Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 319056E821
 for <igt-dev@lists.freedesktop.org>; Wed,  9 May 2018 11:37:00 +0000 (UTC)
Date: Wed, 9 May 2018 13:36:58 +0200
From: Ewelina Musial <ewelina.musial@intel.com>
Message-ID: <20180509113658.GA16482@emusial-desk.ger.corp.intel.com>
References: <20180507130125.24180-1-katarzyna.dec@intel.com>
 <20180509110052.GB12952@emusial-desk.ger.corp.intel.com>
 <20180509113246.GA21251@kdec5-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180509113246.GA21251@kdec5-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/media_fill: Create common
 media_fill library for all gens
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
To: Katarzyna Dec <katarzyna.dec@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBNYXkgMDksIDIwMTggYXQgMDE6MzI6NDZQTSArMDIwMCwgS2F0YXJ6eW5hIERlYyB3
cm90ZToKPiBPbiBXZWQsIE1heSAwOSwgMjAxOCBhdCAwMTowMDo1MlBNICswMjAwLCBFd2VsaW5h
IE11c2lhbCB3cm90ZToKPiA+IE9uIE1vbiwgTWF5IDA3LCAyMDE4IGF0IDAzOjAxOjI1UE0gKzAy
MDAsIEthdGFyenluYSBEZWMgd3JvdGU6Cj4gPiA+ICsJaW50ZXJmYWNlX2Rlc2NyaXB0b3IgPSBn
ZW44X2ZpbGxfaW50ZXJmYWNlX2Rlc2NyaXB0b3IoYmF0Y2gsIGRzdCwKPiA+ID4gKwkJCQkJZ2Vu
OF9tZWRpYV9rZXJuZWwsCj4gPiA+ICsJCQkJCXNpemVvZihnZW44X21lZGlhX2tlcm5lbCkpOwo+
ID4gPiArCWlndF9hc3NlcnQoYmF0Y2gtPnB0ciA8ICZiYXRjaC0+YnVmZmVyWzQwOTVdKTsKPiA+
ID4gKwo+ID4gPiArCS8qIG1lZGlhIHBpcGVsaW5lICovCj4gPiA+ICsJYmF0Y2gtPnB0ciA9IGJh
dGNoLT5idWZmZXI7Cj4gPiA+ICsJT1VUX0JBVENIKEdFTjhfUElQRUxJTkVfU0VMRUNUIHwgUElQ
RUxJTkVfU0VMRUNUX01FRElBKTsKPiA+ID4gKwlnZW44X2VtaXRfc3RhdGVfYmFzZV9hZGRyZXNz
KGJhdGNoKTsKPiA+ID4gKwo+ID4gPiArCWdlbjhfZW1pdF92ZmVfc3RhdGUoYmF0Y2gpOwo+ID4g
PiArCj4gPiA+ICsJZ2VuN19lbWl0X2N1cmJlX2xvYWQoYmF0Y2gsIGN1cmJlX2J1ZmZlcik7Cj4g
PiA+ICsKPiA+ID4gKwlnZW43X2VtaXRfaW50ZXJmYWNlX2Rlc2NyaXB0b3JfbG9hZChiYXRjaCwg
aW50ZXJmYWNlX2Rlc2NyaXB0b3IpOwo+ID4gPiArCj4gPiA+ICsJZ2VuN19lbWl0X21lZGlhX29i
amVjdHMoYmF0Y2gsIHgsIHksIHdpZHRoLCBoZWlnaHQpOwo+ID4gPiArCj4gPiA+ICsJT1VUX0JB
VENIKE1JX0JBVENIX0JVRkZFUl9FTkQpOwo+ID4gPiArCj4gPiA+ICsJYmF0Y2hfZW5kID0gaW50
ZWxfYmF0Y2hidWZmZXJfYWxpZ24oYmF0Y2gsIDgpOwo+ID4gPiArCWlndF9hc3NlcnQoYmF0Y2hf
ZW5kIDwgQkFUQ0hfU1RBVEVfU1BMSVQpOwo+ID4gPiArCj4gPiA+ICsJZ2VuN19yZW5kZXJfZmx1
c2goYmF0Y2gsIGJhdGNoX2VuZCk7Cj4gPiA+ICsJaW50ZWxfYmF0Y2hidWZmZXJfcmVzZXQoYmF0
Y2gpOwo+ID4gPiArfQo+ID4gCj4gPiBBYm92ZSB0d28gZnVuY3Rpb25zIGFyZSByZWFsbHkgc2lt
aWxhciwgSSBhbSB3b25kZXJpbmcgaWYgd2UgY291bGQgY29ubmVjdCB0aGVtIHNvbWVob3cgYW5k
IGRvIG9uZSBmdW5jdGlvbi4KPiA+IEJ1dCBpZiBJIGFtIGFsb25lIHdpdGggdGhpcyB0aGlua2lu
ZyBpdCBpcyBPSyB0byBtZSB0byBsZWF2ZSBpdCA6KQo+ID4gSSBkb250IGhhdmUgYW55IG1vcmUg
Y29tbWVudHMgc28gaWYgdGhpcyBpcyBPSyBmb3Igb3RoZXJzIEkgY2FuIGdpdmUgci1iLgo+ID4g
Cj4gPiBSZXZpZXdlZC1ieTogRXdlbGluYSBNdXNpYWwgPGV3ZWxpbmEubXVzaWFsQGludGVsLmNv
bT4KPiA+IC0gRXdlbGluYQo+IAo+IFllcywgZGlmZmVyZW5jZSBpcyByZWFsbHkgc21hbGwsIGJ1
dCBJIHRoaW5rIHRoYXQgZWZmb3J0IHdpdGggdW5pZmluZyB0aGVtCj4gaXMgYmlnZ2VyIHRoYW4g
cmVzdWx0IHdlIGNhbiBnYWluLgo+IEkgd291bGQgcHJlZmVyIG5vdCB0byBjaGFuZ2UgZ2VuNy9n
ZW44IGNvZGUuCj4gS2FzaWEKCkdvb2QgZW5vdWdoIHRvIG1lIDopCi1Fd2VsaW5hCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
