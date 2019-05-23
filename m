Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D1D589DA2
 for <igt-dev@lists.freedesktop.org>; Thu, 23 May 2019 10:56:46 +0000 (UTC)
From: Simon Ser <simon.ser@intel.com>
Date: Thu, 23 May 2019 13:56:31 +0300
Message-Id: <20190523105632.29397-1-simon.ser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/igt_audio: add more assertions
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

LSBNYWtlIHN1cmUgYW4gYXVkaW8gc2lnbmFsIGlzbid0IGNyZWF0ZWQgd2l0aCB6ZXJvIGNoYW5u
ZWxzCi0gTWFrZSBzdXJlIGVhY2ggY2hhbm5lbCBoYXMgYXQgbGVhc3Qgb25lIGZyZXF1ZW5jeSB3
aGVuIHN5bnRoZXNpemluZwoKU2lnbmVkLW9mZi1ieTogU2ltb24gU2VyIDxzaW1vbi5zZXJAaW50
ZWwuY29tPgotLS0KIGxpYi9pZ3RfYXVkaW8uYyB8IDUgKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9saWIvaWd0X2F1ZGlv
LmMgYi9saWIvaWd0X2F1ZGlvLmMKaW5kZXggMzc2ZTA0YmE2ZWQ2Li4xNjc3ZGQwOWMwMjkgMTAw
NjQ0Ci0tLSBhL2xpYi9pZ3RfYXVkaW8uYworKysgYi9saWIvaWd0X2F1ZGlvLmMKQEAgLTgwLDYg
KzgwLDcgQEAgc3RydWN0IGF1ZGlvX3NpZ25hbCAqYXVkaW9fc2lnbmFsX2luaXQoaW50IGNoYW5u
ZWxzLCBpbnQgc2FtcGxpbmdfcmF0ZSkKIHsKIAlzdHJ1Y3QgYXVkaW9fc2lnbmFsICpzaWduYWw7
CiAKKwlpZ3RfYXNzZXJ0KGNoYW5uZWxzID4gMCk7CiAJaWd0X2Fzc2VydChjaGFubmVscyA8PSBD
SEFOTkVMU19NQVgpOwogCiAJc2lnbmFsID0gbWFsbG9jKHNpemVvZihzdHJ1Y3QgYXVkaW9fc2ln
bmFsKSk7CkBAIC0yNjcsOCArMjY4LDEwIEBAIHZvaWQgYXVkaW9fc2lnbmFsX2ZpbGwoc3RydWN0
IGF1ZGlvX3NpZ25hbCAqc2lnbmFsLCBkb3VibGUgKmJ1ZmZlciwKIAogCW1lbXNldChidWZmZXIs
IDAsIHNpemVvZihkb3VibGUpICogc2lnbmFsLT5jaGFubmVscyAqIHNhbXBsZXMpOwogCi0JZm9y
IChpID0gMDsgaSA8IHNpZ25hbC0+Y2hhbm5lbHM7IGkrKykKKwlmb3IgKGkgPSAwOyBpIDwgc2ln
bmFsLT5jaGFubmVsczsgaSsrKSB7CiAJCWZyZXFzX3Blcl9jaGFubmVsW2ldID0gYXVkaW9fc2ln
bmFsX2NvdW50X2ZyZXFzKHNpZ25hbCwgaSk7CisJCWlndF9hc3NlcnQoZnJlcXNfcGVyX2NoYW5u
ZWxbaV0pOworCX0KIAogCWZvciAoaSA9IDA7IGkgPCBzaWduYWwtPmZyZXFzX2NvdW50OyBpKysp
IHsKIAkJZnJlcSA9ICZzaWduYWwtPmZyZXFzW2ldOwotLSAKMi4yMS4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdApp
Z3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
