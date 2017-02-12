/*
 * Regular expression of Unicode code that are flagged as separator.
 *
 * Contains Unicode code of:
 * - Zs = Separator, space
 * - Zl = Separator, line
 * - Zp = Separator, paragraph
 *
 */

exports.Z = /\u0020|\u00A0|\u1680|\u180E|[\u2000-\u200A]|[\u2028-\u2029]|\u202F|\u205F|\u3000/;
