Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85A566E857
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Oct 2018 15:40:29 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20181005150738.GI31561@phenom.ffwll.local>
References: <20181004132128.6412-1-daniel.vetter@ffwll.ch>
 <20181004132128.6412-4-daniel.vetter@ffwll.ch>
 <20181005150738.GI31561@phenom.ffwll.local>
Message-ID: <153875401480.5379.4296070102922494534@skylake-alporthouse-com>
Date: Fri, 05 Oct 2018 16:40:14 +0100
Subject: Re: [igt-dev] [PATCH i-g-t 4/4] lib/kms: warn if we commit without
 outputs
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
To: Daniel Vetter <daniel@ffwll.ch>, IGT development <igt-dev@lists.freedesktop.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBEYW5pZWwgVmV0dGVyICgyMDE4LTEwLTA1IDE2OjA3OjM4KQo+IE9uIFRodSwgT2N0
IDA0LCAyMDE4IGF0IDAzOjIxOjI4UE0gKzAyMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiBX
aXRoIHRoZSBoaWdoLWxldmVsIGhlbHBlcnMgcmVxdWlyaW5nIG91dHB1dHMgdGhlcmUncyBub3Qg
cG9pbnQKPiA+IGluIHNpbGVudGx5IGlnbm9yaW5nIGlzc3VlcyBhbnltb3JlLiBDb21wbGFpbiBh
Ym91dCB0aGF0IGlmIGl0Cj4gPiBldmVyIGhhcHBlbnMuCj4gPiAKPiA+IENjOiBBbnRvbmlvIEFy
Z2Vuemlhbm8gPGFudG9uaW8uYXJnZW56aWFub0BpbnRlbC5jb20+Cj4gPiBDYzogQ2hyaXMgV2ls
c29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiAKPiBJIGd1ZXNzIG15IG1vdGl2YXRp
b24gd2l0aCBmdW1ibGluZyBhcm91bmQgd2l0aCB0aGUgaWd0X2Rpc3BsYXlfKiBhcGkKPiB3YXNu
J3QgZW50aXJlbHkgY2xlYXI6IEl0J3MgdGhpcyBwYXRjaCBoZXJlLCByZXNwZWN0aXZlbHkgQ2hy
aXMnIHBhdGNoCj4gd2hpY2ggYWRkZWQgdGhlIHNpbGVudCBzaG9ydCBjaXJjdWl0Lgo+IAo+IElt
byB0aGF0J3MgdmVyeSBicml0dGxlIGFwaSwgYXNraW5nIGZvciB0cm91YmxlLCBhbmQgbWUgbm90
IHJlY29nbml6aW5nCj4gcmlnaHQgYXdheSB3aGF0J3MgaGFwcGVuaW5nIGluIHRoZSBkZWJ1Z2Zz
IGlzIGtpbmRhIHByb3ZpbmcgdGhlIHBvaW50Lgo+IFNpbGVudGx5IHRocm93aW5nIGEgcmVxdWVz
dCBhd2F5IGZyb20gdGhlIHRlc3RjYXNlIGlzIGF0IGxlYXN0IHZlcnkKPiBzdXJwcmlzaW5nLiBB
bmQgaW5jb25zaXN0ZW50IHdpdGggYm90aCBtb3JlIGV4cGxpY2l0IGlndF9yZXF1aXJlL2Fzc2Vy
dAo+IGNoZWNrcyBpbiBkcml2ZXJzLCBhbmQgKHRoZSBzdHlsZSBJIGZhdm91ciBwZXJzb25hbGx5
LCBidXQgcmVhbGx5IG5vdCB0aGUKPiBpc3N1ZSBoZXJlKSBwdXR0aW5nIGlndF9yZXF1aXJlL2Fz
c2VydCBpbnRvIHRoZSBoZWxwZXIgbGlicmFyeS4KCkknZCBhcmd1ZSB0aGUgb3Bwb3NpdGUuIFRo
ZSB0ZXN0IGNhc2UgcmVxdWVzdGVkIHVzIHRvIGNvbmZpZ3VyZSAwCm91dHB1dHMgYWNyb3NzIDAg
cGlwZXMsIGFuZCB3ZSBhcmUgb2JleWluZyBpdC4gTm90IHNlY29uZCBndWVzc2luZyB3aGF0CnRo
ZSB0ZXN0IGNhc2UgaW50ZW5kZWQuCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2lndC1kZXYK
