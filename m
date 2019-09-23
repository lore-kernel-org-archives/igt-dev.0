Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 23 Sep 2019 08:36:36 +0100
Message-Id: <20190923073636.19618-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_ppgtt: Check for blitter support
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

QW5vdGhlciB0eXBlIG9mIGJjcyB1c2VyLCBoaWRkZW4gYXdheS4KClNpZ25lZC1vZmYtYnk6IENo
cmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgpDYzogTWlrYSBLdW9wcGFsYSA8
bWlrYS5rdW9wcGFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQogdGVzdHMvaTkxNS9nZW1fcHBndHQu
YyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvdGVz
dHMvaTkxNS9nZW1fcHBndHQuYyBiL3Rlc3RzL2k5MTUvZ2VtX3BwZ3R0LmMKaW5kZXggMGQ0MGE3
Yjc4Li44OWNkYzRkYmMgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2k5MTUvZ2VtX3BwZ3R0LmMKKysrIGIv
dGVzdHMvaTkxNS9nZW1fcHBndHQuYwpAQCAtMjk1LDYgKzI5NSw3IEBAIGlndF9tYWluCiAJaWd0
X2ZpeHR1cmUgewogCQlpbnQgZmQgPSBkcm1fb3Blbl9kcml2ZXIoRFJJVkVSX0lOVEVMKTsKIAkJ
aWd0X3JlcXVpcmVfZ2VtKGZkKTsKKwkJZ2VtX3JlcXVpcmVfYmxpdHRlcihmZCk7CiAJCWNsb3Nl
KGZkKTsKIAl9CiAKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
Z3QtZGV2
