Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9287088E26
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2019 13:10:02 +0000 (UTC)
From: "Ser, Simon" <simon.ser@intel.com>
Date: Tue, 23 Apr 2019 13:09:57 +0000
Message-ID: <2928dcec0ecacd3d471c70c0d7baf54770f7e9a1.camel@intel.com>
References: <20190423075243.19754-1-simon.ser@intel.com>
 <20190423080946.19771-1-chris@chris-wilson.co.uk>
 <b5a664cf2ff3571da4b7950df53f8460415772f1.camel@intel.com>
 <155602083231.9039.17048491065121188664@skylake-alporthouse-com>
In-Reply-To: <155602083231.9039.17048491065121188664@skylake-alporthouse-com>
Content-Language: en-US
Content-ID: <A394C4554B4D3D4DBF6E2F8D44CAD93E@intel.com>
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

T24gVHVlLCAyMDE5LTA0LTIzIGF0IDEzOjAwICswMTAwLCBDaHJpcyBXaWxzb24gd3JvdGU6DQo+
IFF1b3RpbmcgU2VyLCBTaW1vbiAoMjAxOS0wNC0yMyAxMjo0NTowNSkNCj4gPiBPbiBUdWUsIDIw
MTktMDQtMjMgYXQgMDk6MDkgKzAxMDAsIENocmlzIFdpbHNvbiB3cm90ZToNCj4gPiA+IEJlZm9y
ZSBhc3NlcnRpbmcgdGhhdCB0aGUgSERNSSBhdWRpbyBsb29wYmFjayB3b3JrcyBhZnRlciByZXN1
bWUsIGZpcnN0DQo+ID4gPiByZXF1aXJlIGl0IHRvIGJlIHByZXNlbnQgYmVmb3JlIHN1c3BlbmQg
LS0gYXMgbm90IGFsbCBtYWNoaW5lcyBhcmUgc2V0dXANCj4gPiA+IHdpdGggdGhlIHJpZ2h0IEhE
TUkgYXVkaW8gY2FwdHVyZS4NCj4gPiA+IA0KPiA+ID4gTW9yZSBzdHJpY3RseSwgb25lIHdvdWxk
IGV4cGVjdCB0aGF0IGFuIGF1ZGlvIGNhcHR1cmUgZGV2aWNlIHNldHVwDQo+ID4gPiBiZWZvcmUg
c3VzcGVuZCB3aWxsIHJlbWFpbiBmdW5jdGlvbmFsIGFmdGVyIHJlc3VtZS4gQW4gZXhlcmNpc2Ug
bGVmdCBmb3INCj4gPiA+IHRoZSByZWFkZXIuDQo+ID4gDQo+ID4gV2hhdCBpZiBhdWRpbyB3b3Jr
cyB3aXRob3V0IHN1c3BlbmQsIGJ1dCBicmVha3Mgd2l0aCBzdXNwZW5kPyBUaGF0IG5ldw0KPiA+
IHRlc3QgbWFrZXMgaXQgbGVzcyBlYXN5IHRvIHVuZGVyc3RhbmQgd2hldGhlciBhdWRpbyB3b3Jr
cyBhdCBhbGwgb3IgaWYNCj4gPiBpdCBicmVha3MgYmVjYXVzZSBvZiBzdXNwZW5kLg0KPiANCj4g
VGhhdCdzIHRoZSB0ZXN0OyB3aGV0aGVyIGF1ZGlvIGNvbnRpbnVlcyB0byB3b3JrIGFjcm9zcyBz
dXNwZW5kLiBJdCdzDQo+IHRoZSBvcmlnaW5hbCB0ZXN0LCBub3QgYSBuZXcgb25lLg0KPiANCj4g
V2hhdCB0aGUgaWd0IGRpZG4ndCAoYW5kIHN0aWxsIGRvZXNuJ3QpIGRvIGNvcnJlY3RseSBpcyB2
ZXJpZnkgaXQgaGFzIGENCj4gd29ya2luZyBzZXR1cDsgZm9yIG5vdyB3ZSBqdXN0IGFzc3VtZSB0
aGF0IHRoZSBkcml2ZXIgaXMgZmluZSBpZiBpZ3RfYWxzYQ0KPiBmYWlscy4gVHVybnMgYSBicm9r
ZW4gdGVzdCBmcm9tICJEUklWRVIgRkFJTCIgdG8gc2tpcC4NCg0KT2gsIEkgbWl4ZWQgdXAgaWd0
X2Fzc2VydCBhbmQgaWd0X3JlcXVpcmUgYWdhaW4uDQoNClRoaXMgcGF0Y2ggZG9lcyByZW1vdmUg
dGhlIGhkbWktaW50ZWdyaXR5IHRlc3QgZW50aXJlbHkgdGhvdWdoLiBXZQ0KcHJvYmFibHkgd2Fu
dCB0byBrZWVwIGl0IChvciByYXRoZXI6IHdlJ2QgcHJvYmFibHkgd2FudCB0byBrZWVwIGl0IGlm
DQppdCB3YXNuJ3QgYmVpbmcgcmVtb3ZlZCBpbiBhIHBhdGNoIHRoYXQnbGwgc29vbiBiZSBtZXJn
ZWQpLg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0
LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
