Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 030806E089
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Apr 2018 12:17:32 +0000 (UTC)
From: Marta Lofstedt <marta.lofstedt@intel.com>
Date: Fri,  6 Apr 2018 15:19:07 +0300
Message-Id: <20180406121907.22114-1-marta.lofstedt@intel.com>
Subject: [igt-dev] [PATCH i-g-t] tests/kms_frontbuffer_tracking: Save
 runtime by removing sleep.
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

VGhlIGttc19mcm9udGJ1ZmZlcl90cmFja2luZ0Aqc3VzcGVuZCBzdWJ0ZXN0cyBzcGVuZCAyMCBz
ZWNvbmRzCnNsZWVwaW5nIGFyb3VuZCBpZ3Rfc3lzdGVtX3N1c3BlbmRfYXV0b3Jlc3VtZS4gSSBm
aW5kIG5vIG90aGVyCmlndCB0ZXN0IHRoYXQgcmVxdWlyZSBzbGVlcGluZyBpbiByZWxhdGlvbiB0
byBzdXNwZW5kLXJlc3VtZSwgc28KaXQgc2hvdWxkIGJlIHJlbW92ZWQuCgpTaWduZWQtb2ZmLWJ5
OiBNYXJ0YSBMb2ZzdGVkdCA8bWFydGEubG9mc3RlZHRAaW50ZWwuY29tPgotLS0KIHRlc3RzL2tt
c19mcm9udGJ1ZmZlcl90cmFja2luZy5jIHwgNCAtLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYyBi
L3Rlc3RzL2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5jCmluZGV4IGEyMGU3MTE4Li5kMjYwNzhj
YyAxMDA2NDQKLS0tIGEvdGVzdHMva21zX2Zyb250YnVmZmVyX3RyYWNraW5nLmMKKysrIGIvdGVz
dHMva21zX2Zyb250YnVmZmVyX3RyYWNraW5nLmMKQEAgLTI4MzAsMTUgKzI4MzAsMTEgQEAgc3Rh
dGljIHZvaWQgc3VzcGVuZF9zdWJ0ZXN0KGNvbnN0IHN0cnVjdCB0ZXN0X21vZGUgKnQpCiAJc3Ry
dWN0IG1vZGVzZXRfcGFyYW1zICpwYXJhbXMgPSBwaWNrX3BhcmFtcyh0KTsKIAogCXByZXBhcmVf
c3VidGVzdCh0LCBOVUxMKTsKLQlzbGVlcCg1KTsKIAlpZ3Rfc3lzdGVtX3N1c3BlbmRfYXV0b3Jl
c3VtZShTVVNQRU5EX1NUQVRFX01FTSwgU1VTUEVORF9URVNUX05PTkUpOwotCXNsZWVwKDUpOwog
CWRvX2Fzc2VydGlvbnMoQVNTRVJUX0RSUlNfTE9XKTsKIAogCXVuc2V0X2FsbF9jcnRjcygpOwot
CXNsZWVwKDUpOwogCWlndF9zeXN0ZW1fc3VzcGVuZF9hdXRvcmVzdW1lKFNVU1BFTkRfU1RBVEVf
TUVNLCBTVVNQRU5EX1RFU1RfTk9ORSk7Ci0Jc2xlZXAoNSk7CiAJZG9fYXNzZXJ0aW9ucyhBU1NF
UlRfRkJDX0RJU0FCTEVEIHwgQVNTRVJUX1BTUl9ESVNBQkxFRCB8CiAJCSAgICAgIERPTlRfQVNT
RVJUX0NSQyB8IEFTU0VSVF9EUlJTX0lOQUNUSVZFKTsKIAotLSAKMi4xMS4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlz
dAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
