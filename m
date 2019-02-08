Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 853BF6EDDD
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Feb 2019 13:32:40 +0000 (UTC)
Date: Fri, 8 Feb 2019 14:32:38 +0100
From: Katarzyna Dec <katarzyna.dec@intel.com>
Message-ID: <20190208133238.GB27881@kdec5-desk.ger.corp.intel.com>
References: <20190208131037.22811-1-katarzyna.dec@intel.com>
 <154963166124.3378.17047892724983888827@skylake-alporthouse-com>
 <20190208132359.GA27881@kdec5-desk.ger.corp.intel.com>
 <154963246128.3378.1085966481040708512@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <154963246128.3378.1085966481040708512@skylake-alporthouse-com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_exec_parallel: Add
 skip_on_simulation to whole binary
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCBGZWIgMDgsIDIwMTkgYXQgMDE6Mjc6NTFQTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFF1b3RpbmcgS2F0YXJ6eW5hIERlYyAoMjAxOS0wMi0wOCAxMzoyMzo1OSkKPiA+IE9u
IEZyaSwgRmViIDA4LCAyMDE5IGF0IDAxOjE0OjI2UE0gKzAwMDAsIENocmlzIFdpbHNvbiB3cm90
ZToKPiA+ID4gUXVvdGluZyBLYXRhcnp5bmEgRGVjICgyMDE5LTAyLTA4IDEzOjEwOjM3KQo+ID4g
PiA+IE9uIHNpbXVsYXRpb24gZW52aXJvbm1lbnQgdGhlc2UgdGVzdHMgd2VyZSBmYWlsaW5nLiBE
dXJpbmcgZGVidWcKPiA+ID4gPiB3ZSBkZWNpZGVkIHRoYXQgd2hvbGUgYmluYXJ5IHNob3VsZCBi
ZSBza2lwcGVkLCBiZWNhdXNlIHRoZXJlIGlzCj4gPiA+ID4gbm8gYWRkaXRpb25hbCBjb3ZlcmFn
ZSBpbiBzaW11bGF0aW9uLgo+ID4gPiAKPiA+ID4gSG93IGRpZCB0aGV5IGZhaWw/IFRoZXJlIGFy
ZSBzb21lIHBhdGhzIGhlcmUgdGhhdCBhcmUgcmFyZWx5IHRvdWNoZWQKPiA+ID4gZWxzZXdoZXJl
Lgo+ID4gPiAtQ2hyaXMKPiA+IEkgbGlrZSB5b3UgY2hhbGxlbmdlcyBDaHJpcyA6KQo+ID4gCj4g
PiBnZW1fZXhlY19wYXJhbGxlbEAqY29udGV4dCogd2VyZSBmYWlsaW5nIHdpdGggZXJyb3I6Cj4g
PiAKPiA+IChnZW1fZXhlY19wYXJhbGxlbDoxMjQ1KSBpb2N0bF93cmFwcGVycy1DUklUSUNBTDog
VGVzdCBhc3NlcnRpb24gZmFpbHVyZQo+ID4gZnVuY3Rpb24gZ2VtX2V4ZWNidWYsIGZpbGUgLi4v
bGliL2lvY3RsX3dyYXBwZXJzLmM6NjA1Ogo+ID4gKGdlbV9leGVjX3BhcmFsbGVsOjEyNDUpIGlv
Y3RsX3dyYXBwZXJzLUNSSVRJQ0FMOiBGYWlsZWQgYXNzZXJ0aW9uOgo+ID4gX19nZW1fZXhlY2J1
ZihmZCwgZXhlY2J1ZikgPT0gMAo+ID4gKGdlbV9leGVjX3BhcmFsbGVsOjEyNDUpIGlvY3RsX3dy
YXBwZXJzLUNSSVRJQ0FMOiBlcnJvcjogLTI4ICE9IDAKPiAKPiBTaG91bGQgbm90IGhhcHBlbi4K
QnV0IGhhcHBlbmRzIGFuZCBpcyByZXByb2R1Y2libGUgb24gc29tZSBDSSBydW5zLgo+ICAKPiA+
IGFuZCBAKmZkcyogd2l0aDoKPiA+IAo+ID4gKGdlbV9leGVjX3BhcmFsbGVsOjEzMTUpIGlndF9k
ZWJ1Z2ZzLUNSSVRJQ0FMOiBMYXN0IGVycm5vOiAyNCwgVG9vIG1hbnkgb3Blbgo+ID4gZmlsZXMK
PiAKPiBUaGF0IGlzIGJvcmluZywgYnV0IG1vcmUgaW5kaWNhdGl2ZSBvZiBzeXN0ZW0gc2V0dXAg
ZmFpbHVyZS4gV2Ugc2hvdWxkCj4gYmUgY29uZmlndXJpbmcgdGhlIHN5c3RlbSB0byBhbGxvdyBv
dXJzZWx2ZXMsIGFzIHJvb3QsIHRvIHVzZSBhcyBtYW55IGZkCj4gYXMgY2FuIGZpdCBpbiBtZW1v
cnkuCj4gCj4gSSdkIHJlY29tbWVuZCBhIHBhc3MgdGhyb3VnaCB0aGUgYmFzaWMgc3RyZXNzIHRl
c3QgYXQgbGVhc3QuIEl0IHdvbid0Cj4gdGFrZSBhIGxvdCB0byBleGVyY2lzZSBzb21lIHVudXN1
YWwgY29uZGl0aW9ucy4KPiAtQ2hyaXMKCldoYXQgaWYgd2Ugc2tpcCBhbGwgKmNvbnRleHQqIGFu
ZCBhbGwgKmZkcyogYW5kIGxlYXZlIHJlc3QgYXMgaXQgaXM/CldpbGwgaXQgYmUgcmVzb25hYmxl
IGluIHRoaXMgc2hhcGU/CgpLYXNpYSA6KQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2lndC1kZXYK
