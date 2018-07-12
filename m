Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 12 Jul 2018 08:31:42 +0100
Message-Id: <20180712073142.21364-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] [PATCH i-g-t] igt/kms_vblank: Check if hangs are allowed
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

QmVmb3JlIHJ1bm5pbmcgYSBoYW5nIHRlc3QsIGNoZWNrIGlmIHdlIGNhbiBpbmplY3QgYSBoYW5n
IGFuZCBleHBlY3QKcmVjb3ZlciB0byB3b3JrLiBJZiB3ZSBjYW4ndCBjb250cm9sIGEgaGFuZywg
c2tpcCB0aGUgc3VidGVzdC4KClNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hy
aXMtd2lsc29uLmNvLnVrPgotLS0KIHRlc3RzL2ttc192YmxhbmsuYyB8IDQgKysrKwogMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc192Ymxhbmsu
YyBiL3Rlc3RzL2ttc192YmxhbmsuYwppbmRleCAyYmVlNDlkZTUuLjUwOGMwZmEwMyAxMDA2NDQK
LS0tIGEvdGVzdHMva21zX3ZibGFuay5jCisrKyBiL3Rlc3RzL2ttc192YmxhbmsuYwpAQCAtNDQy
LDEwICs0NDIsMTQgQEAgc3RhdGljIHZvaWQgcnVuX3N1YnRlc3RzX2Zvcl9waXBlKGRhdGFfdCAq
ZGF0YSkKIAkJCWlndF9zdWJ0ZXN0X2YoInBpcGUtJXMtJXMtJXMtaGFuZyIsCiAJCQkJICAgICAg
a21zdGVzdF9waXBlX25hbWUoZGF0YS0+cGlwZSksCiAJCQkJICAgICAgZi0+bmFtZSwgbS0+bmFt
ZSkgeworCQkJCWlndF9oYW5nX3QgaGFuZzsKKworCQkJCWhhbmcgPSBpZ3RfYWxsb3dfaGFuZyhk
YXRhLT5kaXNwbGF5LmRybV9mZCwgMCwgMCk7CiAJCQkJZm9yX2VhY2hfdmFsaWRfb3V0cHV0X29u
X3BpcGUoJmRhdGEtPmRpc3BsYXksIGRhdGEtPnBpcGUsIGRhdGEtPm91dHB1dCkgewogCQkJCQlk
YXRhLT5mbGFncyA9IG0tPmZsYWdzOwogCQkJCQlydW5fdGVzdChkYXRhLCBmLT5mdW5jKTsKIAkJ
CQl9CisJCQkJaWd0X2Rpc2FsbG93X2hhbmcoZGF0YS0+ZGlzcGxheS5kcm1fZmQsIGhhbmcpOwog
CQkJfQogCQl9CiAJfQotLSAKMi4xOC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2lndC1kZXYK
