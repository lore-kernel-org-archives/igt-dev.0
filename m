Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 20 Feb 2018 08:45:17 +0000
Message-Id: <20180220084520.27965-13-chris@chris-wilson.co.uk>
In-Reply-To: <20180220084520.27965-1-chris@chris-wilson.co.uk>
References: <20180220084520.27965-1-chris@chris-wilson.co.uk>
Subject: [Intel-gfx] [PATCH igt 13/16] igt/gem_ctx_switch: Do a warmup pass
 over all contexts
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, joonas.lahtinen@linux.intel.com
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

RW5zdXJlIHRoYXQgd2UgYWx3YXlzIHVzZSBldmVyeSBjb250ZXh0IGF0IGxlYXN0IG9uY2UgYmVm
b3JlIHdlIHN0YXJ0CnJ1bm5pbmcgdGhlIHN0cmVzcy10ZXN0LgoKU2lnbmVkLW9mZi1ieTogQ2hy
aXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Ci0tLQogdGVzdHMvZ2VtX2N0eF9z
d2l0Y2guYyB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL3Rlc3RzL2dlbV9jdHhfc3dpdGNoLmMgYi90ZXN0cy9nZW1fY3R4X3N3aXRjaC5j
CmluZGV4IDRkYjkwMmIxLi5lMGFiM2QxOCAxMDA2NDQKLS0tIGEvdGVzdHMvZ2VtX2N0eF9zd2l0
Y2guYworKysgYi90ZXN0cy9nZW1fY3R4X3N3aXRjaC5jCkBAIC0xMDEsNiArMTAxLDEzIEBAIHN0
YXRpYyB2b2lkIHNpbmdsZShpbnQgZmQsIHVpbnQzMl90IGhhbmRsZSwKIAkJc3RydWN0IHRpbWVz
cGVjIHN0YXJ0LCBub3c7CiAJCXVuc2lnbmVkIGludCBjb3VudCA9IDA7CiAKKwkJLyogV2FybXVw
ICovCisJCWZvciAoaW50IGkgPSAwOyBpIDwgQVJSQVlfU0laRShjb250ZXh0cyk7IGkrKykgewor
CQkJZXhlY2J1Zi5yc3ZkMSA9IGNvbnRleHRzW2ldOworCQkJZ2VtX2V4ZWNidWYoZmQsICZleGVj
YnVmKTsKKwkJfQorCQlnZW1fc3luYyhmZCwgaGFuZGxlKTsKKwogCQljbG9ja19nZXR0aW1lKENM
T0NLX01PTk9UT05JQywgJnN0YXJ0KTsKIAkJZG8gewogCQkJaWd0X3doaWxlX2ludGVycnVwdGli
bGUoZmxhZ3MgJiBJTlRFUlJVUFRJQkxFKSB7Ci0tIAoyLjE2LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50
ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
