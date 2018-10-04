Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D99056E63E
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Oct 2018 19:19:51 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id c22-v6so9583770edc.4
 for <igt-dev@lists.freedesktop.org>; Thu, 04 Oct 2018 12:19:51 -0700 (PDT)
Date: Thu, 4 Oct 2018 21:19:43 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20181004191943.GO31561@phenom.ffwll.local>
References: <20181003194349.16674-1-chris@chris-wilson.co.uk>
 <20181004124446.ewjwxv7jzc6zhuv6@ahiler-desk1.fi.intel.com>
 <20181004132705.GL31561@phenom.ffwll.local>
 <153866605534.5379.3056255152464775187@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <153866605534.5379.3056255152464775187@skylake-alporthouse-com>
Subject: Re: [igt-dev] [PATCH i-g-t] igt: Check drmModeGetResources()
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBPY3QgMDQsIDIwMTggYXQgMDQ6MTQ6MTVQTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFF1b3RpbmcgRGFuaWVsIFZldHRlciAoMjAxOC0xMC0wNCAxNDoyNzowNSkKPiA+IE9u
IFRodSwgT2N0IDA0LCAyMDE4IGF0IDAzOjQ0OjQ2UE0gKzAzMDAsIEFya2FkaXVzeiBIaWxlciB3
cm90ZToKPiA+ID4gT24gV2VkLCBPY3QgMDMsIDIwMTggYXQgMDg6NDM6NDlQTSArMDEwMCwgQ2hy
aXMgV2lsc29uIHdyb3RlOgo+ID4gPiA+IElmIEtNUyBpcyBub3Qgc3VwcG9ydGVkIG9uIHRoZSBk
ZXZpY2UsIGRybU1vZGVHZXRSZXNvdXJjZXMoKSB3aWxsIHJldHVybgo+ID4gPiA+IE5VTEwsIG9m
dGVuIHRoaXMgaXMgYW4gaW5kaWNhdGlvbiB0aGF0IHdlIHNob3VsZCBub3QgYXR0ZW1wdCB0byBy
dW4gdGhlCj4gPiA+ID4gdGVzdC4gQWx0aG91Z2ggaXQgd291bGQgYmUgcHJlZmVycmVkIHRvIHVz
ZSBzb21ldGhpbmcgbGlrZQo+ID4gPiA+IGlndF9yZXF1aXJlX2Rpc3BsYXkoKSBhcyB0aGUgY2Fu
b25pY2FsIGNoZWNrIGFuZCBhc3NlcnQgdGhhdAo+ID4gPiA+IGRybU1vZGVHZXRSZXNvdXJjZXMo
KSBkaWQgbm90IGhpdCBhbiBlcnJvciwgaXQgaXMgbm90IGFsd2F5cyBwcmFjdGljYWwKPiA+ID4g
PiBhcyB0aGUgdGVzdHMgZG8gbm90IHV0aWxpemUgdGhlIGNvbW1vbiBpZ3RfZGlzcGxheSBhYnN0
cmFjdGlvbi4KPiA+ID4gPiAKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNo
cmlzQGNocmlzLXdpbHNvbi5jby51az4KPiA+ID4gUmV2aWV3ZWQtYnk6IEFya2FkaXVzeiBIaWxl
ciA8YXJrYWRpdXN6LmhpbGVyQGludGVsLmNvbT4KPiA+ID4gCj4gPiA+IGFuZCBwdXNoZWQKPiA+
IAo+ID4gSSBzdGlsbCB0aGluayBhIGttc3Rlc3RfcmVxdWlyZSgpIG9yIHNvLCBwbHVzIHRoZW4g
cmVtb3ZpbmcgdGhlIHBpbGUgb2YKPiA+IGFkZC1ob3cgaWd0X3JlcXVpcmUgd2UganVzdCBzcHJp
bmtsZWQgYWxsIG92ZXIsIHdvdWxkIGJlIG1vcmUgbWFpbnRhaW5hYmxlCj4gPiBsb25nIHRlcm0u
IGttc3Rlc3RfcmVxdWlyZSgpIHdvdWxkIGFsc28gYWxsb3cgdXMgdG8gZHJvcCBhIG5vdC1zby1j
cnlwdGljCj4gPiBtZXNzYWdlIGludG8gbG9ncy4KPiAKPiBCdXQgd2hhdCBkb2VzIGttc3Rlc3Qg
bWVhbj8gaWd0X3JlcXVpcmVfa21zKCksIHdoaWNoIGNhbiBiZSB0aGUgcmF3Cj4gZHJtX21vZGVf
Z2V0cmVzb3VyY2VzIGlvY3RsLCBtYXRjaGVzIG15IGV4cGVjdGF0aW9ucyBvZiBhIGxvd2xldmVs
IGNoZWNrLgo+IEJ1dCBpcyB0aGF0IGFzIGRlc2NyaXB0aXZlIGZvciB0aGUgdGVzdHMgdGhhdCBh
cmUganVzdCB1c2luZwo+IGRybU1vZGVHZXRSZXNvdXJjZXMoKSBkaXJlY3RseT8gVGhhdCBpcyB0
aGUgY29udW5kcnVtLgoKV2Ugc2hvdWxkIHByb2JhYmx5IGNoYW5nZSB0aGUga21zdGVzdF8gcHJl
Zml4IHRvIHNvbWV0aGluZyBzbGlnaHRseSBtb3JlCm1lYW5pbmdmdWwuIEFuZCB5ZWFoIHRoZXJl
IG1pZ2h0IGJlIGEgZmV3IHRvbyBtYW55IHNoYWRlcyBvZiBncmV5IHdpdGggdGhlCmxvdy1sZXZl
bCB0ZXN0cy4gQnV0IGZvcmUgdGhlIGhpZ2gtbGV2ZWwgb25lcyBJIHRoaW5rIG91dHJpZ2h0IHJl
cXVpcmluZwp0aGF0IHlvdSBoYXZlIGFuIG91dHB1dCBhbmQgYXQgbGVhc3Qgb25lIHBpcGUgc2Vl
bXMgcmVhc29uYWJsZS4KLURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVl
ciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
