Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 11 Jan 2019 10:35:10 +0000
Message-Id: <20190111103510.20564-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/hangman: Read a dummy byte to check
 sysfs existence
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

c3lzZnMgZG9lc24ndCBnaXZlIHRoZSBkcml2ZXIgYW4gb3BlbigpIGNhbGxiYWNrLCBzbyB3ZSBj
YW4gb25seSByZXBvcnQKdGhlIHVuYXZhaWxhYmlsaXR5IG9mIEhXIG9uIHRoZSBmaXJzdCByZWFk
OyBzbyBjaGVjayByZWFkKCkgYWZ0ZXIgY2hlY2tpbmcKb3BlbigpLgoKRml4ZXM6IDkzZjBhZDRi
ODM1ZSAoImk5MTUvaGFuZ21hbjogU2tpcCBpZiBkaXNhYmxlZCBieSB0aGUga2VybmVsIikKU2ln
bmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Ci0tLQog
dGVzdHMvaTkxNS9oYW5nbWFuLmMgfCA4ICsrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9oYW5nbWFu
LmMgYi90ZXN0cy9pOTE1L2hhbmdtYW4uYwppbmRleCBmZmJkMGIwNTcuLjVmNjNiZmM0YiAxMDA2
NDQKLS0tIGEvdGVzdHMvaTkxNS9oYW5nbWFuLmMKKysrIGIvdGVzdHMvaTkxNS9oYW5nbWFuLmMK
QEAgLTQ1LDE0ICs0NSwyMCBAQCBzdGF0aWMgaW50IHN5c2ZzID0gLTE7CiAKIHN0YXRpYyBib29s
IGhhc19lcnJvcl9zdGF0ZShpbnQgZGlyKQogeworCWJvb2wgcmVzdWx0OwogCWludCBmZDsKIAog
CWZkID0gb3BlbmF0KGRpciwgImVycm9yIiwgT19SRE9OTFkpOwogCWlmIChmZCA8IDApCiAJCXJl
dHVybiBmYWxzZTsKIAorCWlmIChyZWFkKGZkLCAmcmVzdWx0LCBzaXplb2YocmVzdWx0KSkgPCAw
KQorCQlyZXN1bHQgPSBmYWxzZTsKKwllbHNlCisJCXJlc3VsdCA9IHRydWU7CisKIAljbG9zZShm
ZCk7Ci0JcmV0dXJuIHRydWU7CisJcmV0dXJuIHJlc3VsdDsKIH0KIAogc3RhdGljIHZvaWQgYXNz
ZXJ0X2VudHJ5KGNvbnN0IGNoYXIgKnMsIGJvb2wgZXhwZWN0KQotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcg
bGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
