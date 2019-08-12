Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <87pnla7g87.fsf@gaia.fi.intel.com>
References: <20190812103224.30163-1-chris@chris-wilson.co.uk>
 <87pnla7g87.fsf@gaia.fi.intel.com>
Message-ID: <156561553834.2301.5514448065180767393@skylake-alporthouse-com>
Date: Mon, 12 Aug 2019 14:12:18 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] lib/i915: Trim ring measurement by one
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
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBNaWthIEt1b3BwYWxhICgyMDE5LTA4LTEyIDEyOjUyOjU2KQo+IENocmlzIFdpbHNv
biA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPiB3cml0ZXM6Cj4gCj4gPiBCZSBhIGxpdHRsZSBt
b3JlIGNvbnNlcnZhdGl2ZSBpbiBvdXIgcmluZyBtZWFzdXJlbWVudCBhbmQgZXhjbHVkZSBvbmUK
PiA+IGJhdGNoIHRvIGxlYXZlIHJvb20gaW4gY2FzZSBvdXIgdXNlciBuZWVkcyB0byB3cmFwICh3
aGVyZSBhIHJlcXVlc3Qgd2lsbAo+ID4gYmUgZXhwYW5kZWQgdG8gY292ZXIgdGhlIHVudXNlZCBz
cGFjZSBhdCB0aGUgZW5kIG9mIHRoZSByaW5nKS4KPiA+Cj4gCj4gZGlkIHJlYWQgdGhlIHdyYXBw
aW5nIHBhcnQgYW5kIHRoYXQgc2VlbXMgdG8gYmUgdGhlIGNhc2UgdGhhdAo+IHdlIGVubGFyZ2Ug
dGhlIHdyYXBwaW5nIHJlcXVlc3QuCj4gCj4gSG93ZXZlciBkbyB3ZSBsb3NlIHNvbWUgY292ZXJh
Z2Ugb24gdGhlIGFjdHVhbCB3cmFwIHRlc3RzPwoKVGhlcmUncyBvbmx5IG9uZSB3aXRoIHRoYXQg
aWRlYSBpbiBtaW5kLCBnZW1fcmluZ2ZpbGwoKS4gV2hpY2ggaXMKYWxyZWFkeSAiYnJva2VuIiBi
ZWNhdXNlIGl0IGFzc3VtZXMgdGhhdCBhbGwgZW5naW5lcyBoYXZlIHRoZSBzYW1lIHJpbmcKc2l6
ZSwgc28gd2Ugd2lsbCBiZSB1bmRlcmZpbGxpbmcgbW9zdC4gQ291bGQgYWxzbyBkbyB3aXRoIGFu
IEFMTF9FTkdJTkVTCm1vZGUuCgpUaGVyZSdzIG5vdGhpbmcgdGhhdCBleHBsaWNpdGx5IHRyaWVz
IHRvIGhpdCBhbGwgdGhlIHBvc3NpYmxlIHdheXMgaW4Kd2hpY2ggcmluZyB3cmFwcGluZyBvY2N1
cnMsIGl0IHRlbmRzIHRvIGZhbGxvdXQgb2YgZmF1eC1zdHJlc3MgdGVzdHMKbGlrZSBnZW1fZXhl
Y19wYXJhbGxlbCBvciBnZW1fY3R4X2NyZWF0ZS4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaWd0LWRldg==
