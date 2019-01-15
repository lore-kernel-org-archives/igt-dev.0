Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0A906E0B9
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jan 2019 22:01:13 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id i7so4817429qtj.10
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jan 2019 14:01:13 -0800 (PST)
Message-ID: <5c17eb0157b6326f1871dff3d0c4ef19770a9601.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
Date: Tue, 15 Jan 2019 17:01:11 -0500
In-Reply-To: <20190111090532.19235-16-paul.kocialkowski@bootlin.com>
References: <20190111090532.19235-1-paul.kocialkowski@bootlin.com>
 <20190111090532.19235-16-paul.kocialkowski@bootlin.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3 15/21] lib/igt_chamelium: Fixup
 resources liberation in comparison helpers
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

TmljZSBjYXRjaCBoZXJlIQoKUmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5j
b20+CgpPbiBGcmksIDIwMTktMDEtMTEgYXQgMTA6MDUgKzAxMDAsIFBhdWwgS29jaWFsa293c2tp
IHdyb3RlOgo+IFRoaXMgZml4ZXMgYSBidW5jaCBvZiBvY2N1cnJlbmNlcyBvZiBtZW1vcnkgbm90
IGJlaW5nIHByb3Blcmx5Cj4gbGliZXJhdGVkIGFmdGVyIGl0cyB1c2UgaW4gaGVscGVycyByZXZv
bHZpbmcgYXJvdW5kIGZyYW1lL0NSQwo+IGNvbXBhcmlzb24uCj4gCj4gU2lnbmVkLW9mZi1ieTog
UGF1bCBLb2NpYWxrb3dza2kgPHBhdWwua29jaWFsa293c2tpQGJvb3RsaW4uY29tPgo+IC0tLQo+
ICBsaWIvaWd0X2NoYW1lbGl1bS5jIHwgMTMgKysrKysrKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgOSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9saWIv
aWd0X2NoYW1lbGl1bS5jIGIvbGliL2lndF9jaGFtZWxpdW0uYwo+IGluZGV4IDMyYjg1OWVhYzRh
Ny4uMGI2YWMzN2EzZDg5IDEwMDY0NAo+IC0tLSBhL2xpYi9pZ3RfY2hhbWVsaXVtLmMKPiArKysg
Yi9saWIvaWd0X2NoYW1lbGl1bS5jCj4gQEAgLTEwNjAsOSArMTA2MCw5IEBAIHZvaWQgY2hhbWVs
aXVtX2Fzc2VydF9jcmNfZXFfb3JfZHVtcChzdHJ1Y3QgY2hhbWVsaXVtCj4gKmNoYW1lbGl1bSwK
PiAgCQlmcmVlKHJlZmVyZW5jZV9zdWZmaXgpOwo+ICAJCWZyZWUoY2FwdHVyZV9zdWZmaXgpOwo+
ICAKPiAtCQljaGFtZWxpdW1fZGVzdHJveV9mcmFtZV9kdW1wKGZyYW1lKTsKPiAtCj4gKwkJY2Fp
cm9fc3VyZmFjZV9kZXN0cm95KHJlZmVyZW5jZSk7Cj4gIAkJY2Fpcm9fc3VyZmFjZV9kZXN0cm95
KGNhcHR1cmUpOwo+ICsJCWNoYW1lbGl1bV9kZXN0cm95X2ZyYW1lX2R1bXAoZnJhbWUpOwo+ICAJ
fQo+ICAKPiAgCWlndF9hc3NlcnQoZXEpOwo+IEBAIC0xMTIwLDExICsxMTIwLDE0IEBAIHZvaWQK
PiBjaGFtZWxpdW1fYXNzZXJ0X2FuYWxvZ19mcmFtZV9tYXRjaF9vcl9kdW1wKHN0cnVjdCBjaGFt
ZWxpdW0gKmNoYW1lbGl1bSwKPiAgCj4gIAkJZnJlZShyZWZlcmVuY2Vfc3VmZml4KTsKPiAgCQlm
cmVlKGNhcHR1cmVfc3VmZml4KTsKPiArCQlmcmVlKHJlZmVyZW5jZV9jcmMpOwo+ICsJCWZyZWUo
Y2FwdHVyZV9jcmMpOwo+ICAJfQo+ICAKPiAtCWNhaXJvX3N1cmZhY2VfZGVzdHJveShjYXB0dXJl
KTsKPiAtCj4gIAlpZ3RfYXNzZXJ0KG1hdGNoKTsKPiArCj4gKwljYWlyb19zdXJmYWNlX2Rlc3Ry
b3kocmVmZXJlbmNlKTsKPiArCWNhaXJvX3N1cmZhY2VfZGVzdHJveShjYXB0dXJlKTsKPiAgfQo+
ICAKPiAgCj4gQEAgLTEzMjMsNiArMTMyNiw4IEBAIGlndF9jcmNfdCAqY2hhbWVsaXVtX2NhbGN1
bGF0ZV9mYl9jcmMoaW50IGZkLCBzdHJ1Y3QKPiBpZ3RfZmIgKmZiKQo+ICAKPiAgCWNoYW1lbGl1
bV9kb19jYWxjdWxhdGVfZmJfY3JjKGZiX3N1cmZhY2UsIHJldCk7Cj4gIAo+ICsJY2Fpcm9fc3Vy
ZmFjZV9kZXN0cm95KGZiX3N1cmZhY2UpOwo+ICsKPiAgCXJldHVybiByZXQ7Cj4gIH0KPiAgCi0t
IApDaGVlcnMsCglMeXVkZSBQYXVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ln
dC1kZXYK
