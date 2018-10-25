Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5262C6E1CF
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Oct 2018 10:32:54 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id c1-v6so7971320ede.5
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Oct 2018 03:32:54 -0700 (PDT)
Date: Thu, 25 Oct 2018 12:32:50 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20181025103250.GD21967@phenom.ffwll.local>
References: <20181025102146.24258-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181025102146.24258-1-ville.syrjala@linux.intel.com>
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
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBPY3QgMjUsIDIwMTggYXQgMDE6MjE6NDZQTSArMDMwMCwgVmlsbGUgU3lyamFsYSB3
cm90ZToKPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tPgo+IAo+IFVubG9hZCB0aGUgc25kX2hkbWlfbHBlX2F1ZGlvIG1vZHVsZS4gT3RoZXJ3aXNl
IGk5MTUgY2FuJ3QgYmUgdW5sb2FkZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOk
bMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClJldmlld2VkLWJ5OiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgoKPiAtLS0KPiAgbGliL2lndF9rbW9kLmMg
fCAxMSArKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQo+IAo+
IGRpZmYgLS1naXQgYS9saWIvaWd0X2ttb2QuYyBiL2xpYi9pZ3Rfa21vZC5jCj4gaW5kZXggYjJm
NGY4ODRiMTM3Li4yMmMyNjAyMTBlM2QgMTAwNjQ0Cj4gLS0tIGEvbGliL2lndF9rbW9kLmMKPiAr
KysgYi9saWIvaWd0X2ttb2QuYwo+IEBAIC0zMzMsNiArMzMzLDE3IEBAIGlndF9pOTE1X2RyaXZl
cl91bmxvYWQodm9pZCkKPiAgCQl9Cj4gIAl9Cj4gIAo+ICsJaWYgKGlndF9rbW9kX2lzX2xvYWRl
ZCgic25kX2hkbWlfbHBlX2F1ZGlvIikpIHsKPiArCQlpZ3RfdGVybWluYXRlX3Byb2Nlc3MoU0lH
VEVSTSwgImFsc2FjdGwiKTsKPiArCj4gKwkJaWYgKGlndF9rbW9kX3VubG9hZCgic25kX2hkbWlf
bHBlX2F1ZGlvIiwgMCkpIHsKPiArCQkJaWd0X3dhcm4oIkNvdWxkIG5vdCB1bmxvYWQgc25kX2hk
bWlfbHBlX2F1ZGlvXG4iKTsKPiArCQkJaWd0X2ttb2RfbGlzdF9sb2FkZWQoKTsKPiArCQkJaWd0
X2xzb2YoIi9kZXYvc25kIik7Cj4gKwkJCXJldHVybiBJR1RfRVhJVF9GQUlMVVJFOwo+ICsJCX0K
PiArCX0KPiArCj4gIAkvKiBnZW41ICovCj4gIAlpZiAoaWd0X2ttb2RfaXNfbG9hZGVkKCJpbnRl
bF9pcHMiKSkKPiAgCQlpZ3Rfa21vZF91bmxvYWQoImludGVsX2lwcyIsIDApOwo+IC0tIAo+IDIu
MTguMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gaWd0LWRldiBtYWlsaW5nIGxpc3QKPiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgoK
LS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0
dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRl
dgo=
