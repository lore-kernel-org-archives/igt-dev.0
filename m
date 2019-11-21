Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4E2F6E0BC
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2019 08:53:35 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20191121084011.GA22294@zkempczy-desk.igk.intel.com>
References: <20191120185739.7497-1-zbigniew.kempczynski@intel.com>
 <20191120185739.7497-5-zbigniew.kempczynski@intel.com>
 <157427958293.13839.9343823746796446845@skylake-alporthouse-com>
 <20191121084011.GA22294@zkempczy-desk.igk.intel.com>
Message-ID: <157432639624.28308.4676662155033975751@skylake-alporthouse-com>
Date: Thu, 21 Nov 2019 08:53:16 +0000
Subject: Re: [igt-dev] [PATCH i-g-t v3 4/4] tests/i915/gem_exec_basic:
 Iterate over all memory regions
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBaYmlnbmlldyBLZW1wY3p5xYRza2kgKDIwMTktMTEtMjEgMDg6NDA6MTEpCj4gT24g
V2VkLCBOb3YgMjAsIDIwMTkgYXQgMDc6NTM6MDJQTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdyb3Rl
Ogo+ID4gUXVvdGluZyBaYmlnbmlldyBLZW1wY3p5xYRza2kgKDIwMTktMTEtMjAgMTg6NTc6Mzkp
Cj4gPiA+IEZyb206IEx1a2FzeiBLYWxhbWFyeiA8bHVrYXN6LmthbGFtYXJ6QGludGVsLmNvbT4K
PiA+ID4gCj4gPiA+IEFzIGEgcGFydCBvZiBsb2NhbCBtZW1vcnkgZWZmb3J0IHdlIG5lZWQgdG8g
bWFrZSBzdXJlLCB0aGF0IGJhc2ljCj4gPiA+IHNjZW5hcmlvcyBhcmUgY292ZXJlZCBmb3IgZXZl
cnkgYXZhaWxhYmxlIG1lbW9yeSByZWdpb24uIFRoaXMgcGF0Y2ggaXMKPiA+ID4gYW4gYXR0ZW1w
dCBmb3IgdGhpcyBwcm9ibGVtLiBJZiBpdCB3aWxsIGJlIGFjY2VwdGVkIGl0IHdpbGwgYmUKPiA+
ID4gcmVwbGljYXRlZCBvbiBlYWNoIHRlc3QgdGhhdCBjYW4gYmVuZWZpdCBmcm9tIGl0Lgo+ID4g
Cj4gPiBnZW1fZXhlY19iYXNpYyBqdXN0IGV4ZXJjaXNlcyB0aGUgZXhlY2J1ZiBpb2N0bC4uLiB3
aGljaCBkb2VzIG5vdAo+ID4gbWVudGlvbiBtZW1vcnkgcmVnaW9uLiBZb3UgYXJlIHRoaW5raW5n
IG9mIGdlbV9leGVjX25vcCBhbmQKPiA+IGdlbV9leGVjX3N0b3JlIGZvciB0aGlzIGZpcnN0IGxl
dmVsIG9mIGJhc2ljIHRlc3RpbmcuCj4gPiAtQ2hyaXMKPiAKPiBEcm9wIGl0PwoKWWVhaCwgSSBz
ZWUgZ2VtX2V4ZWNfYmFzaWMgYXMgb25seSBkb2luZyB0aGUgc2FuaXR5Y2hlY2tzIGZvciB0aGUK
ZXhlY2J1ZjIgaW9jdGwgaXRzZWxmLCB3aGljaCBiYXNpY2FsbHkgb25seSBuZWVkcyB0byBhbnN3
ZXIgdGhlIHF1ZXN0aW9uCm9mIHdoZXRoZXIgdGhlIGlvY3RsIGV4aXN0cywgYW5kIGlzIHVzYWJs
ZSBieSBvdGhlciB0ZXN0cy4gSXQgc3VjaCBhCmJyb2FkIGlvY3RsIGludGVyZmFjaW5nIHdpdGgg
YWxsIHBhcnRzIG9mIHRoZSBIVyB0aGF0IHdlIGRvIG5lZWQgdG8KYnJlYWsgaXQgZG93biBpbnRv
IHBhcnRzLCBhbmQgYXNraW5nIHdoZXRoZXIgaXQgaXMgdXNhYmxlIHdpdGggYWxsCm1lbW9yeSBy
ZWdpb25zIGFjY2Vzc2libGUgZnJvbSB0aGUgc3lzdGVtLCBnb2VzIGJleW9uZCB0aGUgc2ltcGxl
CnF1ZXN0aW9uIG9mIHdoZXRoZXIgdGhlIHRlc3RzIHdobyBkbyBub3QgY2FyZSBhYm91dCB0aGF0
IChhbmQganVzdCB1c2UKdGhlIGRlZmF1bHRzIGhhbmRlZCB0byB0aGVtKSB3aWxsIHdvcmsuCi1D
aHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3Qt
ZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
