Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E91918996E
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Aug 2019 10:40:45 +0000 (UTC)
From: Simon Ser <simon.ser@intel.com>
Date: Wed, 14 Aug 2019 13:41:36 +0300
Message-Id: <20190814104136.3522-1-simon.ser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/tests/igt_audio: silence uninitialized
 variable warning
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

R0NDIGRvZXNuJ3Qgc2VlbSBzbWFydCBlbm91Z2ggdG8gZmlndXJlIG91dCB0aGF0IGV2ZXJ5dGhp
bmcgaXMgZmluZS4gTGV0J3MganVzdAppbml0aWFsaXplIHRoZSB2YXJpYWJsZSB0byBzaWxlbmNl
IHRoZSB3YXJuaW5nLgoKU2lnbmVkLW9mZi1ieTogU2ltb24gU2VyIDxzaW1vbi5zZXJAaW50ZWwu
Y29tPgotLS0KIGxpYi90ZXN0cy9pZ3RfYXVkaW8uYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2xpYi90ZXN0cy9pZ3Rf
YXVkaW8uYyBiL2xpYi90ZXN0cy9pZ3RfYXVkaW8uYwppbmRleCBhMmQ1N2ZiOGI2NjEuLmMwNzI3
NjczY2IxZSAxMDA2NDQKLS0tIGEvbGliL3Rlc3RzL2lndF9hdWRpby5jCisrKyBiL2xpYi90ZXN0
cy9pZ3RfYXVkaW8uYwpAQCAtMTc2LDcgKzE3Niw3IEBAIHN0YXRpYyB2b2lkIHRlc3Rfc2lnbmFs
X2RldGVjdF9waGFzZXNoaWZ0KHN0cnVjdCBhdWRpb19zaWduYWwgKnNpZ25hbCkKCiBpZ3RfbWFp
bgogewotCXN0cnVjdCBhdWRpb19zaWduYWwgKnNpZ25hbDsKKwlzdHJ1Y3QgYXVkaW9fc2lnbmFs
ICpzaWduYWwgPSBOVUxMOwogCWludCByZXQ7CiAJc2l6ZV90IGk7CgotLQoyLjIyLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGlu
ZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
