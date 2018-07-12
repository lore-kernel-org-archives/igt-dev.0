Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
Date: Thu, 12 Jul 2018 22:01:12 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20180712190112.GG5565@intel.com>
References: <20180712153709.10125-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180712153709.10125-1-chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [PATCH i-g-t 1/2] igt/gem_gpgpu_fill: Check for GEM
 before use
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBKdWwgMTIsIDIwMTggYXQgMDQ6Mzc6MDhQTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IEFzIHdlIG5lZWQgR0VNIGFuZCB0aGUgR1BVIHRvIGRvIGEgR1BHUFUgZmlsbCwgd2Ug
c2hvdWxkIGNoZWNrIHRoYXQgaXQKPiBpcyBvcGVyYWJsZSBiZWZvcmUgdXNpbmcgLS0gc2tpcHBp
bmcgcmF0aGVyIHRoYW4gZmFpbGluZyB3aGVuIHRoZSBkZXZpY2UKPiBpcyB3ZWRnZWQuCj4gCj4g
U2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CgpT
ZXJpZXMgaXMKUmV2aWV3ZWQtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51
eC5pbnRlbC5jb20+Cgo+IC0tLQo+ICB0ZXN0cy9nZW1fZ3BncHVfZmlsbC5jIHwgMSArCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS90ZXN0cy9nZW1f
Z3BncHVfZmlsbC5jIGIvdGVzdHMvZ2VtX2dwZ3B1X2ZpbGwuYwo+IGluZGV4IDhlZjA1YTNmMC4u
ZGZiNTgxNjUyIDEwMDY0NAo+IC0tLSBhL3Rlc3RzL2dlbV9ncGdwdV9maWxsLmMKPiArKysgYi90
ZXN0cy9nZW1fZ3BncHVfZmlsbC5jCj4gQEAgLTEwNCw2ICsxMDQsNyBAQCBpZ3Rfc2ltcGxlX21h
aW4KPiAgCj4gIAlkYXRhLmRybV9mZCA9IGRybV9vcGVuX2RyaXZlcl9yZW5kZXIoRFJJVkVSX0lO
VEVMKTsKPiAgCWRhdGEuZGV2aWQgPSBpbnRlbF9nZXRfZHJtX2RldmlkKGRhdGEuZHJtX2ZkKTsK
PiArCWlndF9yZXF1aXJlX2dlbShkYXRhLmRybV9mZCk7Cj4gIAo+ICAJZGF0YS5idWZtZ3IgPSBk
cm1faW50ZWxfYnVmbWdyX2dlbV9pbml0KGRhdGEuZHJtX2ZkLCA0MDk2KTsKPiAgCWlndF9hc3Nl
cnQoZGF0YS5idWZtZ3IpOwo+IC0tIAo+IDIuMTguMAo+IAo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdAo+IElu
dGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAoKLS0gClZpbGxlIFN5cmrDpGzDpApJbnRl
bApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1n
ZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
