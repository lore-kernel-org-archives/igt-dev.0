Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D124F6EC4E
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jul 2020 14:00:51 +0000 (UTC)
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Date: Fri, 10 Jul 2020 17:00:48 +0300
Message-Id: <20200710140048.646121-1-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_psr2_su: Add igt_assert when the
 failing of PSR2 enabling
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

VGhlIHBzcl9wcmludF9kZWJ1Z2ZzKCkgZnVuY3Rpb24gdXNlcyBpZ3RfZGVidWcoKSBmb3IgbG9n
Z2luZy4KQXMgaWd0X3JlcXVpcmUoKSBkb2VzIG5vdCByYWlzZSBwcmludGluZyBvdXQgb2YgSUdU
X0xPR19ERUJVRyBsZXZlbC4KSXQgY2hhbmdlcyBpZ3RfZGVidWcoKSB0byBpZ3RfYXNzZXJ0KCkg
Zm9yIGdldHRpbmcgZGVidWcgbG9nIG9uCnNraXBwaW5nIHRlc3QgY2FzZSBvZiBrbXNfcHNyMl9z
dS4KCkNjOiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4KU2ln
bmVkLW9mZi1ieTogR3dhbi1neWVvbmcgTXVuIDxnd2FuLWd5ZW9uZy5tdW5AaW50ZWwuY29tPgot
LS0KIHRlc3RzL2ttc19wc3IyX3N1LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9rbXNfcHNyMl9zdS5jIGIv
dGVzdHMva21zX3BzcjJfc3UuYwppbmRleCBkNTQ5ZDlhMy4uZTgyMTkzY2IgMTAwNjQ0Ci0tLSBh
L3Rlc3RzL2ttc19wc3IyX3N1LmMKKysrIGIvdGVzdHMva21zX3BzcjJfc3UuYwpAQCAtMjYzLDcg
KzI2Myw3IEBAIGlndF9tYWluCiAJCWNsZWFudXAoJmRhdGEpOwogCQlpZiAoIXIpCiAJCQlwc3Jf
cHJpbnRfZGVidWdmcyhkYXRhLmRlYnVnZnNfZmQpOwotCQlpZ3RfcmVxdWlyZV9mKHIsICJQU1Iy
IGNhbiBub3QgYmUgZW5hYmxlZFxuIik7CisJCWlndF9hc3NlcnRfZihyLCAiUFNSMiBjYW4gbm90
IGJlIGVuYWJsZWRcbiIpOwogCiAJCS8qIGJsb2NraW5nIHRpbWVyZmQgKi8KIAkJZGF0YS5jaGFu
Z2Vfc2NyZWVuX3RpbWVyZmQgPSB0aW1lcmZkX2NyZWF0ZShDTE9DS19NT05PVE9OSUMsIDApOwot
LSAKMi4yNS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
