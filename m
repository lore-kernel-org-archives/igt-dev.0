Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59AFE6E4BE
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jan 2019 00:45:44 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id v11so1257863qtc.2
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jan 2019 16:45:44 -0800 (PST)
Message-ID: <4262e6d9c5784743e0d75483fe300dcc4bbdf269.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
Date: Mon, 14 Jan 2019 19:45:40 -0500
In-Reply-To: <20190111090532.19235-6-paul.kocialkowski@bootlin.com>
References: <20190111090532.19235-1-paul.kocialkowski@bootlin.com>
 <20190111090532.19235-6-paul.kocialkowski@bootlin.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3 05/21] lib/igt_fb: Allow interpreting
 the tile height as a stride equivalent
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
MDEtMTEgYXQgMTA6MDUgKzAxMDAsIFBhdWwgS29jaWFsa293c2tpIHdyb3RlOgo+IFRoZSBWQzQg
U0FORCB0aWxpbmcgbW9kZXMgYXJlIGRpc3Bvc2VkIGluIGNvbHVtbnMgdGhhdCBmb2xsb3cgZWFj
aAo+IG90aGVyIGluIG1lbW9yeS4gVGhlIGNvbHVtbiBoZWlnaHQgZGVmaW5lcyB0aGUgbnVtYmVy
IG9mIGZpeGVkLXdpZHRoCj4gbGluZXMgZnJvbSB0aGUgYmVnaW5uaW5nIG9mIG9uZSBjb2x1bW4g
dG8gdGhlIG90aGVyLCB3aGljaCBtYXkgYmUKPiBncmVhdGVyIHRoYW4gdGhlIGRpc3BsYXkgaGVp
Z2h0LiBJbiB0aGlzIGNhc2UsIHRoZSBleHRyYSBsaW5lcyBhcmUKPiB1c2VkIGFzIHBhZGRpbmcg
YW5kIHRoZSBjb2x1bW4gaGVpZ2h0IGJlY29tZXMgYSBoZWlnaHQtYmFzZWQgc3RyaWRlCj4gZXF1
aXZhbGVudC4KPiAKPiBTdXBwb3J0IHRoaXMgd2hlbiBjYWxjdWxhdGluZyB0aGUgcGxhbmUgc2l6
ZSBieSB1c2luZyB0aGUgdGlsZSBoZWlnaHQKPiBkaXJlY3RseSBpZiBpdCBpcyBncmVhdGVyIHRo
YW4gdGhlIHBsYW5lIGhlaWdodC4gVGhpcyB3b3JrcyBiZXR0ZXIgdGhhbgo+IGFsaWdubWVudCBm
b3Igbm9uLXBvd2VyLW9mLXR3byBjYXNlcyAobm8gc3BhY2UgaXMgd2FzdGVkKSBhbmQgaXQgaXMK
PiBlcXVpdmFsZW50IHRvIGFsaWdubWVudCBmb3IgcG93ZXItb2YtdHdvIHRpbGUgaGVpZ2h0cy4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIEtvY2lhbGtvd3NraSA8cGF1bC5rb2NpYWxrb3dza2lA
Ym9vdGxpbi5jb20+Cj4gLS0tCj4gIGxpYi9pZ3RfZmIuYyB8IDcgKysrKysrKwo+ICAxIGZpbGUg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3RfZmIuYyBi
L2xpYi9pZ3RfZmIuYwo+IGluZGV4IDdmYjhlN2Q0NGJkMi4uMDNhNmI4YmU5NjE4IDEwMDY0NAo+
IC0tLSBhL2xpYi9pZ3RfZmIuYwo+ICsrKyBiL2xpYi9pZ3RfZmIuYwo+IEBAIC00NTAsNiArNDUw
LDEzIEBAIHN0YXRpYyB1aW50NjRfdCBjYWxjX3BsYW5lX3NpemUoc3RydWN0IGlndF9mYiAqZmIs
IGludAo+IHBsYW5lKQo+ICAJCWlndF9nZXRfZmJfdGlsZV9zaXplKGZiLT5mZCwgZmItPnRpbGlu
ZywgZmItPnBsYW5lX2JwcFtwbGFuZV0sCj4gIAkJCQkgICAgICZ0aWxlX3dpZHRoLCAmdGlsZV9o
ZWlnaHQpOwo+ICAKPiArCQkvKiBTcGVjaWFsIGNhc2Ugd2hlcmUgdGhlICJ0aWxlIGhlaWdodCIg
cmVwcmVzZW50cyBhCj4gKwkJICogaGVpZ2h0LWJhc2VkIHN0cmlkZSwgc3VjaCBhcyB3aXRoIFZD
NCBTQU5EIHRpbGluZyBtb2Rlcy4KPiArCQkgKi8KPiArCj4gKwkJaWYgKHRpbGVfaGVpZ2h0ID4g
ZmItPnBsYW5lX2hlaWdodFtwbGFuZV0pCj4gKwkJCXJldHVybiBmYi0+c3RyaWRlc1twbGFuZV0g
KiB0aWxlX2hlaWdodDsKPiArCj4gIAkJcmV0dXJuICh1aW50NjRfdCkgZmItPnN0cmlkZXNbcGxh
bmVdICoKPiAgCQkJQUxJR04oZmItPnBsYW5lX2hlaWdodFtwbGFuZV0sIHRpbGVfaGVpZ2h0KTsK
PiAgCX0KLS0gCkNoZWVycywKCUx5dWRlIFBhdWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaWd0LWRldgo=
