Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
In-Reply-To: <20190311141801.5393-1-chris@chris-wilson.co.uk>
References: <20190311141801.5393-1-chris@chris-wilson.co.uk>
Date: Mon, 11 Mar 2019 17:31:09 +0200
Message-ID: <87d0mxtole.fsf@gaia.fi.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_ppgtt: Swap args to
 intel_require_memory()
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
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Q2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+IHdyaXRlczoKCj4gSXQgc2hv
dWxkIGJlIChjb3VudCwgc2l6ZSkhCgovb1wKCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxz
b24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KClJldmlld2VkLWJ5OiBNaWthIEt1b3BwYWxh
IDxtaWthLmt1b3BwYWxhQGxpbnV4LmludGVsLmNvbT4KCj4gLS0tCj4gIHRlc3RzL2k5MTUvZ2Vt
X3BwZ3R0LmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUvZ2VtX3BwZ3R0LmMgYi90ZXN0cy9p
OTE1L2dlbV9wcGd0dC5jCj4gaW5kZXggOTQwOWJlZjE0Li5hZTk4NjljMmMgMTAwNjQ0Cj4gLS0t
IGEvdGVzdHMvaTkxNS9nZW1fcHBndHQuYwo+ICsrKyBiL3Rlc3RzL2k5MTUvZ2VtX3BwZ3R0LmMK
PiBAQCAtOTcsNyArOTcsNyBAQCBzdGF0aWMgdm9pZCBmb3JrX3Jjc19jb3B5KGludCB0aW1lb3V0
LCB1aW50MzJfdCBmaW5hbCwKPiAgCW1lbV9wZXJfY2hpbGQgPSBTSVpFOwo+ICAJaWYgKGZsYWdz
ICYgQ1JFQVRFX0NPTlRFWFQpCj4gIAkJbWVtX3Blcl9jaGlsZCArPSAyICogMTI4ICogMTAyNDsg
Lyogcm91Z2ggY29udGV4dCBzaXplcyAqLwo+IC0JaW50ZWxfcmVxdWlyZV9tZW1vcnkobWVtX3Bl
cl9jaGlsZCwgY291bnQsIENIRUNLX1JBTSk7Cj4gKwlpbnRlbF9yZXF1aXJlX21lbW9yeShjb3Vu
dCwgbWVtX3Blcl9jaGlsZCwgQ0hFQ0tfUkFNKTsKPiAgCj4gIAlmb3IgKGludCBjaGlsZCA9IDA7
IGNoaWxkIDwgY291bnQ7IGNoaWxkKyspIHsKPiAgCQlpbnQgZmQgPSBkcm1fb3Blbl9kcml2ZXIo
RFJJVkVSX0lOVEVMKTsKPiAtLSAKPiAyLjIwLjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gaWd0LWRldiBtYWlsaW5nIGxpc3QKPiBpZ3QtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaWd0LWRldgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ln
dC1kZXY=
