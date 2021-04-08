Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DFF86E9E3
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Apr 2021 07:44:52 +0000 (UTC)
Date: Thu, 8 Apr 2021 09:44:46 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210408074446.GA7412@zkempczy-mobl2>
References: <20210402093844.39637-1-zbigniew.kempczynski@intel.com>
 <20210402093844.39637-3-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210402093844.39637-3-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v30 02/39] lib/igt_list: Add
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

T24gRnJpLCBBcHIgMDIsIDIwMjEgYXQgMTE6Mzg6MDdBTSArMDIwMCwgWmJpZ25pZXcgS2VtcGN6
ecWEc2tpIHdyb3RlOgo+IEZyb206IERvbWluaWsgR3J6ZWdvcnplayA8ZG9taW5pay5ncnplZ29y
emVrQGludGVsLmNvbT4KPiAKPiBBZGRlZCBzYWZlIHZlcnNpb24gb2YgcmV2ZXJzZWQgaXRlcmF0
aW9uIG92ZXIgaWd0X2xpc3QuCj4gCj4gU2lnbmVkLW9mZi1ieTogRG9taW5payBHcnplZ29yemVr
IDxkb21pbmlrLmdyemVnb3J6ZWtAaW50ZWwuY29tPgo+IENjOiBaYmlnbmlldyBLZW1wY3p5xYRz
a2kgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT4KPiBDYzogQ2hyaXMgV2lsc29uIDxj
aHJpc0BjaHJpcy13aWxzb24uY28udWs+CgpUaGlzIGxvb2tzIG9rLgoKUmV2aWV3ZWQtYnk6IFpi
aWduaWV3IEtlbXBjennFhHNraSA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPgoKPiAt
LS0KPiAgbGliL2lndF9saXN0LmggfCA2ICsrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNl
cnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3RfbGlzdC5oIGIvbGliL2lndF9saXN0
LmgKPiBpbmRleCBjYzkzZDdhMGQuLmJlNjNmZDgwNiAxMDA2NDQKPiAtLS0gYS9saWIvaWd0X2xp
c3QuaAo+ICsrKyBiL2xpYi9pZ3RfbGlzdC5oCj4gQEAgLTEwOCw2ICsxMDgsMTIgQEAgYm9vbCBp
Z3RfbGlzdF9lbXB0eShjb25zdCBzdHJ1Y3QgaWd0X2xpc3RfaGVhZCAqaGVhZCk7Cj4gIAkgICAg
ICZwb3MtPm1lbWJlciAhPSAoaGVhZCk7CQkJCQlcCj4gIAkgICAgIHBvcyA9IGlndF9jb250YWlu
ZXJfb2YoKHBvcyktPm1lbWJlci5wcmV2LCBwb3MsIG1lbWJlcikpCj4gIAo+ICsjZGVmaW5lIGln
dF9saXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmVfcmV2ZXJzZShwb3MsIHRtcCwgaGVhZCwgbWVtYmVy
KQlcCj4gKwlmb3IgKHBvcyA9IGlndF9jb250YWluZXJfb2YoKGhlYWQpLT5wcmV2LCBwb3MsIG1l
bWJlciksCQlcCj4gKwkgICAgIHRtcCA9IGlndF9jb250YWluZXJfb2YoKHBvcyktPm1lbWJlci5w
cmV2LCB0bXAsIG1lbWJlcik7CVwKPiArCSAgICAgJnBvcy0+bWVtYmVyICE9IChoZWFkKTsJCQkJ
CVwKPiArCSAgICAgcG9zID0gdG1wLAkJCQkJCQlcCj4gKwkgICAgIHRtcCA9IGlndF9jb250YWlu
ZXJfb2YoKHBvcyktPm1lbWJlci5wcmV2LCB0bXAsIG1lbWJlcikpCj4gIAo+ICAvKiBJR1QgY3Vz
dG9tIGhlbHBlcnMgKi8KPiAgCj4gLS0gCj4gMi4yNi4wCj4gCj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBpZ3QtZGV2IG1haWxpbmcgbGlzdAo+IGln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaWd0LWRldgo=
