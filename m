Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9895289CC9
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Mar 2018 15:43:57 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 12 Mar 2018 15:43:50 +0000
Message-Id: <20180312154350.7210-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] [PATCH igt] lib/audio: Replace sqrt(a*a + b*b) with
 hypot(a, b)
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Ci0t
LQogbGliL2lndF9hdWRpby5jIHwgNCArLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbGliL2lndF9hdWRpby5jIGIvbGliL2ln
dF9hdWRpby5jCmluZGV4IDIzMjFkMWM2Li4yMjljZTZjNiAxMDA2NDQKLS0tIGEvbGliL2lndF9h
dWRpby5jCisrKyBiL2xpYi9pZ3RfYXVkaW8uYwpAQCAtMjY2LDkgKzI2Niw3IEBAIGJvb2wgYXVk
aW9fc2lnbmFsX2RldGVjdChzdHJ1Y3QgYXVkaW9fc2lnbmFsICpzaWduYWwsIGludCBjaGFubmVs
cywKIAkJbWF4ID0gMDsKIAogCQlmb3IgKGkgPSAwOyBpIDwgZnJhbWVzIC8gMjsgaSsrKSB7Ci0J
CQlhbXBsaXR1ZGVbaV0gPSBzcXJ0KGRhdGFbaV0gKiBkYXRhW2ldICsKLQkJCQkJICAgIGRhdGFb
ZnJhbWVzIC0gaV0gKgotCQkJCQkgICAgZGF0YVtmcmFtZXMgLSBpXSk7CisJCQlhbXBsaXR1ZGVb
aV0gPSBoeXBvdChkYXRhW2ldLCBkYXRhW2ZyYW1lcyAtIGldKTsKIAkJCWlmIChhbXBsaXR1ZGVb
aV0gPiBtYXgpCiAJCQkJbWF4ID0gYW1wbGl0dWRlW2ldOwogCQl9Ci0tIAoyLjE2LjIKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGlu
ZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
