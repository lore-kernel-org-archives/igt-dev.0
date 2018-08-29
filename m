Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E41F6E632
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Aug 2018 21:59:42 +0000 (UTC)
From: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Date: Wed, 29 Aug 2018 14:57:12 -0700
Message-Id: <20180829215713.20962-5-dhinakaran.pandiyan@intel.com>
In-Reply-To: <20180829215713.20962-1-dhinakaran.pandiyan@intel.com>
References: <20180829215713.20962-1-dhinakaran.pandiyan@intel.com>
Subject: [igt-dev] [PATCH i-g-t 5/6] tests/psr: Test PSR1 in kms_psr
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
Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>, rodrigo.vivi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

VGhlIHRlc3RzIHdlIGhhdmUgd29yayBvbmx5IHdpdGggUFNSMSwgYnV0IHNldHRpbmcgdGhlIG1v
ZHVsZSBwYXJhbWV0ZXIKZW5hYmxlX3BzciBlbmFibGVzIFBTUjIgaWYgdGhlIHBhbmVsIHN1cHBv
cnRzIGl0LiBNYWtlIHVzZSBvZiB0aGUgbmV3bHkKYWRkZWQgZGVidWdmcyB0b2dnbGUgdG8gZW5h
YmxlIG9ubHkgUFNSMSB3aGVuIHRlc3RpbmcuCgpTaWduZWQtb2ZmLWJ5OiBEaGluYWthcmFuIFBh
bmRpeWFuIDxkaGluYWthcmFuLnBhbmRpeWFuQGludGVsLmNvbT4KLS0tCiB0ZXN0cy9rbXNfcHNy
LmMgfCA4ICsrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19wc3IuYyBiL3Rlc3RzL2ttc19wc3IuYwpp
bmRleCAzZTY0Y2YwNC4uZmNjMDQ3NzAgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19wc3IuYworKysg
Yi90ZXN0cy9rbXNfcHNyLmMKQEAgLTQxNCw4ICs0MTQsOSBAQCBpbnQgbWFpbihpbnQgYXJnYywg
Y2hhciAqYXJndltdKQogCQlrbXN0ZXN0X3NldF92dF9ncmFwaGljc19tb2RlKCk7CiAJCWRhdGEu
ZGV2aWQgPSBpbnRlbF9nZXRfZHJtX2RldmlkKGRhdGEuZHJtX2ZkKTsKIAotCQlpZ3Rfc2V0X21v
ZHVsZV9wYXJhbV9pbnQoImVuYWJsZV9wc3IiLCBkYXRhLndpdGhfcHNyX2Rpc2FibGVkID8KLQkJ
CQkJIDAgOiAxKTsKKwkJaWYgKCFkYXRhLndpdGhfcHNyX2Rpc2FibGVkKQorCQkJcHNyX2VuYWJs
ZShkYXRhLmRlYnVnZnNfZmQpOworCiAJCWlndF9yZXF1aXJlX2Yoc2lua19zdXBwb3J0KCZkYXRh
KSwKIAkJCSAgICAgICJTaW5rIGRvZXMgbm90IHN1cHBvcnQgUFNSXG4iKTsKIApAQCAtNDkwLDYg
KzQ5MSw5IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCiAJfQogCiAJaWd0X2Zp
eHR1cmUgeworCQlpZiAoIWRhdGEud2l0aF9wc3JfZGlzYWJsZWQpCisJCQlwc3JfZGlzYWJsZShk
YXRhLmRlYnVnZnNfZmQpOworCiAJCWNsb3NlKGRhdGEuZGVidWdmc19mZCk7CiAJCWRybV9pbnRl
bF9idWZtZ3JfZGVzdHJveShkYXRhLmJ1Zm1ncik7CiAJCWRpc3BsYXlfZmluaSgmZGF0YSk7Ci0t
IAoyLjE0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
