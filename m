Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F0858987A
 for <igt-dev@lists.freedesktop.org>; Fri, 17 May 2019 10:47:02 +0000 (UTC)
From: Simon Ser <simon.ser@intel.com>
Date: Fri, 17 May 2019 13:46:53 +0300
Message-Id: <20190517104653.22477-1-simon.ser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_chamelium: document audio test
 frequencies
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
Cc: martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

RXhwbGFpbiB0aGF0IHRoZXkgY2FuIGdldCBkcm9wcGVkIGRlcGVuZGluZyBvbiB0aGUgc2FtcGxp
bmcgcmF0ZSBhbmQgd2h5LgoKU2lnbmVkLW9mZi1ieTogU2ltb24gU2VyIDxzaW1vbi5zZXJAaW50
ZWwuY29tPgotLS0KIHRlc3RzL2ttc19jaGFtZWxpdW0uYyB8IDEwICsrKysrKysrKy0KIDEgZmls
ZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90
ZXN0cy9rbXNfY2hhbWVsaXVtLmMgYi90ZXN0cy9rbXNfY2hhbWVsaXVtLmMKaW5kZXggYzhiNmIy
MmQ3YjRhLi4wZGQ4YzQxYWQyZDUgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19jaGFtZWxpdW0uYwor
KysgYi90ZXN0cy9rbXNfY2hhbWVsaXVtLmMKQEAgLTc4NSwxMiArNzg1LDIwIEBAIHN0YXRpYyBp
bnQgdGVzdF9zYW1wbGluZ19yYXRlc1tdID0gewoKIHN0YXRpYyBpbnQgdGVzdF9zYW1wbGluZ19y
YXRlc19jb3VudCA9IHNpemVvZih0ZXN0X3NhbXBsaW5nX3JhdGVzKSAvIHNpemVvZihpbnQpOwoK
Ky8qIFRlc3QgZnJlcXVlbmNpZXMgKEh6KTogYSBzaW5lIHNpZ25hbCB3aWxsIGJlIGdlbmVyYXRl
ZCBmb3IgZWFjaC4KKyAqCisgKiBEZXBlbmRpbmcgb24gdGhlIHNhbXBsaW5nIHJhdGUgY2hvc2Vu
LCBpdCBtaWdodCBub3QgYmUgcG9zc2libGUgdG8gcHJvcGVybHkKKyAqIGRldGVjdCB0aGUgZ2Vu
ZXJhdGVkIHNpbmUgKHNlZSBOeXF1aXN04oCTU2hhbm5vbiBzYW1wbGluZyB0aGVvcmVtKS4KKyAq
IEZyZXF1ZW5jaWVzIHRoYXQgY2FuJ3QgYmUgcmVsaWFibHkgZGV0ZWN0ZWQgd2lsbCBiZSBhdXRv
bWF0aWNhbGx5IHBydW5lZCBpbgorICogI2F1ZGlvX3NpZ25hbF9hZGRfZnJlcXVlbmN5LiBGb3Ig
aW5zdGFuY2UsIHRoZSA4MEtIeiBmcmVxdWVuY3kgY2FuIG9ubHkgYmUKKyAqIHRlc3RlZCB3aXRo
IGEgMTkyS0h6IHNhbXBsaW5nIHJhdGUuCisgKi8KIHN0YXRpYyBpbnQgdGVzdF9mcmVxdWVuY2ll
c1tdID0gewogCTMwMCwKIAk2MDAsCiAJMTIwMCwKLQk4MDAwMCwKIAkxMDAwMCwKKwk4MDAwMCwK
IH07Cgogc3RhdGljIGludCB0ZXN0X2ZyZXF1ZW5jaWVzX2NvdW50ID0gc2l6ZW9mKHRlc3RfZnJl
cXVlbmNpZXMpIC8gc2l6ZW9mKGludCk7Ci0tCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9pZ3QtZGV2
