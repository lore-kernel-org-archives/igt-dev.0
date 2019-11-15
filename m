Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D0766E0D0
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Nov 2019 05:33:27 +0000 (UTC)
From: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
Date: Thu, 14 Nov 2019 21:33:26 -0800
Message-Id: <20191115053326.1854697-3-vanshidhar.r.konda@intel.com>
In-Reply-To: <20191115053326.1854697-1-vanshidhar.r.konda@intel.com>
References: <20191115053326.1854697-1-vanshidhar.r.konda@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 2/2] i915/i915_fb_tiling: Check if device supports
 tiling
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
Cc: brian.welty@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

U2tpcCB0aGlzIHRlc3QgaWYgdGhlIHBsYXRmb3JtIGRvZXMgbm90IHN1cHBvcnQgc2V0dGluZyB0
aWxpbmcgZm9yIGZyYW1lCmJ1ZmZlciBvYmplY3QuCgpTaWduZWQtb2ZmLWJ5OiBWYW5zaGlkaGFy
IEtvbmRhIDx2YW5zaGlkaGFyLnIua29uZGFAaW50ZWwuY29tPgotLS0KIHRlc3RzL2k5MTUvaTkx
NV9mYl90aWxpbmcuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS90ZXN0cy9pOTE1L2k5MTVfZmJfdGlsaW5nLmMgYi90ZXN0cy9pOTE1L2k5MTVf
ZmJfdGlsaW5nLmMKaW5kZXggN2Q1YzNmMWYuLjRlYzg0OTYyIDEwMDY0NAotLS0gYS90ZXN0cy9p
OTE1L2k5MTVfZmJfdGlsaW5nLmMKKysrIGIvdGVzdHMvaTkxNS9pOTE1X2ZiX3RpbGluZy5jCkBA
IC0zMiw2ICszMiw4IEBAIGlndF9zaW1wbGVfbWFpbgogCXN0cnVjdCBpZ3RfZmIgZmI7CiAJaW50
IHJldDsKIAorCWlndF9yZXF1aXJlKGdlbV9oYXNfbGVnYWN5X2h3X3RpbGluZyhkcm1fZmQpKTsK
KwogCWlndF9jcmVhdGVfZmIoZHJtX2ZkLCA1MTIsIDUxMiwgRFJNX0ZPUk1BVF9YUkdCODg4OCwK
IAkJICAgICAgTE9DQUxfSTkxNV9GT1JNQVRfTU9EX1hfVElMRUQsICZmYik7CiAKLS0gCjIuMjQu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRl
diBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
