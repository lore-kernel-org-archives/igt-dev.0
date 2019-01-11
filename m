Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3A6076F59E
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jan 2019 09:06:20 +0000 (UTC)
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date: Fri, 11 Jan 2019 10:05:13 +0100
Message-Id: <20190111090532.19235-3-paul.kocialkowski@bootlin.com>
In-Reply-To: <20190111090532.19235-1-paul.kocialkowski@bootlin.com>
References: <20190111090532.19235-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 02/21] lib/igt_fb: Add checks on i915 for
 i915-specific tiled buffer allocation
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
Cc: Petri Latvala <petri.latvala@intel.com>, Eben Upton <eben@raspberrypi.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>

VGhlIGNvZGUgcGF0aCBmb3IgYWxsb2NhdGluZyB0aWxlZCBidWZmZXJzIGhhcyBhIGZldyBpOTE1
LXNwZWNpZmljIGJpdHMKd2l0aG91dCBjaGVja3MgZm9yIHRoZSBpOTE1IGRyaXZlci4gQWRkIHRo
ZXNlIG1pc3NpbmcgY2hlY2tzLgoKU2lnbmVkLW9mZi1ieTogUGF1bCBLb2NpYWxrb3dza2kgPHBh
dWwua29jaWFsa293c2tpQGJvb3RsaW4uY29tPgotLS0KIGxpYi9pZ3RfZmIuYyB8IDYgKysrKyst
CiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvbGliL2lndF9mYi5jIGIvbGliL2lndF9mYi5jCmluZGV4IDljZWViODI0ZmZmNC4uOWVj
ZDEwYjhjZGUxIDEwMDY0NAotLS0gYS9saWIvaWd0X2ZiLmMKKysrIGIvbGliL2lndF9mYi5jCkBA
IC0zNjQsNiArMzY0LDcgQEAgc3RhdGljIHVpbnQzMl90IGNhbGNfcGxhbmVfc3RyaWRlKHN0cnVj
dCBpZ3RfZmIgKmZiLCBpbnQgcGxhbmUpCiAJCShmYi0+cGxhbmVfYnBwW3BsYW5lXSAvIDgpOwog
CiAJaWYgKGZiLT50aWxpbmcgIT0gTE9DQUxfRFJNX0ZPUk1BVF9NT0RfTk9ORSAmJgorCSAgICBp
c19pOTE1X2RldmljZShmYi0+ZmQpICYmCiAJICAgIGludGVsX2dlbihpbnRlbF9nZXRfZHJtX2Rl
dmlkKGZiLT5mZCkpIDw9IDMpIHsKIAkJdWludDMyX3Qgc3RyaWRlOwogCkBAIC0zOTIsNiArMzkz
LDcgQEAgc3RhdGljIHVpbnQzMl90IGNhbGNfcGxhbmVfc3RyaWRlKHN0cnVjdCBpZ3RfZmIgKmZi
LCBpbnQgcGxhbmUpCiBzdGF0aWMgdWludDY0X3QgY2FsY19wbGFuZV9zaXplKHN0cnVjdCBpZ3Rf
ZmIgKmZiLCBpbnQgcGxhbmUpCiB7CiAJaWYgKGZiLT50aWxpbmcgIT0gTE9DQUxfRFJNX0ZPUk1B
VF9NT0RfTk9ORSAmJgorCSAgICBpc19pOTE1X2RldmljZShmYi0+ZmQpICYmCiAJICAgIGludGVs
X2dlbihpbnRlbF9nZXRfZHJtX2RldmlkKGZiLT5mZCkpIDw9IDMpIHsKIAkJdWludDY0X3QgbWlu
X3NpemUgPSAodWludDY0X3QpIGZiLT5zdHJpZGVzW3BsYW5lXSAqCiAJCQlmYi0+cGxhbmVfaGVp
Z2h0W3BsYW5lXTsKQEAgLTE0ODgsOSArMTQ5MCwxMSBAQCBzdGF0aWMgdm9pZCAqbWFwX2JvKGlu
dCBmZCwgc3RydWN0IGlndF9mYiAqZmIpCiAJaWYgKGZiLT5pc19kdW1iKQogCQlwdHIgPSBrbXN0
ZXN0X2R1bWJfbWFwX2J1ZmZlcihmZCwgZmItPmdlbV9oYW5kbGUsIGZiLT5zaXplLAogCQkJCQkg
ICAgICBQUk9UX1JFQUQgfCBQUk9UX1dSSVRFKTsKLQllbHNlCisJZWxzZSBpZiAoaXNfaTkxNV9k
ZXZpY2UoZmQpKQogCQlwdHIgPSBnZW1fbW1hcF9fZ3R0KGZkLCBmYi0+Z2VtX2hhbmRsZSwgZmIt
PnNpemUsCiAJCQkJICAgIFBST1RfUkVBRCB8IFBST1RfV1JJVEUpOworCWVsc2UKKwkJaWd0X2Fz
c2VydChmYWxzZSk7CiAKIAlyZXR1cm4gcHRyOwogfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdApp
Z3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
