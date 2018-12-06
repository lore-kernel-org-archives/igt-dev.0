Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 272B96E682
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Dec 2018 22:55:15 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id r14so2528631qtp.1
 for <igt-dev@lists.freedesktop.org>; Thu, 06 Dec 2018 14:55:15 -0800 (PST)
Message-ID: <8b22680b18a14dd69b889b4571889d0ec13238b5.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
Date: Thu, 06 Dec 2018 17:55:13 -0500
In-Reply-To: <20181206141132.23349-4-paul.kocialkowski@bootlin.com>
References: <20181206141132.23349-1-paul.kocialkowski@bootlin.com>
 <20181206141132.23349-4-paul.kocialkowski@bootlin.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 3/9] lib: drmtest: Add helpers to check
 and require the VC4 driver
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
MTItMDYgYXQgMTU6MTEgKzAxMDAsIFBhdWwgS29jaWFsa293c2tpIHdyb3RlOgo+IEluIG9yZGVy
IHRvIGFkZCBzdXBwb3J0IGZvciBmZWF0dXJlcyBzcGVjaWZpYyB0byB0aGUgVkM0IGRyaXZlciwg
YWRkCj4gaGVscGVycyBmb3IgY2hlY2tpbmcgYW5kIHJlcXVpcmluZyB0aGUgZHJpdmVyIGxpa2Ug
aXQncyBkb25lIGZvciB0aGUKPiBpOTE1IGRyaXZlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVs
IEtvY2lhbGtvd3NraSA8cGF1bC5rb2NpYWxrb3dza2lAYm9vdGxpbi5jb20+Cj4gLS0tCj4gIGxp
Yi9kcm10ZXN0LmMgfCAxMCArKysrKysrKysrCj4gIGxpYi9kcm10ZXN0LmggfCAgMiArKwo+ICAy
IGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvbGliL2Ry
bXRlc3QuYyBiL2xpYi9kcm10ZXN0LmMKPiBpbmRleCBkMmFhMWMxOS4uNTNlYTc1OTggMTAwNjQ0
Cj4gLS0tIGEvbGliL2RybXRlc3QuYwo+ICsrKyBiL2xpYi9kcm10ZXN0LmMKPiBAQCAtMTA1LDYg
KzEwNSwxMSBAQCBib29sIGlzX2k5MTVfZGV2aWNlKGludCBmZCkKPiAgCXJldHVybiBfX2lzX2Rl
dmljZShmZCwgImk5MTUiKTsKPiAgfQo+ICAKPiArYm9vbCBpc192YzRfZGV2aWNlKGludCBmZCkK
PiArewo+ICsJcmV0dXJuIF9faXNfZGV2aWNlKGZkLCAidmM0Iik7Cj4gK30KPiArCj4gIHN0YXRp
YyBib29sIGhhc19rbm93bl9pbnRlbF9jaGlwc2V0KGludCBmZCkKPiAgewo+ICAJc3RydWN0IGRy
bV9pOTE1X2dldHBhcmFtIGdwOwo+IEBAIC00NDQsMyArNDQ5LDggQEAgdm9pZCBpZ3RfcmVxdWly
ZV9pbnRlbChpbnQgZmQpCj4gIHsKPiAgCWlndF9yZXF1aXJlKGlzX2k5MTVfZGV2aWNlKGZkKSAm
JiBoYXNfa25vd25faW50ZWxfY2hpcHNldChmZCkpOwo+ICB9Cj4gKwo+ICt2b2lkIGlndF9yZXF1
aXJlX3ZjNChpbnQgZmQpCj4gK3sKPiArCWlndF9yZXF1aXJlKGlzX3ZjNF9kZXZpY2UoZmQpKTsK
PiArfQo+IGRpZmYgLS1naXQgYS9saWIvZHJtdGVzdC5oIGIvbGliL2RybXRlc3QuaAo+IGluZGV4
IDk2ZWU1MTdlLi4xZDExYmZmOSAxMDA2NDQKPiAtLS0gYS9saWIvZHJtdGVzdC5oCj4gKysrIGIv
bGliL2RybXRlc3QuaAo+IEBAIC03OCw4ICs3OCwxMCBAQCBpbnQgX19kcm1fb3Blbl9kcml2ZXIo
aW50IGNoaXBzZXQpOwo+ICB2b2lkIGdlbV9xdWllc2NlbnRfZ3B1KGludCBmZCk7Cj4gIAo+ICB2
b2lkIGlndF9yZXF1aXJlX2ludGVsKGludCBmZCk7Cj4gK3ZvaWQgaWd0X3JlcXVpcmVfdmM0KGlu
dCBmZCk7Cj4gIAo+ICBib29sIGlzX2k5MTVfZGV2aWNlKGludCBmZCk7Cj4gK2Jvb2wgaXNfdmM0
X2RldmljZShpbnQgZmQpOwo+ICAKPiAgLyoqCj4gICAqIGRvX29yX2RpZToKLS0gCkNoZWVycywK
CUx5dWRlIFBhdWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
