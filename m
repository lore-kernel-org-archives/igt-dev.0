Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 876ED6E078
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Feb 2018 07:47:02 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20180222074343.25292-1-marta.lofstedt@intel.com>
In-Reply-To: <20180222074343.25292-1-marta.lofstedt@intel.com>
Message-ID: <151928561738.11316.4884773980791963564@mail.alporthouse.com>
Date: Thu, 22 Feb 2018 07:46:57 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] igt/kms_fbcon_fbt: Handle ENODEV
 when checking i915_edp_psr_status for chipset support
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
To: Marta Lofstedt <marta.lofstedt@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBNYXJ0YSBMb2ZzdGVkdCAoMjAxOC0wMi0yMiAwNzo0Mzo0MSkKPiBJZiB0aGUgbWFj
aGluZSBkb2Vzbid0IHN1cHBvcnQgUFNSLCBpdCB3aWxsIHJldHVybiAtRU5PREVWIGZyb20KPiBp
OTE1X2VkcF9wc3Jfc3RhdHVzLCB3aGljaCB3ZSB3YW50IHRvIGludGVycHJldCBhcyB1bnN1cHBv
cnRlZC4KPiBUaGlzIGlzIGluIGxpbmUgd2l0aCB3aGF0IENocmlzIGp1c3QgZml4ZWQgZm9yIEZC
Qy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXJ0YSBMb2ZzdGVkdCA8bWFydGEubG9mc3RlZHRAaW50
ZWwuY29tPgo+IC0tLQo+ICB0ZXN0cy9rbXNfZmJjb25fZmJ0LmMgfCAyICsrCj4gIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdHMva21zX2ZiY29u
X2ZidC5jIGIvdGVzdHMva21zX2ZiY29uX2ZidC5jCj4gaW5kZXggMWIyMzZmOGIuLjZhYTE3MWU2
IDEwMDY0NAo+IC0tLSBhL3Rlc3RzL2ttc19mYmNvbl9mYnQuYwo+ICsrKyBiL3Rlc3RzL2ttc19m
YmNvbl9mYnQuYwo+IEBAIC0xNjQsNiArMTY0LDggQEAgc3RhdGljIGJvb2wgcHNyX3N1cHBvcnRl
ZF9vbl9jaGlwc2V0KGludCBmZCkKPiAgewo+ICAgICAgICAgY2hhciBidWZbMjU2XTsKPiAgCj4g
KyAgICAgICBpZiAoKmJ1ZiA9PSAnXDAnKSAvKiAhSEFTX1BTUiAtPiAtRU5PREVWKi8KPiArICAg
ICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ICAgICAgICAgaWd0X2RlYnVnZnNfcmVhZChmZCwg
Imk5MTVfZWRwX3Bzcl9zdGF0dXMiLCBidWYpOwoKQWZ0ZXIgdGhlIHJlYWQgOikKCj4gICAgICAg
ICByZXR1cm4gc3Ryc3RyKGJ1ZiwgIlNpbmtfU3VwcG9ydDogeWVzXG4iKTsKPiAgfQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcg
bGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
