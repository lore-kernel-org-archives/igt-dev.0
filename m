Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 12 Jul 2018 22:01:59 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20180712190159.GH5565@intel.com>
References: <20180712154003.12630-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180712154003.12630-1-chris@chris-wilson.co.uk>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t]
 igt/gem_unfence_active_buffers: Check GEM before use
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
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBKdWwgMTIsIDIwMTggYXQgMDQ6NDA6MDNQTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IEFzIHdlIHdhbnQgdG8gbWFrZSB0aGUgYnVmZmVycyBhY3RpdmUgb24gdGhlIEdQVSBi
ZWZvcmUgcmVtb3ZpbmcgdGhlaXIKPiBmZW5jZSwgYW4gb3BlcmF0aW9uYWwgR1BVIChub3Qgd2Vk
Z2VkISkgaXMgcmVxdWlyZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJp
c0BjaHJpcy13aWxzb24uY28udWs+CgpSZXZpZXdlZC1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxs
ZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCj4gLS0tCj4gIHRlc3RzL2dlbV91bmZlbmNlX2Fj
dGl2ZV9idWZmZXJzLmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4g
Cj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2dlbV91bmZlbmNlX2FjdGl2ZV9idWZmZXJzLmMgYi90ZXN0
cy9nZW1fdW5mZW5jZV9hY3RpdmVfYnVmZmVycy5jCj4gaW5kZXggNmRmMjNjYzUzLi5iNzhmYmFm
YTcgMTAwNjQ0Cj4gLS0tIGEvdGVzdHMvZ2VtX3VuZmVuY2VfYWN0aXZlX2J1ZmZlcnMuYwo+ICsr
KyBiL3Rlc3RzL2dlbV91bmZlbmNlX2FjdGl2ZV9idWZmZXJzLmMKPiBAQCAtNzQsNiArNzQsNyBA
QCBpZ3Rfc2ltcGxlX21haW4KPiAgCQlkYXRhW2ldID0gaTsKPiAgCj4gIAlmZCA9IGRybV9vcGVu
X2RyaXZlcihEUklWRVJfSU5URUwpOwo+ICsJaWd0X3JlcXVpcmVfZ2VtKGZkKTsKPiAgCj4gIAli
dWZtZ3IgPSBkcm1faW50ZWxfYnVmbWdyX2dlbV9pbml0KGZkLCA0MDk2KTsKPiAgCWRybV9pbnRl
bF9idWZtZ3JfZ2VtX2VuYWJsZV9yZXVzZShidWZtZ3IpOwo+IC0tIAo+IDIuMTguMAo+IAo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdAo+IEludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAoKLS0gClZp
bGxlIFN5cmrDpGzDpApJbnRlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1k
ZXYK
