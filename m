Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1E2895A8
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Aug 2018 14:22:48 +0000 (UTC)
Date: Tue, 28 Aug 2018 17:21:11 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20180828142111.GA5565@intel.com>
References: <20180719150415.935-1-ville.syrjala@linux.intel.com>
 <20180719150415.935-5-ville.syrjala@linux.intel.com>
 <c1153aa1ffca54365d2c9f5a49aeda5ab35e084a.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c1153aa1ffca54365d2c9f5a49aeda5ab35e084a.camel@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 05/25] tests/gem_render_copy: Fix
 clipped height
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
To: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBBdWcgMjMsIDIwMTggYXQgMDg6MTc6NTRQTSAtMDcwMCwgRGhpbmFrYXJhbiBQYW5k
aXlhbiB3cm90ZToKPiAKPiAKPiBPbiBUaHUsIDIwMTgtMDctMTkgYXQgMTg6MDMgKzAzMDAsIFZp
bGxlIFN5cmphbGEgd3JvdGU6Cj4gPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmph
bGFAbGludXguaW50ZWwuY29tPgo+ID4gCj4gPiBBc3NpZ24gdGhlIGNsaXBwZWQgaGVpZ2h0IHRv
ICdoJywgbm90ICd3Jy4gVGhpcyBkaWRuJ3QgY2F1c2UgYW55Cj4gPiBwcm9ibGVtcyBzbyBmYXIg
YmVjYXVzZSB3ZSB1c2Ugc3F1YXJlIGJ1ZmZlcnMuCj4gPiAKPiA+IEFsc28gZ2V0IHJpZCBvZiB0
aGUgZ2NjIHZhcmlhYmxlIHNoYWRvd2luZyB3YXJuaW5ncyBieSBub3QgbmVzdGluZwo+ID4gdGhl
Cj4gPiBtaW4oKS9tYXgoKS4KPiA+IAo+IFJldmlld2VkLWJ5OiBEaGluYWthcmFuIFBhbmRpeWFu
IDxkaGluYWthcmFuLnBhbmRpeWFuQGludGVsLmNvbT4KClRoYW5rcy4gUGF0Y2ggcHVzaGVkLgoK
PiAKPiA+IEZpeGVzOiBhYWEyM2VmZjIxYTEgKCJ0ZXN0cy9nZW1fcmVuZGVyX2NvcHk6IFVzZSBh
IG1vcmUgZWxhYm9yYXRlCj4gPiBwYXR0ZXJuIG9mIHBpeGVscyIpCj4gPiBTaWduZWQtb2ZmLWJ5
OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+ID4gLS0t
Cj4gPiAgdGVzdHMvZ2VtX3JlbmRlcl9jb3B5LmMgfCA3ICsrKysrLS0KPiA+ICAxIGZpbGUgY2hh
bmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0
IGEvdGVzdHMvZ2VtX3JlbmRlcl9jb3B5LmMgYi90ZXN0cy9nZW1fcmVuZGVyX2NvcHkuYwo+ID4g
aW5kZXggMjM4ZTcwZTk3YjVkLi4xMzUzNzVhOTBlYzIgMTAwNjQ0Cj4gPiAtLS0gYS90ZXN0cy9n
ZW1fcmVuZGVyX2NvcHkuYwo+ID4gKysrIGIvdGVzdHMvZ2VtX3JlbmRlcl9jb3B5LmMKPiA+IEBA
IC0yNTQsOCArMjU0LDExIEBAIHNjcmF0Y2hfYnVmX2NvcHkoZGF0YV90ICpkYXRhLAo+ID4gIAls
aW5lYXJfc3JjID0gZ2VtX21tYXBfX2d0dChkYXRhLT5kcm1fZmQsIHNyYy0+Ym8tPmhhbmRsZSwK
PiA+ICAJCQkJICAgc3JjLT5iby0+c2l6ZSwgUFJPVF9SRUFEKTsKPiA+ICAKPiA+IC0JdyA9IG1p
bih3LCBtaW4od2lkdGggLSBzeCwgd2lkdGggLSBkeCkpOwo+ID4gLQl3ID0gbWluKGgsIG1pbiho
ZWlnaHQgLSBzeSwgaGVpZ2h0IC0gZHkpKTsKPiA+ICsJdyA9IG1pbih3LCB3aWR0aCAtIHN4KTsK
PiA+ICsJdyA9IG1pbih3LCB3aWR0aCAtIGR4KTsKPiA+ICsKPiA+ICsJaCA9IG1pbihoLCBoZWln
aHQgLSBzeSk7Cj4gPiArCWggPSBtaW4oaCwgaGVpZ2h0IC0gZHkpOwo+ID4gIAo+ID4gIAlmb3Ig
KGludCB5ID0gMDsgeSA8IGg7IHkrKykgewo+ID4gIAkJaWd0X21lbWNweV9mcm9tX3djKCZsaW5l
YXJfZHN0WyhkeSt5KSAqIHdpZHRoICsgZHhdLAoKLS0gClZpbGxlIFN5cmrDpGzDpApJbnRlbApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1h
aWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
