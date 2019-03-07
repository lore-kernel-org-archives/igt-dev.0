Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D73636E29B
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Mar 2019 11:25:43 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu,  7 Mar 2019 13:24:26 +0200
Message-Id: <20190307112427.29146-4-petri.latvala@intel.com>
In-Reply-To: <20190307112427.29146-1-petri.latvala@intel.com>
References: <20190307112427.29146-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/5] lib/fb: Add missing break in
 get_yuv_parameters
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

WVZVNDIwIGFuZCBZVlU0MjIgd2lsbCBvdGhlcndpc2UgdXNlIG9mZnNldHMgZm9yIFAwMTAgYW5k
IHBhbHMuCgpTaWduZWQtb2ZmLWJ5OiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVs
LmNvbT4KLS0tCiBsaWIvaWd0X2ZiLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvbGliL2lndF9mYi5jIGIvbGliL2lndF9mYi5jCmluZGV4IDlk
Y2EyYTQ2Li5mNDliZWNiZCAxMDA2NDQKLS0tIGEvbGliL2lndF9mYi5jCisrKyBiL2xpYi9pZ3Rf
ZmIuYwpAQCAtMTg0MSw2ICsxODQxLDggQEAgc3RhdGljIHZvaWQgZ2V0X3l1dl9wYXJhbWV0ZXJz
KHN0cnVjdCBpZ3RfZmIgKmZiLCBzdHJ1Y3QgeXV2X3BhcmFtZXRlcnMgKnBhcmFtcykKIAkJcGFy
YW1zLT55X29mZnNldCA9IGZiLT5vZmZzZXRzWzBdOwogCQlwYXJhbXMtPnVfb2Zmc2V0ID0gZmIt
Pm9mZnNldHNbMl07CiAJCXBhcmFtcy0+dl9vZmZzZXQgPSBmYi0+b2Zmc2V0c1sxXTsKKwkJYnJl
YWs7CisKIAljYXNlIERSTV9GT1JNQVRfUDAxMDoKIAljYXNlIERSTV9GT1JNQVRfUDAxMjoKIAlj
YXNlIERSTV9GT1JNQVRfUDAxNjoKLS0gCjIuMTkuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pZ3QtZGV2
