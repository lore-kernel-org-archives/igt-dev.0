Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F41C6E866
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jun 2019 10:01:30 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
Date: Fri, 21 Jun 2019 15:33:20 +0530
Message-Id: <20190621100345.20019-19-ramalingam.c@intel.com>
In-Reply-To: <20190621100345.20019-1-ramalingam.c@intel.com>
References: <20190621100345.20019-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC v2 18/43] tests/i915/gem_exec_create: use the
 gem_engine_topology library
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
To: igt-dev@lists.freedesktop.org, tvrtko.ursulin@linux.intel.com, andi@etezian.org
List-ID: <igt-dev@lists.freedesktop.org>

UmVwbGFjZSB0aGUgbGVnYWN5IGZvcl9lYWNoX2VuZ2luZSogZGVmaW5lcyB3aXRoIHRoZSBvbmVz
CmltcGxlbWVudGVkIGluIHRoZSBnZW1fZW5naW5lX3RvcG9sb2d5IGxpYnJhcnkuCgpTaWduZWQt
b2ZmLWJ5OiBSYW1hbGluZ2FtIEMgPHJhbWFsaW5nYW0uY0BpbnRlbC5jb20+Ci0tLQogdGVzdHMv
aTkxNS9nZW1fZXhlY19jcmVhdGUuYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUvZ2VtX2V4
ZWNfY3JlYXRlLmMgYi90ZXN0cy9pOTE1L2dlbV9leGVjX2NyZWF0ZS5jCmluZGV4IDU0YTI0Mjll
NDlkOS4uOWUyMTMyMGQwMjIxIDEwMDY0NAotLS0gYS90ZXN0cy9pOTE1L2dlbV9leGVjX2NyZWF0
ZS5jCisrKyBiL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfY3JlYXRlLmMKQEAgLTYzLDExICs2MywxMSBA
QCBzdGF0aWMgdm9pZCBhbGwoaW50IGZkLCB1bnNpZ25lZCBmbGFncywgaW50IHRpbWVvdXQsIGlu
dCBuY3B1cykKIAlzdHJ1Y3QgZHJtX2k5MTVfZ2VtX2V4ZWNfb2JqZWN0MiBvYmo7CiAJdW5zaWdu
ZWQgZW5naW5lc1sxNl07CiAJdW5zaWduZWQgbmVuZ2luZTsKLQl1bnNpZ25lZCBlbmdpbmU7CisJ
Y29uc3Qgc3RydWN0IGludGVsX2V4ZWN1dGlvbl9lbmdpbmUyICplOwogCiAJbmVuZ2luZSA9IDA7
Ci0JZm9yX2VhY2hfcGh5c2ljYWxfZW5naW5lKGZkLCBlbmdpbmUpCi0JCWVuZ2luZXNbbmVuZ2lu
ZSsrXSA9IGVuZ2luZTsKKwlfX2Zvcl9lYWNoX3BoeXNpY2FsX2VuZ2luZShmZCwgZSkKKwkJZW5n
aW5lc1tuZW5naW5lKytdID0gZS0+ZmxhZ3M7CiAJaWd0X3JlcXVpcmUobmVuZ2luZSk7CiAKIAlt
ZW1zZXQoJm9iaiwgMCwgc2l6ZW9mKG9iaikpOwotLSAKMi4xOS4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3Qt
ZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
