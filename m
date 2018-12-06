Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A73D6E682
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Dec 2018 22:58:43 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id n32so2475677qte.11
 for <igt-dev@lists.freedesktop.org>; Thu, 06 Dec 2018 14:58:42 -0800 (PST)
Message-ID: <3de29aeb93ffa67621c82e357198f22d1ad646df.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
Date: Thu, 06 Dec 2018 17:58:40 -0500
In-Reply-To: <20181206141132.23349-9-paul.kocialkowski@bootlin.com>
References: <20181206141132.23349-1-paul.kocialkowski@bootlin.com>
 <20181206141132.23349-9-paul.kocialkowski@bootlin.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 8/9] lib/igt_fb: Add a helper to
 retreive the plane bpp for a given format
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
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>, Eben Upton <eben@raspberrypi.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpPbiBUaHUsIDIwMTgt
MTItMDYgYXQgMTU6MTEgKzAxMDAsIFBhdWwgS29jaWFsa293c2tpIHdyb3RlOgo+IFRoZSBmb3Jt
YXQgYnBwIGZvciBhIGdpdmVuIHBsYW5lIGlzIHN0b3JlZCBpbiB0aGUgc3RhdGljIGZvcm1hdF9k
ZXNjCj4gc3RydWN0dXJlIGFuZCBpcyBub3QgYWNjZXNzaWJsZSB0byB0ZXN0cywgd2hpY2ggaXMg
aW5jb252ZW5pZW50IHRvCj4gZ2V0IHRoZSBtaW5pbXVtIHN0cmlkZSBmb3IgYSBmb3JtYXQgd2hl
biB0ZXN0aW5nIHZhcmlvdXMgc3RyaWRlcy4KPiAKPiBBZGQgYSBzaW1wbGUgaGVscGVyIHRvIGV4
cG9zZSB0aGUgaW5mb3JtYXRpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBLb2NpYWxrb3dz
a2kgPHBhdWwua29jaWFsa293c2tpQGJvb3RsaW4uY29tPgo+IC0tLQo+ICBsaWIvaWd0X2ZiLmMg
fCAxNiArKysrKysrKysrKysrKysrCj4gIGxpYi9pZ3RfZmIuaCB8ICAxICsKPiAgMiBmaWxlcyBj
aGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3RfZmIuYyBi
L2xpYi9pZ3RfZmIuYwo+IGluZGV4IDE1NDhiZjRlLi5iMDJmN2YyMiAxMDA2NDQKPiAtLS0gYS9s
aWIvaWd0X2ZiLmMKPiArKysgYi9saWIvaWd0X2ZiLmMKPiBAQCAtMjQxNiwzICsyNDE2LDE5IEBA
IGJvb2wgaWd0X2Zvcm1hdF9pc195dXYodWludDMyX3QgZHJtX2Zvcm1hdCkKPiAgCQlyZXR1cm4g
ZmFsc2U7Cj4gIAl9Cj4gIH0KPiArCj4gKy8qKgo+ICsgKiBpZ3RfZm9ybWF0X3BsYW5lX2JwcDoK
PiArICogQGRybV9mb3JtYXQ6IGRybSBmb3VyY2MKPiArICogQHBsYW5lOiBmb3JtYXQgcGxhbmUg
aW5kZXgKPiArICoKPiArICogVGhpcyBmdW5jdGlvbnMgcmV0dXJucyB0aGUgbnVtYmVyIG9mIGJp
dHMgcGVyIHBpeGVsIGZvciB0aGUgZ2l2ZW4gQHBsYW5lCj4gKyAqIGluZGV4IG9mIHRoZSBAZHJt
X2Zvcm1hdC4KPiArICovCj4gK2ludCBpZ3RfZm9ybWF0X3BsYW5lX2JwcCh1aW50MzJfdCBkcm1f
Zm9ybWF0LCBpbnQgcGxhbmUpCj4gK3sKPiArCWNvbnN0IHN0cnVjdCBmb3JtYXRfZGVzY19zdHJ1
Y3QgKmZvcm1hdCA9Cj4gKwkJbG9va3VwX2RybV9mb3JtYXQoZHJtX2Zvcm1hdCk7Cj4gKwo+ICsJ
cmV0dXJuIGZvcm1hdC0+cGxhbmVfYnBwW3BsYW5lXTsKPiArfQo+IGRpZmYgLS1naXQgYS9saWIv
aWd0X2ZiLmggYi9saWIvaWd0X2ZiLmgKPiBpbmRleCBjYjIxZmRiYy4uYTM5YzRkMmYgMTAwNjQ0
Cj4gLS0tIGEvbGliL2lndF9mYi5oCj4gKysrIGIvbGliL2lndF9mYi5oCj4gQEAgLTE3NSw2ICsx
NzUsNyBAQCB1aW50MzJfdCBpZ3RfZHJtX2Zvcm1hdF90b19icHAodWludDMyX3QgZHJtX2Zvcm1h
dCk7Cj4gIGNvbnN0IGNoYXIgKmlndF9mb3JtYXRfc3RyKHVpbnQzMl90IGRybV9mb3JtYXQpOwo+
ICBib29sIGlndF9mYl9zdXBwb3J0ZWRfZm9ybWF0KHVpbnQzMl90IGRybV9mb3JtYXQpOwo+ICBi
b29sIGlndF9mb3JtYXRfaXNfeXV2KHVpbnQzMl90IGRybV9mb3JtYXQpOwo+ICtpbnQgaWd0X2Zv
cm1hdF9wbGFuZV9icHAodWludDMyX3QgZHJtX2Zvcm1hdCwgaW50IHBsYW5lKTsKPiAgCj4gICNl
bmRpZiAvKiBfX0lHVF9GQl9IX18gKi8KPiAgCi0tIApDaGVlcnMsCglMeXVkZSBQYXVsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxp
bmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
