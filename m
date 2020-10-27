Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 416076E200
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Oct 2020 17:07:39 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Tue, 27 Oct 2020 17:07:14 +0000
Message-ID: <5b9297d93e06ae0bd8ae19e395d1e88bc3755fe9.camel@intel.com>
References: <20201023231151.383909-1-jose.souza@intel.com>
 <20201026083456.GW7444@platvala-desk.ger.corp.intel.com>
 <1d7e9b6870961ee2904405dcd1f2f854498337ce.camel@intel.com>
 <20201027084934.GZ7444@platvala-desk.ger.corp.intel.com>
In-Reply-To: <20201027084934.GZ7444@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Content-ID: <C6A909F9882F7640BC5A6FDAB4D1CBE5@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_psr2_su: Skip frontbuffer
 test in TGL
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
To: "Latvala, Petri" <petri.latvala@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCAyMDIwLTEwLTI3IGF0IDEwOjQ5ICswMjAwLCBQZXRyaSBMYXR2YWxhIHdyb3RlOg0K
PiBPbiBNb24sIE9jdCAyNiwgMjAyMCBhdCAwNzo0NzoxNVBNICswMjAwLCBTb3V6YSwgSm9zZSB3
cm90ZToNCj4gPiBPbiBNb24sIDIwMjAtMTAtMjYgYXQgMTA6MzQgKzAyMDAsIFBldHJpIExhdHZh
bGEgd3JvdGU6DQo+ID4gPiBPbiBGcmksIE9jdCAyMywgMjAyMCBhdCAwNDoxMTo1MVBNIC0wNzAw
LCBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIHdyb3RlOg0KPiA+ID4gPiBEdWUgdGhlIGNvbW1pdCA3
MWMxYTQ5OTgzMjAgKCJkcm0vaTkxNS90Z2wvcHNyOiBGaXggZ2xpdGNoZXMgd2hlbg0KPiA+ID4g
PiBkb2luZyBmcm9udGJ1ZmZlciBtb2RpZmljYXRpb25zIiksIGZyb250YnVmZmVyIHRlc3QgaXMg
ZXhwZWN0ZWQgdG8NCj4gPiA+ID4gZmFpbCBvbiBUR0wsIHNvIGhlcmUgc2tpcGluZyB0aGlzIHRl
c3Qgb24gVEdMLg0KPiA+ID4gPiBXaGVuIFBTUiBpc3N1ZXMgaXMgZml4ZWQgdGhlIHBhdGNoIGFi
b3ZlIHdpbGwgYmUgcmV2ZXJ0ZWQgYW5kIHdlDQo+ID4gPiA+IGNhbiByZXZlcnQgdGhpcyBza2lw
IHRvby4NCj4gPiA+IA0KPiA+ID4gSG93IGRvZXMgdGhlIHByZXZpb3VzIGZhaWx1cmUgYmVoYXZl
PyBJIG1lYW4gaW4gdGhlIHNlbnNlIHRoYXQgd2hhdA0KPiA+ID4gZG9lcyB0aGlzIHNraXAgZ2Fp
bj8gVGhlIHNraXAgd2lsbCBoYXZlIHRvIGJlIGNpYnVnbG9nLWZpbHRlcmVkIHRvbyBzbw0KPiA+
ID4gbm8gZ2FpbiBvbiB0aGF0IHNpZGUuDQo+ID4gPiANCj4gPiA+IERpZCB0aGUgZmFpbCBraWxs
IHRoZSBtYWNoaW5lLCBvciBpcyB0aGlzIGp1c3QgZm9yIHNhdmluZyBydW50aW1lPw0KPiA+IA0K
PiA+IEp1c3Qgc2F2aW5nIHRpbWUuDQo+ID4gU28gbm8gbmVlZCBmb3IgaXQ/DQo+IA0KPiBEZXBl
bmRzIG9uIHRoZSBhbW91bnQuIERvIHlvdSBoYXZlIG51bWJlcnMgZm9yIHRoaXM/IEkgZ3Vlc3Mg
aWYgaXQNCj4gc2F2ZXMgZW50aXJlIG1pbnV0ZXMgaXQgYmVjb21lcyB3b3J0aCBpdC4NCj4gDQo+
IA0KDQpUYWtlcyBhYm91dCBvbmUgc2Vjb25kIHdoZW4gZmFpbHMgYSBsaXR0bGUgbGVzcyB3aGVu
IGl0IHdhcyBwYXNzaW5nIG9uIFRHTC4NCkp1c3Qgd2FudCB0byBhdm9pZCBhIG5ldyBmcmVlZGVz
a3RvcCBpc3N1ZSB0byBiZSBmaWxlZCwgd2UgYXJlIHRyYWNraW5nIHRoZSByaWdodCBrZXJuZWwg
Zml4IGluIEppcmEuIA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
