/*
 * Regular expression of Unicode code that are flagged as separator.
 *
 * Contains Unicode code of:
 * - Zs = Separator, space
 * - Zl = Separator, line
 * - Zp = Separator, paragraph
 *
 * This list has been computed from http://www.unicode.org/Public/5.2.0/ucdxml/ucd.all.flat.zip
 *
 */

exports.Z = /\u0020|\u00A0|\u1680|\u180E|[\u2000-\u200A]|[\u2028-\u2029]|\u202F|\u205F|\u3000/;
