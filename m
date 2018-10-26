Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4401A6E4B6
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Oct 2018 14:57:15 +0000 (UTC)
Date: Fri, 26 Oct 2018 17:57:11 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20181026145711.GW9144@intel.com>
References: <20181025102146.24258-1-ville.syrjala@linux.intel.com>
 <20181025103250.GD21967@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181025103250.GD21967@phenom.ffwll.local>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/kmod: Unload snd_hdmi_lpe_audio
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
To: Daniel Vetter <daniel@ffwll.ch>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBPY3QgMjUsIDIwMTggYXQgMTI6MzI6NTBQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUaHUsIE9jdCAyNSwgMjAxOCBhdCAwMToyMTo0NlBNICswMzAwLCBWaWxsZSBT
eXJqYWxhIHdyb3RlOgo+ID4gRnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxp
bnV4LmludGVsLmNvbT4KPiA+IAo+ID4gVW5sb2FkIHRoZSBzbmRfaGRtaV9scGVfYXVkaW8gbW9k
dWxlLiBPdGhlcndpc2UgaTkxNSBjYW4ndCBiZSB1bmxvYWRlZC4KPiA+IAo+ID4gU2lnbmVkLW9m
Zi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiAK
PiBSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KClRo
YW5rcy4gUHVzaGVkLgoKPiAKPiA+IC0tLQo+ID4gIGxpYi9pZ3Rfa21vZC5jIHwgMTEgKysrKysr
KysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZm
IC0tZ2l0IGEvbGliL2lndF9rbW9kLmMgYi9saWIvaWd0X2ttb2QuYwo+ID4gaW5kZXggYjJmNGY4
ODRiMTM3Li4yMmMyNjAyMTBlM2QgMTAwNjQ0Cj4gPiAtLS0gYS9saWIvaWd0X2ttb2QuYwo+ID4g
KysrIGIvbGliL2lndF9rbW9kLmMKPiA+IEBAIC0zMzMsNiArMzMzLDE3IEBAIGlndF9pOTE1X2Ry
aXZlcl91bmxvYWQodm9pZCkKPiA+ICAJCX0KPiA+ICAJfQo+ID4gIAo+ID4gKwlpZiAoaWd0X2tt
b2RfaXNfbG9hZGVkKCJzbmRfaGRtaV9scGVfYXVkaW8iKSkgewo+ID4gKwkJaWd0X3Rlcm1pbmF0
ZV9wcm9jZXNzKFNJR1RFUk0sICJhbHNhY3RsIik7Cj4gPiArCj4gPiArCQlpZiAoaWd0X2ttb2Rf
dW5sb2FkKCJzbmRfaGRtaV9scGVfYXVkaW8iLCAwKSkgewo+ID4gKwkJCWlndF93YXJuKCJDb3Vs
ZCBub3QgdW5sb2FkIHNuZF9oZG1pX2xwZV9hdWRpb1xuIik7Cj4gPiArCQkJaWd0X2ttb2RfbGlz
dF9sb2FkZWQoKTsKPiA+ICsJCQlpZ3RfbHNvZigiL2Rldi9zbmQiKTsKPiA+ICsJCQlyZXR1cm4g
SUdUX0VYSVRfRkFJTFVSRTsKPiA+ICsJCX0KPiA+ICsJfQo+ID4gKwo+ID4gIAkvKiBnZW41ICov
Cj4gPiAgCWlmIChpZ3Rfa21vZF9pc19sb2FkZWQoImludGVsX2lwcyIpKQo+ID4gIAkJaWd0X2tt
b2RfdW5sb2FkKCJpbnRlbF9pcHMiLCAwKTsKPiA+IC0tIAo+ID4gMi4xOC4xCj4gPiAKPiA+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBpZ3QtZGV2
IG1haWxpbmcgbGlzdAo+ID4gaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IGh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo+IAo+IC0t
IAo+IERhbmllbCBWZXR0ZXIKPiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24K
PiBodHRwOi8vYmxvZy5mZndsbC5jaAoKLS0gClZpbGxlIFN5cmrDpGzDpApJbnRlbApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcg
bGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
