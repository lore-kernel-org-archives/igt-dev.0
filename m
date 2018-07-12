Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A80F86EF72
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jul 2018 11:00:12 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id e7-v6so1688232wrs.9
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jul 2018 04:00:12 -0700 (PDT)
From: Tvrtko Ursulin <tursulin@ursulin.net>
Date: Thu, 12 Jul 2018 11:59:57 +0100
Message-Id: <20180712105958.12953-9-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20180712105958.12953-1-tvrtko.ursulin@linux.intel.com>
References: <20180712105958.12953-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t 8/9] trace.pl: Basic preemption support
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
Cc: intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KCkp1c3QgZm9y
Z2V0IGFib3V0IGVhcmxpZXIgcmVxdWVzdF9pbiBldmVudHMuCgpTaWduZWQtb2ZmLWJ5OiBUdnJ0
a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgotLS0KIHNjcmlwdHMvdHJhY2Uu
cGwgfCA0ICsrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9zY3JpcHRzL3RyYWNlLnBsIGIvc2NyaXB0cy90cmFjZS5wbAppbmRl
eCAzMzA0NWYzMjY0ZjIuLjQzYzY4MDAxZDc2OCAxMDA3NTUKLS0tIGEvc2NyaXB0cy90cmFjZS5w
bAorKysgYi9zY3JpcHRzL3RyYWNlLnBsCkBAIC00MzgsNyArNDM4LDkgQEAgd2hpbGUgKDw+KSB7
CiAJfSBlbHNpZiAoJHRwX25hbWUgZXEgJ2k5MTU6aTkxNV9yZXF1ZXN0X2luOicpIHsKIAkJbXkg
JXJlcTsKIAotCQlkaWUgaWYgZXhpc3RzICRkYnska2V5fTsKKwkJIyBwcmVlbXB0aW9uCisJCWRl
bGV0ZSAkZGJ7JGtleX0gaWYgZXhpc3RzICRkYnska2V5fTsKKwogCQlkaWUgdW5sZXNzIGV4aXN0
cyAkcXVldWV7JGtleX07CiAJCWRpZSB1bmxlc3MgZXhpc3RzICRzdWJtaXR7JGtleX07CiAKLS0g
CjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
aWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
