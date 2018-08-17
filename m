Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30CC96E632
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Aug 2018 21:35:58 +0000 (UTC)
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Fri, 17 Aug 2018 14:35:53 -0700
Message-Id: <20180817213553.4544-1-rodrigo.vivi@intel.com>
In-Reply-To: <153454120121.10736.16460853969838180302@skylake-alporthouse-com>
References: <153454120121.10736.16460853969838180302@skylake-alporthouse-com>
Subject: [igt-dev] [PATCH i-g-t] pm_rpm: Require DMC loaded before testing
 runtime_pm for gen9+
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

U2luY2Ugd2UgYmxvY2sgcnVudGltZSBQTSBpZiBETUMgaXMgbm90IGxvYWRlZCwgbGV0J3Mgc2tp
cAp0aGUgdGVzdC4KCnYyOiBVc2UgaTkxNV9kbWNfaW5mbyBwcmVzZW5jZSB0byBkZXRlY3QgZG1j
IHJlcXVpcmVtZW50CiAgICBpbnN0ZWFkIG9mIGdlbiBjaGVjayBhcyBDaHJpcyBzdWdnZXN0ZWQu
CnYzOiBBZGQgbWlzc2luZyBcMCBiZWZvcmUgdXNpbmcgYnVmLiAoQ2hyaXMpCgpDYzogQ2hyaXMg
V2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CkNjOiBJbXJlIERlYWsgPGltcmUuZGVh
a0BpbnRlbC5jb20+CkNjOiBBbnVzaGEgU3JpdmF0c2EgPGFudXNoYS5zcml2YXRzYUBpbnRlbC5j
b20+ClNpZ25lZC1vZmYtYnk6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4K
LS0tCiB0ZXN0cy9wbV9ycG0uYyB8IDE2ICsrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCAxNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdGVzdHMvcG1fcnBtLmMgYi90ZXN0cy9w
bV9ycG0uYwppbmRleCBiYmUzNmU1OS4uZmEwZDk4ZGMgMTAwNjQ0Ci0tLSBhL3Rlc3RzL3BtX3Jw
bS5jCisrKyBiL3Rlc3RzL3BtX3JwbS5jCkBAIC02OTMsNiArNjkzLDIxIEBAIHN0YXRpYyB2b2lk
IHNldHVwX3BjOCh2b2lkKQogCWhhc19wYzggPSB0cnVlOwogfQogCitzdGF0aWMgYm9vbCBkbWNf
bG9hZGVkKHZvaWQpCit7CisJY2hhciBidWZbMTVdOworCWludCBsZW47CisKKwlsZW4gPSBpZ3Rf
c3lzZnNfcmVhZChkZWJ1Z2ZzLCAiaTkxNV9kbWNfaW5mbyIsIGJ1Ziwgc2l6ZW9mKGJ1ZikpOwor
CWlmIChsZW4gPCAwKQorCSAgICByZXR1cm4gdHJ1ZTsgLyogbm8gQ1NSIHN1cHBvcnQsIG5vIERN
QyByZXF1aXJlbWVudCAqLworCisJYnVmW2xlbl0gPSAnXDAnOworCisJaWd0X2luZm8oIkRNQzog
JXNcbiIsIGJ1Zik7CisJcmV0dXJuIHN0cnN0cihidWYsICJmdyBsb2FkZWQ6IHllcyIpOworfQor
CiBzdGF0aWMgYm9vbCBzZXR1cF9lbnZpcm9ubWVudCh2b2lkKQogewogCWlmIChoYXNfcnVudGlt
ZV9wbSkKQEAgLTcxNSw2ICs3MzAsNyBAQCBzdGF0aWMgYm9vbCBzZXR1cF9lbnZpcm9ubWVudCh2
b2lkKQogCWlndF9pbmZvKCJSdW50aW1lIFBNIHN1cHBvcnQ6ICVkXG4iLCBoYXNfcnVudGltZV9w
bSk7CiAJaWd0X2luZm8oIlBDOCByZXNpZGVuY3kgc3VwcG9ydDogJWRcbiIsIGhhc19wYzgpOwog
CWlndF9yZXF1aXJlKGhhc19ydW50aW1lX3BtKTsKKwlpZ3RfcmVxdWlyZShkbWNfbG9hZGVkKCkp
OwogCiBvdXQ6CiAJZGlzYWJsZV9hbGxfc2NyZWVucygmbXNfZGF0YSk7Ci0tIAoyLjE3LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFp
bGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
