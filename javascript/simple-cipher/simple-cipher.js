function Cipher(key = generateKey()) {
  this.key = key;

  this.chars = function(str) {
    return str.split("");
  }

  this.encode = function(str) {
    return this.chars(str).map((char, index) => this.encodeChar(char, index)).join("");
  }

  this.decode = function(str) {
    return this.chars(str).map((char, index) => this.decodeChar(char, index)).join("");
  }

  this.encodeChar = function(char, index) {
    return this.addCharCodes(char.charCodeAt(0), this.key.charCodeAt(index) - 97);
  }

  this.decodeChar = function(char, index) {
    return this.subtractCharCodes(char.charCodeAt(0), this.key.charCodeAt(index) - 97);
  }

  this.addCharCodes = function(charCode, encodeCharCode) {
    // console.log("charCode: " + charCode);
    // console.log("encodeCharCode: " + encodeCharCode);
    // console.log("wrapAround: " + this.wrapAround(charCode + encodeCharCode));
    return String.fromCharCode(this.wrapAround(charCode + encodeCharCode));
  }

  this.subtractCharCodes = function(charCode, encodeCharCode) {
    // console.log("charCode: " + charCode);
    // console.log("encodeCharCode: " + encodeCharCode);
    // console.log("wrapAround: " + this.wrapAround(charCode + encodeCharCode));
    return String.fromCharCode(this.wrapAround(charCode - encodeCharCode));
  }

  // ASCII 97 = "a", 122 = "z"
  this.wrapAround = function(charCode) {
    return ((charCode - 97) % 26) + 97;
  }

}

function generateKey() {
  return "aaaaaaaaaa"
}

module.exports = Cipher
