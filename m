Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E8426ED6B
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Jul 2018 09:36:12 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b15-v6so7350657wrv.10
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Jul 2018 02:36:12 -0700 (PDT)
From: Tvrtko Ursulin <tursulin@ursulin.net>
Date: Thu, 19 Jul 2018 10:36:01 +0100
Message-Id: <20180719093601.11788-5-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20180719093601.11788-1-tvrtko.ursulin@linux.intel.com>
References: <20180719093601.11788-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t 4/4] trace.pl: Fix frequency timeline
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

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KCkZyZXF1ZW5j
eSB0aW1lbGluZSBuZWVkcyB0byBiZSBmaW5pc2hlZCB3aXRoIGFuIGVudHJ5IHNwYW5uaW5nIHRv
IHRoZSBlbmQKb2Yga25vd24gdGltZSBzbyB0aGF0IHRoZSBsYXN0IGtub3duIGZyZXF1ZW5jeSBp
cyBkaXNwbGF5ZWQuCgpTaWduZWQtb2ZmLWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3Vs
aW5AaW50ZWwuY29tPgotLS0KIHNjcmlwdHMvdHJhY2UucGwgfCAyICsrCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvc2NyaXB0cy90cmFjZS5wbCBiL3Njcmlw
dHMvdHJhY2UucGwKaW5kZXggMTkyNDMzM2UxMmI2Li4yOTc2Y2ZkZjU4NWEgMTAwNzU1Ci0tLSBh
L3NjcmlwdHMvdHJhY2UucGwKKysrIGIvc2NyaXB0cy90cmFjZS5wbApAQCAtMTIwMSw2ICsxMjAx
LDggQEAgZm9yZWFjaCBteSAka2V5IChzb3J0IHNvcnRRdWV1ZSBrZXlzICVkYikgewogCWxhc3Qg
aWYgJGkgPiAkbWF4X2l0ZW1zOwogfQogCitwdXNoIEBmcmVxcywgWyRwcmV2X2ZyZXFfdHMsICRs
YXN0X3RzLCAkcHJldl9mcmVxXSBpZiAkcHJldl9mcmVxOworCiBmb3JlYWNoIG15ICRpdGVtIChA
ZnJlcXMpIHsKIAlteSAoJHN0YXJ0LCAkZW5kLCAkZnJlcSkgPSBAJGl0ZW07CiAJbXkgJHN0YXJ0
ZW5kOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
