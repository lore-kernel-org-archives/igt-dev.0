Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E1D46E271
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Mar 2019 07:55:05 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id f2so19185556edy.13
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Feb 2019 23:55:05 -0800 (PST)
Date: Fri, 1 Mar 2019 08:55:00 +0100
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20190301075500.GS2665@phenom.ffwll.local>
References: <20190228171723.31331-1-daniel.vetter@ffwll.ch>
 <20190228171723.31331-4-daniel.vetter@ffwll.ch>
 <155137641692.5847.3262521320199157636@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <155137641692.5847.3262521320199157636@skylake-alporthouse-com>
Subject: Re: [igt-dev] [PATCH i-g-t 4/4] tests: Use
 igt_device_set/drop_master
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
Cc: IGT development <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBGZWIgMjgsIDIwMTkgYXQgMDU6NTM6NDJQTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFF1b3RpbmcgRGFuaWVsIFZldHRlciAoMjAxOS0wMi0yOCAxNzoxNzoyMykKPiA+IFN1
Z2dlc3RlZCBieSBDaHJpcy4KPiA+IAo+ID4gQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMt
d2lsc29uLmNvLnVrPgo+ID4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZl
dHRlckBmZndsbC5jaD4KPiA+IC0tLQo+ID4gIHRlc3RzL2NvcmVfc2V0bWFzdGVyX3ZzX2F1dGgu
YyB8ICA2ICsrKystLQo+ID4gIHRlc3RzL2ttc19mbGlwX2V2ZW50X2xlYWsuYyAgICB8IDEwICsr
KystLS0tLS0KPiA+ICB0ZXN0cy9rbXNfbGVhc2UuYyAgICAgICAgICAgICAgfCAxMSArKysrKyst
LS0tLQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25z
KC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS90ZXN0cy9jb3JlX3NldG1hc3Rlcl92c19hdXRoLmMg
Yi90ZXN0cy9jb3JlX3NldG1hc3Rlcl92c19hdXRoLmMKPiA+IGluZGV4IGMzMzVkZGZmM2EyZC4u
ZjllOTdjN2E1N2VmIDEwMDY0NAo+ID4gLS0tIGEvdGVzdHMvY29yZV9zZXRtYXN0ZXJfdnNfYXV0
aC5jCj4gPiArKysgYi90ZXN0cy9jb3JlX3NldG1hc3Rlcl92c19hdXRoLmMKPiA+IEBAIC0zOSw2
ICszOSw4IEBACj4gPiAgI2luY2x1ZGUgPHN0ZGlvLmg+Cj4gPiAgI2luY2x1ZGUgPHN0cmluZy5o
Pgo+ID4gIAo+ID4gKyNpbmNsdWRlIDxpZ3RfZGV2aWNlLmg+Cj4gCj4gImlndF9kZXZpY2UuaCIg
Zm9yIGEgbG9jYWwgaGVhZGVyPwoKUG9saXNoZWQgYW5kIG1lcmdlZCwgdGhhbmtzIGZvciB5b3Vy
IHJldmlldy4KLURhbmllbAoKPiAKPiBDb252ZXJzaW9ucyBsb29rIGZpbmUgb3RoZXJ3aXNlLgo+
IAo+IFdpdGggIiIsCj4gUmV2aWV3ZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2ls
c29uLmNvLnVrPgo+IC1DaHJpcwoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIs
IEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaWd0LWRldg==
