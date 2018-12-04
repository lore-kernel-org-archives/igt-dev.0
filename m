Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34A816E25B
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Dec 2018 23:09:50 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Tue,  4 Dec 2018 15:09:39 -0800
Message-Id: <20181204230944.7753-3-jose.souza@intel.com>
In-Reply-To: <20181204230944.7753-1-jose.souza@intel.com>
References: <20181204230944.7753-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/8] lib/psr: Add support to new modified
 i915_edp_psr_status output
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
Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

VGhlIGtlcm5lbCBwYXRjaCAnZHJtL2k5MTU6IFJlZmFjdG9yIFBTUiBzdGF0dXMgZGVidWdmcycg
Y2hhbmdlZCB0aGUKb3V0cHV0IG9mIGk5MTVfZWRwX3Bzcl9zdGF0dXMsIHNvIGFkZGluZyBzdXBw
b3J0IHRvIHRoZSBuZXcgb3V0cHV0CmhlcmUgd2hpbGUga2VlcGluZyB0aGUgc3VwcG9ydCB0byB0
aGUgb2xkIG9uZSBmb3IgYSB3aGlsZS4KCkNjOiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBp
bnRlbC5jb20+CkNjOiBEaGluYWthcmFuIFBhbmRpeWFuIDxkaGluYWthcmFuLnBhbmRpeWFuQGlu
dGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6
YUBpbnRlbC5jb20+Ci0tLQogbGliL2lndF9wc3IuYyB8IDkgKysrKysrLS0tCiAxIGZpbGUgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2xpYi9p
Z3RfcHNyLmMgYi9saWIvaWd0X3Bzci5jCmluZGV4IGQ2OGY0YjQ5Li5lZWNlZTQ1OSAxMDA2NDQK
LS0tIGEvbGliL2lndF9wc3IuYworKysgYi9saWIvaWd0X3Bzci5jCkBAIC0zNCw4ICszNCwxMCBA
QCBzdGF0aWMgYm9vbCBwc3JfYWN0aXZlKGludCBkZWJ1Z2ZzX2ZkLCBib29sIGNoZWNrX2FjdGl2
ZSkKIAogCWlndF9kZWJ1Z2ZzX3NpbXBsZV9yZWFkKGRlYnVnZnNfZmQsICJpOTE1X2VkcF9wc3Jf
c3RhdHVzIiwgYnVmLAogCQkJCXNpemVvZihidWYpKTsKLQlhY3RpdmUgPSBzdHJzdHIoYnVmLCAi
SFcgRW5hYmxlZCAmIEFjdGl2ZSBiaXQ6IHllc1xuIikgJiYKLQkJKHN0cnN0cihidWYsICJTUkRF
TlQiKSB8fCBzdHJzdHIoYnVmLCAiU0xFRVAiKSk7CisKKwlhY3RpdmUgPSBzdHJzdHIoYnVmLCAi
SFcgRW5hYmxlZCAmIEFjdGl2ZSBiaXQ6IHllc1xuIikgfHwKKwkJIHN0cnN0cihidWYsICJTb3Vy
Y2UgUFNSIGN0bDogZW5hYmxlZCIpOworCWFjdGl2ZSAmPSAhIShzdHJzdHIoYnVmLCAiU1JERU5U
IikgfHwgc3Ryc3RyKGJ1ZiwgIlNMRUVQIikpOwogCXJldHVybiBjaGVja19hY3RpdmUgPyBhY3Rp
dmUgOiAhYWN0aXZlOwogfQogCkBAIC0xMzgsNSArMTQwLDYgQEAgYm9vbCBwc3Jfc3VwcG9ydGVk
KGludCBkZWJ1Z2ZzX2ZkKQogCiAJaWd0X2RlYnVnZnNfc2ltcGxlX3JlYWQoZGVidWdmc19mZCwg
Imk5MTVfZWRwX3Bzcl9zdGF0dXMiLCBidWYsCiAJCQkJc2l6ZW9mKGJ1ZikpOwotCXJldHVybiBz
dHJzdHIoYnVmLCAiU2lua19TdXBwb3J0OiB5ZXNcbiIpOworCXJldHVybiBzdHJzdHIoYnVmLCAi
U2lua19TdXBwb3J0OiB5ZXNcbiIpIHx8CisJICAgICAgIHN0cnN0cihidWYsICJTaW5rIHN1cHBv
cnQ6IHllcyIpOwogfQotLSAKMi4xOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2lndC1kZXYK
