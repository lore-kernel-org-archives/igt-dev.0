Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E38FF6E808
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jan 2018 11:43:03 +0000 (UTC)
Message-ID: <1516880581.2602.1.camel@intel.com>
From: Mika Kahola <mika.kahola@intel.com>
Date: Thu, 25 Jan 2018 13:43:01 +0200
In-Reply-To: <2571d0ca-50c5-b630-0f2f-793e325d4cc9@linux.intel.com>
References: <20180123125642.58698-1-maarten.lankhorst@linux.intel.com>
 <20180123125642.58698-2-maarten.lankhorst@linux.intel.com>
 <20180123155052.GM5453@intel.com>
 <2571d0ca-50c5-b630-0f2f-793e325d4cc9@linux.intel.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/8] lib/igt_fb: Add igt_put_cairo_ctx
 as counter to igt_get_cairo_ctx
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: mika.kahola@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCAyMDE4LTAxLTI0IGF0IDEzOjI2ICswMTAwLCBNYWFydGVuIExhbmtob3JzdCB3cm90
ZToKPiBIZXksCj4gCj4gT3AgMjMtMDEtMTggb20gMTY6NTAgc2NocmVlZiBWaWxsZSBTeXJqw6Rs
w6Q6Cj4gPiAKPiA+IE9uIFR1ZSwgSmFuIDIzLCAyMDE4IGF0IDAxOjU2OjM1UE0gKzAxMDAsIE1h
YXJ0ZW4gTGFua2hvcnN0IHdyb3RlOgo+ID4gPiAKPiA+ID4gVGhpcyB3aWxsIGFsbG93IHN1cHBv
cnQgZm9yIE5WMTIgaW4gdGhlIGZ1dHVyZSwgd2hlcmUKPiA+ID4gaWd0X2dldF9jYWlyb19jdHgK
PiA+ID4gd2lsbCByZXR1cm4gYSBSR0IgaW1hZ2UgdG8gZHJhdyB3aXRoLCB3aGljaCB3aWxsIGJl
IGNvbnZlcnRlZCBpbgo+ID4gPiBpZ3RfcHV0X2NhaXJvX2N0eCBzbyB0ZXN0cyBkb24ndCBoYXZl
IHRvIGFkZCBzcGVjaWFsIHN1cHBvcnQgZm9yCj4gPiA+IE5WMTIuCj4gPiBXaHkgZG8gd2UgbmVl
ZCBhIHNwZWNpYWwgZnVuY2l0b24/IEFzIGluLCBjYW4ndCB5b3UganVzdCBkbyBpdCB0aGUKPiA+
IHNhbWUgYXMgd2UgaGFuZGxlIHRoZSBndHQgdnMuIGJsaXQgc3R1ZmY/Cj4gPiAKPiBUaGUgY2Fp
cm9fZGVzdHJveSgpIGNhbGwgd2lsbCBkbyB0aGUgYWN0dWFsIGNvbnZlcnNpb24gYmFjaywgYnV0
IHdpdGgKPiB0aGlzIGhlbHBlciB3ZSBjYW4KPiBhY3R1YWxseSBjaGVjayB0aGF0IGV2ZXJ5IGNh
bGwgdG8gZ2V0KCkgaXMgZm9sbG93ZWQgYnkgYSBwdXQoKSBhbmQKPiBlcnJvcnMgYXJlIGNvbnNp
c3RlbnRseQo+IGNoZWNrZWQuIE5vdCBhbGwgY2FsbGVycyBoYXZlIGJvdGgsIHNvIEkgZmVsdCBp
dCBiZXR0ZXIgdG8gcHV0IGl0IGluCj4gdGhlIGNvcmUuLgoKRnJvbSB0aGUgbmFtaW5nIGNvbnZl
bnRpb24gcG9pbnQgb2YgdmlldywgSSB3b3VsZCB1c2Ugc2V0KCkgaW5zdGVhZCBvZgpwdXQoKSBh
cyB3ZSBoYXZlIGEgZ2V0KCkgYXMgY291bnRlcnBhcnQuCgo+IAo+IH5NYWFydGVuCj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBpZ3QtZGV2IG1haWxp
bmcgbGlzdAo+IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Ci0tIApNaWthIEthaG9sYSAt
IEludGVsIE9UQwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
