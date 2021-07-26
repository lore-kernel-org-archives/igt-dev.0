Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F36716FD0B
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jul 2021 13:47:26 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 26 Jul 2021 15:46:00 +0200
Message-Id: <20210726134616.49873-37-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210726134616.49873-1-zbigniew.kempczynski@intel.com>
References: <20210726134616.49873-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 36/52] tests/gem_unref_active_buffers:
 Adopt to use allocator
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Rm9yIG5ld2VyIGdlbnMgd2UncmUgbm90IGFibGUgdG8gcmVseSBvbiByZWxvY2F0aW9ucy4gQWRv
cHQgdG8gdXNlCm9mZnNldHMgYWNxdWlyZWQgZnJvbSB0aGUgYWxsb2NhdG9yLgoKU2lnbmVkLW9m
Zi1ieTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5j
b20+CkNjOiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4KQ2M6IEFzaHV0
b3NoIERpeGl0IDxhc2h1dG9zaC5kaXhpdEBpbnRlbC5jb20+Ci0tLQogdGVzdHMvaTkxNS9nZW1f
dW5yZWZfYWN0aXZlX2J1ZmZlcnMuYyB8IDUgKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9pOTE1L2dlbV91bnJl
Zl9hY3RpdmVfYnVmZmVycy5jIGIvdGVzdHMvaTkxNS9nZW1fdW5yZWZfYWN0aXZlX2J1ZmZlcnMu
YwppbmRleCA3MzExOTBiMzkuLjNiOGM5ODFkYSAxMDA2NDQKLS0tIGEvdGVzdHMvaTkxNS9nZW1f
dW5yZWZfYWN0aXZlX2J1ZmZlcnMuYworKysgYi90ZXN0cy9pOTE1L2dlbV91bnJlZl9hY3RpdmVf
YnVmZmVycy5jCkBAIC02OSwxMSArNjksMTMgQEAgaWd0X3NpbXBsZV9tYWluCiAJc3RydWN0IGl0
aW1lcnZhbCBpdHY7CiAJaWd0X3NwaW5fdCAqc3BpbjsKIAlpbnQgaTkxNTsKKwl1aW50NjRfdCBh
aG5kOwogCiAJaTkxNSA9IGRybV9vcGVuX2RyaXZlcihEUklWRVJfSU5URUwpOwogCWlndF9yZXF1
aXJlX2dlbShpOTE1KTsKIAotCXNwaW4gPSBpZ3Rfc3Bpbl9uZXcoaTkxNSk7CisJYWhuZCA9IGdl
dF9yZWxvY19haG5kKGk5MTUsIDApOworCXNwaW4gPSBpZ3Rfc3Bpbl9uZXcoaTkxNSwgLmFobmQg
PSBhaG5kKTsKIAlmY250bChpOTE1LCBGX1NFVEZMLCBmY250bChpOTE1LCBGX0dFVEZMKSB8IE9f
Tk9OQkxPQ0spOwogCiAJc2lnYWN0aW9uKFNJR0FMUk0sICZzYSwgJm9sZF9zYSk7CkBAIC0xMTgs
NCArMTIwLDUgQEAgaWd0X3NpbXBsZV9tYWluCiAJc2lnYWN0aW9uKFNJR0FMUk0sICZvbGRfc2Es
IE5VTEwpOwogCiAJaWd0X3NwaW5fZnJlZShpOTE1LCBzcGluKTsKKwlwdXRfYWhuZChhaG5kKTsK
IH0KLS0gCjIuMjYuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
