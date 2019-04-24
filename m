Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C9E891AA
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Apr 2019 20:06:47 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id i13so17045922edf.11
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Apr 2019 13:06:47 -0700 (PDT)
Date: Wed, 24 Apr 2019 22:06:41 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20190424200641.GW9857@phenom.ffwll.local>
References: <20190424070129.8591-1-simon.ser@intel.com>
 <20190424092842.GV22949@platvala-desk.ger.corp.intel.com>
 <20190424132655.GY22949@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190424132655.GY22949@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_halffloat: fix compilation with
 Clang
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
To: Simon Ser <simon.ser@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBBcHIgMjQsIDIwMTkgYXQgMDQ6MjY6NTVQTSArMDMwMCwgUGV0cmkgTGF0dmFsYSB3
cm90ZToKPiBPbiBXZWQsIEFwciAyNCwgMjAxOSBhdCAxMjoyODo0MlBNICswMzAwLCBQZXRyaSBM
YXR2YWxhIHdyb3RlOgo+ID4gT24gV2VkLCBBcHIgMjQsIDIwMTkgYXQgMTA6MDE6MjlBTSArMDMw
MCwgU2ltb24gU2VyIHdyb3RlOgo+ID4gPiBUaGUgc291cmNlIGZpbGUgY29udGFpbnMgYSBzcGVj
aWFsIGNvZGUtcGF0aCBmb3IgQ2xhbmcsIGhvd2V2ZXIgdGhpcyBwYXRoIGZhaWxzCj4gPiA+IHRv
IGNvbXBpbGU6Cj4gPiA+IAo+ID4gPiAgIC4uL2xpYi9pZ3RfaGFsZmZsb2F0LmM6MjI3Ojc6IGVy
cm9yOiBjb25mbGljdGluZyB0eXBlcyBmb3IgJ2lndF9oYWxmX3RvX2Zsb2F0Jwo+ID4gPiAgIGZs
b2F0IGlndF9oYWxmX3RvX2Zsb2F0KGNvbnN0IHVpbnQxNl90ICpoLCBmbG9hdCAqZiwgdW5zaWdu
ZWQgaW50IG51bSkKPiA+ID4gICAgICAgICBeCj4gPiA+ICAgLi4vbGliL2lndF9oYWxmZmxvYXQu
aDoyNjo2OiBub3RlOiBwcmV2aW91cyBkZWNsYXJhdGlvbiBpcyBoZXJlCj4gPiA+ICAgdm9pZCBp
Z3RfaGFsZl90b19mbG9hdChjb25zdCB1aW50MTZfdCAqaCwgZmxvYXQgKmYsIHVuc2lnbmVkIGlu
dCBudW0pOwo+ID4gPiAgICAgICAgXgo+ID4gPiAgIDEgZXJyb3IgZ2VuZXJhdGVkLgo+ID4gPiAK
PiA+ID4gVGhpcyBjb21taXQgZml4ZXMgdGhpcyBtaXNtYXRjaC4KPiA+ID4gCj4gPiA+IFNpZ25l
ZC1vZmYtYnk6IFNpbW9uIFNlciA8c2ltb24uc2VyQGludGVsLmNvbT4KPiA+IAo+ID4gU2FtZSBj
bGFuZyBwYXRoIGlzIGFsc28gdXNlZCBmb3IgIXg4Nl82NCwgYXMgc2hvd24gaW4gdGhlIGdpdGxh
YiBDSQo+ID4gYnVpbGQgZmFpbHVyZS4KPiA+IAo+ID4gCj4gPiBSZXZpZXdlZC1ieTogUGV0cmkg
TGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+Cj4gCj4gCj4gQW5kIG1lcmdlZCBub3cs
IHRoYW5rcy4KCkZvciBuZXh0IHRpbWUgZm9yIHJlZ3Jlc3Npb25zOiBQbGVhc2UgY2MgdGhlIGZv
bGtzIHdobyBicm9rZSB0aGluZ3MgKG9yCnJldmlld2VkIHRoYXQgYnJlYWthZ2UpLCBhbmQgcXVv
dGUgdGhlIG9mZmVuZGluZyBjb21taXQgd2l0aCBGaXhlczogbGluZXMuCgpBbHNvIEknbSBraW5k
YSB3b25kZXJpbmcgd2hldGhlciB3ZSBzaG91bGQgZW5mb3JjZSBnaXRsYWIgQ0kgYnVpbGQgc3Vj
Y2Vzcwpnb2luZyBmb3J3YXJkIC4uLiBTdHVmZiBub3QgY29tcGlsaW5nIGlzbid0IGF3ZXNvbWUu
CgpUaGFua3MsIERhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50
ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9pZ3QtZGV2
