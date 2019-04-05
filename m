Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri,  5 Apr 2019 09:36:06 +0100
Message-Id: <20190405083606.12665-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/pm_rpm: Probe connectors to run
 standalone
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
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

SW4gb3JkZXIgdG8gcnVuIGFzIGEgc3RhbmRhbG9uZSB0ZXN0IChpLmUuIGltbWVkaWF0ZWx5IGFm
dGVyIGJvb3RpbmcgYQpkZXZpY2UpLCB3ZSBuZWVkIHRvIGV4cGxpY2l0bHkgcHJvYmUgdGhlIGNv
bm5lY3RvcnMuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNv
bi5jby51az4KLS0tCiB0ZXN0cy9pOTE1L2k5MTVfcG1fcnBtLmMgfCA1ICsrKy0tCiAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rl
c3RzL2k5MTUvaTkxNV9wbV9ycG0uYyBiL3Rlc3RzL2k5MTUvaTkxNV9wbV9ycG0uYwppbmRleCBh
MmM5ZDBlZGUuLjJmN2UzMDU5MiAxMDA2NDQKLS0tIGEvdGVzdHMvaTkxNS9pOTE1X3BtX3JwbS5j
CisrKyBiL3Rlc3RzL2k5MTUvaTkxNV9wbV9ycG0uYwpAQCAtMzk0LDggKzM5NCw5IEBAIHN0YXRp
YyB2b2lkIGluaXRfbW9kZV9zZXRfZGF0YShzdHJ1Y3QgbW9kZV9zZXRfZGF0YSAqZGF0YSkKIAlp
ZiAoZGF0YS0+cmVzKSB7CiAJCWlndF9hc3NlcnQoZGF0YS0+cmVzLT5jb3VudF9jb25uZWN0b3Jz
IDw9IE1BWF9DT05ORUNUT1JTKTsKIAkJZm9yIChpbnQgaSA9IDA7IGkgPCBkYXRhLT5yZXMtPmNv
dW50X2Nvbm5lY3RvcnM7IGkrKykgewotCQkJZGF0YS0+Y29ubmVjdG9yc1tpXSA9IGRybU1vZGVH
ZXRDb25uZWN0b3JDdXJyZW50KGRybV9mZCwKLQkJCQkJCQkJCSBkYXRhLT5yZXMtPmNvbm5lY3Rv
cnNbaV0pOworCQkJZGF0YS0+Y29ubmVjdG9yc1tpXSA9CisJCQkJZHJtTW9kZUdldENvbm5lY3Rv
cihkcm1fZmQsCisJCQkJCQkgICAgZGF0YS0+cmVzLT5jb25uZWN0b3JzW2ldKTsKIAkJCWRhdGEt
PmVkaWRzW2ldID0gZ2V0X2Nvbm5lY3Rvcl9lZGlkKGRhdGEtPmNvbm5lY3RvcnNbaV0sIGkpOwog
CQl9CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
