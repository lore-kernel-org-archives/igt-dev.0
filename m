Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 711FC89613
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2019 10:42:16 +0000 (UTC)
Date: Thu, 21 Mar 2019 12:42:13 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20190321104213.GU4038@platvala-desk.ger.corp.intel.com>
References: <20190320114857.5110-1-simon.ser@intel.com>
 <155308321344.8718.17930913902883307230@skylake-alporthouse-com>
 <20190320121749.GS4038@platvala-desk.ger.corp.intel.com>
 <1396f41a1412e33798632cfc9a81ea87684c4496.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1396f41a1412e33798632cfc9a81ea87684c4496.camel@intel.com>
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
To: "Ser, Simon" <simon.ser@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBNYXIgMjEsIDIwMTkgYXQgMTI6MzI6MjRQTSArMDIwMCwgU2VyLCBTaW1vbiB3cm90
ZToKPiBPbiBXZWQsIDIwMTktMDMtMjAgYXQgMTQ6MTcgKzAyMDAsIFBldHJpIExhdHZhbGEgd3Jv
dGU6Cj4gPiBPbiBXZWQsIE1hciAyMCwgMjAxOSBhdCAxMjowMDoxM1BNICswMDAwLCBDaHJpcyBX
aWxzb24gd3JvdGU6Cj4gPiA+IFF1b3RpbmcgU2ltb24gU2VyICgyMDE5LTAzLTIwIDExOjQ4OjU3
KQo+ID4gPiA+ICsgICAgICAgYXJndjAgPSBzdHJkdXAoYXJndlswXSk7Cj4gPiA+ID4gKyAgICAg
ICBpZ3RfYXNzZXJ0KGFyZ3YwKTsKPiA+ID4gPiArICAgICAgIGV4ZWNfcGF0aCA9IGRpcm5hbWUo
YXJndjApOwo+ID4gPiA+ICAgICAgICAgcmV0ID0gY2hkaXIoZXhlY19wYXRoKTsKPiA+ID4gPiAg
ICAgICAgIGlndF9hc3NlcnRfZXEocmV0LCAwKTsKPiA+ID4gCj4gPiA+IE9uZSBzaG91bGQgYXNr
IFBldHJpIGlmIGlndF9hc3NlcnRfZXEoKSBpcyBldmVuIGxlZ2FsIGluc2lkZSB0aGUKPiA+ID4g
aGVscGVyCj4gPiA+IChpLmUuIG91dHNpZGUgb2YgaWd0X21haW4gYW5kIGlndF9zdWJ0ZXN0KS4K
PiA+IAo+ID4gKm9wZW5zIHRlc3RkaXNwbGF5LmMqCj4gPiAKPiA+ICpmaW5kcyBtYWluKCkqCj4g
PiAKPiA+ICpydW5zIGF3YXkgc2NyZWFtaW5nKgo+ID4gCj4gPiAKPiA+IFNob3J0IGFuc3dlcjog
SXQncyBub3QgbGVnYWwgdGhlcmUKPiA+IAo+ID4gTG9uZyBhbnN3ZXI6Cj4gPiBJdCB3b3VsZCBi
ZSBsZWdhbCB0aGVyZSBpZiBhcHByb3ByaWF0ZSBzdGVwcyBhcmUgdGFrZW4gdG8gZW5zdXJlIElH
VAo+ID4gY29yZSBrbm93cyBpdCdzIGEgdGVzdCB3aXRob3V0IHN1YnRlc3RzLiB0ZXN0ZGlzcGxh
eSwgYmVpbmcgYQo+ID4gZGlub3NhdXIKPiA+IHRoYXQgaGFzbid0IHJlYWxpemVkIGl0J3MgcHVz
aGluZyB1cCB0aGUgZGFpc2llcywgZG9lc24ndCB1c2UKPiA+IGlndF9zaW1wbGVfbWFpbiwgb3Ig
Y2FsbCBpZ3Rfc2ltcGxlX2luaXRfcGFyc2Vfb3B0cywgb3Igb3RoZXJ3aXNlIGRvCj4gPiB0aGUg
Y29tbW9uIHRoaW5ncyBhbnkgcmVjZW50bHkgd3JpdHRlbiB0ZXN0IGlzIGRvaW5nLgo+ID4gCj4g
PiBJdCdzIGFsc28gY2FsbGluZyBpZ3Rfc2tpcF9vbl9zaW11bGF0aW9uIGluIGp1c3QgYWJvdXQg
dGhlIG9ubHkKPiA+IHBvc3NpYmxlIGNvbnRleHQgd2hlcmUgaXQncyBub3QgbGVnYWwuCj4gPiAK
PiA+IE5vdGUgdG8gc2VsZjogSHVycnkgdXAgd2l0aCByZW1vdmluZyBhbGwgY3VzdG9tIG1haW4g
ZnVuY3Rpb25zLgo+IAo+IEhtbS4gU28gd291bGQgeW91IHByZWZlciB0byBhZGQgYW4gZXJyb3Ig
cmV0dXJuIHZhbHVlIHRvIHRoaXMgZnVuY3Rpb24sCj4gb3IgdG8ganVzdCBjb250aW51ZSB0byB1
c2UgdGhlc2UgZXZlbiBpZiB0aGV5IGRvbid0IHdvcmsgYW5kIGZpeAo+IGV2ZXJ5dGhpbmcgaW4g
YSBsYXRlciBjb21taXQ/CgoKTm8gbm8sIHRoZSBwYXRjaCBpcyBnb29kLiBBbGwgdGhhdCBpcyB3
cm9uZyB3aXRoIHRoZSBjb2RlIGhhcyBhbHJlYWR5CmJlZW4gd3JvbmcsIGFuZCB3aWxsIGJlIGZp
eGVkIGJ5IHJlcGxhY2luZyBpdHMgY3VzdG9tIG1haW4oKSB3aXRoCmlndF9zaW1wbGVfbWFpbl9j
dXN0b21fYXJndl9oYW5kbGluZyAoaW1wbGVtZW50YXRpb24gcGVuZGluZykuCgoKLS0gClBldHJp
IExhdHZhbGEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
aWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
