Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96995896A3
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Oct 2019 14:30:53 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Fri, 25 Oct 2019 17:30:47 +0300
Message-Id: <20191025143050.18205-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/4] lib/igt_fb: Adjust < pixman-0.36.0
 float hacks
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkRl
ZmluZSBQSVhNQU5fcmdiYV9mbG9hdCB0aGUgc2FtZSB3YXkgbmV3ZXIgcGl4bWFuIHJlbGVhc2Vz
IGRvIGl0LgpUaGlzIGFsbG93cyB1cyB0byBjb21waWxlIHRoZSBjb2RlIGFnYWluc3QgYW4gb2xk
IHBpeG1hbiB2ZXJzaW9uCndoaWxlIHN0aWxsIHJ1bm5pbmcgaXQgYWdhaW5zdCBhIG1vcmUgcmVj
ZW50IHJlbGVhc2UuIEEgc2ltaWxhciBoYWNrCmlzIGFscmVhZHkgdXNlZCBmb3IgY2Fpcm8uCgpT
dWdnZXN0ZWQtYnk6IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29t
PgotLS0KIGxpYi9pZ3RfZmIuYyB8IDEwICsrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA5IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9saWIvaWd0X2ZiLmMgYi9s
aWIvaWd0X2ZiLmMKaW5kZXggNmI2NzRjMWJjZDAyLi44NzIyOGNjYTc5MzYgMTAwNjQ0Ci0tLSBh
L2xpYi9pZ3RfZmIuYworKysgYi9saWIvaWd0X2ZiLmMKQEAgLTgxLDcgKzgxLDE1IEBACiAjZW5k
aWYKIAogI2lmIFBJWE1BTl9WRVJTSU9OIDwgUElYTUFOX1ZFUlNJT05fRU5DT0RFKDAsIDM2LCAw
KQotI2RlZmluZSBQSVhNQU5fcmdiYV9mbG9hdCBQSVhNQU5faW52YWxpZAorI2RlZmluZSBQSVhN
QU5fRk9STUFUX0JZVEUoYnBwLHR5cGUsYSxyLGcsYikgXAorCSgoKGJwcCA+PiAzKSA8PCAyNCkg
fAkJICAgICBcCisJKDMgPDwgMjIpIHwgKCh0eXBlKSA8PCAxNikgfAkgICAgIFwKKwkoKGEgPj4g
MykgPDwgMTIpIHwJCSAgICAgXAorCSgociA+PiAzKSA8PCA4KSB8CQkgICAgIFwKKwkoKGcgPj4g
MykgPDwgNCkgfAkJICAgICBcCisJKChiID4+IDMpKSkKKyNkZWZpbmUgUElYTUFOX1RZUEVfUkdC
QV9GTE9BVCAxMQorI2RlZmluZSBQSVhNQU5fcmdiYV9mbG9hdCBQSVhNQU5fRk9STUFUX0JZVEUo
MTI4LCBQSVhNQU5fVFlQRV9SR0JBX0ZMT0FULDMyLDMyLDMyLDMyKQogI2VuZGlmCiAKIC8qIGRy
bSBmb3VyY2MvY2Fpcm8gZm9ybWF0IG1hcHMgKi8KLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
