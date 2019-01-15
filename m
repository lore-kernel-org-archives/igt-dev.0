Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A61BB6E042
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jan 2019 21:49:37 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id l12so4799565qtf.8
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jan 2019 13:49:37 -0800 (PST)
Message-ID: <9a26f36842be8d5b02e82a8f8602fa2707acfbac.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
Date: Tue, 15 Jan 2019 16:49:34 -0500
In-Reply-To: <20190111090532.19235-11-paul.kocialkowski@bootlin.com>
References: <20190111090532.19235-1-paul.kocialkowski@bootlin.com>
 <20190111090532.19235-11-paul.kocialkowski@bootlin.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3 10/21] lib/igt_vc4: Add helper for
 checking T-tiling support on plane
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

UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpPbiBGcmksIDIwMTkt
MDEtMTEgYXQgMTA6MDUgKzAxMDAsIFBhdWwgS29jaWFsa293c2tpIHdyb3RlOgo+IFRoaXMgaW50
cm9kdWNlcyBhIGNvbnZlbmllbmNlIGhlbHBlciBmb3IgY2hlY2tpbmcgd2hldGhlciBhIHBsYW5l
Cj4gc3VwcG9ydHMgVC10aWxpbmcgZm9yIGEgZ2l2ZW4gZm9ybWF0Lgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFBhdWwgS29jaWFsa293c2tpIDxwYXVsLmtvY2lhbGtvd3NraUBib290bGluLmNvbT4KPiAt
LS0KPiAgbGliL2lndF92YzQuaCB8IDkgKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGlu
c2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvbGliL2lndF92YzQuaCBiL2xpYi9pZ3RfdmM0
LmgKPiBpbmRleCBkNWM1MjliYmNjZGEuLmVlN2FmNzM3YWRlOSAxMDA2NDQKPiAtLS0gYS9saWIv
aWd0X3ZjNC5oCj4gKysrIGIvbGliL2lndF92YzQuaAo+IEBAIC0yNCw2ICsyNCwxNSBAQAo+ICAj
aWZuZGVmIElHVF9WQzRfSAo+ICAjZGVmaW5lIElHVF9WQzRfSAo+ICAKPiArI2luY2x1ZGUgImln
dF9rbXMuaCIKPiArCj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBpZ3RfdmM0X3BsYW5lX3N1cHBvcnRz
X3RfdGlsaW5nKGlndF9wbGFuZV90ICpwbGFuZSwKPiArCQkJCQkJICAgdWludDMyX3QgZm9ybWF0
KQo+ICt7Cj4gKwlyZXR1cm4gaWd0X3BsYW5lX2hhc19mb3JtYXRfbW9kKHBsYW5lLCBmb3JtYXQs
Cj4gKwkJCQkJRFJNX0ZPUk1BVF9NT0RfQlJPQURDT01fVkM0X1RfVElMRUQpOwo+ICt9Cj4gKwo+
ICB1aW50MzJfdCBpZ3RfdmM0X2dldF9jbGVhcmVkX2JvKGludCBmZCwgc2l6ZV90IHNpemUsIHVp
bnQzMl90IGNsZWFydmFsKTsKPiAgaW50IGlndF92YzRfY3JlYXRlX2JvKGludCBmZCwgc2l6ZV90
IHNpemUpOwo+ICB2b2lkICppZ3RfdmM0X21tYXBfYm8oaW50IGZkLCB1aW50MzJfdCBoYW5kbGUs
IHVpbnQzMl90IHNpemUsIHVuc2lnbmVkCj4gcHJvdCk7Ci0tIApDaGVlcnMsCglMeXVkZSBQYXVs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2
IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
