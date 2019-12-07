Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20191207174239.GC1300@jack.zhora.eu>
References: <20191207010835.2100418-1-chris@chris-wilson.co.uk>
 <20191207174239.GC1300@jack.zhora.eu>
Message-ID: <157574079170.2300.6327103910530104961@skylake-alporthouse-com>
Date: Sat, 07 Dec 2019 17:46:31 +0000
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] Revert "tests/i915: Use
 engine query interface for gem_ctx_isolation/persistence"
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
To: Andi Shyti <andi@etezian.org>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBbmRpIFNoeXRpICgyMDE5LTEyLTA3IDE3OjQyOjM5KQo+IEhpIENocmlzLAo+IAo+
IE9uIFNhdCwgRGVjIDA3LCAyMDE5IGF0IDAxOjA4OjM1QU0gKzAwMDAsIENocmlzIFdpbHNvbiB3
cm90ZToKPiA+IFRoaXMgcmV2ZXJ0cyBjb21taXQgMzQzYWFlNzc2YTU4YTY3ZmExNTM4MjUzODVl
NmZlOTBlMzE4NWM1Yi4KPiA+IAo+ID4gX19mb3JfZWFjaF9waHlzaWNhbF9lbmdpbmUoKSByZXBy
b2dyYW1zIHRoZSBjb250ZXh0LCBpbnZhbGlkYXRpbmcgdGhlCj4gPiB1c2Ugb2YgZS0+ZmxhZ3Mg
dG8gc2VsZWN0IGVuZ2luZXMsIG5lY2Vzc2l0YXRpbmcgZS0+aW5kZXggaW5zdGVhZC4KPiA+IFdp
dGhvdCBhbHNvIGZpeGluZyB1cCB0aGUgZW5naW5lIHNlbGVjdGlvbiwgdGhlIHJlc3VsdCBpcyB0
aGF0IHJhbmRvbQo+ID4gZW5naW5lcyB3ZXJlIGJlaW5nIHVzZWQgdG8gcmVhZCByZWdpc3RlcnMg
ZnJvbSB0aGUgaW50ZW5kZWQgZW5naW5lLgo+ID4gVGhpcyBkb2VzIG5vdCBlbmQgd2VsbC4KPiAK
PiBTbywgdGhlIHByb2JsZW0gaGVyZSBpcyB0aGF0IHdpdGggX19mb3JfZWFjaF9waHlzaWNhbF9l
bmdpbmUoKSB3ZQo+ICJyZXByb2dyYW0gdGhlIGNvbnRleHQiIHdoaWNoIG1lYW5zIHRoYXQgdGhl
cmUgaXMgYSByZS1tYXBwaW5nIG9mCj4gZW5naW5lcyBpbiBpdC4gSGF2ZSBJIHVuZGVyc3Rvb2Qg
Y29ycmVjdGx5Pwo+IAo+IERvZXNuJ3QgdGhhdCBoYXBwZW4gb25seSBpbiB0aGUgY2FzZSB3aGVu
IHRoZSBjb250ZXh0IGhhcyBubwo+IGVuZ2luZXMgaW4gaXQ/CgppaXJjLCBpdCBkb2VzIHNvbWV0
aGluZyBsaWtlIGluaXRfZW5naW5lX21hcCBhbmQgc2V0cyBhIGNvbnNpc3RlbnQKZW5naW5lIGxh
eW91dCBvbiB0aGUgY29udGV4dCAtLSBidXQgc3dpdGNoZXMgZXhlY2J1ZiBvdmVyIHRvIGluZGV4
IG1vZGUuCiAKPiA+IEBAIC04NzcsNyArODc2LDggQEAgaWd0X21haW4KPiA+ICAgICAgICAgICAg
ICAgaWd0X3NraXBfb24oZ2VuID4gTEFTVF9LTk9XTl9HRU4pOwo+ID4gICAgICAgfQo+ID4gIAo+
ID4gLSAgICAgX19mb3JfZWFjaF9waHlzaWNhbF9lbmdpbmUoZmQsIGUpIHsKPiA+ICsgICAgIGZv
ciAoY29uc3Qgc3RydWN0IGludGVsX2V4ZWN1dGlvbl9lbmdpbmUyICplID0gaW50ZWxfZXhlY3V0
aW9uX2VuZ2luZXMyOwo+ID4gKyAgICAgICAgICBlLT5uYW1lOyBlKyspIHsKPiAKPiBfX2Zvcl9l
YWNoX3N0YXRpY19lbmdpbmUoKSA/CgpJJ20ganVzdCBkb2luZyBhIHNpbXBsZSByZXZlcnQgc28g
d2UgY2FuIHRyeSBhZ2FpbiA6KQotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pZ3QtZGV2
