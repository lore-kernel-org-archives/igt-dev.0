Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm0-x244.google.com (mail-wm0-x244.google.com
 [IPv6:2a00:1450:400c:c09::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AEF76E7CD
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jan 2018 08:01:11 +0000 (UTC)
Received: by mail-wm0-x244.google.com with SMTP id i186so6109841wmi.4
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jan 2018 00:01:10 -0800 (PST)
Date: Wed, 31 Jan 2018 09:01:06 +0100
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20180131080106.GU25930@phenom.ffwll.local>
References: <20180125010003.7678-1-antonio.argenziano@intel.com>
 <20180125010003.7678-3-antonio.argenziano@intel.com>
 <151688024415.674.17042783575166373202@mail.alporthouse.com>
 <4d736654-d9db-4c60-7626-ef398ac0b8bf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4d736654-d9db-4c60-7626-ef398ac0b8bf@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 3/3] tests/gem_ctx_param: Add
 set_priority tests for non SYS_NICE users
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
To: Antonio Argenziano <antonio.argenziano@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBKYW4gMzAsIDIwMTggYXQgMDQ6NDc6NTdQTSAtMDgwMCwgQW50b25pbyBBcmdlbnpp
YW5vIHdyb3RlOgo+IE9uIDI1LzAxLzE4IDAzOjM3LCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gPiBR
dW90aW5nIEFudG9uaW8gQXJnZW56aWFubyAoMjAxOC0wMS0yNSAwMTowMDowMykKPiA+ID4gKyAg
ICAgICAgICAgICAgIH0KPiA+ID4gKwo+ID4gPiAgICAgICAgICAgICAgICAgIGdlbV9jb250ZXh0
X2dldF9wYXJhbShmZCwgJmFyZyk7Cj4gPiA+ICAgICAgICAgICAgICAgICAgb2xkX3ZhbHVlID0g
YXJnLnZhbHVlOwo+ID4gPiBAQCAtMzEyLDkgKzMzOCwxMyBAQCBpZ3RfbWFpbgo+ID4gPiAgICAg
ICAgICAgICAgICAgIH0KPiA+ID4gICAgICAgICAgICAgICAgICBmb3IgKHVuc2lnbmVkIGZsYWdz
ID0gMDsKPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmbGFncyA8PSAoUk9P
VCB8IE5FV19DVFggfCBWQUxJRF9QUklPIHwgT1ZFUkZMT1dfUFJJTyk7Cj4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZmxhZ3MgPD0gKE5JQ0UgfCBST09UIHwgTkVXX0NUWCB8
IFZBTElEX1BSSU8gfCBPVkVSRkxPV19QUklPKTsKPiA+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZmxhZ3MrKykgewo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICBpZ3Rf
c3VidGVzdF9mKCJzZXQtcHJpb3JpdHklcyVzJXMlcyIsCj4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgIGlmICghKGZsYWdzICYgTklDRSkgJiYgIShmbGFncyAmIFJPT1QpKQo+ID4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOyAvKiBOZWVkcyB0byBiZSByb3Qg
dG8gc2V0IHByb3BlcnRpZXMgKi8KPiA+IAo+ID4gTm9wZSwganVzdCB1c2UgaWd0X3JlcXVpcmUg
YXMgYWJvdmUuCj4gCj4gSSBkaWRuJ3Qgd2FudCBhbnkgIiotbm90LW5pY2UtdXNlcioiIHN1YnRl
c3RzIHRvIGFwcGVhciBpbiB0aGUgbGlzdCBhdCBhbGwsCj4gd2l0aCBpZ3RfcmVxdWlyZSB0aGV5
IHdvdWxkIGp1c3Qgc2tpcCBidXQgc3RpbGwgYmUgdGhlcmUgcmlnaHQ/CgpzdWJ0ZXN0IGxpc3Rz
IHNob3VsZG4ndCBiZSBkeW5hbWljLCBpdCBjb25mdXNlcyBDSSBpbmZyYXN0cnVjdHVyZSBiYWRs
eS4KSGVuY2Ugd2h5IGlndF9yZXF1aXJlL2lndF9za2lwIHJlc3VsdCBpbiBhIHNwZWNpYWwgc3Vi
dGVzdCByZXN1bHQgYW5kIHdpbGwKbm90IHN1cHJlc3MgdGhlIHN1YnRlc3Qgb3V0cmlnaHQuCgpJ
IGtub3cgdGhhdCB2cGcgaXMgc3RydWdnbGluZyB3aXRoIGhlYXBzIG9mIHNraXBwZWQgdGVzdHMg
aW4gdGhlaXIKcmVwb3J0aW5nLCBidXQgYXMgc29vbiBhcyB5b3UgZG8gY3Jvc3MtcGxhdGZvcm0v
a2VybmVsL09TIHRlc3RpbmcsIGl0J3MKdGhlIG9ubHkgcmVhc29uYWJsZSB3YXkgdG8gaGFuZGxl
IHRoaW5ncy4KClNvIHllYWgsIHRoaXMgbmVlZHMgdG8gYmUgYW4gaWd0X3JlcXVpcmUsIGFuZCBw
cm9iYWJseSBtb3ZlZCBpbnRvIHRoZQpzdWJ0ZXN0IHN0YW56YSAob3Igd3JhcHBlZCB3aXRoIGFu
IGlndF9zdWJ0ZXN0X2dyb3VwIGRlcGVuZGluZyB1cG9uIHRoZQpvdmVyYWxsIHRlc3QgbG9naWMp
LgoKCkFzaWRlOiBUaGUgaWd0IGludHJvIGRvY3Mgc2hvdWxkIGV4cGxhaW4gdGhpcywgcGF0Y2gg
d291bGQgYmUgZ3JlYXQgaWYKaXQncyB1bmNsZWFyL21pc3NpbmcuCi1EYW5pZWwKLS0gCkRhbmll
bCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9n
LmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
