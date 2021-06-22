Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFF846E07B
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Jun 2021 03:00:48 +0000 (UTC)
Date: Tue, 22 Jun 2021 05:00:43 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210622030043.GA4847@zkempczy-mobl2>
References: <20210621105922.48408-1-zbigniew.kempczynski@intel.com>
 <20210621105922.48408-2-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210621105922.48408-2-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib: Beware implicit sign extension
 on large constants
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
Cc: Chris Wilson <chris.p.wilson@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCBKdW4gMjEsIDIwMjEgYXQgMTI6NTk6MjFQTSArMDIwMCwgWmJpZ25pZXcgS2VtcGN6
ecWEc2tpIHdyb3RlOgo+IEZyb206IENocmlzIFdpbHNvbiA8Y2hyaXMucC53aWxzb25AaW50ZWwu
Y29tPgo+IAo+IChnZGIpIHAveCAobG9uZyBsb25nIHVuc2lnbmVkIGludCkoMSA8PCAzMSkKPiAk
MSA9IDB4ZmZmZmZmZmY4MDAwMDAwMAo+IChnZGIpIHAveCAobG9uZyBsb25nIHVuc2lnbmVkIGlu
dCkoMXUgPDwgMzEpCj4gJDIgPSAweDgwMDAwMDAwCj4gCj4gVGhlIGltcGFjdCBvZiB0aGlzIGlz
IHRoYXQgdGhlIHJhbmRvbSBhZGRyZXNzIHdlIHdlcmUgcGxhY2luZyB0aGUgc3Bpbm5lcgo+IGF0
IHdhcyBhbHdheXMgaW52YWxpZCBvbiBtb2Rlcm4gbWFjaGluZXMsIGNhdXNpbmcgdGhlIGtlcm5l
bCB0byByZWxvY2F0ZQo+IHRoZSBzcGlubmVycyB3aGVyZXZlciBhbmQgdGh1cyB1bmRlcmdvaW5n
IHJlbG9jYXRpb25zLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXMucC53
aWxzb25AaW50ZWwuY29tPgoKV2UgaGF2ZSBzYW1lIG9ic2VydmF0aW9uIGFuZCB3ZSB3YW50IHRv
IGZpeCB0aGF0LgoKUmV2aWV3ZWQtYnk6IFpiaWduaWV3IEtlbXBjennFhHNraSA8emJpZ25pZXcu
a2VtcGN6eW5za2lAaW50ZWwuY29tPgoKLS0KWmJpZ25pZXcKCj4gLS0tCj4gIGxpYi9pZ3RfZHVt
bXlsb2FkLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9saWIvaWd0X2R1bW15bG9hZC5jIGIvbGliL2lndF9k
dW1teWxvYWQuYwo+IGluZGV4IDgyNDU5ZTUyNC4uNjNiMWZjNzNiIDEwMDY0NAo+IC0tLSBhL2xp
Yi9pZ3RfZHVtbXlsb2FkLmMKPiArKysgYi9saWIvaWd0X2R1bW15bG9hZC5jCj4gQEAgLTExOSw3
ICsxMTksNyBAQCBlbWl0X3JlY3Vyc2l2ZV9iYXRjaChpZ3Rfc3Bpbl90ICpzcGluLAo+ICAJICov
Cj4gIAlhZGRyID0gZ2VtX2FwZXJ0dXJlX3NpemUoZmQpIC8gMjsKPiAgCWlmIChhZGRyID4+IDMx
KQo+IC0JCWFkZHIgPSAxIDw8IDMxOwo+ICsJCWFkZHIgPSAxdSA8PCAzMTsKPiAgCWFkZHIgKz0g
cmFuZG9tKCkgJSBhZGRyIC8gMjsKPiAgCWFkZHIgJj0gLTQwOTY7Cj4gIAo+IC0tIAo+IDIuMjYu
MAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
aWd0LWRldiBtYWlsaW5nIGxpc3QKPiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxp
bmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
