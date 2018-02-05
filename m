Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm0-x244.google.com (mail-wm0-x244.google.com
 [IPv6:2a00:1450:400c:c09::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EA5889C84
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Feb 2018 15:02:32 +0000 (UTC)
Received: by mail-wm0-x244.google.com with SMTP id f71so26713465wmf.0
 for <igt-dev@lists.freedesktop.org>; Mon, 05 Feb 2018 07:02:32 -0800 (PST)
From: Tvrtko Ursulin <tursulin@ursulin.net>
Date: Mon,  5 Feb 2018 15:02:21 +0000
Message-Id: <20180205150221.16268-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <151784008225.15322.7253457290210571678@mail.alporthouse.com>
References: <151784008225.15322.7253457290210571678@mail.alporthouse.com>
Subject: [igt-dev] [PATCH i-g-t v3 8/9] tests/perf_pmu: Explicitly test for
 engine availability in init tests
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KClRlc3Qgd2ls
bCBzdWNjZWVkIGlmIHByZXNlbnQgZW5naW5lIGNhbiBiZSBvcGVuZWQsIG9yIGlmIHRoZSBtaXNz
aW5nCmVuZ2luZSByZXBvcnRzIHRoZSBjb3JyZWN0IGVycm9yIGNvZGUuCgp2MjoKICogVXNlIHRo
ZSByaWdodCBlcnJuby4KICogQ2xvc2UgZmQgb25seSBvbiBzdWNjZXNzLiAoQ2hyaXMgV2lsc29u
KQoKdjM6CiAqIE9ubHkgc2FtcGxlIGVycm5vIG9uIGZhaWx1cmUuIChDaHJpcyBXaWxzb24pCgpT
aWduZWQtb2ZmLWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgpS
ZXZpZXdlZC1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Ci0tLQog
dGVzdHMvcGVyZl9wbXUuYyB8IDE2ICsrKysrKysrKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAx
MyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL3BlcmZf
cG11LmMgYi90ZXN0cy9wZXJmX3BtdS5jCmluZGV4IDNkMWIzYTJjN2M2MS4uNWIzODcxMmZlNzM0
IDEwMDY0NAotLS0gYS90ZXN0cy9wZXJmX3BtdS5jCisrKyBiL3Rlc3RzL3BlcmZfcG11LmMKQEAg
LTcyLDExICs3MiwyMSBAQCBzdGF0aWMgaW50IG9wZW5fZ3JvdXAodWludDY0X3QgY29uZmlnLCBp
bnQgZ3JvdXApCiBzdGF0aWMgdm9pZAogaW5pdChpbnQgZ2VtX2ZkLCBjb25zdCBzdHJ1Y3QgaW50
ZWxfZXhlY3V0aW9uX2VuZ2luZTIgKmUsIHVpbnQ4X3Qgc2FtcGxlKQogewotCWludCBmZDsKKwlp
bnQgZmQsIGVyciA9IDA7CiAKLQlmZCA9IG9wZW5fcG11KF9fSTkxNV9QTVVfRU5HSU5FKGUtPmNs
YXNzLCBlLT5pbnN0YW5jZSwgc2FtcGxlKSk7CisJZXJybm8gPSAwOworCWZkID0gcGVyZl9pOTE1
X29wZW4oX19JOTE1X1BNVV9FTkdJTkUoZS0+Y2xhc3MsIGUtPmluc3RhbmNlLCBzYW1wbGUpKTsK
KwlpZiAoZmQgPCAwKQorCQllcnIgPSBlcnJubzsKIAotCWNsb3NlKGZkKTsKKwlpZiAoZ2VtX2hh
c19lbmdpbmUoZ2VtX2ZkLCBlLT5jbGFzcywgZS0+aW5zdGFuY2UpKSB7CisJCWlndF9hc3NlcnRf
ZXEoZXJyLCAwKTsKKwkJaWd0X2Fzc2VydF9mZChmZCk7CisJCWNsb3NlKGZkKTsKKwl9IGVsc2Ug
eworCQlpZ3RfYXNzZXJ0X2x0KGZkLCAwKTsKKwkJaWd0X2Fzc2VydF9lcShlcnIsIEVOT0RFVik7
CisJfQogfQogCiBzdGF0aWMgdWludDY0X3QgcG11X3JlYWRfc2luZ2xlKGludCBmZCkKLS0gCjIu
MTQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0
LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
