Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 035416E24E
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2019 11:17:57 +0000 (UTC)
Date: Mon, 25 Mar 2019 13:17:55 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20190325111755.GW4038@platvala-desk.ger.corp.intel.com>
References: <20190320114857.5110-1-simon.ser@intel.com>
 <155308321344.8718.17930913902883307230@skylake-alporthouse-com>
 <20190320121749.GS4038@platvala-desk.ger.corp.intel.com>
 <1396f41a1412e33798632cfc9a81ea87684c4496.camel@intel.com>
 <20190321104213.GU4038@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190321104213.GU4038@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3] tests/testdisplay: fix heap overflow
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
To: "Ser, Simon" <simon.ser@intel.com>, "chris@chris-wilson.co.uk" <chris@chris-wilson.co.uk>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBNYXIgMjEsIDIwMTkgYXQgMTI6NDI6MTNQTSArMDIwMCwgUGV0cmkgTGF0dmFsYSB3
cm90ZToKPiBPbiBUaHUsIE1hciAyMSwgMjAxOSBhdCAxMjozMjoyNFBNICswMjAwLCBTZXIsIFNp
bW9uIHdyb3RlOgo+ID4gT24gV2VkLCAyMDE5LTAzLTIwIGF0IDE0OjE3ICswMjAwLCBQZXRyaSBM
YXR2YWxhIHdyb3RlOgo+ID4gPiBPbiBXZWQsIE1hciAyMCwgMjAxOSBhdCAxMjowMDoxM1BNICsw
MDAwLCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gPiA+ID4gUXVvdGluZyBTaW1vbiBTZXIgKDIwMTkt
MDMtMjAgMTE6NDg6NTcpCj4gPiA+ID4gPiArICAgICAgIGFyZ3YwID0gc3RyZHVwKGFyZ3ZbMF0p
Owo+ID4gPiA+ID4gKyAgICAgICBpZ3RfYXNzZXJ0KGFyZ3YwKTsKPiA+ID4gPiA+ICsgICAgICAg
ZXhlY19wYXRoID0gZGlybmFtZShhcmd2MCk7Cj4gPiA+ID4gPiAgICAgICAgIHJldCA9IGNoZGly
KGV4ZWNfcGF0aCk7Cj4gPiA+ID4gPiAgICAgICAgIGlndF9hc3NlcnRfZXEocmV0LCAwKTsKPiA+
ID4gPiAKPiA+ID4gPiBPbmUgc2hvdWxkIGFzayBQZXRyaSBpZiBpZ3RfYXNzZXJ0X2VxKCkgaXMg
ZXZlbiBsZWdhbCBpbnNpZGUgdGhlCj4gPiA+ID4gaGVscGVyCj4gPiA+ID4gKGkuZS4gb3V0c2lk
ZSBvZiBpZ3RfbWFpbiBhbmQgaWd0X3N1YnRlc3QpLgo+ID4gPiAKPiA+ID4gKm9wZW5zIHRlc3Rk
aXNwbGF5LmMqCj4gPiA+IAo+ID4gPiAqZmluZHMgbWFpbigpKgo+ID4gPiAKPiA+ID4gKnJ1bnMg
YXdheSBzY3JlYW1pbmcqCj4gPiA+IAo+ID4gPiAKPiA+ID4gU2hvcnQgYW5zd2VyOiBJdCdzIG5v
dCBsZWdhbCB0aGVyZQo+ID4gPiAKPiA+ID4gTG9uZyBhbnN3ZXI6Cj4gPiA+IEl0IHdvdWxkIGJl
IGxlZ2FsIHRoZXJlIGlmIGFwcHJvcHJpYXRlIHN0ZXBzIGFyZSB0YWtlbiB0byBlbnN1cmUgSUdU
Cj4gPiA+IGNvcmUga25vd3MgaXQncyBhIHRlc3Qgd2l0aG91dCBzdWJ0ZXN0cy4gdGVzdGRpc3Bs
YXksIGJlaW5nIGEKPiA+ID4gZGlub3NhdXIKPiA+ID4gdGhhdCBoYXNuJ3QgcmVhbGl6ZWQgaXQn
cyBwdXNoaW5nIHVwIHRoZSBkYWlzaWVzLCBkb2Vzbid0IHVzZQo+ID4gPiBpZ3Rfc2ltcGxlX21h
aW4sIG9yIGNhbGwgaWd0X3NpbXBsZV9pbml0X3BhcnNlX29wdHMsIG9yIG90aGVyd2lzZSBkbwo+
ID4gPiB0aGUgY29tbW9uIHRoaW5ncyBhbnkgcmVjZW50bHkgd3JpdHRlbiB0ZXN0IGlzIGRvaW5n
Lgo+ID4gPiAKPiA+ID4gSXQncyBhbHNvIGNhbGxpbmcgaWd0X3NraXBfb25fc2ltdWxhdGlvbiBp
biBqdXN0IGFib3V0IHRoZSBvbmx5Cj4gPiA+IHBvc3NpYmxlIGNvbnRleHQgd2hlcmUgaXQncyBu
b3QgbGVnYWwuCj4gPiA+IAo+ID4gPiBOb3RlIHRvIHNlbGY6IEh1cnJ5IHVwIHdpdGggcmVtb3Zp
bmcgYWxsIGN1c3RvbSBtYWluIGZ1bmN0aW9ucy4KPiA+IAo+ID4gSG1tLiBTbyB3b3VsZCB5b3Ug
cHJlZmVyIHRvIGFkZCBhbiBlcnJvciByZXR1cm4gdmFsdWUgdG8gdGhpcyBmdW5jdGlvbiwKPiA+
IG9yIHRvIGp1c3QgY29udGludWUgdG8gdXNlIHRoZXNlIGV2ZW4gaWYgdGhleSBkb24ndCB3b3Jr
IGFuZCBmaXgKPiA+IGV2ZXJ5dGhpbmcgaW4gYSBsYXRlciBjb21taXQ/Cj4gCj4gCj4gTm8gbm8s
IHRoZSBwYXRjaCBpcyBnb29kLiBBbGwgdGhhdCBpcyB3cm9uZyB3aXRoIHRoZSBjb2RlIGhhcyBh
bHJlYWR5Cj4gYmVlbiB3cm9uZywgYW5kIHdpbGwgYmUgZml4ZWQgYnkgcmVwbGFjaW5nIGl0cyBj
dXN0b20gbWFpbigpIHdpdGgKPiBpZ3Rfc2ltcGxlX21haW5fY3VzdG9tX2FyZ3ZfaGFuZGxpbmcg
KGltcGxlbWVudGF0aW9uIHBlbmRpbmcpLgoKCkFuZCBtZXJnZWQuCgoKLS0gClBldHJpIExhdHZh
bGEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRl
diBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
