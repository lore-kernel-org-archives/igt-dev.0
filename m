Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B18116E58A
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Apr 2018 16:44:08 +0000 (UTC)
Date: Wed, 18 Apr 2018 18:43:38 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <20180418164338.hk33g745jkco7lsb@mwiniars-main.ger.corp.intel.com>
References: <20180416073954.3651-1-katarzyna.dec@intel.com>
 <1523952760.3305.6.camel@intel.com>
 <1523961895.3558.52.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1523961895.3558.52.camel@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/intel_batchbuffer: Reuse
 gen9_media_fill on Gen 10
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
To: "Kalamarz, Lukasz" <lukasz.kalamarz@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBBcHIgMTcsIDIwMTggYXQgMTA6NDQ6NTdBTSArMDAwMCwgS2FsYW1hcnosIEx1a2Fz
eiB3cm90ZToKPiBPbiBUdWUsIDIwMTgtMDQtMTcgYXQgMDg6MTIgKzAwMDAsIFN6d2ljaHRlbmJl
cmcsIFJhZG9zbGF3IHdyb3RlOgo+ID4gT24gTW9uLCAyMDE4LTA0LTE2IGF0IDA5OjM5ICswMjAw
LCBLYXRhcnp5bmEgRGVjIHdyb3RlOgo+ID4gPiBNZWRpYSBmaWxsIGZ1bmN0aW9uIGNhbiBiZSBy
ZXVzZWQgb24gR2VuMTAuIENvZGUgaGFzIG5vdAo+ID4gPiBjaGFuZ2VkLiBMZXQncyByZXVzZSBn
ZW45Lgo+ID4gPiAKPiA+ID4gQ2M6IEx1Y2FzIERlIE1hcmNoaSA8bHVjYXMuZGVtYXJjaGlAaW50
ZWwuY29tPgo+ID4gPiBDYzogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPgo+
ID4gPiBDYzogRGFuaWVsZSBDZXJhb2xvIFNwdXJpbyA8ZGFuaWVsZS5jZXJhb2xvc3B1cmlvQGlu
dGVsLmNvbT4KPiA+ID4gU2lnbmVkLW9mZi1ieTogS2F0YXJ6eW5hIERlYyA8a2F0YXJ6eW5hLmRl
Y0BpbnRlbC5jb20+Cj4gPiAKPiA+IFJldmlld2VkLWJ5OiBSYWRvc2xhdyBTendpY2h0ZW5iZXJn
IDxyYWRvc2xhdy5zendpY2h0ZW5iZXJnQGludGVsLmNvbQo+IAo+IFJldmlld2VkLWJ5OiBMdWth
c3ogS2FsYW1hcnogPGx1a2Fzei5rYWxhbWFyekBpbnRlbC5jb20+CgpQdXNoZWQuCgpUaGFua3Mg
Zm9yIHRoZSBwYXRjaCBhbmQgdGhlIHJldmlldyEKCi1NaWNoYcWCCgo+ID4gPgo+ID4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IGlndC1kZXYgbWFp
bGluZyBsaXN0Cj4gPiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBpZ3QtZGV2IG1haWxpbmcg
bGlzdAo+IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaWd0LWRldgo=
