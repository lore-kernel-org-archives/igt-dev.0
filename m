Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue,  2 Oct 2018 12:26:01 +0100
Message-Id: <20181002112601.9981-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t] igt/kms_busy: Flush request queue when
 re-enabling hangcheck
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

RW5hYmxpbmcgaGFuZ2NoZWNrIG9ubHkgdGFrZXMgZWZmZWN0IGF0IHRoZSBzdGFydCBvZiBhIG5l
dyByZXF1ZXN0CnF1ZXVlLiBCZWZvcmUgd2UgcmUtZW5hYmxlIGhhbmdjaGVjayBhZnRlciBvdXIg
cG9raW5nIGFyb3VuZCwgd2UKdGhlcmVmb3JlIG5lZWQgdG8gd2FpdCB1bnRpbCB0aGUgZ3B1IGlz
IGlkbGUgb3RoZXJ3aXNlIHRoZSBuZXh0IHRlc3QKd2lsbCBzdGFydCB3aXRob3V0IGhhbmdjaGVj
ayBhbmQgc3Vic2VxdWVudGx5IGhhbmcgZm9yZXZlci4KClNpZ25lZC1vZmYtYnk6IENocmlzIFdp
bHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgpDYzogUGV0cmkgTGF0dmFsYSA8cGV0cmku
bGF0dmFsYUBpbnRlbC5jb20+Ci0tLQogdGVzdHMva21zX2J1c3kuYyB8IDEgKwogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvdGVzdHMva21zX2J1c3kuYyBiL3Rl
c3RzL2ttc19idXN5LmMKaW5kZXggZDgyMWVjNzExLi5lZDNjYWFlNGMgMTAwNjQ0Ci0tLSBhL3Rl
c3RzL2ttc19idXN5LmMKKysrIGIvdGVzdHMva21zX2J1c3kuYwpAQCAtMTM4LDYgKzEzOCw3IEBA
IHN0YXRpYyB2b2lkIGZsaXBfdG9fZmIoaWd0X2Rpc3BsYXlfdCAqZHB5LCBpbnQgcGlwZSwKIAlp
Z3RfYXNzZXJ0KHBvbGwoJnBmZCwgMSwgMCkgPT0gMCk7CiAKIAlpZiAobW9kZXNldCkgeworCQln
ZW1fcXVpZXNjZW50X2dwdShkcHktPmRybV9mZCk7CiAJCWlndF9zZXRfbW9kdWxlX3BhcmFtX2lu
dCgiZW5hYmxlX2hhbmdjaGVjayIsIDEpOwogCiAJCS8qIENsZWFyIG9sZCBtb2RlIGJsb2IuICov
Ci0tIAoyLjE5LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdm
eAo=
