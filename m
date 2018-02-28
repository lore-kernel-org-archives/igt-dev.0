Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr0-x244.google.com (mail-wr0-x244.google.com
 [IPv6:2a00:1450:400c:c0c::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E43B96E91A
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Feb 2018 10:08:10 +0000 (UTC)
Received: by mail-wr0-x244.google.com with SMTP id v111so1753610wrb.3
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Feb 2018 02:08:10 -0800 (PST)
From: Tvrtko Ursulin <tursulin@ursulin.net>
Date: Wed, 28 Feb 2018 10:07:59 +0000
Message-Id: <20180228100800.11840-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/kms_frontbuffer_tracking: Fix
 build warning
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

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KCk1hcmsgZHJy
c19zZXQgYXMgc3RhdGljIHRvIGF2b2lkIGEgYnVpbGQgd2FybmluZy4KClNpZ25lZC1vZmYtYnk6
IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+Ci0tLQogdGVzdHMva21z
X2Zyb250YnVmZmVyX3RyYWNraW5nLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9rbXNfZnJvbnRidWZmZXJf
dHJhY2tpbmcuYyBiL3Rlc3RzL2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5jCmluZGV4IDE0ODNj
MjI4MDQ0ZS4uNDMzODQ4MDFlMmI1IDEwMDY0NAotLS0gYS90ZXN0cy9rbXNfZnJvbnRidWZmZXJf
dHJhY2tpbmcuYworKysgYi90ZXN0cy9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYwpAQCAtODMw
LDcgKzgzMCw3IEBAIHN0YXRpYyB2b2lkIHBzcl9wcmludF9zdGF0dXModm9pZCkKIAlpZ3RfaW5m
bygiUFNSIHN0YXR1czpcbiVzXG4iLCBidWYpOwogfQogCi12b2lkIGRycnNfc2V0KHVuc2lnbmVk
IGludCB2YWwpCitzdGF0aWMgdm9pZCBkcnJzX3NldCh1bnNpZ25lZCBpbnQgdmFsKQogewogCWNo
YXIgYnVmWzJdOwogCWludCByZXQ7Ci0tIAoyLjE0LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaWd0LWRldgo=
