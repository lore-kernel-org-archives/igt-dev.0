Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C026EE59
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Feb 2019 18:02:57 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id a48so4941511qtb.4
 for <igt-dev@lists.freedesktop.org>; Fri, 08 Feb 2019 10:02:57 -0800 (PST)
Message-ID: <dee432297a1781e8fc309755d237a0154b9055a9.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
Date: Fri, 08 Feb 2019 13:02:53 -0500
In-Reply-To: <20190208131901.1400-4-maxime.ripard@bootlin.com>
References: <20190208131901.1400-1-maxime.ripard@bootlin.com>
 <20190208131901.1400-4-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v6 03/10] igt: fb: Account for all
 planes bpp
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

UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpPbiBGcmksIDIwMTkt
MDItMDggYXQgMTQ6MTggKzAxMDAsIE1heGltZSBSaXBhcmQgd3JvdGU6Cj4gV2hlbiBhbGxvY2F0
aW5nIGEgZHVtYiBidWZmZXIgZm9yIGEgZm9ybWF0IHdpdGggbXVsdGlwbGUgcGxhbmUsIHdlIG5l
ZWQgdG8KPiBhY2NvdW50IGZvciBhbGwgcGxhbmUncyBicHAgaW4gb3JkZXIgdG8gYWxsb2NhdGUg
dGhlIHByb3BlciBzaXplLgo+IAo+IExldCdzIGFkZCBhbGwgdGhlIHBsYW5lcyBicHAgYW5kIHVz
ZSB0aGUgcmVzdWx0IHRvIGFsbG9jYXRlIG91ciBidWZmZXIuCj4gCj4gUmV2aWV3ZWQtYnk6IFBh
dWwgS29jaWFsa293c2tpIDxwYXVsLmtvY2lhbGtvd3NraUBib290bGluLmNvbT4KPiBTaWduZWQt
b2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgo+IC0tLQo+
ICBsaWIvaWd0X2ZiLmMgfCA5ICsrKysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9saWIvaWd0X2ZiLmMgYi9s
aWIvaWd0X2ZiLmMKPiBpbmRleCBjYTQ4NjU1MTljMTMuLmNhMTljMDM0ZjRhMyAxMDA2NDQKPiAt
LS0gYS9saWIvaWd0X2ZiLmMKPiArKysgYi9saWIvaWd0X2ZiLmMKPiBAQCAtNTI4LDYgKzUyOCw5
IEBAIHN0YXRpYyB2b2lkIGNsZWFyX3l1dl9idWZmZXIoc3RydWN0IGlndF9mYiAqZmIpCj4gIC8q
IGhlbHBlcnMgdG8gY3JlYXRlIG5pY2UtbG9va2luZyBmcmFtZWJ1ZmZlcnMgKi8KPiAgc3RhdGlj
IGludCBjcmVhdGVfYm9fZm9yX2ZiKHN0cnVjdCBpZ3RfZmIgKmZiKQo+ICB7Cj4gKwljb25zdCBz
dHJ1Y3QgZm9ybWF0X2Rlc2Nfc3RydWN0ICpmbXQgPSBsb29rdXBfZHJtX2Zvcm1hdChmYi0KPiA+
ZHJtX2Zvcm1hdCk7Cj4gKwl1bnNpZ25lZCBpbnQgYnBwID0gMDsKPiArCXVuc2lnbmVkIGludCBw
bGFuZTsKPiAgCWludCBmZCA9IGZiLT5mZDsKPiAgCj4gIAlpZiAoZmItPnRpbGluZyB8fCBmYi0+
c2l6ZSB8fCBmYi0+c3RyaWRlc1swXSB8fCBpZ3RfZm9ybWF0X2lzX3l1dihmYi0KPiA+ZHJtX2Zv
cm1hdCkpIHsKPiBAQCAtNTcwLDExICs1NzMsMTMgQEAgc3RhdGljIGludCBjcmVhdGVfYm9fZm9y
X2ZiKHN0cnVjdCBpZ3RfZmIgKmZiKQo+ICAJaWd0X2Fzc2VydChmYi0+c3RyaWRlc1swXSA9PSAw
KTsKPiAgCj4gIAlmYi0+c2l6ZSA9IGNhbGNfZmJfc2l6ZShmYik7Cj4gKwlmb3IgKHBsYW5lID0g
MDsgcGxhbmUgPCBmYi0+bnVtX3BsYW5lczsgcGxhbmUrKykKPiArCQlicHAgKz0gRElWX1JPVU5E
X1VQKGZiLT5wbGFuZV9icHBbcGxhbmVdLAo+ICsJCQkJICAgIHBsYW5lID8gZm10LT5oc3ViICog
Zm10LT52c3ViIDogMSk7Cj4gIAo+ICAJZmItPmlzX2R1bWIgPSB0cnVlOwo+ICAJZmItPmdlbV9o
YW5kbGUgPSBrbXN0ZXN0X2R1bWJfY3JlYXRlKGZkLCBmYi0+d2lkdGgsIGZiLT5oZWlnaHQsCj4g
LQkJCQkJICAgICBmYi0+cGxhbmVfYnBwWzBdLAo+IC0JCQkJCSAgICAgJmZiLT5zdHJpZGVzWzBd
LCAmZmItPnNpemUpOwo+ICsJCQkJCSAgICAgYnBwLCAmZmItPnN0cmlkZXNbMF0sICZmYi0+c2l6
ZSk7Cj4gIAo+ICAJcmV0dXJuIGZiLT5nZW1faGFuZGxlOwo+ICB9Ci0tIApDaGVlcnMsCglMeXVk
ZSBQYXVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
