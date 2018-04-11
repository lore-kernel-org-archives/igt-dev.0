Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AA066E0BE
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Apr 2018 02:37:58 +0000 (UTC)
From: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Date: Tue, 10 Apr 2018 19:37:13 -0700
Message-Id: <20180411023732.32362-1-dhinakaran.pandiyan@intel.com>
Subject: [igt-dev] [PATCH i-g-t 01/20] tests/psr: Print the reason for
 skipping when sink lacks PSR support
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
Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>, rodrigo.vivi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

QW5kIHJlbmFtZSB0aGUgZnVuY3Rpb24gdG8gbWF0Y2ggd2hhdCBpdCBkb2VzLgoKU2lnbmVkLW9m
Zi1ieTogRGhpbmFrYXJhbiBQYW5kaXlhbiA8ZGhpbmFrYXJhbi5wYW5kaXlhbkBpbnRlbC5jb20+
Ci0tLQogdGVzdHMva21zX3Bzcl9zaW5rX2NyYy5jIHwgNiArKystLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMva21z
X3Bzcl9zaW5rX2NyYy5jIGIvdGVzdHMva21zX3Bzcl9zaW5rX2NyYy5jCmluZGV4IDk4ZDI5YmE5
Li45MzgwN2MwMyAxMDA2NDQKLS0tIGEvdGVzdHMva21zX3Bzcl9zaW5rX2NyYy5jCisrKyBiL3Rl
c3RzL2ttc19wc3Jfc2lua19jcmMuYwpAQCAtMTkzLDcgKzE5Myw3IEBAIHN0YXRpYyB2b2lkIGZp
bGxfcmVuZGVyKGRhdGFfdCAqZGF0YSwgdWludDMyX3QgaGFuZGxlLCB1bnNpZ25lZCBjaGFyIGNv
bG9yKQogCWdlbV9ib19idXN5KGRhdGEtPmRybV9mZCwgaGFuZGxlKTsKIH0KIAotc3RhdGljIGJv
b2wgcHNyX3Bvc3NpYmxlKGRhdGFfdCAqZGF0YSkKK3N0YXRpYyBib29sIHNpbmtfc3VwcG9ydChk
YXRhX3QgKmRhdGEpCiB7CiAJY2hhciBidWZbNTEyXTsKIApAQCAtNTEzLDggKzUxMyw4IEBAIGlu
dCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCiAKIAkJaWd0X3NldF9tb2R1bGVfcGFyYW1f
aW50KCJlbmFibGVfcHNyIiwgcnVubmluZ193aXRoX3Bzcl9kaXNhYmxlZCA/CiAJCQkJCSAwIDog
MSk7Ci0KLQkJaWd0X3NraXBfb24oIXBzcl9wb3NzaWJsZSgmZGF0YSkpOworCQlpZ3RfcmVxdWly
ZV9mKHNpbmtfc3VwcG9ydCgmZGF0YSksCisJCQkgICAgICAiU2luayBkb2VzIG5vdCBzdXBwb3J0
IFBTUlxuIik7CiAKIAkJZGF0YS5idWZtZ3IgPSBkcm1faW50ZWxfYnVmbWdyX2dlbV9pbml0KGRh
dGEuZHJtX2ZkLCA0MDk2KTsKIAkJaWd0X2Fzc2VydChkYXRhLmJ1Zm1ncik7Ci0tIAoyLjE0LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYg
bWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
