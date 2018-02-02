Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr0-x241.google.com (mail-wr0-x241.google.com
 [IPv6:2a00:1450:400c:c0c::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 060E16EFBB
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Feb 2018 18:38:12 +0000 (UTC)
Received: by mail-wr0-x241.google.com with SMTP id a43so15892858wrc.4
 for <igt-dev@lists.freedesktop.org>; Fri, 02 Feb 2018 10:38:11 -0800 (PST)
From: Tvrtko Ursulin <tursulin@ursulin.net>
Date: Fri,  2 Feb 2018 18:37:53 +0000
Message-Id: <20180202183754.30042-9-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20180202183754.30042-1-tvrtko.ursulin@linux.intel.com>
References: <20180202183754.30042-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t 8/9] tests/perf_pmu: Explicitly test for
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
aW5nCmVuZ2luZSByZXBvcnRzIHRoZSBjb3JyZWN0IGVycm9yIGNvZGUuCgpTaWduZWQtb2ZmLWJ5
OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgotLS0KIHRlc3RzL3Bl
cmZfcG11LmMgfCA3ICsrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9wZXJmX3BtdS5jIGIvdGVzdHMvcGVyZl9w
bXUuYwppbmRleCBkNjU0ZWNlNjNiYjcuLjIwMWFhMGI0MDA2OCAxMDA2NDQKLS0tIGEvdGVzdHMv
cGVyZl9wbXUuYworKysgYi90ZXN0cy9wZXJmX3BtdS5jCkBAIC03NCw3ICs3NCwxMiBAQCBpbml0
KGludCBnZW1fZmQsIGNvbnN0IHN0cnVjdCBpbnRlbF9leGVjdXRpb25fZW5naW5lMiAqZSwgdWlu
dDhfdCBzYW1wbGUpCiB7CiAJaW50IGZkOwogCi0JZmQgPSBvcGVuX3BtdShfX0k5MTVfUE1VX0VO
R0lORShlLT5jbGFzcywgZS0+aW5zdGFuY2UsIHNhbXBsZSkpOworCWZkID0gcGVyZl9pOTE1X29w
ZW4oX19JOTE1X1BNVV9FTkdJTkUoZS0+Y2xhc3MsIGUtPmluc3RhbmNlLCBzYW1wbGUpKTsKKwor
CWlmIChnZW1faGFzX2VuZ2luZShnZW1fZmQsIGUtPmNsYXNzLCBlLT5pbnN0YW5jZSkpCisJCWln
dF9hc3NlcnQoZmQgPj0gMCk7CisJZWxzZQorCQlpZ3RfYXNzZXJ0KGZkIDwgMCAmJiBlcnJubyA9
PSBFTk9ERVYpOwogCiAJY2xvc2UoZmQpOwogfQotLSAKMi4xNC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3Qt
ZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
