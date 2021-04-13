Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64DD089A61
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Apr 2021 08:43:31 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 13 Apr 2021 10:42:26 +0200
Message-Id: <20210413084226.41287-40-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210413084226.41287-1-zbigniew.kempczynski@intel.com>
References: <20210413084226.41287-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v33 39/39] lib/intel_allocator: Wait for
 allocator thread to be ready
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

QmVmb3JlIGFsbG93aW5nIGFsbG9jYXRvciB3b3JraW5nIGluIG11bHRpcHJvY2VzcyBtb2RlIHdl
IGhhdmUgdG8KZW5zdXJlIGl0IGlzIHJlYWR5IGFuZCBhYmxlIHRvIHByb2Nlc3MgYWxsb2NhdG9y
IG1lc3NhZ2VzIHBhc3NlZApmcm9tIGNoaWxkcmVuLgoKU2lnbmVkLW9mZi1ieTogWmJpZ25pZXcg
S2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+CkNjOiBKYXNvbiBF
a3N0cmFuZCA8amFzb25Aamxla3N0cmFuZC5uZXQ+Ci0tLQogbGliL2ludGVsX2FsbG9jYXRvci5j
IHwgNyArKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvbGliL2ludGVsX2FsbG9jYXRvci5jIGIvbGliL2ludGVsX2FsbG9jYXRvci5jCmluZGV4IDhh
MmU2MDdjMy4uOTZmODM5ZDRiIDEwMDY0NAotLS0gYS9saWIvaW50ZWxfYWxsb2NhdG9yLmMKKysr
IGIvbGliL2ludGVsX2FsbG9jYXRvci5jCkBAIC03OTQsMTAgKzc5NCwxNyBAQCB2b2lkIF9faW50
ZWxfYWxsb2NhdG9yX211bHRpcHJvY2Vzc19wcmVwYXJlKHZvaWQpCiAJY2hhbm5lbC0+aW5pdChj
aGFubmVsKTsKIH0KIAorI2RlZmluZSBTVEFSVF9USU1FT1VUX01TIDEwMAogdm9pZCBfX2ludGVs
X2FsbG9jYXRvcl9tdWx0aXByb2Nlc3Nfc3RhcnQodm9pZCkKIHsKKwlpbnQgdGltZV9sZWZ0ID0g
U1RBUlRfVElNRU9VVF9NUzsKKwogCXB0aHJlYWRfY3JlYXRlKCZhbGxvY2F0b3JfdGhyZWFkLCBO
VUxMLAogCQkgICAgICAgYWxsb2NhdG9yX3RocmVhZF9sb29wLCBOVUxMKTsKKworCS8qIFdhaXQg
dW5sZXNzIGFsbG9jYXRvciB0aHJlYWQgZ2V0IHN0YXJ0ZWQgKi8KKwl3aGlsZSAodGltZV9sZWZ0
LS0gPiAwICYmICFSRUFEX09OQ0UoYWxsb2NhdG9yX3RocmVhZF9ydW5uaW5nKSkKKwkJdXNsZWVw
KDEwMDApOwogfQogCiAvKioKLS0gCjIuMjYuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pZ3QtZGV2Cg==
