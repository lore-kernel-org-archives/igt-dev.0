Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0368E6E947
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Jan 2019 19:46:58 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id l11so23711978qtp.0
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Jan 2019 11:46:57 -0800 (PST)
Message-ID: <9f029deab28e9f40502c4c0f8406d5d3ac5141e2.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
Date: Tue, 29 Jan 2019 14:46:55 -0500
In-Reply-To: <20190125145842.15738-6-maxime.ripard@bootlin.com>
References: <20190125145842.15738-1-maxime.ripard@bootlin.com>
 <20190125145842.15738-6-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v5 05/13] igt: fb: Refactor dumb buffer
 allocation path
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
Cc: Petri Latvala <petri.latvala@intel.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, eben@raspberrypi.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCAyMDE5LTAxLTI1IGF0IDE1OjU4ICswMTAwLCBNYXhpbWUgUmlwYXJkIHdyb3RlOgo+
IFRoZSBlbHNlIGNvbmRpdGlvbiBpcyBub3QgbmVlZGVkLCBzaW5jZSBhbGwgdGhlIG90aGVyIGNv
bmRpdGlvbnMgcmV0dXJuCj4gd2hlbiB0aGV5IGFyZSBkb25lLgo+IAo+IE1vdmUgdGhlIEtNUyBk
dW1iIGJ1ZmZlciBhbGxvY2F0aW9uIG91dHNpZGUgb2YgdGhlIG91dGVyIGVsc2UgY29uZGl0aW9u
LAo+IHRoaXMgd2lsbCBhbHNvIGFsbG93IHRvIGVhc2UgbGF0ZXIgY2hhbmdlcy4KPiAKPiBSZXZp
ZXdlZC1ieTogUGF1bCBLb2NpYWxrb3dza2kgPHBhdWwua29jaWFsa293c2tpQGJvb3RsaW4uY29t
Pgo+IFNpZ25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5j
b20+Cj4gLS0tCj4gIGxpYi9pZ3RfZmIuYyB8IDI1ICsrKysrKysrKysrKysrKysrLS0tLS0tLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2xpYi9pZ3RfZmIuYyBiL2xpYi9pZ3RfZmIuYwo+IGluZGV4IGQ2OWMzZmIy
ZDM4ZC4uMjcwZGI4ZDZkYzkwIDEwMDY0NAo+IC0tLSBhL2xpYi9pZ3RfZmIuYwo+ICsrKyBiL2xp
Yi9pZ3RfZmIuYwo+IEBAIC01NTcsMTUgKzU1NywyNCBAQCBzdGF0aWMgaW50IGNyZWF0ZV9ib19m
b3JfZmIoc3RydWN0IGlndF9mYiAqZmIpCj4gIAkJCWlndF9yZXF1aXJlKGRyaXZlcl9oYXNfZ2Vt
X2FwaSk7Cj4gIAkJCXJldHVybiAtRUlOVkFMOwo+ICAJCX0KPiAtCX0gZWxzZSB7Cj4gLQkJZmIt
PmlzX2R1bWIgPSB0cnVlOwo+IC0KPiAtCQlmYi0+Z2VtX2hhbmRsZSA9IGttc3Rlc3RfZHVtYl9j
cmVhdGUoZmQsIGZiLT53aWR0aCwgZmItCj4gPmhlaWdodCwKPiAtCQkJCQkJICAgICBmYi0+cGxh
bmVfYnBwWzBdLAo+IC0JCQkJCQkgICAgICZmYi0+c3RyaWRlc1swXSwgJmZiLQo+ID5zaXplKTsK
PiAtCj4gLQkJcmV0dXJuIGZiLT5nZW1faGFuZGxlOwo+ICAJfQo+ICsKPiArCS8qCj4gKwkgKiBU
aGUgY3VycmVudCBkdW1iIGJ1ZmZlciBhbGxvY2F0aW9uIEFQSSBkb2Vzbid0IHJlYWxseSBhbGxv
dyB0bwo+ICsJICogc3BlY2lmeSBhIGN1c3RvbSBzaXplIG9yIHN0cmlkZS4gWWV0IHRoZSBjYWxs
ZXIgaXMgZnJlZSB0byBzcGVjaWZ5Cj4gKwkgKiB0aGVtLCBzbyB3ZSBuZWVkIHRvIG1ha2Ugc3Vy
ZSB0byBlcnJvciBvdXQgaW4gdGhpcyBjYXNlLgo+ICsJICovCj4gKwlpZ3RfYXNzZXJ0KGZiLT5z
aXplID09IDApOwo+ICsJaWd0X2Fzc2VydChmYi0+c3RyaWRlc1swXSA9PSAwKTsKPiArCj4gKwlm
Yi0+c2l6ZSA9IGNhbGNfZmJfc2l6ZShmYik7CgpeIElzIHRoaXMgc3VwcG9zZWQgdG8gYmUgcGFy
dCBvZiBhIHNlcGVyYXRlIHBhdGNoPwoKPiArCj4gKwlmYi0+aXNfZHVtYiA9IHRydWU7Cj4gKwlm
Yi0+Z2VtX2hhbmRsZSA9IGttc3Rlc3RfZHVtYl9jcmVhdGUoZmQsIGZiLT53aWR0aCwgZmItPmhl
aWdodCwKPiArCQkJCQkgICAgIGZiLT5wbGFuZV9icHBbMF0sCj4gKwkJCQkJICAgICAmZmItPnN0
cmlkZXNbMF0sICZmYi0+c2l6ZSk7Cj4gKwo+ICsJcmV0dXJuIGZiLT5nZW1faGFuZGxlOwo+ICB9
Cj4gIAo+ICAvKioKLS0gCkNoZWVycywKCUx5dWRlIFBhdWwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaWd0LWRldgo=
