Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 31 Aug 2018 16:30:31 +0300
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20180831133031.GB7402@ideak-desk.fi.intel.com>
References: <20180831130813.19014-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180831130813.19014-1-chris@chris-wilson.co.uk>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_vblank: Test if we have
 functional rpm before testing
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: imre.deak@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCBBdWcgMzEsIDIwMTggYXQgMDI6MDg6MTNQTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFdlIHdhbnQgdG8gdGVzdCB0aGF0IHByb3Zva2luZyBhIHZibGFuayBpbnRlcnJ1cHQg
d29ya3MgY29ycmVjdGx5IGFmdGVyCj4gd2FraW5nIHVwIGZyb20gcnVudGltZS1wbS4gRmlyc3Qg
dGhvdWdoLCB3ZSBtdXN0IHdhaXQgZm9yIHRoZSBkZXZpY2UgdG8KPiBlbnRlciBydW50aW1lLXN1
c3BlbmQuIElmIHRoZSBkZXZpY2UgY2Fubm90LCBlLmcuIHdlIGhhdmVuJ3QgZW5hYmxlZCB0aGUK
PiBETUMgZmlybXdhcmUsIHRoZSB0ZXN0IHNob3VsZCBza2lwIGJlY2F1c2Ugb3VyIGV4dGVybmFs
IHJlcXVpcmVtZW50cyBhcmUKPiBub3QgbWV0Lgo+IAo+IEJ1Z3ppbGxhOiBodHRwczovL2J1Z3Mu
ZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMDc3NjgKPiBTaWduZWQtb2ZmLWJ5OiBD
aHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiBDYzogSW1yZSBEZWFrIDxp
bXJlLmRlYWtAaW50ZWwuY29tPgoKU2lnbmVkLW9mZi1ieTogSW1yZSBEZWFrIDxpbXJlLmRlYWtA
aW50ZWwuY29tPgoKPiAtLS0KPiAgdGVzdHMva21zX3ZibGFuay5jIHwgMiArLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
dGVzdHMva21zX3ZibGFuay5jIGIvdGVzdHMva21zX3ZibGFuay5jCj4gaW5kZXggNTA4YzBmYTAz
Li5iM2NkMmQ5M2MgMTAwNjQ0Cj4gLS0tIGEvdGVzdHMva21zX3ZibGFuay5jCj4gKysrIGIvdGVz
dHMva21zX3ZibGFuay5jCj4gQEAgLTM1Miw3ICszNTIsNyBAQCBzdGF0aWMgdm9pZCB2Ymxhbmtf
dHNfY29udChkYXRhX3QgKmRhdGEsIGludCBmZCwgaW50IG5jaGlsZHJlbikKPiAgCX0KPiAgCj4g
IAlpZiAoZGF0YS0+ZmxhZ3MgJiBSUE0pCj4gLQkJaWd0X2Fzc2VydChpZ3Rfd2FpdF9mb3JfcG1f
c3RhdHVzKElHVF9SVU5USU1FX1BNX1NUQVRVU19TVVNQRU5ERUQpKTsKPiArCQlpZ3RfcmVxdWly
ZShpZ3Rfd2FpdF9mb3JfcG1fc3RhdHVzKElHVF9SVU5USU1FX1BNX1NUQVRVU19TVVNQRU5ERUQp
KTsKPiAgCj4gIAlpZiAoZGF0YS0+ZmxhZ3MgJiBTVVNQRU5EKQo+ICAJCWlndF9zeXN0ZW1fc3Vz
cGVuZF9hdXRvcmVzdW1lKFNVU1BFTkRfU1RBVEVfTUVNLAo+IC0tIAo+IDIuMTkuMC5yYzEKPiAK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
