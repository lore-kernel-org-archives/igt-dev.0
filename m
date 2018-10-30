Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F276E163
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Oct 2018 03:36:22 +0000 (UTC)
From: Jyoti Yadav <jyoti.r.yadav@intel.com>
Date: Mon, 29 Oct 2018 23:36:01 -0400
Message-Id: <1540870563-32554-4-git-send-email-jyoti.r.yadav@intel.com>
In-Reply-To: <1540870563-32554-1-git-send-email-jyoti.r.yadav@intel.com>
References: <1540870563-32554-1-git-send-email-jyoti.r.yadav@intel.com>
Subject: [igt-dev] [PATCH i-g-t v3 3/5] [intel-gfx] tests/pm_dc: Added test
 for
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
Cc: Jyoti Yadav <jyoti.r.yadav@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

VGhpcyBwYXRjaCBhZGQgc3VidGVzdCB0byBjaGVjayBEQzYgZW50cnkgb24gUFNSIGZvciB0aGUg
c3VwcG9ydGVkCnBsYXRmb3Jtcy4KCnYyOiBSZW5hbWUgdGhlIHN1YnRlc3Qgd2l0aCBtb3JlIG1l
YW5pbmdmdWwgbmFtZS4KdjM6IFJlYmFzZWQuCgpTaWduZWQtb2ZmLWJ5OiBKeW90aSBZYWRhdiA8
anlvdGkuci55YWRhdkBpbnRlbC5jb20+Ci0tLQogdGVzdHMvcG1fZGMuYyB8IDEyICsrKysrKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90ZXN0
cy9wbV9kYy5jIGIvdGVzdHMvcG1fZGMuYwppbmRleCA5Y2VkMzRmLi5iNzRmMTFmIDEwMDY0NAot
LS0gYS90ZXN0cy9wbV9kYy5jCisrKyBiL3Rlc3RzL3BtX2RjLmMKQEAgLTIwMSw2ICsyMDEsMTgg
QEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKIAkJdGVzdF9kY19zdGF0ZV9wc3Io
JmRhdGEsIENIRUNLX0RDNSk7CiAJCWNsZWFudXAoJmRhdGEpOwogCX0KKworCWlndF9zdWJ0ZXN0
KCJkYzYtcHNyIikgeworCQlwc3JfZW5hYmxlKGRhdGEuZGVidWdmc19mZCk7CisJCWlndF9yZXF1
aXJlX2YoZWRwX3Bzcl9zaW5rX3N1cHBvcnQoJmRhdGEpLAorCQkJICAgICAgIlNpbmsgZG9lcyBu
b3Qgc3VwcG9ydCBQU1JcbiIpOworCQkvKiBDaGVjayBEQzUgY291bnRlciBpcyBhdmFpbGFibGUg
Zm9yIHRoZSBwbGF0Zm9ybS4KKwkJICogU2tpcCB0aGUgdGVzdCBpZiBjb3VudGVyIGlzIG5vdCBh
dmFpbGFibGUuCisJCSAqLworCQlyZWFkX2RjX2NvdW50ZXIoZGF0YS5kcm1fZmQsIENIRUNLX0RD
Nik7CisJCXRlc3RfZGNfc3RhdGVfcHNyKCZkYXRhLCBDSEVDS19EQzYpOworCQljbGVhbnVwKCZk
YXRhKTsKKwl9CiAJaWd0X2ZpeHR1cmUgewogCQljbG9zZShkYXRhLmRlYnVnZnNfZmQpOwogCQlk
aXNwbGF5X2ZpbmkoJmRhdGEpOwotLSAKMS45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaWd0LWRldgo=
