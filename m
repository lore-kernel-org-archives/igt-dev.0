Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2660A6E224
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Apr 2018 00:00:06 +0000 (UTC)
Message-ID: <1523579074.2453.14.camel@dk-H97M-D3H>
From: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Date: Thu, 12 Apr 2018 17:24:34 -0700
In-Reply-To: <20180412112647.GG20211@kdec5-desk.ger.corp.intel.com>
References: <20180411023732.32362-1-dhinakaran.pandiyan@intel.com>
 <20180411023732.32362-10-dhinakaran.pandiyan@intel.com>
 <20180412112647.GG20211@kdec5-desk.ger.corp.intel.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 10/20] tests/psr: Remove delay between
 dpms toggle.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: dhinakaran.pandiyan@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Katarzyna Dec <katarzyna.dec@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

CgoKT24gVGh1LCAyMDE4LTA0LTEyIGF0IDEzOjI2ICswMjAwLCBLYXRhcnp5bmEgRGVjIHdyb3Rl
Ogo+IE9uIFR1ZSwgQXByIDEwLCAyMDE4IGF0IDA3OjM3OjIyUE0gLTA3MDAsIERoaW5ha2FyYW4g
UGFuZGl5YW4gd3JvdGU6Cj4gPiBObyByZWFzb24gZm9yIHRoZSBkZWxheSBiZXR3ZWVuIGRwbXMg
b2ZmIGFuZCBvbi4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogRGhpbmFrYXJhbiBQYW5kaXlhbiA8
ZGhpbmFrYXJhbi5wYW5kaXlhbkBpbnRlbC5jb20+Cj4gPiAtLS0KPiA+ICB0ZXN0cy9rbXNfcHNy
X3NpbmtfY3JjLmMgfCAxIC0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+ID4g
Cj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMva21zX3Bzcl9zaW5rX2NyYy5jIGIvdGVzdHMva21zX3Bz
cl9zaW5rX2NyYy5jCj4gPiBpbmRleCBkOTQwZWM4OS4uMTc0OTA3MjYgMTAwNjQ0Cj4gPiAtLS0g
YS90ZXN0cy9rbXNfcHNyX3NpbmtfY3JjLmMKPiA+ICsrKyBiL3Rlc3RzL2ttc19wc3Jfc2lua19j
cmMuYwo+ID4gQEAgLTQyOCw3ICs0MjgsNiBAQCBzdGF0aWMgdm9pZCBkcG1zX29mZl9vbihkYXRh
X3QgZGF0YSkKPiA+ICB7Cj4gPiAgCWttc3Rlc3Rfc2V0X2Nvbm5lY3Rvcl9kcG1zKGRhdGEuZHJt
X2ZkLCBkYXRhLm91dHB1dC0+Y29uZmlnLmNvbm5lY3RvciwKPiA+ICAJCQkJICAgRFJNX01PREVf
RFBNU19PRkYpOwo+ID4gLQlzbGVlcCgxKTsKPiBXaHkgdGhlcmUgd2FzIGFzIHNsZWVwIGF0IHRo
ZSBmaXJzdCBwbGFjZSBoZXJlPyBQcm9iYWJseSB0aGVyZSB3YXMgc29tZSByZWFzb24uCgpQcm9i
YWJseS4gSXQgaXMgbm90IG9idmlvdXMgdGhvdWdoLiBUaGUgdGVzdCB3b3JrcyBmaW5lIHdpdGhv
dXQgaXQgYW5kCnJlbW92aW5nIGl0IGN1dHMgZG93biB0aGUgcnVubmluZyB0aW1lLCB3aGljaCBt
ZWFucyB3ZSBjYW4gcnVuIG90aGVyCnVzZWZ1bCB0ZXN0cy4KCj4gS2FzaWEKPiA+ICAJa21zdGVz
dF9zZXRfY29ubmVjdG9yX2RwbXMoZGF0YS5kcm1fZmQsIGRhdGEub3V0cHV0LT5jb25maWcuY29u
bmVjdG9yLAo+ID4gIAkJCQkgICBEUk1fTU9ERV9EUE1TX09OKTsKPiA+ICB9Cj4gPiAtLSAKPiA+
IDIuMTQuMQo+ID4gCj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+ID4gaWd0LWRldiBtYWlsaW5nIGxpc3QKPiA+IGlndC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2lndC1kZXYKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IGlndC1kZXYgbWFpbGluZyBsaXN0Cj4gaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1k
ZXYKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1k
ZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
