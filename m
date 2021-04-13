Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0979A89CBC
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Apr 2021 13:54:53 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 13 Apr 2021 15:54:05 +0200
Message-Id: <20210413135441.121421-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210413135441.121421-1-zbigniew.kempczynski@intel.com>
References: <20210413135441.121421-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v34 02/38] lib/igt_list: Add
 igt_list_for_each_entry_safe_reverse
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

RnJvbTogRG9taW5payBHcnplZ29yemVrIDxkb21pbmlrLmdyemVnb3J6ZWtAaW50ZWwuY29tPgoK
QWRkZWQgc2FmZSB2ZXJzaW9uIG9mIHJldmVyc2VkIGl0ZXJhdGlvbiBvdmVyIGlndF9saXN0LgoK
U2lnbmVkLW9mZi1ieTogRG9taW5payBHcnplZ29yemVrIDxkb21pbmlrLmdyemVnb3J6ZWtAaW50
ZWwuY29tPgpDYzogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBp
bnRlbC5jb20+CkNjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KUmV2
aWV3ZWQtYnk6IFpiaWduaWV3IEtlbXBjennFhHNraSA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50
ZWwuY29tPgpBY2tlZC1ieTogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+
Ci0tLQogbGliL2lndF9saXN0LmggfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3RfbGlzdC5oIGIvbGliL2lndF9saXN0LmgKaW5k
ZXggY2M5M2Q3YTBkLi5iZTYzZmQ4MDYgMTAwNjQ0Ci0tLSBhL2xpYi9pZ3RfbGlzdC5oCisrKyBi
L2xpYi9pZ3RfbGlzdC5oCkBAIC0xMDgsNiArMTA4LDEyIEBAIGJvb2wgaWd0X2xpc3RfZW1wdHko
Y29uc3Qgc3RydWN0IGlndF9saXN0X2hlYWQgKmhlYWQpOwogCSAgICAgJnBvcy0+bWVtYmVyICE9
IChoZWFkKTsJCQkJCVwKIAkgICAgIHBvcyA9IGlndF9jb250YWluZXJfb2YoKHBvcyktPm1lbWJl
ci5wcmV2LCBwb3MsIG1lbWJlcikpCiAKKyNkZWZpbmUgaWd0X2xpc3RfZm9yX2VhY2hfZW50cnlf
c2FmZV9yZXZlcnNlKHBvcywgdG1wLCBoZWFkLCBtZW1iZXIpCVwKKwlmb3IgKHBvcyA9IGlndF9j
b250YWluZXJfb2YoKGhlYWQpLT5wcmV2LCBwb3MsIG1lbWJlciksCQlcCisJICAgICB0bXAgPSBp
Z3RfY29udGFpbmVyX29mKChwb3MpLT5tZW1iZXIucHJldiwgdG1wLCBtZW1iZXIpOwlcCisJICAg
ICAmcG9zLT5tZW1iZXIgIT0gKGhlYWQpOwkJCQkJXAorCSAgICAgcG9zID0gdG1wLAkJCQkJCQlc
CisJICAgICB0bXAgPSBpZ3RfY29udGFpbmVyX29mKChwb3MpLT5tZW1iZXIucHJldiwgdG1wLCBt
ZW1iZXIpKQogCiAvKiBJR1QgY3VzdG9tIGhlbHBlcnMgKi8KIAotLSAKMi4yNi4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcg
bGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
