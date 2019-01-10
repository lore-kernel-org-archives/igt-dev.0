Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 766126F244
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jan 2019 10:10:46 +0000 (UTC)
Message-ID: <3ed6f6c0822bd313cbe61e1ecce1a8425d34e627.camel@bootlin.com>
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date: Thu, 10 Jan 2019 11:10:35 +0100
In-Reply-To: <20190108152001.5367-5-maxime.ripard@bootlin.com>
References: <cover.58d25323616120b55c27ab28cdac25877a37bd78.1546960696.git-series.maxime.ripard@bootlin.com>
 <20190108152001.5367-5-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 05/13] igt: fb: Move size computation
 to the common path
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
To: Maxime Ripard <maxime.ripard@bootlin.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>, eben@raspberrypi.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCAyMDE5LTAxLTA4IGF0IDE2OjE5ICswMTAwLCBNYXhpbWUgUmlwYXJkIHdyb3RlOgo+
IEluIG9yZGVyIHRvIHByb3Blcmx5IHN1cHBvcnQgdGhlIFlVViBidWZmZXIgb24gbm9uLWk5MTUg
cGxhdGZvcm1zLCB3ZSBuZWVkCj4gdG8gcnVuIGNhbGNfZmJfc2l6ZSBmb3IgdGhlIGR1bWIgYnVm
ZmVycyBhbGxvY2F0aW9uIHBhdGggdG9vLiBNb3ZlIGl0IG91dAo+IG9mIHRoZSBzcGVjaWFsIGNh
c2UgYW5kIGluIHRoZSBjb21tb24gY29kZSBwYXRoLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1heGlt
ZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+CgpSZXZpZXdlZC1ieTogUGF1bCBL
b2NpYWxrb3dza2kgPHBhdWwua29jaWFsa293c2tpQGJvb3RsaW4uY29tPgoKPiAtLS0KPiAgbGli
L2lndF9mYi5jIHwgMTIgKysrKystLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlv
bnMoKyksIDcgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3RfZmIuYyBiL2xp
Yi9pZ3RfZmIuYwo+IGluZGV4IGQ2OWMzZmIyZDM4ZC4uMzFlNDRkNjE4OGQ5IDEwMDY0NAo+IC0t
LSBhL2xpYi9pZ3RfZmIuYwo+ICsrKyBiL2xpYi9pZ3RfZmIuYwo+IEBAIC01MjgsMTYgKzUyOCwx
NCBAQCBzdGF0aWMgdm9pZCBjbGVhcl95dXZfYnVmZmVyKHN0cnVjdCBpZ3RfZmIgKmZiKQo+ICAv
KiBoZWxwZXJzIHRvIGNyZWF0ZSBuaWNlLWxvb2tpbmcgZnJhbWVidWZmZXJzICovCj4gIHN0YXRp
YyBpbnQgY3JlYXRlX2JvX2Zvcl9mYihzdHJ1Y3QgaWd0X2ZiICpmYikKPiAgewo+ICsJdWludDY0
X3Qgc2l6ZSA9IGNhbGNfZmJfc2l6ZShmYik7Cj4gIAlpbnQgZmQgPSBmYi0+ZmQ7Cj4gIAo+ICsJ
LyogcmVzcGVjdCB0aGUgc2l6ZSByZXF1ZXN0ZWQgYnkgdGhlIGNhbGxlciAqLwo+ICsJaWYgKGZi
LT5zaXplID09IDApCj4gKwkJZmItPnNpemUgPSBzaXplOwo+ICsKPiAgCWlmIChmYi0+dGlsaW5n
IHx8IGZiLT5zaXplIHx8IGZiLT5zdHJpZGVzWzBdIHx8IGlndF9mb3JtYXRfaXNfeXV2KGZiLT5k
cm1fZm9ybWF0KSkgewo+IC0JCXVpbnQ2NF90IHNpemU7Cj4gLQo+IC0JCXNpemUgPSBjYWxjX2Zi
X3NpemUoZmIpOwo+IC0KPiAtCQkvKiByZXNwZWN0IHRoZSBzaXplIHJlcXVlc3RlZCBieSB0aGUg
Y2FsbGVyICovCj4gLQkJaWYgKGZiLT5zaXplID09IDApCj4gLQkJCWZiLT5zaXplID0gc2l6ZTsK
PiAgCj4gIAkJZmItPmlzX2R1bWIgPSBmYWxzZTsKPiAgCi0tIApQYXVsIEtvY2lhbGtvd3NraSwg
Qm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQga2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9v
dGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
