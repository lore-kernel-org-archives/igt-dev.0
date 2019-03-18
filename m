Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C048984F
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Mar 2019 13:17:27 +0000 (UTC)
Date: Mon, 18 Mar 2019 09:31:40 -0400
From: "Kumar Valsan, Prathap" <prathap.kumar.valsan@intel.com>
Message-ID: <20190318133140.GC30702@intel.com>
References: <20190215214608.32021-1-prathap.kumar.valsan@intel.com>
 <20190315191555.6792-1-prathap.kumar.valsan@intel.com>
 <20190318131043.GB30702@intel.com>
 <155291437385.4168.16028572505368306948@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <155291437385.4168.16028572505368306948@skylake-alporthouse-com>
Subject: Re: [igt-dev] [PATCH i-g-t v7] i915/gem_mocs_settings: Add mocs
 table for icelake
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

T24gTW9uLCBNYXIgMTgsIDIwMTkgYXQgMDE6MDY6MTNQTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFF1b3RpbmcgS3VtYXIgVmFsc2FuLCBQcmF0aGFwICgyMDE5LTAzLTE4IDEzOjEwOjQz
KQo+ID4gT24gRnJpLCBNYXIgMTUsIDIwMTkgYXQgMDM6MTU6NTVQTSAtMDQwMCwgUHJhdGhhcCBL
dW1hciBWYWxzYW4gd3JvdGU6Cj4gPiA+ICtzdGF0aWMgdm9pZCBpc29sYXRpb25fdGVzdChpbnQg
ZmQsIHVuc2lnbmVkIGVuZ2luZSkKPiA+ID4gK3sKPiA+ID4gKyAgICAgdWludDMyX3QgY3R4WzJd
ID0geyBnZW1fY29udGV4dF9jcmVhdGUoZmQpLCBnZW1fY29udGV4dF9jcmVhdGUoZmQpIH07Cj4g
PiA+ICsKPiA+ID4gKyAgICAgLyogQW55IHdyaXRlcyBieSBvbmUgbm9ybWFsIGNsaWVudCBzaG91
bGQgbm90IGFmZmVjdCBhIHNlY29uZCBjbGllbnQgKi8KPiA+ID4gKyAgICAgd3JpdGVfZGlydHlf
bW9jcyhmZCwgZW5naW5lLCBjdHhbMF0sIGZhbHNlKTsKPiA+ID4gKyAgICAgY2hlY2tfbW9jc192
YWx1ZXMoZmQsIGVuZ2luZSwgY3R4WzFdLCBmYWxzZSk7Cj4gPiA+ICsKPiA+ID4gKyAgICAgZm9y
IChpbnQgaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGN0eCk7IGkrKykKPiA+ID4gKyAgICAgICAgICAg
ICBnZW1fY29udGV4dF9kZXN0cm95KGZkLCBjdHhbaV0pOwo+ID4gPiArfQo+ID4gPiArCj4gPiA+
ICBpZ3RfbWFpbgo+ID4gPiAgewo+ID4gPiAgICAgICBjb25zdCBzdHJ1Y3QgaW50ZWxfZXhlY3V0
aW9uX2VuZ2luZSAqZTsKPiA+ID4gQEAgLTQ5MCw2ICs1NTksMTQgQEAgaWd0X21haW4KPiA+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfQo+ID4gPiAgICAgICAgICAgICAgICAgICAg
ICAgfQo+ID4gPiAgICAgICAgICAgICAgIH0KPiA+ID4gKwo+ID4gPiArICAgICAgICAgICAgIGln
dF9zdWJ0ZXN0X2YoIm1vY3MtaXNvbGF0aW9uLSVzIiwKPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZS0+bmFtZSkgewo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgZ2VtX3Jl
cXVpcmVfY29udGV4dHMoZmQpOwo+ID4gPiArCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBp
c29sYXRpb25fdGVzdChmZCwgZS0+ZXhlY19pZCB8IGUtPmZsYWdzKTsKPiA+ID4gKyAgICAgICAg
ICAgICB9Cj4gPiA+ICsKPiA+ID4gICAgICAgfQo+ID4gQ2hyaXMsCj4gPiBBZGRlZCBpc29sYXRp
b25fdGVzdCBhcyBhIHN1YnRlc3QuIENhbiBpIGdldCBhIHItYiBpZiB0aGlzIGxvb2tzIGdvb2Qg
dG8KPiA+IHlvdS4KPiAKPiBZdXAsIHRoYXQgbG9va3MgbGlrZSB3aGF0IEkgZXhwZWN0IHdlIG5l
ZWQgdG8gdmVyaWZ5IHRoZSBBQkkgdGhhdCBtb2NzCj4gdmFsdWVzIGFyZSBpbmRlcGVuZGVudCB3
aXRob3V0IG92ZXJidXJkZW5pbmcgb3Vyc2VsdmVzIHdpdGggYWN0dWFsIEhXCj4gaW1wbGVtZW50
YXRpb24uCj4gCj4gUmV2aWV3ZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29u
LmNvLnVrPgo+IC1DaHJpcwoKVGhhbmtzIGZvciB0aGUgcmV2aWV3cy4KCi1QcmF0aGFwCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGlu
ZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
