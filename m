Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue,  4 Sep 2018 11:19:38 +0100
Message-Id: <20180904101938.5545-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/pm: Increase snd module probe timeout
 to 10s
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
Cc: Imre Deak <imre.deak@intel.linux.com>, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

NXMgaXMgb2Z0ZW4gbm90IGVub3VnaCBmb3IgdGhlIHNvdW5kIG1vZHVsZSB0byBmaW5pc2ggbG9h
ZGluZywgc28gYnVtcAp0aGUgdGltZW91dCB0byAxMHMuIEZvciBmdW4sIHBvbGwgcXVpY2tlciBv
dmVyIHRoZSAxcyEKClNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2ls
c29uLmNvLnVrPgpDYzogSW1yZSBEZWFrIDxpbXJlLmRlYWtAaW50ZWwubGludXguY29tPgotLS0K
IGxpYi9pZ3RfcG0uYyB8IDcgKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9saWIvaWd0X3BtLmMgYi9saWIvaWd0X3Bt
LmMKaW5kZXggZTg2ZmE0YTQwLi42MTU0NjNhMDggMTAwNjQ0Ci0tLSBhL2xpYi9pZ3RfcG0uYwor
KysgYi9saWIvaWd0X3BtLmMKQEAgLTI1OCwxMiArMjU4LDE1IEBAIHZvaWQgaWd0X3BtX2VuYWJs
ZV9hdWRpb19ydW50aW1lX3BtKHZvaWQpCiAJaWYgKF9faWd0X3BtX2F1ZGlvX3J1bnRpbWVfcG93
ZXJfc2F2ZVswXSkKIAkJcmV0dXJuOwogCi0JZm9yIChpbnQgY291bnQgPSAwOyBjb3VudCA8IDU7
IGNvdW50KyspIHsKKwlmb3IgKGludCBjb3VudCA9IDA7IGNvdW50IDwgMTEwOyBjb3VudCsrKSB7
CiAJCWlmICghX19pZ3RfcG1fZW5hYmxlX2F1ZGlvX3J1bnRpbWVfcG0oKSkKIAkJCXJldHVybjsK
IAogCQkvKiBtb2Rwcm9iZShzbmEtaGRhLWludGVsKSBhY3RzIGFzeW5jIHNvIHBvbGwgZm9yIHN5
c2ZzICovCi0JCXNsZWVwKDEpOworCQlpZiAoY291bnQgPCAxMDApCisJCQl1c2xlZXAoMTAgKiAx
MDAwKTsgLyogcG9sbCBhdCAxMG1zIGZvciB0aGUgZmlyc3QgMXMgKi8KKwkJZWxzZQorCQkJc2xl
ZXAoMSk7CiAJfQogCiAJZXJyID0gX19pZ3RfcG1fZW5hYmxlX2F1ZGlvX3J1bnRpbWVfcG0oKTsK
LS0gCjIuMTkuMC5yYzEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
