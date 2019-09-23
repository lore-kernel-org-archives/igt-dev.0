Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 23 Sep 2019 08:41:49 +0100
Message-Id: <20190923074149.19753-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_eio: Include non-context based
 tests for older kms testing
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

QXMgbm90IGV2ZXJ5IG1hY2hpbmUgY2FuIHVzZSBjb250ZXh0cywgaW5jbHVkZSBhIG5vbi1jb250
ZXh0IHJlc2V0IHN0cmVzcwp0ZXN0IHRvIHJ1biBpbiBwYXJhbGxlbCB0byBlbmFibGluZy9kaXNh
YmxpbmcgcGlwZXMuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdp
bHNvbi5jby51az4KLS0tCiB0ZXN0cy9pOTE1L2dlbV9laW8uYyB8IDcgKysrKystLQogMSBmaWxl
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90
ZXN0cy9pOTE1L2dlbV9laW8uYyBiL3Rlc3RzL2k5MTUvZ2VtX2Vpby5jCmluZGV4IGU3ZjVkNGRk
Yi4uNTJlODNhNWNmIDEwMDY0NAotLS0gYS90ZXN0cy9pOTE1L2dlbV9laW8uYworKysgYi90ZXN0
cy9pOTE1L2dlbV9laW8uYwpAQCAtODcwLDggKzg3MCwxMSBAQCBzdGF0aWMgdm9pZCB0ZXN0X2tt
cyhpbnQgaTkxNSwgaWd0X2Rpc3BsYXlfdCAqZHB5KQogCWlndF9mb3JrKGNoaWxkLCAxKQogCQlk
aXNwbGF5X2hlbHBlcihkcHksIHNoYXJlZCk7CiAKLQl0ZXN0X3Jlc2V0X3N0cmVzcyhpOTE1LCAw
KTsKLQl0ZXN0X3Jlc2V0X3N0cmVzcyhpOTE1LCBURVNUX1dFREdFKTsKKwl0ZXN0X2luZmxpZ2h0
KGk5MTUsIDApOworCWlmIChnZW1faGFzX2NvbnRleHRzKGZkKSkgeworCQl0ZXN0X3Jlc2V0X3N0
cmVzcyhpOTE1LCAwKTsKKwkJdGVzdF9yZXNldF9zdHJlc3MoaTkxNSwgVEVTVF9XRURHRSk7CisJ
fQogCiAJKnNoYXJlZCA9IDE7CiAJaWd0X3dhaXRjaGlsZHJlbigpOwotLSAKMi4yMy4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxp
bmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
