Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon,  4 Nov 2019 20:17:10 +0000
Message-Id: <20191104201710.3778-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_exec_balancer: Wait for both
 engines to complete before resubmitting
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
Cc: igt-dev@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

QXMgdGhlIHNjcmF0Y2ggYnVmIGlzIHNoYXJlZCBiZXR3ZWVuIHRoZSB0d28gcmVxdWVzdHMgb24g
Ym90aCBlbmdpbmVzLAp3ZSBuZWVkIHRvIHdhaXQgZm9yIGJvdGggdG8gZmluaXNoIHVzaW5nIHRo
ZSBidWZmZXIgYmVmb3JlIHdlIHJlc2V0IGl0LgoKU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29u
IDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CkNjOiBNaWthIEt1b3BwYWxhIDxtaWthLmt1b3Bw
YWxhQGxpbnV4LmludGVsLmNvbT4KQ2M6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBp
bnRlbC5jb20+Ci0tLQogdGVzdHMvaTkxNS9nZW1fZXhlY19iYWxhbmNlci5jIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
dGVzdHMvaTkxNS9nZW1fZXhlY19iYWxhbmNlci5jIGIvdGVzdHMvaTkxNS9nZW1fZXhlY19iYWxh
bmNlci5jCmluZGV4IGU1MmY1ZGY5NS4uNzBjNDUyOWI0IDEwMDY0NAotLS0gYS90ZXN0cy9pOTE1
L2dlbV9leGVjX2JhbGFuY2VyLmMKKysrIGIvdGVzdHMvaTkxNS9nZW1fZXhlY19iYWxhbmNlci5j
CkBAIC04NDAsNyArODQwLDcgQEAgc3RhdGljIHZvaWQgYm9uZGVkX3NsaWNlKGludCBpOTE1KQog
CQkJZ2VtX2V4ZWNidWYoaTkxNSwgJmViKTsKIAkJCWNsb3NlKGViLnJzdmQyKTsKIAotCQkJZ2Vt
X3N5bmMoaTkxNSwgb2JqWzJdLmhhbmRsZSk7CisJCQlnZW1fc3luYyhpOTE1LCBvYmpbMF0uaGFu
ZGxlKTsKIAkJfQogCiAJCSpzdG9wID0gMTsKLS0gCjIuMjQuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9pZ3QtZGV2
