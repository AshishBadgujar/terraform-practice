variable "filename" {
  default     = "variable.text"
  type        = string
  description = "string type"
}
variable "number" {
  default     = 23
  type        = number
  description = "number type"
}
variable "bool" {
  default     = true
  type        = bool
  description = "boolian type"
}
variable "list" {
  default     = ["bunana", "apple", "chiku"]
  type        = list(string)
  description = "duplication not allowed & values should be of same type"
}
variable "map" {
  type = map(string)
  default = {
    key1 = "value1"
    key2 = "value2"
  }
  description = "all entries should be of same type"
}
variable "objects" {
  type = object({
    name   = string
    age    = number
    food   = list(string)
    isGood = bool
  })
  default = {
    age    = 18
    food   = ["kachori", "pohe", "samosa"]
    isGood = false
    name   = "Ashish"
  }
  description = "similar as map but can contain diff types of values"
}
variable "tuple" {
  type        = tuple([string, number, bool])
  default     = ["cat", 20, true]
  description = "similar as list but can contain diff types of values"
}
