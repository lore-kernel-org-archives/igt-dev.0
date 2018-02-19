Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm0-x243.google.com (mail-wm0-x243.google.com
 [IPv6:2a00:1450:400c:c09::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31B906E05C
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Feb 2018 10:04:18 +0000 (UTC)
Received: by mail-wm0-x243.google.com with SMTP id k87so14022459wmi.0
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Feb 2018 02:04:18 -0800 (PST)
From: Tvrtko Ursulin <tursulin@ursulin.net>
Date: Mon, 19 Feb 2018 10:04:08 +0000
Message-Id: <20180219100408.30246-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t] perf_pmu: Fix some compile warnings with
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
LgoKU2lnbmVkLW9mZi1ieTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNv
bT4KUmVwb3J0ZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgot
LS0KIHRlc3RzL3BlcmZfcG11LmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvcGVyZl9wbXUuYyBiL3Rl
c3RzL3BlcmZfcG11LmMKaW5kZXggODIwNTM0MTZjYmVhLi44ZDhkYmUzOTdkZjYgMTAwNjQ0Ci0t
LSBhL3Rlc3RzL3BlcmZfcG11LmMKKysrIGIvdGVzdHMvcGVyZl9wbXUuYwpAQCAtMzAwLDcgKzMw
MCw3IEBAIGJ1c3lfZG91YmxlX3N0YXJ0KGludCBnZW1fZmQsIGNvbnN0IHN0cnVjdCBpbnRlbF9l
eGVjdXRpb25fZW5naW5lMiAqZSkKIAl1c2xlZXAoYmF0Y2hfZHVyYXRpb25fbnMgLyAxMDAwKTsK
IAl2YWwyID0gcG11X3JlYWRfc2luZ2xlKGZkKSAtIHZhbDI7CiAKLQlpZ3RfaW5mbygiYnVzeT0l
bHUgaWRsZT0lbHVcbiIsIHZhbCwgdmFsMik7CisJaWd0X2luZm8oImJ1c3k9JSJQUkl1NjQiIGlk
bGU9JSJQUkl1NjQiXG4iLCB2YWwsIHZhbDIpOwogCiAJaWd0X3NwaW5fYmF0Y2hfZnJlZShnZW1f
ZmQsIHNwaW5bMF0pOwogCWlndF9zcGluX2JhdGNoX2ZyZWUoZ2VtX2ZkLCBzcGluWzFdKTsKQEAg
LTM0MCwxMSArMzQwLDExIEBAIGJ1c3lfY2hlY2tfYWxsKGludCBnZW1fZmQsIGNvbnN0IHN0cnVj
dCBpbnRlbF9leGVjdXRpb25fZW5naW5lMiAqZSwKIHsKIAljb25zdCBzdHJ1Y3QgaW50ZWxfZXhl
Y3V0aW9uX2VuZ2luZTIgKmVfOwogCXVpbnQ2NF90IHR2YWxbMl1bbnVtX2VuZ2luZXNdOworCXVu
c2lnbmVkIGludCBidXN5X2lkeCA9IDAsIGk7CiAJdWludDY0X3QgdmFsW251bV9lbmdpbmVzXTsK
IAlpbnQgZmRbbnVtX2VuZ2luZXNdOwogCXVuc2lnbmVkIGxvbmcgc2xlcHQ7CiAJaWd0X3NwaW5f
dCAqc3BpbjsKLQl1bnNpZ25lZCBpbnQgYnVzeV9pZHgsIGk7CiAKIAlpID0gMDsKIAlmZFswXSA9
IC0xOwotLSAKMi4xNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
