Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F3A26E44B
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Mar 2021 16:25:27 +0000 (UTC)
Received: by mail-qv1-f70.google.com with SMTP id l16so5869670qvt.19
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Mar 2021 09:25:24 -0700 (PDT)
Message-ID: <06018ecd06bd1699079e02ac84f79c115ff7fd81.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
Date: Mon, 29 Mar 2021 12:25:22 -0400
In-Reply-To: <20210329140714.3921-1-petri.latvala@intel.com>
References: <20210329140714.3921-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Don't use libdrm_nouveau if not
 found
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: lyude@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

d2hvb3BzIC0gbmljZSBjYXRjaCB3aXRoIHRoaXMgb25lOgoKUmV2aWV3ZWQtYnk6IEx5dWRlIFBh
dWwgPGx5dWRlQHJlZGhhdC5jb20+CgpPbiBNb24sIDIwMjEtMDMtMjkgYXQgMTc6MDcgKzAzMDAs
IFBldHJpIExhdHZhbGEgd3JvdGU6Cj4gT25seSAjaW5jbHVkZSB0aGUgbGliZHJtX25vdXZlYXUg
aGVhZGVycyBpZiBIQVZFX0xJQkRSTV9OT1VWRUFVIGlzIHNldAo+IHNvIElHVCBidWlsZHMgYWdh
aW4gd2l0aG91dCBpdCBpbnN0YWxsZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGV0cmkgTGF0dmFs
YSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+Cj4gQ2M6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhh
dC5jb20+Cj4gLS0tCj4gwqBsaWIvaWd0X25vdXZlYXUuaCB8IDggKysrKy0tLS0KPiDCoDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL2xpYi9pZ3Rfbm91dmVhdS5oIGIvbGliL2lndF9ub3V2ZWF1LmgKPiBpbmRleCBlYTQ0YWRi
Mi4uYzUxOGRlM2MgMTAwNjQ0Cj4gLS0tIGEvbGliL2lndF9ub3V2ZWF1LmgKPiArKysgYi9saWIv
aWd0X25vdXZlYXUuaAo+IEBAIC0yNiwxMCArMjYsNiBAQAo+IMKgI2luY2x1ZGUgPHN0ZGRlZi5o
Pgo+IMKgI2luY2x1ZGUgPGludHR5cGVzLmg+Cj4gwqAKPiAtI2luY2x1ZGUgPG5vdXZlYXUvbm91
dmVhdS5oPgo+IC0jaW5jbHVkZSA8bm91dmVhdS9udmlmL2NsYXNzLmg+Cj4gLSNpbmNsdWRlIDxu
b3V2ZWF1L252aWYvY2wwMDgwLmg+Cj4gLQo+IMKgI2luY2x1ZGUgImlndF9jb3JlLmgiCj4gwqAK
PiDCoCNkZWZpbmUgSUdUX05PVVZFQVVfQ0hJUFNFVF9HVjEwMCAweDE0MAo+IEBAIC0zNyw2ICsz
MywxMCBAQAo+IMKgdHlwZWRlZiBzdHJ1Y3QgaWd0X2ZiIGlndF9mYl90Owo+IMKgCj4gwqAjaWZk
ZWYgSEFWRV9MSUJEUk1fTk9VVkVBVQo+ICsjaW5jbHVkZSA8bm91dmVhdS9ub3V2ZWF1Lmg+Cj4g
KyNpbmNsdWRlIDxub3V2ZWF1L252aWYvY2xhc3MuaD4KPiArI2luY2x1ZGUgPG5vdXZlYXUvbnZp
Zi9jbDAwODAuaD4KPiArCj4gwqAjZGVmaW5lIERFQ0woZCkgZAo+IMKgI2Vsc2UKPiDCoC8qIFRo
ZXJlIHNob3VsZG4ndCBiZSBhbnkgY29kZSB0aGF0IGNhbGxzIGlndF9ub3V2ZWF1XyogZnVuY3Rp
b25zIHdpdGhvdXQKPiBsaWJkcm0gc3VwcG9ydCBlbmFibGVkLCBhcwoKLS0gClNpbmNlcmVseSwK
ICAgTHl1ZGUgUGF1bCAoc2hlL2hlcikKICAgU29mdHdhcmUgRW5naW5lZXIgYXQgUmVkIEhhdAog
ICAKTm90ZTogSSBkZWFsIHdpdGggYSBsb3Qgb2YgZW1haWxzIGFuZCBoYXZlIGEgbG90IG9mIGJ1
Z3Mgb24gbXkgcGxhdGUuIElmIHlvdSd2ZQphc2tlZCBtZSBhIHF1ZXN0aW9uLCBhcmUgd2FpdGlu
ZyBmb3IgYSByZXZpZXcvbWVyZ2Ugb24gYSBwYXRjaCwgZXRjLiBhbmQgSQpoYXZlbid0IHJlc3Bv
bmRlZCBpbiBhIHdoaWxlLCBwbGVhc2UgZmVlbCBmcmVlIHRvIHNlbmQgbWUgYW5vdGhlciBlbWFp
bCB0byBjaGVjawpvbiBteSBzdGF0dXMuIEkgZG9uJ3QgYml0ZSEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
