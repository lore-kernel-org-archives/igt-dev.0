Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr0-x243.google.com (mail-wr0-x243.google.com
 [IPv6:2a00:1450:400c:c0c::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE956EEEA
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Jun 2018 17:51:05 +0000 (UTC)
Received: by mail-wr0-x243.google.com with SMTP id d2-v6so3337697wrm.10
 for <igt-dev@lists.freedesktop.org>; Tue, 05 Jun 2018 10:51:05 -0700 (PDT)
From: Tvrtko Ursulin <tursulin@ursulin.net>
Date: Tue,  5 Jun 2018 18:50:49 +0100
Message-Id: <20180605175050.29850-7-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20180605175050.29850-1-tvrtko.ursulin@linux.intel.com>
References: <20180605175050.29850-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t 7/8] trace.pl: Basic preemption support
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
eCAxZDQyZjI3NDk3MTAuLjliYzBiNWIyOTFkNCAxMDA3NTUKLS0tIGEvc2NyaXB0cy90cmFjZS5w
bAorKysgYi9zY3JpcHRzL3RyYWNlLnBsCkBAIC00MjgsNyArNDI4LDkgQEAgd2hpbGUgKDw+KSB7
CiAJfSBlbHNpZiAoJHRwX25hbWUgZXEgJ2k5MTU6aTkxNV9yZXF1ZXN0X2luOicpIHsKIAkJbXkg
JXJlcTsKIAotCQlkaWUgaWYgZXhpc3RzICRkYnska2V5fTsKKwkJIyBwcmVlbXB0aW9uCisJCWRl
bGV0ZSAkZGJ7JGtleX0gaWYgZXhpc3RzICRkYnska2V5fTsKKwogCQlkaWUgdW5sZXNzIGV4aXN0
cyAkcXVldWV7JGtleX07CiAJCWRpZSB1bmxlc3MgZXhpc3RzICRzdWJtaXR7JGtleX07CiAKLS0g
CjIuMTcuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
aWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
