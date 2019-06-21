Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EEAB6E865
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jun 2019 10:01:15 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
Date: Fri, 21 Jun 2019 15:33:12 +0530
Message-Id: <20190621100345.20019-11-ramalingam.c@intel.com>
In-Reply-To: <20190621100345.20019-1-ramalingam.c@intel.com>
References: <20190621100345.20019-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC v2 10/43] tests/i915/gem_concurrent_all: use the
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
aTkxNS9nZW1fY29uY3VycmVudF9hbGwuYyB8IDggKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9n
ZW1fY29uY3VycmVudF9hbGwuYyBiL3Rlc3RzL2k5MTUvZ2VtX2NvbmN1cnJlbnRfYWxsLmMKaW5k
ZXggM2RkYWFiODIwNTI1Li44YTk3NTY0MDYzZTEgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2k5MTUvZ2Vt
X2NvbmN1cnJlbnRfYWxsLmMKKysrIGIvdGVzdHMvaTkxNS9nZW1fY29uY3VycmVudF9hbGwuYwpA
QCAtOTQ5LDE1ICs5NDksMTUgQEAgc3RhdGljIGlndF9oYW5nX3QgcmNzX2hhbmcodm9pZCkKIHN0
YXRpYyBpZ3RfaGFuZ190IGFsbF9oYW5nKHZvaWQpCiB7CiAJaWd0X2hhbmdfdCBoYW5nID0gaWd0
X2hhbmdfcmluZyhmZCwgSTkxNV9FWEVDX1JFTkRFUik7Ci0JdW5zaWduZWQgZW5naW5lOworCWNv
bnN0IHN0cnVjdCBpbnRlbF9leGVjdXRpb25fZW5naW5lMiAqZTsKIAotCWZvcl9lYWNoX3BoeXNp
Y2FsX2VuZ2luZShmZCwgZW5naW5lKSB7CisJX19mb3JfZWFjaF9waHlzaWNhbF9lbmdpbmUoZmQs
IGUpIHsKIAkJc3RydWN0IGRybV9pOTE1X2dlbV9leGVjYnVmZmVyMiBlYiA9IGhhbmcuc3Bpbi0+
ZXhlY2J1ZjsKIAotCQlpZiAoZW5naW5lID09IEk5MTVfRVhFQ19SRU5ERVIpCisJCWlmIChlLT5j
bGFzcyA9PSBJOTE1X0VOR0lORV9DTEFTU19SRU5ERVIpCiAJCQljb250aW51ZTsKIAotCQllYi5m
bGFncyA9IGVuZ2luZTsKKwkJZWIuZmxhZ3MgPSBlLT5mbGFnczsKIAkJX19nZW1fZXhlY2J1Zihm
ZCwgJmViKTsKIAl9CiAKLS0gCjIuMTkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pZ3QtZGV2
