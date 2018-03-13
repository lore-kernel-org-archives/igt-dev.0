Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE5EC6E28A
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Mar 2018 09:18:07 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Tue, 13 Mar 2018 09:17:54 +0000
Message-Id: <20180313091755.2916-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/i915_query: fix expected subslice
 count on hsw
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
List-ID: <igt-dev@lists.freedesktop.org>

SGFzd2VsbCdzIGNvbmZpZ3VyYXRpb24gYXJlIGEgYml0IGRpZmZlcmVudCBmcm9tIHRoZSBmb2xs
b3dpbmcgR2Vucy4KCkJ1Z3ppbGxhOiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3df
YnVnLmNnaT9pZD0xMDU0NzYKU2lnbmVkLW9mZi1ieTogTGlvbmVsIExhbmR3ZXJsaW4gPGxpb25l
bC5nLmxhbmR3ZXJsaW5AaW50ZWwuY29tPgotLS0KIHRlc3RzL2k5MTVfcXVlcnkuYyB8IDEwICsr
KysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNV9xdWVyeS5jIGIvdGVzdHMvaTkxNV9xdWVyeS5jCmlu
ZGV4IGJiMGYwNzA3Li4zMjhjNTRiYyAxMDA2NDQKLS0tIGEvdGVzdHMvaTkxNV9xdWVyeS5jCisr
KyBiL3Rlc3RzL2k5MTVfcXVlcnkuYwpAQCAtNDQ5LDExICs0NDksMTcgQEAgdGVzdF9xdWVyeV90
b3BvbG9neV9rbm93bl9wY2lfaWRzKGludCBmZCwgaW50IGRldmlkKQogCQlicmVhazsKIAljYXNl
IDI6CiAJCWlndF9hc3NlcnRfZXEobl9zbGljZXMsIDEpOwotCQlpZ3RfYXNzZXJ0X2VxKG5fc3Vi
c2xpY2VzLCAzKTsKKwkJaWYgKGRldl9pbmZvLT5pc19oYXN3ZWxsKQorCQkJaWd0X2Fzc2VydF9l
cShuX3N1YnNsaWNlcywgMik7CisJCWVsc2UKKwkJCWlndF9hc3NlcnRfZXEobl9zdWJzbGljZXMs
IDMpOwogCQlicmVhazsKIAljYXNlIDM6CiAJCWlndF9hc3NlcnRfZXEobl9zbGljZXMsIDIpOwot
CQlpZ3RfYXNzZXJ0X2VxKG5fc3Vic2xpY2VzLCAyICogMyk7CisJCWlmIChkZXZfaW5mby0+aXNf
aGFzd2VsbCkKKwkJCWlndF9hc3NlcnRfZXEobl9zdWJzbGljZXMsIDIgKiAyKTsKKwkJZWxzZQor
CQkJaWd0X2Fzc2VydF9lcShuX3N1YnNsaWNlcywgMiAqIDMpOwogCQlicmVhazsKIAljYXNlIDQ6
CiAJCWlndF9hc3NlcnRfZXEobl9zbGljZXMsIDMpOwotLSAKMi4xNi4yCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdApp
Z3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
