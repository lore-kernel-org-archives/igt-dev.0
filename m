Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Thu, 28 Feb 2019 14:18:26 +0000
Message-Id: <20190228141828.2567-3-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20190228141828.2567-1-tvrtko.ursulin@linux.intel.com>
References: <20190228141828.2567-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/5] gem_wsim: Remove some unused struct
 members
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
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KCldlIGRvIG5v
dCBib3RoZXIgZXhwbGljaXRseSB1bm1hcHBpbmcgbWVtb3J5IG9uIGV4aXQgc28gbm8gbmVlZCB0
byBzdG9yZQphZGRyZXNzIGFuZCBzaXplIGluIHRoZSB3b3JrbG9hZCBzdGVwIHN0cnVjdC4KClNp
Z25lZC1vZmYtYnk6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+Ci0t
LQogYmVuY2htYXJrcy9nZW1fd3NpbS5jIHwgNSAtLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYmVuY2htYXJrcy9nZW1fd3NpbS5jIGIvYmVuY2htYXJr
cy9nZW1fd3NpbS5jCmluZGV4IDU3Y2ViOTgzY2Y4Mi4uYWZiOTY0NGRkN2YwIDEwMDY0NAotLS0g
YS9iZW5jaG1hcmtzL2dlbV93c2ltLmMKKysrIGIvYmVuY2htYXJrcy9nZW1fd3NpbS5jCkBAIC0x
MzEsNyArMTMxLDYgQEAgc3RydWN0IHdfc3RlcAogCXN0cnVjdCBkcm1faTkxNV9nZW1fcmVsb2Nh
dGlvbl9lbnRyeSByZWxvY1s0XTsKIAl1bnNpZ25lZCBsb25nIGJiX3N6OwogCXVpbnQzMl90IGJi
X2hhbmRsZTsKLQl1aW50MzJfdCAqbWFwcGVkX2JhdGNoOwogCXVpbnQzMl90ICpzZXFub192YWx1
ZTsKIAl1aW50MzJfdCAqc2Vxbm9fYWRkcmVzczsKIAl1aW50MzJfdCAqcnQwX3ZhbHVlOwpAQCAt
MTM5LDcgKzEzOCw2IEBAIHN0cnVjdCB3X3N0ZXAKIAl1aW50MzJfdCAqcnQxX2FkZHJlc3M7CiAJ
dWludDMyX3QgKmxhdGNoX3ZhbHVlOwogCXVpbnQzMl90ICpsYXRjaF9hZGRyZXNzOwotCXVuc2ln
bmVkIGludCBtYXBwZWRfbGVuOwogfTsKIAogREVDTEFSRV9FV01BKHVpbnQ2NF90LCBydCwgNCwg
MikKQEAgLTgyNCw5ICs4MjIsNiBAQCB0ZXJtaW5hdGVfYmIoc3RydWN0IHdfc3RlcCAqdywgdW5z
aWduZWQgaW50IGZsYWdzKQogCX0KIAogCSpjcyA9IGJiZTsKLQotCXctPm1hcHBlZF9iYXRjaCA9
IHB0cjsKLQl3LT5tYXBwZWRfbGVuID0gbW1hcF9sZW47CiB9CiAKIHN0YXRpYyBjb25zdCB1bnNp
Z25lZCBpbnQgZWJfZW5naW5lX21hcFtOVU1fRU5HSU5FU10gPSB7Ci0tIAoyLjE5LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGlu
ZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
