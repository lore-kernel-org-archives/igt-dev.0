Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr0-x241.google.com (mail-wr0-x241.google.com
 [IPv6:2a00:1450:400c:c0c::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 861C66E91C
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Feb 2018 10:08:11 +0000 (UTC)
Received: by mail-wr0-x241.google.com with SMTP id p104so1722434wrc.12
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Feb 2018 02:08:11 -0800 (PST)
From: Tvrtko Ursulin <tursulin@ursulin.net>
Date: Wed, 28 Feb 2018 10:08:00 +0000
Message-Id: <20180228100800.11840-2-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20180228100800.11840-1-tvrtko.ursulin@linux.intel.com>
References: <20180228100800.11840-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/perf: Fix build warning
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

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KCk1vdmUgdmFy
aWFibGUgZGVjbGFyYXRpb24gdG8gdG9wIG9mIHNjb3BlIHRvIGF2b2lkIEM5MCBidWlsZCB3YXJu
aW5nLgoKU2lnbmVkLW9mZi1ieTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVs
LmNvbT4KLS0tCiB0ZXN0cy9wZXJmLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9wZXJmLmMgYi90ZXN0cy9w
ZXJmLmMKaW5kZXggYzMwMmEzNTViODUwLi43OGJmNmNkZDM1MDQgMTAwNjQ0Ci0tLSBhL3Rlc3Rz
L3BlcmYuYworKysgYi90ZXN0cy9wZXJmLmMKQEAgLTE3MjYsNiArMTcyNiw3IEBAIHRlc3Rfb2Ff
ZXhwb25lbnRzKHZvaWQpCiAJCWludCBidWZfc2l6ZSA9IHNhbXBsZV9zaXplICogbWF4X3JlcG9y
dHMgKiAxLjU7CiAJCXVpbnQ4X3QgKmJ1ZiA9IGNhbGxvYygxLCBidWZfc2l6ZSk7CiAJCWludCBy
ZXQsIG5fdGltZXJfcmVwb3J0cyA9IDA7CisJCXVpbnQzMl90IG1hdGNoZXMgPSAwOwogCQlzdHJ1
Y3QgewogCQkJdWludDMyX3QgcmVwb3J0WzY0XTsKIAkJfSB0aW1lcl9yZXBvcnRzWzMwXTsKQEAg
LTE3ODUsNyArMTc4Niw2IEBAIHRlc3Rfb2FfZXhwb25lbnRzKHZvaWQpCiAJCWlndF9kZWJ1Zygi
cmVwb3J0JTA0aSB0cz0lMDh4IGh3X2lkPTB4JTA4eFxuIiwgMCwKIAkJCSAgdGltZXJfcmVwb3J0
c1swXS5yZXBvcnRbMV0sCiAJCQkgIG9hX3JlcG9ydF9nZXRfY3R4X2lkKHRpbWVyX3JlcG9ydHNb
MF0ucmVwb3J0KSk7Ci0JCXVpbnQzMl90IG1hdGNoZXMgPSAwOwogCQlmb3IgKGludCBpID0gMTsg
aSA8IG5fdGltZXJfcmVwb3J0czsgaSsrKSB7CiAJCQl1aW50MzJfdCBkZWx0YSA9CiAJCQkJdGlt
ZXJfcmVwb3J0c1tpXS5yZXBvcnRbMV0gLSB0aW1lcl9yZXBvcnRzW2kgLSAxXS5yZXBvcnRbMV07
Ci0tIAoyLjE0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
