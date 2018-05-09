Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A1F86E90E
 for <igt-dev@lists.freedesktop.org>; Wed,  9 May 2018 17:38:09 +0000 (UTC)
From: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Date: Wed,  9 May 2018 10:37:42 -0700
Message-Id: <20180509173746.23405-11-dhinakaran.pandiyan@intel.com>
In-Reply-To: <20180509173746.23405-1-dhinakaran.pandiyan@intel.com>
References: <20180509173746.23405-1-dhinakaran.pandiyan@intel.com>
Subject: [igt-dev] [PATCH i-g-t 10/14] tests/psr: Check for drrs status only
 after checking for PSR
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

VGhlIGdvYWwgb2YgdGhpcyB0ZXN0IGlzIChvciBzaG91bGQgYmUpIHRvIHZlcmlmeSBEUlJTIGlz
IGRpc2FibGVkIGlmIFBTUgp3YXMgZW5hYmxlZC4gVGhlcmUgaXMgbm8gcG9pbnQgaW4gY2hlY2tp
bmcgZm9yIERSUlMgc3RhdHVzIGlmIFBTUiB3YXMgbm90CmVuYWJsZWQgaW4gdGhlIGZpcnN0IHBs
YWNlLgoKU2lnbmVkLW9mZi1ieTogRGhpbmFrYXJhbiBQYW5kaXlhbiA8ZGhpbmFrYXJhbi5wYW5k
aXlhbkBpbnRlbC5jb20+ClJldmlld2VkLWJ5OiBLYXRhcnp5bmEgRGVjIDxrYXRhcnp5bmEuZGVj
QGludGVsLmNvbT4KLS0tCiB0ZXN0cy9rbXNfcHNyX3NpbmtfY3JjLmMgfCAxICsKIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19wc3Jfc2lua19j
cmMuYyBiL3Rlc3RzL2ttc19wc3Jfc2lua19jcmMuYwppbmRleCBhZjE4ZDQzZS4uMGY1ODhkNWYg
MTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19wc3Jfc2lua19jcmMuYworKysgYi90ZXN0cy9rbXNfcHNy
X3NpbmtfY3JjLmMKQEAgLTQ4NCw2ICs0ODQsNyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAq
YXJndltdKQogCiAJaWd0X3N1YnRlc3QoIm5vX2RycnMiKSB7CiAJCXNldHVwX3Rlc3RfcGxhbmUo
JmRhdGEpOworCQlpZ3RfYXNzZXJ0KHdhaXRfcHNyX2VudHJ5KCZkYXRhKSk7CiAJCWlndF9hc3Nl
cnQoZHJyc19kaXNhYmxlZCgmZGF0YSkpOwogCQl0ZXN0X2NsZWFudXAoJmRhdGEpOwogCX0KLS0g
CjIuMTQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
aWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
