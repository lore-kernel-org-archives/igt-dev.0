Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27ECA6E541
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Nov 2018 13:25:43 +0000 (UTC)
Date: Wed, 14 Nov 2018 15:25:39 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20181114132539.GO9144@intel.com>
References: <20181113172547.30565-1-chris@chris-wilson.co.uk>
 <20181114115653.GY17124@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181114115653.GY17124@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] runner: Treat dmesg warnings as pure
 warnings
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
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org, Martin Peres <martin.peres@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBOb3YgMTQsIDIwMTggYXQgMDE6NTY6NTNQTSArMDIwMCwgUGV0cmkgTGF0dmFsYSB3
cm90ZToKPiBPbiBUdWUsIE5vdiAxMywgMjAxOCBhdCAwNToyNTo0N1BNICswMDAwLCBDaHJpcyBX
aWxzb24gd3JvdGU6Cj4gPiBJIGhhdmUgd2hpbmdlZCBvbiBmb3IgYWdlcyBhYm91dCB0aGUgZG1l
c2ctd2FybmluZ3MgYmVpbmcgYW4gZXhwZWN0ZWQKPiA+IHBhcnQgb2Yga2VybmVsIHRlc3Rpbmcg
KHdoZXJlIGVsc2UgaXMgdGhlIGtlcm5lbCBtZWFudCB0byBsb2cgaXRzCj4gPiBlcnJvcnM/KSBh
bmQgc2hvdWxkIGJlIHRyZWF0ZWQgdGhlIHNhbWUgYXMgb3VyIHN0ZGVyciBmb3IgdGhlIHRlc3Qu
IFRoYXQKPiA+IGlzIGlmIGEgdGVzdCBmYWlscywgaXQgZmFpbHMgYW5kIGRvZXMgbm90IG5lZWQg
dG8gYmUgY29uZmxhdGVkIHdpdGgKPiA+IHdoZXRoZXIgb3Igbm90IHRoZXJlIHdhcyBhIGRtZXNn
IHdhcm5pbmcgKGp1c3QgYXMgdGhlIHRlc3Qgc2F5aW5nIHdoeSBpdAo+ID4gZmFpbGVkIG9uIHN0
ZGVyciBkb2VzIG5vdCBuZWVkIGZsYWdnaW5nKSwgYW5kIHRoYXQgYSBwYXNzaW5nIHRlc3Qgd2l0
aCBhCj4gPiBkbWVzZyB3YXJuaW5nIGlzIHNpbXBseSBhIHdhcm4uCj4gPiAKPiA+IFRoZSBlZmZl
Y3QgaXMgdGhhdCB3ZSBzaW1wbHkgcmVtb3ZlIHRoZSAiZG1lc2ctIiBmbGFnZ2luZyBmcm9tIHJl
c3VsdHMKPiA+IG5hbWVzLCBhcyB0aGUgZXJyL2RtZXNnIG91dHB1dCBpcyBzaW1wbHkgY29sbGF0
ZWQgZm9yIHRoZSBlcnJvciByZXBvcnQKPiA+IGFscmVhZHkuCj4gPiAKPiA+IFNpZ25lZC1vZmYt
Ynk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+ID4gQ2M6IFBldHJp
IExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgo+ID4gQ2M6IE1hcnRpbiBQZXJlcyA8
bWFydGluLnBlcmVzQGxpbnV4LmludGVsLmNvbT4KPiAKPiAKPiBZZXAsIG5vdydzIGEgZ29vZCBh
IHRpbWUgYXMgYW55IHRvIHJlbW92ZSB0aGlzIGNhcmdvIGN1bHQgaWYgZXZlci4KPiAKPiBTb21l
IGFja3MgZnJvbSBrZXJuZWwgcGVvcGxlIGluIGdlbmVyYWwgd291bGQgYmUgbmljZS4KPiAKPiBU
T0RPOgo+ICBNYXJ0aW46IGNpYnVnbG9nIGZpbHRlcnMgcmVhZHkgZm9yIHRoaXMKPiAgVG9taSBl
dCBhbDogVmlzdWFsaXphdGlvbiByZWFkeSBmb3IgdGhpcyAodG9vbHRpcHMgZXRjKQoKQ2FuIEkg
c3RpbGwgc2VlIGZyb20gdGhlIGNvbG9yL2V0Yy4gd2hldGhlciB0aGVyZSB3YXMgc29tZSBkbWVz
ZyBzcGV3IG9yCm5vdD8gSSBvZnRlbiBnbGFuY2UgYXQgdGhvc2UgYW5kIHdvdWxkIHByZWZlciB0
byBub3QgaGF2ZSB0byBnbyB0aHJvdWdoCmFsbCB0aGUgZmFpbHMgdG8gZmluZCB0aGVtLgoKLS0g
ClZpbGxlIFN5cmrDpGzDpApJbnRlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ln
dC1kZXYK
