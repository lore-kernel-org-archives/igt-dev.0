Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E6816E02F
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2019 21:58:05 +0000 (UTC)
From: Antonio Argenziano <antonio.argenziano@intel.com>
Date: Tue, 12 Mar 2019 14:57:36 -0700
Message-Id: <20190312215738.5598-3-antonio.argenziano@intel.com>
In-Reply-To: <20190312215738.5598-1-antonio.argenziano@intel.com>
References: <20190312215738.5598-1-antonio.argenziano@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC 2/4] tests/i915/gem_mmap: Add invalid parameters
 tests
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

QWRkIGEgY291cGxlIG9mIHRlc3RzIHRoYXQgc3VwcGx5IGludmFsaWQgcGFyYW1ldGVycyB0byB0
aGUgbW1hcCBJT0NUTC4KClNpZ25lZC1vZmYtYnk6IEFudG9uaW8gQXJnZW56aWFubyA8YW50b25p
by5hcmdlbnppYW5vQGludGVsLmNvbT4KLS0tCiB0ZXN0cy9pOTE1L2dlbV9tbWFwLmMgfCAxOCAr
KysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvdGVzdHMvaTkxNS9nZW1fbW1hcC5jIGIvdGVzdHMvaTkxNS9nZW1fbW1hcC5jCmlu
ZGV4IDBlZDE1ODc4Li4yYTY3NmI5YSAxMDA2NDQKLS0tIGEvdGVzdHMvaTkxNS9nZW1fbW1hcC5j
CisrKyBiL3Rlc3RzL2k5MTUvZ2VtX21tYXAuYwpAQCAtMTM2LDYgKzEzNiwyNCBAQCBpZ3RfbWFp
bgogCQlpZ3RfYXNzZXJ0KHJldCA9PSAtMSAmJiBlcnJubyA9PSBFTk9FTlQpOwogCX0KIAorCWln
dF9zdWJ0ZXN0KCJiYWQtb2Zmc2V0IikgeworCQltZW1zZXQoJmFyZywgMCwgc2l6ZW9mKGFyZykp
OworCQlhcmcuaGFuZGxlID0gZ2VtX2NyZWF0ZShmZCwgNDA5Nik7CisJCWFyZy5vZmZzZXQgPSA0
MDk2ICsgMTsKKwkJYXJnLnNpemUgPSA0MDk2OworCQlyZXQgPSBpb2N0bChmZCwgRFJNX0lPQ1RM
X0k5MTVfR0VNX01NQVAsICZhcmcpOworCQlpZ3RfYXNzZXJ0KHJldCA9PSAtMSAmJiBlcnJubyA9
PSBFSU5WQUwpOworCX0KKworCWlndF9zdWJ0ZXN0KCJiYWQtc2l6ZSIpIHsKKwkJbWVtc2V0KCZh
cmcsIDAsIHNpemVvZihhcmcpKTsKKwkJYXJnLmhhbmRsZSA9IGdlbV9jcmVhdGUoZmQsIDQwOTYp
OworCQlhcmcub2Zmc2V0ID0gNDA5NjsKKwkJYXJnLnNpemUgPSAwOworCQlyZXQgPSBpb2N0bChm
ZCwgRFJNX0lPQ1RMX0k5MTVfR0VNX01NQVAsICZhcmcpOworCQlpZ3RfYXNzZXJ0KHJldCA9PSAt
MSAmJiBlcnJubyA9PSBFSU5WQUwpOworCX0KKwogCWlndF9zdWJ0ZXN0KCJiYXNpYyIpIHsKIAkJ
YXJnLmhhbmRsZSA9IGdlbV9jcmVhdGUoZmQsIE9CSkVDVF9TSVpFKTsKIAkJYXJnLm9mZnNldCA9
IDA7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
