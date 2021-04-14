Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0323D6E4D4
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Apr 2021 09:05:08 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Wed, 14 Apr 2021 11:04:43 +0200
Message-Id: <20210414090445.19552-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 0/2] Fix gem_tiled_blits on TGL
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Rm9yIENJLCBzYW1lIGNvZGUgYXMgc2VwYXJhdGUgcGF0Y2gsIGJ1dCB0aGlzIGlzIGZvciBxdWlj
ayByZXN1bHQuCgp2MjogZWgsIGJsYWNrbGlzdC1wcmUtbWVyZ2UgdHVybmVkIG9mZiB0aGUgdGVz
dCBpbiBwcmUtbWVyZ2UuCgpaYmlnbmlldyBLZW1wY3p5xYRza2kgKDIpOgogIHRlc3RzL2dlbV90
aWxlZF9ibGl0czogZml4IHNpZ3NlZ3Ygb24gVEdMIHdoZW4gYWxsb2NhdG9yIGlzIGluIHVzZQog
IEhBWDogZXhlcmNpc2UgZ2VtX3RpbGVkX2JsaXRzIG9ubHkKCiB0ZXN0cy9pOTE1L2dlbV90aWxl
ZF9ibGl0cy5jICAgICAgICAgICB8ICAgNCArCiB0ZXN0cy9pbnRlbC1jaS9ibGFja2xpc3QtcHJl
LW1lcmdlLnR4dCB8ICAgMiAtCiB0ZXN0cy9pbnRlbC1jaS9mYXN0LWZlZWRiYWNrLnRlc3RsaXN0
ICB8IDE3NiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDcgaW5z
ZXJ0aW9ucygrKSwgMTc1IGRlbGV0aW9ucygtKQoKLS0gCjIuMjYuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
