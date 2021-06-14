Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF2A89DF7
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 15:04:38 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id b9so15883652ybg.10
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 08:04:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210609043035.102359-1-jason@jlekstrand.net>
 <20210609043035.102359-19-jason@jlekstrand.net>
 <20210609071839.GK6228@zkempczy-mobl2>
 <CAOFGe95pMGM5k60wEEkqJz1u3Vq8NgrjxyDHwv91+7ffHbT1GA@mail.gmail.com>
 <87tum4m6qh.wl-ashutosh.dixit@intel.com>
 <20210614053422.GA3302@zkempczy-mobl2>
In-Reply-To: <20210614053422.GA3302@zkempczy-mobl2>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 14 Jun 2021 10:04:26 -0500
Message-ID: <CAOFGe97w0tVAvvZ2sCqEFsOTHyKSXT4WF9whOMC8uOGP6qnBkQ@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 18/93] tests/i915/gem_exec_fence: Move
 the engine data into inter_engine_context
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
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: IGT GPU Tools <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTQsIDIwMjEgYXQgMTI6MzQgQU0gWmJpZ25pZXcgS2VtcGN6ecWEc2tpCjx6
Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBKdW4gMTEs
IDIwMjEgYXQgMDI6Mjg6MDZQTSAtMDcwMCwgRGl4aXQsIEFzaHV0b3NoIHdyb3RlOgo+ID4gT24g
V2VkLCAwOSBKdW4gMjAyMSAwODowMjowNCAtMDcwMCwgSmFzb24gRWtzdHJhbmQgd3JvdGU6Cj4g
PiA+IE9uIFdlZCwgSnVuIDksIDIwMjEgYXQgMjoxOCBBTSBaYmlnbmlldyBLZW1wY3p5xYRza2kK
PiA+ID4gPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT4gd3JvdGU6Cj4gPiA+ID4gT24g
VHVlLCBKdW4gMDgsIDIwMjEgYXQgMTE6MzA6MDRQTSAtMDUwMCwgSmFzb24gRWtzdHJhbmQgd3Jv
dGU6Cj4gPiA+ID4gPiAtc3RhdGljIHZvaWQgc2V0dXBfdGltZWxpbmVfY2hhaW5fZW5naW5lcyhz
dHJ1Y3QgaW50ZXJfZW5naW5lX2NvbnRleHQgKmNvbnRleHQsIGludCBmZCwgc3RydWN0IGludGVs
X2VuZ2luZV9kYXRhICplbmdpbmVzKQo+ID4gPiA+ID4gK3N0YXRpYyB2b2lkIHNldHVwX3RpbWVs
aW5lX2NoYWluX2VuZ2luZXMoc3RydWN0IGludGVyX2VuZ2luZV9jb250ZXh0ICpjb250ZXh0LCBp
bnQgZmQpCj4gPiA+ID4gPiAgewo+ID4gPiA+ID4gICAgICAgbWVtc2V0KGNvbnRleHQsIDAsIHNp
emVvZigqY29udGV4dCkpOwo+ID4gPiA+ID4KPiA+ID4gPiA+ICAgICAgIGNvbnRleHQtPmZkID0g
ZmQ7Cj4gPiA+ID4gPiAtICAgICBjb250ZXh0LT5lbmdpbmVzID0gZW5naW5lczsKPiA+ID4gPiA+
ICsgICAgIGNvbnRleHQtPmVuZ2luZXMgPSBpbnRlbF9pbml0X2VuZ2luZV9saXN0KGZkLCAwKTsK
PiA+ID4gPgo+ID4gPiA+IE9yaWdpbmFsIGNvZGUgdmVyaWZpZXMgdGhlcmUncyBuZW5naW5lcyA+
IDAuIEkgd291bGQga2VlcCB0aGlzIGlndF9yZXF1aXJlKCkuCj4gPiA+Cj4gPiA+IEknbSBub3Qg
c2VlaW5nIHRoYXQgaW4gdGhlIGRpZmYgb3IgdGhlIGNvZGUuICBNaW5kIHBvaW50aW5nIG1lIGF0
IGl0Pwo+ID4gPiBJbiBhbnkgY2FzZSwgSSdtIGZpbmUgd2l0aCB0aGUgaWd0X3JlcXVpcmUoKTsg
aXQgc2hvdWxkIGFsd2F5cyBiZSB0cnVlCj4gPiA+IGFueXdheS4KPiA+Cj4gPiBOb3RlIHRoYXQg
b3JpZ2luYWwgY29kZSBoYXMgImlndF9yZXF1aXJlKGVuZ2luZXMubmVuZ2luZXMgPiAxKSIgbm90
ID4KPiA+IDAuIFN0aWxsIGFsd2F5cyB0cnVlIGJ1dCBwcm9iYWJseSB0aGVyZSBqdXN0IHRvIHNo
b3cgdGhlIGludGVudCBvZiB0aGUKPiA+IHRlc3QuCj4KPiBZZXMsIEkgbWVhbiBpZ3RfcmVxdWly
ZShlbmdpbmVzLm5lbmdpbmVzID4gMSkuCj4KPiBJc3N1ZSBjb21lcyBiZWNhdXNlIEknbSB1c2lu
ZyBzaWRlLWJ5LXNpZGUgY29kZSBjb21wYXJlIHNvIEkgY29tcGFyZWQKPiBhbGwgY29tbWl0cyBh
cHBsaWVkIHRvIGdlbV9leGVjX2ZlbmNlLmMuIElmIHRoZXJlJ3Mgbm8gb3B0aW9uIHRvIGhhdmUK
PiBsZXNzIHRoYW4gdHdvIGVuZ2luZXMgd2UgY291bGQganVzdCByZW1vdmUgdGhhdCBjaGVjay4K
Ck9rLCBJIGZvdW5kIGl0LiAgSXQncyBhY3R1YWxseSBhbGwgaW4gdGhlIHByZXZpb3VzIHBhdGNo
LiAgSSdsbCBzZW5kIGEKdjMgb2YgdGhhdCBvbmUgZm9yIHlvdSB0byBsb29rIGF0LgoKLS1KYXNv
bgoKPiAtLQo+IFpiaWduaWV3Cj4KPiA+ID4KPiA+ID4gPiBXaXRoIHRoYXQgbWlub3Igbml0Ogo+
ID4gPiA+Cj4gPiA+ID4gUmV2aWV3ZWQtYnk6IFpiaWduaWV3IEtlbXBjennFhHNraSA8emJpZ25p
ZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPgo+ID4gPgo+ID4gPiBUaGFua3MhCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0
CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
