Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3B9D6EA11
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jul 2021 16:54:30 +0000 (UTC)
Date: Wed, 28 Jul 2021 18:54:24 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210728165424.GA4024@zkempczy-mobl2>
References: <20210722082426.4538-1-andrzej.turko@linux.intel.com>
 <20210722082426.4538-2-andrzej.turko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210722082426.4538-2-andrzej.turko@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/intel_allocator_simple: Check
 boundaries of reserved blocks
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
To: Andrzej Turko <andrzej.turko@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBKdWwgMjIsIDIwMjEgYXQgMTA6MjQ6MjVBTSArMDIwMCwgQW5kcnplaiBUdXJrbyB3
cm90ZToKPiBNYWtlIHN1cmUgdGhhdCByZXNlcnZlZCBibG9ja3MgZml0IGluIHRoZQo+IGFkZHJl
c3Mgc3BhY2UgbWFuYWdlZCBieSB0aGUgc2ltcGxlIGFsbG9jYXRvci4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBBbmRyemVqIFR1cmtvIDxhbmRyemVqLnR1cmtvQGxpbnV4LmludGVsLmNvbT4KPiBDYzog
WmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+Cj4g
LS0tCj4gIGxpYi9pbnRlbF9hbGxvY2F0b3Jfc2ltcGxlLmMgfCAyICsrCj4gIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvbGliL2ludGVsX2FsbG9jYXRv
cl9zaW1wbGUuYyBiL2xpYi9pbnRlbF9hbGxvY2F0b3Jfc2ltcGxlLmMKPiBpbmRleCAwZTY3NjM5
NjQuLjhkNTEwNWYxMSAxMDA2NDQKPiAtLS0gYS9saWIvaW50ZWxfYWxsb2NhdG9yX3NpbXBsZS5j
Cj4gKysrIGIvbGliL2ludGVsX2FsbG9jYXRvcl9zaW1wbGUuYwo+IEBAIC01MjMsNiArNTIzLDgg
QEAgc3RhdGljIGJvb2wgaW50ZWxfYWxsb2NhdG9yX3NpbXBsZV9yZXNlcnZlKHN0cnVjdCBpbnRl
bF9hbGxvY2F0b3IgKmlhbCwKPiAgCWVuZCA9IERFQ0FOT05JQ0FMKGVuZCk7Cj4gIAlpZ3RfYXNz
ZXJ0KGVuZCA+IHN0YXJ0IHx8IGVuZCA9PSAwKTsKPiAgCXNpemUgPSBnZXRfc2l6ZShzdGFydCwg
ZW5kKTsKPiArCWlndF9hc3NlcnQoc3RhcnQgKyBzaXplIDw9IGlhbHMtPmVuZCk7Cj4gKwlpZ3Rf
YXNzZXJ0KHN0YXJ0ID49IGlhbHMtPnN0YXJ0KTsKCkluIHRoZSBmdXR1cmUgSSB3aWxsIGxpa2Vs
eSBoYXZlIHRvIHJlbGF4IGdldF9zaXplKCkgYW5kIGp1c3QgZG8KZW5kIC0gc3RhcnQgY2FsY3Vs
YXRpb24gKHdlJ3JlIG5vdCBwYXNzaW5nIGk5MTUgZmQgc28gd2Ugd29uJ3QgYmUgYWJsZQp0byBk
ZXRlY3QgZ3R0IHNpemUpIGJ1dCBhdCB0aGUgbW9tZW50IG9rLCB3ZSB3YW50IHRvIGhhdmUgdGhp
cyBjaGVjay4KClNvOgoKUmV2aWV3ZWQtYnk6IFpiaWduaWV3IEtlbXBjennFhHNraSA8emJpZ25p
ZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPgoKLS0KWmJpZ25pZXcKCj4gIAo+ICAJaWYgKHNpbXBs
ZV92bWFfaGVhcF9hbGxvY19hZGRyKGlhbHMsIHN0YXJ0LCBzaXplKSkgewo+ICAJCXJlYyA9IG1h
bGxvYyhzaXplb2YoKnJlYykpOwo+IC0tIAo+IDIuMjUuMQo+IApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2lndC1kZXYK
