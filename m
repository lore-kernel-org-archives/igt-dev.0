Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC8EF890F2
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2019 11:12:52 +0000 (UTC)
From: "Ser, Simon" <simon.ser@intel.com>
Date: Thu, 25 Apr 2019 11:12:49 +0000
Message-ID: <619bf21390754c44b051f42418e92a9c719aa29a.camel@intel.com>
References: <20190423075243.19754-1-simon.ser@intel.com>
 <20190423080946.19771-1-chris@chris-wilson.co.uk>
 <b5a664cf2ff3571da4b7950df53f8460415772f1.camel@intel.com>
 <155602083231.9039.17048491065121188664@skylake-alporthouse-com>
 <2928dcec0ecacd3d471c70c0d7baf54770f7e9a1.camel@intel.com>
In-Reply-To: <2928dcec0ecacd3d471c70c0d7baf54770f7e9a1.camel@intel.com>
Content-Language: en-US
Content-ID: <D33FDF02A63A584D8F494D2C80470111@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] audio: Avoid test_integrity failing if
 there's no HW support
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
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "chris@chris-wilson.co.uk" <chris@chris-wilson.co.uk>
Cc: "paul.kocialkowski@linux.intel.com" <paul.kocialkowski@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCAyMDE5LTA0LTIzIGF0IDEzOjA5ICswMDAwLCBTZXIsIFNpbW9uIHdyb3RlOg0KPiBP
biBUdWUsIDIwMTktMDQtMjMgYXQgMTM6MDAgKzAxMDAsIENocmlzIFdpbHNvbiB3cm90ZToNCj4g
PiBRdW90aW5nIFNlciwgU2ltb24gKDIwMTktMDQtMjMgMTI6NDU6MDUpDQo+ID4gPiBPbiBUdWUs
IDIwMTktMDQtMjMgYXQgMDk6MDkgKzAxMDAsIENocmlzIFdpbHNvbiB3cm90ZToNCj4gPiA+ID4g
QmVmb3JlIGFzc2VydGluZyB0aGF0IHRoZSBIRE1JIGF1ZGlvIGxvb3BiYWNrIHdvcmtzIGFmdGVy
DQo+ID4gPiA+IHJlc3VtZSwgZmlyc3QNCj4gPiA+ID4gcmVxdWlyZSBpdCB0byBiZSBwcmVzZW50
IGJlZm9yZSBzdXNwZW5kIC0tIGFzIG5vdCBhbGwgbWFjaGluZXMNCj4gPiA+ID4gYXJlIHNldHVw
DQo+ID4gPiA+IHdpdGggdGhlIHJpZ2h0IEhETUkgYXVkaW8gY2FwdHVyZS4NCj4gPiA+ID4gDQo+
ID4gPiA+IE1vcmUgc3RyaWN0bHksIG9uZSB3b3VsZCBleHBlY3QgdGhhdCBhbiBhdWRpbyBjYXB0
dXJlIGRldmljZQ0KPiA+ID4gPiBzZXR1cA0KPiA+ID4gPiBiZWZvcmUgc3VzcGVuZCB3aWxsIHJl
bWFpbiBmdW5jdGlvbmFsIGFmdGVyIHJlc3VtZS4gQW4gZXhlcmNpc2UNCj4gPiA+ID4gbGVmdCBm
b3INCj4gPiA+ID4gdGhlIHJlYWRlci4NCj4gPiA+IA0KPiA+ID4gV2hhdCBpZiBhdWRpbyB3b3Jr
cyB3aXRob3V0IHN1c3BlbmQsIGJ1dCBicmVha3Mgd2l0aCBzdXNwZW5kPw0KPiA+ID4gVGhhdCBu
ZXcNCj4gPiA+IHRlc3QgbWFrZXMgaXQgbGVzcyBlYXN5IHRvIHVuZGVyc3RhbmQgd2hldGhlciBh
dWRpbyB3b3JrcyBhdCBhbGwNCj4gPiA+IG9yIGlmDQo+ID4gPiBpdCBicmVha3MgYmVjYXVzZSBv
ZiBzdXNwZW5kLg0KPiA+IA0KPiA+IFRoYXQncyB0aGUgdGVzdDsgd2hldGhlciBhdWRpbyBjb250
aW51ZXMgdG8gd29yayBhY3Jvc3Mgc3VzcGVuZC4NCj4gPiBJdCdzDQo+ID4gdGhlIG9yaWdpbmFs
IHRlc3QsIG5vdCBhIG5ldyBvbmUuDQo+ID4gDQo+ID4gV2hhdCB0aGUgaWd0IGRpZG4ndCAoYW5k
IHN0aWxsIGRvZXNuJ3QpIGRvIGNvcnJlY3RseSBpcyB2ZXJpZnkgaXQNCj4gPiBoYXMgYQ0KPiA+
IHdvcmtpbmcgc2V0dXA7IGZvciBub3cgd2UganVzdCBhc3N1bWUgdGhhdCB0aGUgZHJpdmVyIGlz
IGZpbmUgaWYNCj4gPiBpZ3RfYWxzYQ0KPiA+IGZhaWxzLiBUdXJucyBhIGJyb2tlbiB0ZXN0IGZy
b20gIkRSSVZFUiBGQUlMIiB0byBza2lwLg0KPiANCj4gT2gsIEkgbWl4ZWQgdXAgaWd0X2Fzc2Vy
dCBhbmQgaWd0X3JlcXVpcmUgYWdhaW4uDQo+IA0KPiBUaGlzIHBhdGNoIGRvZXMgcmVtb3ZlIHRo
ZSBoZG1pLWludGVncml0eSB0ZXN0IGVudGlyZWx5IHRob3VnaC4gV2UNCj4gcHJvYmFibHkgd2Fu
dCB0byBrZWVwIGl0IChvciByYXRoZXI6IHdlJ2QgcHJvYmFibHkgd2FudCB0byBrZWVwIGl0IGlm
DQo+IGl0IHdhc24ndCBiZWluZyByZW1vdmVkIGluIGEgcGF0Y2ggdGhhdCdsbCBzb29uIGJlIG1l
cmdlZCkuDQoNCk9sZCBhdWRpbyB0ZXN0cyBoYXZlIG5vdyBiZWVuIHJlbW92ZWQgZnJvbSBtYXN0
ZXIuIFRoaXMgcGF0Y2ggaXMgbm8NCmxvbmdlciBhcHBsaWNhYmxlLg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
