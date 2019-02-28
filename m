Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C1F56E179
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Feb 2019 11:44:22 +0000 (UTC)
Date: Thu, 28 Feb 2019 13:44:17 +0200
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20190228114417.x6lizlng6rpukkb2@ahiler-desk1.fi.intel.com>
References: <20190227180643.8038-1-arkadiusz.hiler@intel.com>
 <20190228105955.GF4038@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190228105955.GF4038@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] meson: Make doc building dependent on
 gtk-doc
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

T24gVGh1LCBGZWIgMjgsIDIwMTkgYXQgMTI6NTk6NTVQTSArMDIwMCwgUGV0cmkgTGF0dmFsYSB3
cm90ZToKPiBPbiBXZWQsIEZlYiAyNywgMjAxOSBhdCAwODowNjo0M1BNICswMjAwLCBBcmthZGl1
c3ogSGlsZXIgd3JvdGU6Cj4gPiBDdXJyZW50bHksIHdoZW4gZ3RrLWRvYyBpcyBub3QgaW5zdGFs
bGVkICduaW5qYScgc3VjY2VlZHMgYnV0Cj4gPiAnbmluamEgaW5zdGFsbCcgZmFpbHMgd2l0aCB0
aGUgZm9sbG93aW5nIGVycm9yOgo+ID4gCj4gPiAgICBGaWxlTm90Rm91bmRFcnJvcjogW0Vycm5v
IDJdIE5vIHN1Y2ggZmlsZSBvciBkaXJlY3Rvcnk6ICdndGtkb2Mtc2Nhbic6ICdndGtkb2Mtc2Nh
bicKPiA+IAo+ID4gV2l0aCB0aGlzIHBhdGNoICdtZXNvbiBidWlsZCcgd2lsbCBsb2cgdGhhdCBk
b2N1bWVudGF0aW9ucyB3b3VsZCBub3QKPiA+IGJ1aWxkIGFuZCAnbmluamEgaW5zdGFsbCcgd2ls
bCBzdWNjZWVkLgo+ID4gCj4gPiBXaGVuIGZvcmNpbmcgYnVpbGRpbmcgZG9jcyB3aXRoICdtZXNv
biAtRGJ1aWxkX2RvY3M9dHJ1ZSBidWlsZCcgdGhlCj4gPiBmb2xsb3dpbmcgZXJyb3Igd2lsbCBv
Y2N1ciBpbnN0ZWFkOgo+ID4gCj4gPiAgIG1lc29uLmJ1aWxkOjMyMzowOiBFUlJPUjogIERlcGVu
ZGVuY3kgImd0ay1kb2MiIG5vdCBmb3VuZCwgdHJpZWQgcGtnY29uZmlnIGFuZCBjbWFrZQo+ID4g
Cj4gPiBDYzogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+Cj4gPiBSZXBv
cnRlZC1ieTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGxpbnV4LmludGVsLmNvbT4K
PiA+IFNpZ25lZC1vZmYtYnk6IEFya2FkaXVzeiBIaWxlciA8YXJrYWRpdXN6LmhpbGVyQGludGVs
LmNvbT4KPiAKPiBSZXZpZXdlZC1ieTogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRl
bC5jb20+Cj4gCj4gVGhlIGd0a19kb2MgZGVwZW5kZW5jeSBvYmplY3QgaXMgbGVmdCB1bnVzZWQs
IGRvYyBidWlsZGluZyB1c2VzCj4gaW1wb3J0KCdnbm9tZScpIGluc3RlYWQgZm9yIGl0LCBidXQg
aGV5LgoKWWVhaCwgSSBhbSBzdXJwcmlzZWQgdGh0YSBnbm9tZS5ndGtkb2MoKSBpcyBub3QgY2xl
dmVyIGVub3VnaCwgZG9lc24ndApkbyBhbnkgZGVwZW5kZW5jeSBjaGVja3MgYW5kIGxhY2tzICdy
ZXF1aXJlZCcgZmxhZy4KClRoZXkgaGF2ZSBhbiBpc3N1ZSBvbiB0aGF0IHNpbmNlIDAuNDUuMSBp
biBNZXNvbi4KCkFueXdheSwgdGhhbmtzIGZvciB0aGUgcmV2aWV3LiBQdXNoaW5nIGluIGEgbW9t
ZW50LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3Qt
ZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
