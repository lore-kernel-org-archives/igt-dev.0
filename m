Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7FD789B42
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Nov 2020 17:17:43 +0000 (UTC)
Date: Mon, 9 Nov 2020 18:17:35 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20201109171735.GA2883@zkempczy-mobl2>
References: <20201109120632.389212-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201109120632.389212-1-imre.deak@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/intel_batchbuffer: Fix relocs
 across the 4GB address boundary
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
To: Imre Deak <imre.deak@intel.com>
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCBOb3YgMDksIDIwMjAgYXQgMDI6MDY6MzFQTSArMDIwMCwgSW1yZSBEZWFrIHdyb3Rl
Ogo+IElmIHRoZSBkZWx0YSBvZiBhIHJlbG9jYXRpb24gdGFyZ2V0IHdydC4gdGhlIG9iamVjdCBi
YXNlIGFkZHJlc3MgY3Jvc3Nlcwo+IHRoZSA0R0IgYWRkcmVzcyBib3VuZGFyeSB0aGUgdXBwZXIg
MzJiaXQgb2YgdGhlIHRhcmdldCBhZGRyZXNzIHdpbGwgYmUKPiBpbmNvcnJlY3QsIGZpeCB0aGlz
LgoKR2l2ZSBtZSBhIGRheSwgSSdtIGdvaW5nIHRvIGFkZCBhY2NvbXBhbnlpbmcgdGVzdC4gSSBu
ZWVkIHRvIGRvIHRoaXMKdHdpY2UgLSBvbmUgd2l0aCBjdXJyZW50IEFQSSBhbmQgc2Vjb25kIGZv
ciBhbGxvY2F0b3Igc2VyaWVzIHdoZXJlIApBUEkgY2hhbmdlZCBhIGJpdCBpbiBhbGlnbm1lbnQg
bWFuYWdlbWVudC4KCi0tClpiaWduaWV3Cgo+IAo+IENjOiBaYmlnbmlldyBLZW1wY3p5xYRza2kg
PHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT4KPiBDYzogQ2hyaXMgV2lsc29uIDxjaHJp
c0BjaHJpcy13aWxzb24uY28udWs+Cj4gU2lnbmVkLW9mZi1ieTogSW1yZSBEZWFrIDxpbXJlLmRl
YWtAaW50ZWwuY29tPgo+IC0tLQo+ICBsaWIvaW50ZWxfYmF0Y2hidWZmZXIuYyB8IDIgKy0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2xpYi9pbnRlbF9iYXRjaGJ1ZmZlci5jIGIvbGliL2ludGVsX2JhdGNoYnVmZmVyLmMK
PiBpbmRleCBmYzczNDk1YzAuLjdiNGNmYjBkZCAxMDA2NDQKPiAtLS0gYS9saWIvaW50ZWxfYmF0
Y2hidWZmZXIuYwo+ICsrKyBiL2xpYi9pbnRlbF9iYXRjaGJ1ZmZlci5jCj4gQEAgLTE4NTAsNyAr
MTg1MCw3IEBAIHN0YXRpYyB1aW50NjRfdCBfX2ludGVsX2JiX2VtaXRfcmVsb2Moc3RydWN0IGlu
dGVsX2JiICppYmIsCj4gIAo+ICAJaW50ZWxfYmJfb3V0KGliYiwgZGVsdGEgKyBhZGRyZXNzKTsK
PiAgCWlmIChpYmItPmdlbiA+PSA4KQo+IC0JCWludGVsX2JiX291dChpYmIsIGFkZHJlc3MgPj4g
MzIpOwo+ICsJCWludGVsX2JiX291dChpYmIsIChkZWx0YSArIGFkZHJlc3MpID4+IDMyKTsKPiAg
Cj4gIAlyZXR1cm4gYWRkcmVzczsKPiAgfQo+IC0tIAo+IDIuMjUuMQo+IApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdApp
Z3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
