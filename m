Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 919696E129
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Oct 2018 12:02:17 +0000 (UTC)
From: Jyoti Yadav <jyoti.r.yadav@intel.com>
Date: Wed, 10 Oct 2018 08:01:48 -0400
Message-Id: <1539172908-20679-6-git-send-email-jyoti.r.yadav@intel.com>
In-Reply-To: <1539172908-20679-1-git-send-email-jyoti.r.yadav@intel.com>
References: <1539172908-20679-1-git-send-email-jyoti.r.yadav@intel.com>
Subject: [igt-dev] [PATCH i-g-t v2 5/5] [intel-gfx] tests/pm_dc: Added test
 for DC6 during DPMS.
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
Cc: Jyoti Yadav <jyoti.r.yadav@intel.com>, anusha.srivatsa@intel.com, rodrigo.vivi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

QWRkZWQgbmV3IHN1YnRlc3QgZm9yIERDNiBlbnRyeSBkdXJpbmcgRFBNUyBvbi9vZmYgY3ljbGUu
CkR1cmluZyBEUE1TIG9uL29mZiBjeWNsZSBEQzYgY291bnRlciBpcyBpbmNyZW1lbnRlZC4KClNp
Z25lZC1vZmYtYnk6IEp5b3RpIFlhZGF2IDxqeW90aS5yLnlhZGF2QGludGVsLmNvbT4KLS0tCiB0
ZXN0cy9wbV9kYy5jIHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS90ZXN0cy9wbV9kYy5jIGIvdGVzdHMvcG1fZGMuYwppbmRleCBkYWM2MDM1
Li5jYjBhZWQ3IDEwMDY0NAotLS0gYS90ZXN0cy9wbV9kYy5jCisrKyBiL3Rlc3RzL3BtX2RjLmMK
QEAgLTI0NCw2ICsyNDQsMTIgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKIAkJ
Y2xlYW51cCgmZGF0YSk7CiAJfQogCisJaWd0X3N1YnRlc3QoImRjNi1kcG1zIikgeworCQlkYXRh
LmRjX2ZsYWdzIHw9IENIRUNLX0RDNjsKKwkJdGVzdF9kY19zdGF0ZV9kcG1zKCZkYXRhKTsKKwkJ
Y2xlYW51cCgmZGF0YSk7CisJfQorCiAJaWd0X2ZpeHR1cmUgewogCQljbG9zZShkYXRhLmRlYnVn
ZnNfZmQpOwogCQlkaXNwbGF5X2ZpbmkoJmRhdGEpOwotLSAKMS45LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0Cmln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
