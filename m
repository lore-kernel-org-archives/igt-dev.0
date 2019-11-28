Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ABD36E369
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Nov 2019 00:49:07 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Wed, 27 Nov 2019 16:49:02 -0800
Message-Id: <20191128004902.157126-2-jose.souza@intel.com>
In-Reply-To: <20191128004902.157126-1-jose.souza@intel.com>
References: <20191128004902.157126-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/i915_pm_dc: Wait for PSR2 entry
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
Cc: Jeevan B <jeevan.b@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

QWZ0ZXIgZW5hYmxlIFBTUjIgd2UgY2FuIG5vdCBjaGVjayByaWdodCBhd2F5IGlmIFBTUjIgaXMg
ZW5hYmxlZCwgd2UKbmVlZCBsZXQgc29tZSB0aW1lIHRvIFBTUjIgdG8gYmUgZW5hYmxlZC4KRm9y
IHRoYXQgd2UgaGF2ZSBwc3Jfd2FpdF9lbnRyeSgpLCB0aGF0IGlzIHdoeSB0aGUgcHJldmlvdXMg
cGF0Y2ggd2FzCnJldmVydGVkIGFzIHBzcl9lbmFibGVkKCkgaXMgbm90IG11Y2ggdXNlZnVsLgoK
QnVnemlsbGE6IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTEx
MjQxMQpDYzogSmVldmFuIEIgPGplZXZhbi5iQGludGVsLmNvbT4KQ2M6IEFuc2h1bWFuIEd1cHRh
IDxhbnNodW1hbi5ndXB0YUBpbnRlbC5jb20+CkNjOiBBcmthZGl1c3ogSGlsZXIgPGFya2FkaXVz
ei5oaWxlckBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEg
PGpvc2Uuc291emFAaW50ZWwuY29tPgotLS0KIHRlc3RzL2k5MTUvaTkxNV9wbV9kYy5jIHwgMTIg
Ky0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDExIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUvaTkxNV9wbV9kYy5jIGIvdGVzdHMvaTkxNS9p
OTE1X3BtX2RjLmMKaW5kZXggMDJiMDgxODkuLmNkMjgyOGI4IDEwMDY0NAotLS0gYS90ZXN0cy9p
OTE1L2k5MTVfcG1fZGMuYworKysgYi90ZXN0cy9pOTE1L2k5MTVfcG1fZGMuYwpAQCAtODQsMTYg
Kzg0LDYgQEAgc3RhdGljIHZvaWQgZGlzcGxheV9maW5pKGRhdGFfdCAqZGF0YSkKIAlpZ3RfZGlz
cGxheV9maW5pKCZkYXRhLT5kaXNwbGF5KTsKIH0KIAotc3RhdGljIGJvb2wgZWRwX3BzcjJfZW5h
YmxlZChkYXRhX3QgKmRhdGEpCi17Ci0JY2hhciBidWZbNTEyXTsKLQotCWlndF9kZWJ1Z2ZzX3Np
bXBsZV9yZWFkKGRhdGEtPmRlYnVnZnNfZmQsICJpOTE1X2VkcF9wc3Jfc3RhdHVzIiwKLQkJCQli
dWYsIHNpemVvZihidWYpKTsKLQotCXJldHVybiBzdHJzdHIoYnVmLCAiUFNSIG1vZGU6IFBTUjIg
ZW5hYmxlZCIpICE9IE5VTEw7Ci19Ci0KIHN0YXRpYyB2b2lkIGNsZWFudXBfZGNfcHNyKGRhdGFf
dCAqZGF0YSkKIHsKIAlpZ3RfcGxhbmVfdCAqcHJpbWFyeTsKQEAgLTI5OCw3ICsyODgsNyBAQCBz
dGF0aWMgdm9pZCBzZXR1cF9kYzNjbyhkYXRhX3QgKmRhdGEpCiB7CiAJZGF0YS0+b3BfcHNyX21v
ZGUgPSBQU1JfTU9ERV8yOwogCXBzcl9lbmFibGUoZGF0YS0+ZGVidWdmc19mZCwgZGF0YS0+b3Bf
cHNyX21vZGUpOwotCWlndF9yZXF1aXJlX2YoZWRwX3BzcjJfZW5hYmxlZChkYXRhKSwKKwlpZ3Rf
cmVxdWlyZV9mKHBzcl93YWl0X2VudHJ5KGRhdGEtPmRlYnVnZnNfZmQsIGRhdGEtPm9wX3Bzcl9t
b2RlKSwKIAkJICAgICAgIlBTUjIgaXMgbm90IGVuYWJsZWRcbiIpOwogfQogCi0tIAoyLjI0LjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYg
bWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
