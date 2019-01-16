Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB9BD6EFD3
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jan 2019 11:21:03 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed, 16 Jan 2019 13:20:48 +0200
Message-Id: <20190116112050.27647-20-petri.latvala@intel.com>
In-Reply-To: <20190116112050.27647-1-petri.latvala@intel.com>
References: <20190116112050.27647-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 19/21] lib/igt_kms: Aid static analyzer with
 the control flow
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

SWYgd2UgZmlyc3QgZmluZCBuIGFtb3VudCBvZiAnOicgaW4gYSBzdHJpbmcsIHRoZSBhbW91bnQg
aXMgc3RpbGwgbgp3aGVuIHdlIHdhbGsgdGhyb3VnaCBpdCB0aGUgc2Vjb25kIHRpbWUuCgpTaWdu
ZWQtb2ZmLWJ5OiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4KQ2M6IEpv
b25hcyBMYWh0aW5lbiA8am9vbmFzLmxhaHRpbmVuQGxpbnV4LmludGVsLmNvbT4KLS0tCiBsaWIv
aWd0X2ttb2QuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0t
Z2l0IGEvbGliL2lndF9rbW9kLmMgYi9saWIvaWd0X2ttb2QuYwppbmRleCAyMmMyNjAyMS4uOTE2
NjJlYjMgMTAwNjQ0Ci0tLSBhL2xpYi9pZ3Rfa21vZC5jCisrKyBiL2xpYi9pZ3Rfa21vZC5jCkBA
IC04Niw2ICs4Niw3IEBAIHN0YXRpYyBzdHJ1Y3Qga21vZF9jdHggKmttb2RfY3R4KHZvaWQpCiAK
IAkJcCA9IGNvbmZpZ19wYXRoc19zdHI7CiAJCWZvciAoaSA9IDA7IGkgPCBjb3VudDsgKytpKSB7
CisJCQlpZ3RfYXNzZXJ0KHAgIT0gTlVMTCk7CiAJCQljb25maWdfcGF0aHNbaV0gPSBwOwogCiAJ
CQlpZiAoKHAgPSBzdHJjaHIocCwgJzonKSkpCi0tIAoyLjE5LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
