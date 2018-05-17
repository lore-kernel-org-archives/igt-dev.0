Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 158A76E3ED
 for <igt-dev@lists.freedesktop.org>; Thu, 17 May 2018 19:51:57 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Thu, 17 May 2018 22:51:41 +0300
Message-Id: <20180517195148.5765-3-ville.syrjala@linux.intel.com>
In-Reply-To: <20180517195148.5765-1-ville.syrjala@linux.intel.com>
References: <20180517195148.5765-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 03/10] lib: Don't use dumb buffers for YCbCr
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCldl
IGRvbid0IGRvIHRoZSAiYmxhY2sgIT0gemVybyIgY2xlYXJpbmcgZm9yIGR1bWIgYnVmZmVycywg
c28gbGV0J3Mgbm90CnVzZSB0aGVtIGZvciBZQ2JDciBmcmFtZWJ1ZmZlcnMuCgpTaWduZWQtb2Zm
LWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgotLS0K
IGxpYi9pZ3RfZmIuYyB8IDE2ICsrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxNSBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbGliL2lndF9mYi5jIGIv
bGliL2lndF9mYi5jCmluZGV4IDk1OTZjYWVlMTZhMi4uNWNmMmNkN2Q5ZTkwIDEwMDY0NAotLS0g
YS9saWIvaWd0X2ZiLmMKKysrIGIvbGliL2lndF9mYi5jCkBAIC0zNDUsNiArMzQ1LDIwIEBAIHN0
YXRpYyB2b2lkICptZW1zZXQzMih2b2lkICpzLCB1aW50MzJfdCBjLCBzaXplX3QgbikKIAlyZXR1
cm4gczsKIH0KIAorc3RhdGljIGJvb2wgaXNfeXV2KHVpbnQzMl90IGZvcm1hdCkKK3sKKwlzd2l0
Y2ggKGZvcm1hdCkgeworCWNhc2UgRFJNX0ZPUk1BVF9OVjEyOgorCWNhc2UgRFJNX0ZPUk1BVF9Z
VVlWOgorCWNhc2UgRFJNX0ZPUk1BVF9ZVllVOgorCWNhc2UgRFJNX0ZPUk1BVF9VWVZZOgorCWNh
c2UgRFJNX0ZPUk1BVF9WWVVZOgorCQlyZXR1cm4gdHJ1ZTsKKwlkZWZhdWx0OgorCQlyZXR1cm4g
ZmFsc2U7CisJfQorfQorCiAvKiBoZWxwZXJzIHRvIGNyZWF0ZSBuaWNlLWxvb2tpbmcgZnJhbWVi
dWZmZXJzICovCiBzdGF0aWMgaW50IGNyZWF0ZV9ib19mb3JfZmIoaW50IGZkLCBpbnQgd2lkdGgs
IGludCBoZWlnaHQsCiAJCQkgICAgc3RydWN0IGZvcm1hdF9kZXNjX3N0cnVjdCAqZm9ybWF0LApA
QCAtMzU5LDcgKzM3Myw3IEBAIHN0YXRpYyBpbnQgY3JlYXRlX2JvX2Zvcl9mYihpbnQgZmQsIGlu
dCB3aWR0aCwgaW50IGhlaWdodCwKIAlpZiAob2Zmc2V0cykKIAkJbWVtc2V0KG9mZnNldHMsIDAs
IEFSUkFZX1NJWkUoZm9ybWF0LT5wbGFuZV9icHApICogc2l6ZW9mKCpvZmZzZXRzKSk7CiAKLQlp
ZiAodGlsaW5nIHx8IHNpemUgfHwgc3RyaWRlIHx8IGZvcm1hdC0+cGxhbmVzID4gMSkgeworCWlm
ICh0aWxpbmcgfHwgc2l6ZSB8fCBzdHJpZGUgfHwgaXNfeXV2KGZvcm1hdC0+ZHJtX2lkKSkgewog
CQl1bnNpZ25lZCBjYWxjdWxhdGVkX3NpemUsIGNhbGN1bGF0ZWRfc3RyaWRlOwogCiAJCWlmIChm
b3JtYXQtPnBsYW5lcyA+IDEpCi0tIAoyLjE2LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaWd0LWRldgo=
