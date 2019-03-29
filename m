Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
References: <20190228144910.26488-1-daniel.vetter@ffwll.ch>
 <20190228144910.26488-4-daniel.vetter@ffwll.ch>
 <20190314085604.5e0b1a50@collabora.com>
In-Reply-To: <20190314085604.5e0b1a50@collabora.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 29 Mar 2019 14:47:55 +1000
Message-ID: <CAPM=9twPLZP=urJGBWjahLfKmCZ+XcbsGJci4FW7CkQqA-V=5w@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH 3/7] drm/leases: Don't init to 0 in
 drm_master_create
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
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: IGT development <igt-dev@lists.freedesktop.org>, Keith Packard <keithp@keithp.com>, DRI Development <dri-devel@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCAxNCBNYXIgMjAxOSBhdCAxNzo1NiwgQm9yaXMgQnJlemlsbG9uCjxib3Jpcy5icmV6
aWxsb25AY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIDI4IEZlYiAyMDE5IDE1OjQ5
OjA2ICswMTAwCj4gRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4gd3JvdGU6
Cj4KPiA+IFdlIGt6YWxsb2MuCj4gPgo+ID4gQ2M6IEtlaXRoIFBhY2thcmQgPGtlaXRocEBrZWl0
aHAuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBm
ZndsbC5jaD4KPgo+IFJldmlld2VkLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxv
bkBjb2xsYWJvcmEuY29tPgoKUmV2aWV3ZWQtYnk6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhh
dC5jb20+Cj4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fYXV0aC5jIHwgMiAtLQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2F1dGguYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXV0aC5jCj4g
PiBpbmRleCAxNjY5YzQyYzQwZWQuLmJjZjBhNWExMDE4ZiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fYXV0aC5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F1dGgu
Ywo+ID4gQEAgLTEwOSw4ICsxMDksNiBAQCBzdHJ1Y3QgZHJtX21hc3RlciAqZHJtX21hc3Rlcl9j
cmVhdGUoc3RydWN0IGRybV9kZXZpY2UgKmRldikKPiA+ICAgICAgIG1hc3Rlci0+ZGV2ID0gZGV2
Owo+ID4KPiA+ICAgICAgIC8qIGluaXRpYWxpemUgdGhlIHRyZWUgb2Ygb3V0cHV0IHJlc291cmNl
IGxlc3NlZXMgKi8KPiA+IC0gICAgIG1hc3Rlci0+bGVzc29yID0gTlVMTDsKPiA+IC0gICAgIG1h
c3Rlci0+bGVzc2VlX2lkID0gMDsKPiA+ICAgICAgIElOSVRfTElTVF9IRUFEKCZtYXN0ZXItPmxl
c3NlZXMpOwo+ID4gICAgICAgSU5JVF9MSVNUX0hFQUQoJm1hc3Rlci0+bGVzc2VlX2xpc3QpOwo+
ID4gICAgICAgaWRyX2luaXQoJm1hc3Rlci0+bGVhc2VzKTsKPgo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2lndC1kZXY=
