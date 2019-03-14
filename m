Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 14 Mar 2019 08:56:04 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
Message-ID: <20190314085604.5e0b1a50@collabora.com>
In-Reply-To: <20190228144910.26488-4-daniel.vetter@ffwll.ch>
References: <20190228144910.26488-1-daniel.vetter@ffwll.ch>
 <20190228144910.26488-4-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: IGT development <igt-dev@lists.freedesktop.org>, Keith Packard <keithp@keithp.com>, DRI Development <dri-devel@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCAyOCBGZWIgMjAxOSAxNTo0OTowNiArMDEwMApEYW5pZWwgVmV0dGVyIDxkYW5pZWwu
dmV0dGVyQGZmd2xsLmNoPiB3cm90ZToKCj4gV2Uga3phbGxvYy4KPiAKPiBDYzogS2VpdGggUGFj
a2FyZCA8a2VpdGhwQGtlaXRocC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8
ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KClJldmlld2VkLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJv
cmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2Ry
bV9hdXRoLmMgfCAyIC0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2F1dGguYyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fYXV0aC5jCj4gaW5kZXggMTY2OWM0MmM0MGVkLi5iY2YwYTVhMTAxOGYgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9hdXRoLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X2F1dGguYwo+IEBAIC0xMDksOCArMTA5LDYgQEAgc3RydWN0IGRybV9tYXN0ZXIgKmRybV9tYXN0
ZXJfY3JlYXRlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCj4gIAltYXN0ZXItPmRldiA9IGRldjsK
PiAgCj4gIAkvKiBpbml0aWFsaXplIHRoZSB0cmVlIG9mIG91dHB1dCByZXNvdXJjZSBsZXNzZWVz
ICovCj4gLQltYXN0ZXItPmxlc3NvciA9IE5VTEw7Cj4gLQltYXN0ZXItPmxlc3NlZV9pZCA9IDA7
Cj4gIAlJTklUX0xJU1RfSEVBRCgmbWFzdGVyLT5sZXNzZWVzKTsKPiAgCUlOSVRfTElTVF9IRUFE
KCZtYXN0ZXItPmxlc3NlZV9saXN0KTsKPiAgCWlkcl9pbml0KCZtYXN0ZXItPmxlYXNlcyk7Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1h
aWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
