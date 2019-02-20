Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 20 Feb 2019 09:36:25 +0000
Message-Id: <20190220093625.15245-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_ctx_exec: Remember to ask for
 permission to reset the GPU
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

bm9yZWNvdmVyeSBpbnRlbnRpb25hbGx5IGlzc3VlcyBhIEdQVSByZXNldCwgYnV0IHdlIHNob3Vs
ZCBvbmx5IGRvIHNvCmFmdGVyIGNvbmZpcm1pbmcgd2l0aCB0aGUga2VybmVsIHRoYXQgdGhpcyBj
YW4gd29yay4KClNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29u
LmNvLnVrPgotLS0KIHRlc3RzL2k5MTUvZ2VtX2N0eF9leGVjLmMgfCA1ICsrKysrCiAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9nZW1fY3R4
X2V4ZWMuYyBiL3Rlc3RzL2k5MTUvZ2VtX2N0eF9leGVjLmMKaW5kZXggNzhjZmU2NmM4Li5kNjdk
MGVjMjUgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2k5MTUvZ2VtX2N0eF9leGVjLmMKKysrIGIvdGVzdHMv
aTkxNS9nZW1fY3R4X2V4ZWMuYwpAQCAtMTU4LDcgKzE1OCwxMCBAQCBzdGF0aWMgYm9vbCBoYXNf
cmVjb3ZlcmFibGVfcGFyYW0oaW50IGk5MTUpCiAKIHN0YXRpYyB2b2lkIG5vcmVjb3ZlcnkoaW50
IGk5MTUpCiB7CisJaWd0X2hhbmdfdCBoYW5nOworCiAJaWd0X3JlcXVpcmUoaGFzX3JlY292ZXJh
YmxlX3BhcmFtKGk5MTUpKTsKKwloYW5nID0gaWd0X2FsbG93X2hhbmcoaTkxNSwgMCwgMCk7CiAK
IAlmb3IgKGludCBwYXNzID0gMTsgcGFzcyA+PSAwOyBwYXNzLS0pIHsKIAkJc3RydWN0IGRybV9p
OTE1X2dlbV9jb250ZXh0X3BhcmFtIHBhcmFtID0gewpAQCAtMTkwLDYgKzE5Myw4IEBAIHN0YXRp
YyB2b2lkIG5vcmVjb3ZlcnkoaW50IGk5MTUpCiAKIAkJZ2VtX2NvbnRleHRfZGVzdHJveShpOTE1
LCBwYXJhbS5jdHhfaWQpOwogCX0KKworCSBpZ3RfZGlzYWxsb3dfaGFuZyhpOTE1LCBoYW5nKTsK
IH0KIAogaWd0X21haW4KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pZ3QtZGV2
