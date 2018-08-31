Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8029D6E8F8
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Aug 2018 13:58:38 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 31 Aug 2018 14:58:28 +0100
Message-Id: <20180831135828.24312-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib: Squelch warning for failing to enable
 audio powermanagement
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

SXQgZG9lc24ndCBzZWVtIHRvIGJlIHByZXZlbnRpbmcgcnBtIChzZWUgdGhlIHBtX3JwbSB0ZXN0
cykgaWYgd2UgZmFpbAp0byBlbmFibGUgcnVudGltZS1wb3dlcm1hbmFnZW1lbnQgZm9yIGF1ZGlv
LCBzbyByZWR1Y2UgdGhlIHdhcm5pbmcgdG8gYQpkZWJ1Zy4gSXQgd2lsbCBzdGlsbCBiZSB2aXNp
YmxlIGlmIGl0IGZhaWxzLCBidXQgb25seSBpZiBpdCBmYWlscy4KClNpZ25lZC1vZmYtYnk6IENo
cmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgpDYzogSW1yZSBEZWFrIDxpbXJl
LmRlYWtAaW50ZWwuY29tPgpDYzogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVs
LmNvbT4KLS0tCiBsaWIvaWd0X3BtLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9saWIvaWd0X3BtLmMgYi9saWIvaWd0
X3BtLmMKaW5kZXggMzM5YTUxZTZmLi5iMWYzNTlkOGIgMTAwNjQ0Ci0tLSBhL2xpYi9pZ3RfcG0u
YworKysgYi9saWIvaWd0X3BtLmMKQEAgLTI2MCw3ICsyNjAsNyBAQCB2b2lkIGlndF9wbV9lbmFi
bGVfYXVkaW9fcnVudGltZV9wbSh2b2lkKQogCiAJZXJyID0gX19pZ3RfcG1fZW5hYmxlX2F1ZGlv
X3J1bnRpbWVfcG0oKTsKIAlpZiAoZXJyKQotCQlpZ3Rfd2FybigiRmFpbGVkIHRvIGVuYWJsZSBh
dWRpbyBydW50aW1lIFBNISAoJWQpXG4iLCAtZXJyKTsKKwkJaWd0X2RlYnVnKCJGYWlsZWQgdG8g
ZW5hYmxlIGF1ZGlvIHJ1bnRpbWUgUE0hICglZClcbiIsIC1lcnIpOwogfQogCiAvKioKLS0gCjIu
MTkuMC5yYzEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
