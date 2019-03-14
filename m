Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 14 Mar 2019 09:44:19 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
Message-ID: <20190314094419.5889d461@collabora.com>
In-Reply-To: <20190228144910.26488-3-daniel.vetter@ffwll.ch>
References: <20190228144910.26488-1-daniel.vetter@ffwll.ch>
 <20190228144910.26488-3-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 2/7] drm/lease: Drop recursive leads checks
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
Cc: IGT development <igt-dev@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@intel.com>, Keith Packard <keithp@keithp.com>, DRI Development <dri-devel@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCAyOCBGZWIgMjAxOSAxNTo0OTowNSArMDEwMApEYW5pZWwgVmV0dGVyIDxkYW5pZWwu
dmV0dGVyQGZmd2xsLmNoPiB3cm90ZToKCj4gV2UgZGlzYWxsb3cgc3VibGVhc2luZywgc28gbm8g
cG9pbnQgY2hlY2tpbmcgd2hldGhlciB0aGUgbWFzdGVyIGhvbGRzCj4gYWxsIHRoZSBsZWFzZXMg
LSBpdCB3aWxsLgo+IAo+IFNwb3R0ZWQgd2hpbGUgdHlwaW5nIGV4aGF1c3RpdmUgaWd0IGNvdmVy
YWdlIGZvciBhbGwgdGhlc2UgY29ybmVyCj4gY2FzZXMuCj4gCj4gQ2M6IEtlaXRoIFBhY2thcmQg
PGtlaXRocEBrZWl0aHAuY29tPgo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmll
bC52ZXR0ZXJAaW50ZWwuY29tPgoKUmV2aWV3ZWQtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMu
YnJlemlsbG9uQGNvbGxhYm9yYS5jb20+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2xl
YXNlLmMgfCAyIC0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2xlYXNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X2xlYXNlLmMKPiBpbmRleCAxMTc2ZDgxNGNmN2YuLmNjZTVkOWRkNTJmZiAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2xlYXNlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X2xlYXNlLmMKPiBAQCAtMjIwLDggKzIyMCw2IEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX21hc3RlciAq
ZHJtX2xlYXNlX2NyZWF0ZShzdHJ1Y3QgZHJtX21hc3RlciAqbGVzc29yLCBzdHJ1Y3QgaWRyCj4g
IAkJZXJyb3IgPSAwOwo+ICAJCWlmICghaWRyX2ZpbmQoJmRldi0+bW9kZV9jb25maWcub2JqZWN0
X2lkciwgb2JqZWN0KSkKPiAgCQkJZXJyb3IgPSAtRU5PRU5UOwo+IC0JCWVsc2UgaWYgKCFfZHJt
X2xlYXNlX2hlbGRfbWFzdGVyKGxlc3Nvciwgb2JqZWN0KSkKPiAtCQkJZXJyb3IgPSAtRUFDQ0VT
Owo+ICAJCWVsc2UgaWYgKF9kcm1faGFzX2xlYXNlZChsZXNzb3IsIG9iamVjdCkpCj4gIAkJCWVy
cm9yID0gLUVCVVNZOwo+ICAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRl
dg==
