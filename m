Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Thu,  6 Jun 2019 08:02:29 +0100
Message-Id: <20190606070229.11816-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/gem_ctx_shared: Fix vecs0 mmio base
 on Icelake
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
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KCnZlY3MyIGFk
ZHJlc3Mgd2FzIGNvcHkgcGFzdGVkIGJ5IGFjY2lkZW50LgoKU2lnbmVkLW9mZi1ieTogVHZydGtv
IFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KQnVnemlsbGE6IGh0dHBzOi8vYnVn
cy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTExMDg0MApDYzogQ2hyaXMgV2lsc29u
IDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Ci0tLQogdGVzdHMvaTkxNS9nZW1fY3R4X3NoYXJl
ZC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9nZW1fY3R4X3NoYXJlZC5jIGIvdGVzdHMvaTkxNS9n
ZW1fY3R4X3NoYXJlZC5jCmluZGV4IDY3ZWNkMDk1MzY4MS4uYjNjZmMxNWRiMDYzIDEwMDY0NAot
LS0gYS90ZXN0cy9pOTE1L2dlbV9jdHhfc2hhcmVkLmMKKysrIGIvdGVzdHMvaTkxNS9nZW1fY3R4
X3NoYXJlZC5jCkBAIC01NDYsNyArNTQ2LDcgQEAgc3RhdGljIHZvaWQgaW5kZXBlbmRlbnQoaW50
IGk5MTUsIHVuc2lnbmVkIHJpbmcsIHVuc2lnbmVkIGZsYWdzKQogCiAJY2FzZSBJOTE1X0VYRUNf
VkVCT1g6CiAJCWlmIChpbnRlbF9nZW4oaW50ZWxfZ2V0X2RybV9kZXZpZChpOTE1KSkgPj0gMTEp
Ci0JCQltbWlvX2Jhc2UgPSAweDFkODAwMDsKKwkJCW1taW9fYmFzZSA9IDB4MWM4MDAwOwogCQll
bHNlCiAJCQltbWlvX2Jhc2UgPSAweDFhMDAwOwogCQlicmVhazsKLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5n
IGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
