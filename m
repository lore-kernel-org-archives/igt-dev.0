Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 306776E082
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Oct 2019 11:13:59 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed, 16 Oct 2019 14:13:49 +0300
Message-Id: <20191016111352.5212-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/4] runner: Produce skip instead of notrun
 for nonexisting tests
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

SWYgYSB0ZXN0IHdhcyBhdHRlbXB0ZWQgYnV0IGRpZG4ndCBhY3R1YWxseSBleGlzdCwgbWFrZSBp
dCByZXN1bHQgaW4gYQpza2lwIGluc3RlYWQgb2YgYSBub3RydW4uIFRoaXMgaXMgdG8gZGlmZmVy
ZW50aWF0ZSB0aGVtIGZyb20gdGhlIHRlc3RzCnRoYXQgd2UgZGlkbid0IGV2ZW4gYXR0ZW1wdCwg
bGlrZSB0ZXN0cyBhZnRlciBnZXR0aW5nIGEgbWFjaGluZQpoYW5nLiBUaGlzIHdpbGwgaW1wcm92
ZSBoYW5kbGluZyBvZiBzdWJ0ZXN0cyBmb3IgR0VNIGVuZ2luZXMgdGhhdApkb24ndCBleGlzdC4K
ClNpZ25lZC1vZmYtYnk6IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgpD
YzogQXJrYWRpdXN6IEhpbGVyIDxhcmthZGl1c3ouaGlsZXJAaW50ZWwuY29tPgpDYzogTWFydGlu
IFBlcmVzIDxtYXJ0aW4ucGVyZXNAbGludXguaW50ZWwuY29tPgotLS0KIHJ1bm5lci9yZXN1bHRn
ZW4uYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL3J1bm5lci9yZXN1bHRnZW4uYyBiL3J1bm5lci9yZXN1bHRnZW4uYwpp
bmRleCA0NmM5ZDhkNS4uNWZhYTg1NTUgMTAwNjQ0Ci0tLSBhL3J1bm5lci9yZXN1bHRnZW4uYwor
KysgYi9ydW5uZXIvcmVzdWx0Z2VuLmMKQEAgLTczMiw3ICs3MzIsNyBAQCBzdGF0aWMgY29uc3Qg
Y2hhciAqcmVzdWx0X2Zyb21fZXhpdGNvZGUoaW50IGV4aXRjb2RlKQogCWNhc2UgSUdUX0VYSVRf
U1VDQ0VTUzoKIAkJcmV0dXJuICJwYXNzIjsKIAljYXNlIElHVF9FWElUX0lOVkFMSUQ6Ci0JCXJl
dHVybiAibm90cnVuIjsKKwkJcmV0dXJuICJza2lwIjsKIAljYXNlIElOQ09NUExFVEVfRVhJVENP
REU6CiAJCXJldHVybiAiaW5jb21wbGV0ZSI7CiAJZGVmYXVsdDoKLS0gCjIuMTkuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5n
IGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
