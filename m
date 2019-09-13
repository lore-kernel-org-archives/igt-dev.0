Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 454B46E962
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Sep 2019 10:42:22 +0000 (UTC)
Date: Fri, 13 Sep 2019 13:42:19 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20190913104219.GR4019@platvala-desk.ger.corp.intel.com>
References: <20190913102340.4784-1-simon.ser@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190913102340.4784-1-simon.ser@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_eld: fix eld_is_supported
 failing if not supported
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
To: Simon Ser <simon.ser@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgMDE6MjM6NDBQTSArMDMwMCwgU2ltb24gU2VyIHdyb3Rl
Ogo+IFdoZW4gZ2xvYigzKSBkb2Vzbid0IGZpbmQgYW55IHJlc3VsdHMsIGl0IHJldHVybnMgR0xP
Ql9OT01BVENILiBJJ3ZlIGJlZW4KPiBjb25mdXNlZCBieSBHTE9CX05PQ0hFQ0sncyBkZXNjcmlw
dGlvbiBhbmQgdGhvdWdodCBpdCB3b3VsZCByZXR1cm4gMC4KPiAKPiBJbnN0ZWFkIG9mIGZhaWxp
bmcgb24gdGhlIGFzc2VydCwgcmV0dXJuIHRoYXQgRUxEcyBhcmVuJ3Qgc3VwcG9ydGVkIGluIGNh
c2UKPiB0aGVyZSdzIG5vIG1hdGNoLgo+IAo+IFdoaWxlIGF0IGl0LCBhbHNvIGluY2x1ZGUgZ2xv
YidzIHJldHVybiB2YWx1ZSBpbiB0aGUgYXNzZXJ0IG1lc3NhZ2UuCj4gCj4gU2lnbmVkLW9mZi1i
eTogU2ltb24gU2VyIDxzaW1vbi5zZXJAaW50ZWwuY29tPgo+IEZpeGVzOiAzMzc0Y2QwYjA0OGYg
KCJsaWIvaWd0X2VsZDogaW50cm9kdWNlIGVsZF9pc19zdXBwb3J0ZWQiKQo+IENjOiBQZXRyaSBM
YXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4KPiAtLS0KPiAKPiBTb3JyeSBhYm91dCB0
aGUgZnVzcy4KPiAKPiAgbGliL2lndF9lbGQuYyB8IDkgKysrKysrLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCA2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2xp
Yi9pZ3RfZWxkLmMgYi9saWIvaWd0X2VsZC5jCj4gaW5kZXggNWQxZDhlMDFjZDMzLi4yM2ViZjYz
MDVhZTAgMTAwNjQ0Cj4gLS0tIGEvbGliL2lndF9lbGQuYwo+ICsrKyBiL2xpYi9pZ3RfZWxkLmMK
PiBAQCAtMjcwLDExICsyNzAsMTQgQEAgYm9vbCBlbGRfaGFzX2lndCh2b2lkKQo+ICBib29sIGVs
ZF9pc19zdXBwb3J0ZWQodm9pZCkKPiAgewo+ICAJZ2xvYl90IGdsb2JfYnVmID0gezB9Owo+ICsJ
aW50IHJldDsKPiAgCWJvb2wgaGFzX2VsZHM7Cj4gCj4gLQlpZ3RfYXNzZXJ0X2YoZ2xvYigiL3By
b2MvYXNvdW5kL2NhcmQqLyIgRUxEX1BSRUZJWCAiKiIsCj4gLQkJCSAgR0xPQl9OT1NPUlQsIE5V
TEwsICZnbG9iX2J1ZikgPT0gMCwKPiAtCQkgICAgICJnbG9iIGZhaWxlZFxuIik7Cj4gKwlyZXQg
PSBnbG9iKCIvcHJvYy9hc291bmQvY2FyZCovIiBFTERfUFJFRklYICIqIiwKPiArCQkgICBHTE9C
X05PU09SVCwgTlVMTCwgJmdsb2JfYnVmKTsKPiArCWlmIChyZXQgPT0gR0xPQl9OT01BVENIKQo+
ICsJCXJldHVybiBmYWxzZTsKPiArCWlndF9hc3NlcnRfZihyZXQgPT0gMCwgImdsb2IgZmFpbGVk
OiAlZFxuIiwgcmV0KTsKClJldmlld2VkLWJ5OiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxh
QGludGVsLmNvbT4KCgo+ICAJaGFzX2VsZHMgPSBnbG9iX2J1Zi5nbF9wYXRoYyA+IDA7Cj4gIAln
bG9iZnJlZSgmZ2xvYl9idWYpOwo+IAo+IC0tCj4gMi4yMy4wCj4gCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaWd0LWRldg==
