Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D1966E190
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2020 12:13:59 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 28 Jul 2020 14:13:17 +0200
Message-Id: <20200728121320.6358-15-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200728121320.6358-1-zbigniew.kempczynski@intel.com>
References: <20200728121320.6358-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v11 14/17] lib/intel_batchbuffer: change
 alignment constraints on gen3
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

R2VuMyByZXF1aXJlcyBiaWdnZXIgYWxpZ25tZW50IG9uIHRpbGVkIGJ1ZmZlcnMuIENoYW5nZSB0
byBwb3dlcgpvZiB0d28gc2l6ZWQgKHN0YXJ0aW5nIGZyb20gMU1CKS4KClNpZ25lZC1vZmYtYnk6
IFpiaWduaWV3IEtlbXBjennFhHNraSA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPgot
LS0KIGxpYi9pbnRlbF9iYXRjaGJ1ZmZlci5jIHwgMTAgKysrKysrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDEwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9saWIvaW50ZWxfYmF0Y2hidWZmZXIu
YyBiL2xpYi9pbnRlbF9iYXRjaGJ1ZmZlci5jCmluZGV4IDNhZTM2OWI3Li5jZDUyNzhiMCAxMDA2
NDQKLS0tIGEvbGliL2ludGVsX2JhdGNoYnVmZmVyLmMKKysrIGIvbGliL2ludGVsX2JhdGNoYnVm
ZmVyLmMKQEAgLTE1NzgsNiArMTU3OCwxNiBAQCBpbnRlbF9iYl9hZGRfaW50ZWxfYnVmKHN0cnVj
dCBpbnRlbF9iYiAqaWJiLCBzdHJ1Y3QgaW50ZWxfYnVmICpidWYsIGJvb2wgd3JpdGUpCiAJCW9i
ai0+YWxpZ25tZW50ID0gMHgxMDAwMDsKIAl9CiAKKwkvKiBGb3IgZ2VuMyBlbnN1cmUgdGlsZWQg
YnVmZmVycyBhcmUgYWxpZ25lZCB0byBwb3dlciBvZiB0d28gc2l6ZSAqLworCWlmIChpYmItPmdl
biA9PSAzICYmIGJ1Zi0+dGlsaW5nKSB7CisJCXVpbnQ2NF90IGFsaWdubWVudCA9IDEwMjQgKiAx
MDI0OworCisJCXdoaWxlIChhbGlnbm1lbnQgPCBidWYtPnN1cmZhY2VbMF0uc2l6ZSkKKwkJCWFs
aWdubWVudCA8PD0gMTsKKwkJb2JqLT5vZmZzZXQgJj0gfihhbGlnbm1lbnQgLSAxKTsKKwkJb2Jq
LT5hbGlnbm1lbnQgPSBhbGlnbm1lbnQ7CisJfQorCiAJLyogVXBkYXRlIGFkZHJlc3MgaW4gaW50
ZWxfYnVmIGJ1ZmZlciAqLwogCWJ1Zi0+YWRkci5vZmZzZXQgPSBvYmotPm9mZnNldDsKIAotLSAK
Mi4yNi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
