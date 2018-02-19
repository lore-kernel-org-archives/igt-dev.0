Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr0-x243.google.com (mail-wr0-x243.google.com
 [IPv6:2a00:1450:400c:c0c::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43BEE6E107
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Feb 2018 10:17:12 +0000 (UTC)
Received: by mail-wr0-x243.google.com with SMTP id s5so9044364wra.0
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Feb 2018 02:17:12 -0800 (PST)
From: Tvrtko Ursulin <tursulin@ursulin.net>
Date: Mon, 19 Feb 2018 10:17:02 +0000
Message-Id: <20180219101702.30707-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <151903517768.2041.4670562671355178120@mail.alporthouse.com>
References: <151903517768.2041.4670562671355178120@mail.alporthouse.com>
Subject: [igt-dev] [PATCH i-g-t v2] perf_pmu: Fix some compile warnings with
 old compilers / 32-bit builds
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
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KCkNvcnJlY3Qg
cHJpbnRmIGZvcm1hdCBmb3IgdWludDY0X3QgYW5kIG9uZSAibWF5IGJlIHVuaW5pdGlhbGl6ZWQi
LgoKdjI6IEZpeCBvbmUgbW9yZSAibWF5IGJlIHVuaW5pdGlhbGl6ZWQiLiAoQ2hyaXMgV2lsc29u
KQoKU2lnbmVkLW9mZi1ieTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNv
bT4KUmVwb3J0ZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgpS
ZXZpZXdlZC1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Ci0tLQog
dGVzdHMvcGVyZl9wbXUuYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL3BlcmZfcG11LmMgYi90ZXN0
cy9wZXJmX3BtdS5jCmluZGV4IDgyMDUzNDE2Y2JlYS4uYmVkNGMyNTcwMTNkIDEwMDY0NAotLS0g
YS90ZXN0cy9wZXJmX3BtdS5jCisrKyBiL3Rlc3RzL3BlcmZfcG11LmMKQEAgLTMwMCw3ICszMDAs
NyBAQCBidXN5X2RvdWJsZV9zdGFydChpbnQgZ2VtX2ZkLCBjb25zdCBzdHJ1Y3QgaW50ZWxfZXhl
Y3V0aW9uX2VuZ2luZTIgKmUpCiAJdXNsZWVwKGJhdGNoX2R1cmF0aW9uX25zIC8gMTAwMCk7CiAJ
dmFsMiA9IHBtdV9yZWFkX3NpbmdsZShmZCkgLSB2YWwyOwogCi0JaWd0X2luZm8oImJ1c3k9JWx1
IGlkbGU9JWx1XG4iLCB2YWwsIHZhbDIpOworCWlndF9pbmZvKCJidXN5PSUiUFJJdTY0IiBpZGxl
PSUiUFJJdTY0IlxuIiwgdmFsLCB2YWwyKTsKIAogCWlndF9zcGluX2JhdGNoX2ZyZWUoZ2VtX2Zk
LCBzcGluWzBdKTsKIAlpZ3Rfc3Bpbl9iYXRjaF9mcmVlKGdlbV9mZCwgc3BpblsxXSk7CkBAIC0z
NDAsMTEgKzM0MCwxMSBAQCBidXN5X2NoZWNrX2FsbChpbnQgZ2VtX2ZkLCBjb25zdCBzdHJ1Y3Qg
aW50ZWxfZXhlY3V0aW9uX2VuZ2luZTIgKmUsCiB7CiAJY29uc3Qgc3RydWN0IGludGVsX2V4ZWN1
dGlvbl9lbmdpbmUyICplXzsKIAl1aW50NjRfdCB0dmFsWzJdW251bV9lbmdpbmVzXTsKKwl1bnNp
Z25lZCBpbnQgYnVzeV9pZHggPSAwLCBpOwogCXVpbnQ2NF90IHZhbFtudW1fZW5naW5lc107CiAJ
aW50IGZkW251bV9lbmdpbmVzXTsKIAl1bnNpZ25lZCBsb25nIHNsZXB0OwogCWlndF9zcGluX3Qg
KnNwaW47Ci0JdW5zaWduZWQgaW50IGJ1c3lfaWR4LCBpOwogCiAJaSA9IDA7CiAJZmRbMF0gPSAt
MTsKQEAgLTE3NTgsNyArMTc1OCw3IEBAIGlndF9tYWluCiAJICogQ2hlY2sgcmVuZGVyIG5vZGVz
IGFyZSBjb3VudGVkLgogCSAqLwogCWlndF9zdWJ0ZXN0X2dyb3VwIHsKLQkJaW50IHJlbmRlcl9m
ZDsKKwkJaW50IHJlbmRlcl9mZCA9IC0xOwogCiAJCWlndF9maXh0dXJlIHsKIAkJCXJlbmRlcl9m
ZCA9IGRybV9vcGVuX2RyaXZlcl9yZW5kZXIoRFJJVkVSX0lOVEVMKTsKLS0gCjIuMTQuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWls
aW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
