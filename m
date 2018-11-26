Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6054089DA2
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Nov 2018 14:24:35 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id f4so15955562edq.10
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Nov 2018 06:24:35 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 26 Nov 2018 15:24:26 +0100
Message-Id: <20181126142426.19636-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/gem_ctx_param: Missing igt_fixture
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
To: IGT development <igt-dev@lists.freedesktop.org>
Cc: Petri Latvala <petri.latvala@intel.com>, Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

SXQncyBub3QgY29vbCB0byBydW4gYW4gaW9jdGwgb3V0c2lkZSBvZiBpZ3RfZml4dHVyZS4KClJl
cG9ydGVkLWJ5OiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4KQ2M6IFBl
dHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KLS0tCiB0ZXN0cy9pOTE1L2dlbV9j
dHhfcGFyYW0uYyB8IDEyICsrKysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9pOTE1L2dlbV9jdHhfcGFy
YW0uYyBiL3Rlc3RzL2k5MTUvZ2VtX2N0eF9wYXJhbS5jCmluZGV4IGM0NmZkNzA5YjBkNy4uMGJi
YzVlZmZiZjlmIDEwMDY0NAotLS0gYS90ZXN0cy9pOTE1L2dlbV9jdHhfcGFyYW0uYworKysgYi90
ZXN0cy9pOTE1L2dlbV9jdHhfcGFyYW0uYwpAQCAtMTU2LDE0ICsxNTYsMTQgQEAgaWd0X21haW4K
IAogCQlnZW1fcmVxdWlyZV9jb250ZXh0cyhmZCk7CiAJCWN0eCA9IGdlbV9jb250ZXh0X2NyZWF0
ZShmZCk7Ci0JfQogCi0JYXJnLnBhcmFtID0gSTkxNV9DT05URVhUX1BBUkFNX0JBTl9QRVJJT0Q7
CisJCWFyZy5wYXJhbSA9IEk5MTVfQ09OVEVYVF9QQVJBTV9CQU5fUEVSSU9EOwogCi0JLyogWFhY
IHN0YXJ0IHRvIGVuZm9yY2UgYmFuIHBlcmlvZCByZXR1cm5pbmcgLUVJTlZBTCB3aGVuCi0JICog
dHJhbnNpdGlvbiBoYXMgYmVlbiBkb25lICovCi0JaWYgKF9fZ2VtX2NvbnRleHRfZ2V0X3BhcmFt
KGZkLCAmYXJnKSA9PSAtRUlOVkFMKQotCQlhcmcucGFyYW0gPSBJOTE1X0NPTlRFWFRfUEFSQU1f
QkFOTkFCTEU7CisJCS8qIFhYWCBzdGFydCB0byBlbmZvcmNlIGJhbiBwZXJpb2QgcmV0dXJuaW5n
IC1FSU5WQUwgd2hlbgorCQkgKiB0cmFuc2l0aW9uIGhhcyBiZWVuIGRvbmUgKi8KKwkJaWYgKF9f
Z2VtX2NvbnRleHRfZ2V0X3BhcmFtKGZkLCAmYXJnKSA9PSAtRUlOVkFMKQorCQkJYXJnLnBhcmFt
ID0gSTkxNV9DT05URVhUX1BBUkFNX0JBTk5BQkxFOworCX0KIAogCWlndF9zdWJ0ZXN0KCJiYXNp
YyIpIHsKIAkJYXJnLmN0eF9pZCA9IGN0eDsKLS0gCjIuMTkuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
