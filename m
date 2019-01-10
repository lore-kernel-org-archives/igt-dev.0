Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2B7C56F244
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jan 2019 10:11:19 +0000 (UTC)
Message-ID: <2e7910f007e53df3e5abd6d1de0c9d3c2e21357e.camel@bootlin.com>
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date: Thu, 10 Jan 2019 11:11:08 +0100
In-Reply-To: <20190108152001.5367-6-maxime.ripard@bootlin.com>
References: <cover.58d25323616120b55c27ab28cdac25877a37bd78.1546960696.git-series.maxime.ripard@bootlin.com>
 <20190108152001.5367-6-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 06/13] igt: fb: Refactor dumb buffer
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
Cc: Petri Latvala <petri.latvala@intel.com>, eben@raspberrypi.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCAyMDE5LTAxLTA4IGF0IDE2OjE5ICswMTAwLCBNYXhpbWUgUmlwYXJkIHdyb3RlOgo+
IFRoZSBlbHNlIGNvbmRpdGlvbiBpcyBub3QgbmVlZGVkLCBzaW5jZSBhbGwgdGhlIG90aGVyIGNv
bmRpdGlvbnMgcmV0dXJuCj4gd2hlbiB0aGV5IGFyZSBkb25lLgo+IAo+IE1vdmUgdGhlIEtNUyBk
dW1iIGJ1ZmZlciBhbGxvY2F0aW9uIG91dHNpZGUgb2YgdGhlIG91dGVyIGVsc2UgY29uZGl0aW9u
LAo+IHRoaXMgd2lsbCBhbHNvIGFsbG93IHRvIGVhc2UgbGF0ZXIgY2hhbmdlcy4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgoKUmV2
aWV3ZWQtYnk6IFBhdWwgS29jaWFsa293c2tpIDxwYXVsLmtvY2lhbGtvd3NraUBib290bGluLmNv
bT4KCj4gLS0tCj4gIGxpYi9pZ3RfZmIuYyB8IDE1ICsrKysrKystLS0tLS0tLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9saWIvaWd0X2ZiLmMgYi9saWIvaWd0X2ZiLmMKPiBpbmRleCAzMWU0NGQ2MTg4ZDkuLjJjMzNh
ODk5YmMwNCAxMDA2NDQKPiAtLS0gYS9saWIvaWd0X2ZiLmMKPiArKysgYi9saWIvaWd0X2ZiLmMK
PiBAQCAtNTU1LDE1ICs1NTUsMTQgQEAgc3RhdGljIGludCBjcmVhdGVfYm9fZm9yX2ZiKHN0cnVj
dCBpZ3RfZmIgKmZiKQo+ICAJCQlpZ3RfcmVxdWlyZShkcml2ZXJfaGFzX2dlbV9hcGkpOwo+ICAJ
CQlyZXR1cm4gLUVJTlZBTDsKPiAgCQl9Cj4gLQl9IGVsc2Ugewo+IC0JCWZiLT5pc19kdW1iID0g
dHJ1ZTsKPiAtCj4gLQkJZmItPmdlbV9oYW5kbGUgPSBrbXN0ZXN0X2R1bWJfY3JlYXRlKGZkLCBm
Yi0+d2lkdGgsIGZiLT5oZWlnaHQsCj4gLQkJCQkJCSAgICAgZmItPnBsYW5lX2JwcFswXSwKPiAt
CQkJCQkJICAgICAmZmItPnN0cmlkZXNbMF0sICZmYi0+c2l6ZSk7Cj4gLQo+IC0JCXJldHVybiBm
Yi0+Z2VtX2hhbmRsZTsKPiAgCX0KPiArCj4gKwlmYi0+aXNfZHVtYiA9IHRydWU7Cj4gKwlmYi0+
Z2VtX2hhbmRsZSA9IGttc3Rlc3RfZHVtYl9jcmVhdGUoZmQsIGZiLT53aWR0aCwgZmItPmhlaWdo
dCwKPiArCQkJCQkgICAgIGZiLT5wbGFuZV9icHBbMF0sCj4gKwkJCQkJICAgICAmZmItPnN0cmlk
ZXNbMF0sICZmYi0+c2l6ZSk7Cj4gKwo+ICsJcmV0dXJuIGZiLT5nZW1faGFuZGxlOwo+ICB9Cj4g
IAo+ICAvKioKLS0gClBhdWwgS29jaWFsa293c2tpLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFu
ZCBrZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
