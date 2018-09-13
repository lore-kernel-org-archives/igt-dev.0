Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 056B76E1C5
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Sep 2018 15:06:20 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id n2-v6so6207854wrw.7
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Sep 2018 08:06:20 -0700 (PDT)
From: Tvrtko Ursulin <tursulin@ursulin.net>
Date: Thu, 13 Sep 2018 16:06:13 +0100
Message-Id: <20180913150613.16265-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] [PATH i-g-t] igt_sysfs: Avoid double closing the fd in
 igt_sysfs_scanf
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

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KCmZkb3BlbiB0
YWtlcyBvd25lcnNoaXAgb2YgdGhlIGZkIHNvIG9ubHkgb25lIGZsYXZvdXIgb2YgY2xvc2luZyBp
dCBpcwpuZWVkZWQuCgpTaWduZWQtb2ZmLWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3Vs
aW5AaW50ZWwuY29tPgotLS0KIGxpYi9pZ3Rfc3lzZnMuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbGliL2lndF9z
eXNmcy5jIGIvbGliL2lndF9zeXNmcy5jCmluZGV4IDkwMTJjYzczZjZlMy4uZDMyM2I4MWRkOTg2
IDEwMDY0NAotLS0gYS9saWIvaWd0X3N5c2ZzLmMKKysrIGIvbGliL2lndF9zeXNmcy5jCkBAIC0z
NzksOCArMzc5LDkgQEAgaW50IGlndF9zeXNmc19zY2FuZihpbnQgZGlyLCBjb25zdCBjaGFyICph
dHRyLCBjb25zdCBjaGFyICpmbXQsIC4uLikKIAkJdmFfZW5kKGFwKTsKIAogCQlmY2xvc2UoZmls
ZSk7CisJfSBlbHNlIHsKKwkJY2xvc2UoZmQpOwogCX0KLQljbG9zZShmZCk7CiAKIAlyZXR1cm4g
cmV0OwogfQotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1k
ZXYK
