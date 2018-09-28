Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Deepak Rawat <drawat@vmware.com>
Date: Thu, 27 Sep 2018 17:43:48 -0700
Message-ID: <20180928004350.2346-5-drawat@vmware.com>
In-Reply-To: <20180928004350.2346-1-drawat@vmware.com>
References: <20180928004350.2346-1-drawat@vmware.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 5/7] lib: Don't call
 igt_require_fb_modifiers() when no modifier
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
To: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-graphics-maintainer@vmware.com, thellstrom@vmware.com, syeh@vmware.com
Cc: Deepak Rawat <drawat@vmware.com>
List-ID: <igt-dev@lists.freedesktop.org>

dm13Z2Z4IGRvZXNuJ3Qgc3VwcG9ydCBmYiBtb2RpZmllciBzbyBza2lwIGlndF9yZXF1aXJlX2Zi
X21vZGlmaWVycygpCndoZW4gbW9kaWZpZXIgYXJlIG5vdCBwYXNzZWQuCgpTaWduZWQtb2ZmLWJ5
OiBEZWVwYWsgUmF3YXQgPGRyYXdhdEB2bXdhcmUuY29tPgotLS0KIGxpYi9pb2N0bF93cmFwcGVy
cy5jIHwgNSArKysrLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2xpYi9pb2N0bF93cmFwcGVycy5jIGIvbGliL2lvY3RsX3dyYXBw
ZXJzLmMKaW5kZXggMDkyOWM0M2YuLjNhMTFjYjZlIDEwMDY0NAotLS0gYS9saWIvaW9jdGxfd3Jh
cHBlcnMuYworKysgYi9saWIvaW9jdGxfd3JhcHBlcnMuYwpAQCAtMTY3OCw3ICsxNjc4LDEwIEBA
IGludCBfX2ttc19hZGRmYihpbnQgZmQsIHVpbnQzMl90IGhhbmRsZSwKIAlzdHJ1Y3QgZHJtX21v
ZGVfZmJfY21kMiBmOwogCWludCByZXQsIGk7CiAKLQlpZ3RfcmVxdWlyZV9mYl9tb2RpZmllcnMo
ZmQpOworCWlmIChtb2RpZmllcikKKwkJaWd0X3JlcXVpcmVfZmJfbW9kaWZpZXJzKGZkKTsKKwll
bHNlCisJCWZsYWdzICY9IH5EUk1fTU9ERV9GQl9NT0RJRklFUlM7CiAKIAltZW1zZXQoJmYsIDAs
IHNpemVvZihmKSk7CiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pZ3QtZGV2Cg==
