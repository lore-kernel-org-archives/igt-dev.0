Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3D2A6E1D5
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Feb 2019 14:49:22 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id f2so17173585edy.13
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Feb 2019 06:49:22 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 28 Feb 2019 15:49:06 +0100
Message-Id: <20190228144910.26488-4-daniel.vetter@ffwll.ch>
In-Reply-To: <20190228144910.26488-1-daniel.vetter@ffwll.ch>
References: <20190228144910.26488-1-daniel.vetter@ffwll.ch>
Subject: [igt-dev] [PATCH 3/7] drm/leases: Don't init to 0 in
 drm_master_create
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: IGT development <igt-dev@lists.freedesktop.org>, Keith Packard <keithp@keithp.com>
List-ID: <igt-dev@lists.freedesktop.org>

V2Uga3phbGxvYy4KCkNjOiBLZWl0aCBQYWNrYXJkIDxrZWl0aHBAa2VpdGhwLmNvbT4KU2lnbmVk
LW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vZHJtX2F1dGguYyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXV0aC5jIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9hdXRoLmMKaW5kZXggMTY2OWM0MmM0MGVkLi5iY2YwYTVhMTAxOGYgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXV0aC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fYXV0aC5jCkBAIC0xMDksOCArMTA5LDYgQEAgc3RydWN0IGRybV9tYXN0ZXIgKmRybV9tYXN0
ZXJfY3JlYXRlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCiAJbWFzdGVyLT5kZXYgPSBkZXY7CiAK
IAkvKiBpbml0aWFsaXplIHRoZSB0cmVlIG9mIG91dHB1dCByZXNvdXJjZSBsZXNzZWVzICovCi0J
bWFzdGVyLT5sZXNzb3IgPSBOVUxMOwotCW1hc3Rlci0+bGVzc2VlX2lkID0gMDsKIAlJTklUX0xJ
U1RfSEVBRCgmbWFzdGVyLT5sZXNzZWVzKTsKIAlJTklUX0xJU1RfSEVBRCgmbWFzdGVyLT5sZXNz
ZWVfbGlzdCk7CiAJaWRyX2luaXQoJm1hc3Rlci0+bGVhc2VzKTsKLS0gCjIuMTQuNAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5n
IGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
