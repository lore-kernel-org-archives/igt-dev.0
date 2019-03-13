Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A16A6E0B1
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2019 12:06:46 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed, 13 Mar 2019 14:06:40 +0200
Message-Id: <20190313120641.7350-3-petri.latvala@intel.com>
In-Reply-To: <20190313120641.7350-1-petri.latvala@intel.com>
References: <20190313120641.7350-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/4] gem_exec_latency: Initialize variance
 to zero
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

SXQncyBqdXN0IGFkZGVkIHRvIGluIGEgbG9vcCBsYXRlciB3aXRob3V0IGFueSBpbml0aWFsaXph
dGlvbiBvcgpkaXJlY3QgYXNzaWdubWVudC4KClNpZ25lZC1vZmYtYnk6IFBldHJpIExhdHZhbGEg
PHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgotLS0KIHRlc3RzL2k5MTUvZ2VtX2V4ZWNfbGF0ZW5j
eS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9nZW1fZXhlY19sYXRlbmN5LmMgYi90ZXN0cy9pOTE1
L2dlbV9leGVjX2xhdGVuY3kuYwppbmRleCA2ZGQxOTFlYy4uMWIwMjJkZjUgMTAwNjQ0Ci0tLSBh
L3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfbGF0ZW5jeS5jCisrKyBiL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNf
bGF0ZW5jeS5jCkBAIC01OTcsNyArNTk3LDcgQEAgcnRob2dfbGF0ZW5jeV9vbl9yaW5nKGludCBm
ZCwgdW5zaWduZWQgaW50IGVuZ2luZSwgY29uc3QgY2hhciAqbmFtZSwgdW5zaWduZWQgaW4KIAlm
b3IgKHVuc2lnbmVkIGludCBjaGlsZCA9IDA7IGNoaWxkIDwgbmVuZ2luZTsgY2hpbGQrKykgewog
CQlzdHJ1Y3QgcnRfcGt0IG5vcm1hbCA9IHJlc3VsdHNbTlBBU1MgKiBjaGlsZCArIDFdOwogCQlp
Z3Rfc3RhdHNfdCBzdGF0czsKLQkJZG91YmxlIHZhcmlhbmNlOworCQlkb3VibGUgdmFyaWFuY2Ug
PSAwLjA7CiAKIAkJaWd0X3N0YXRzX2luaXRfd2l0aF9zaXplKCZzdGF0cywgTlBBU1MpOwogCi0t
IAoyLjE5LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
