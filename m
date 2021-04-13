Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB0489CBC
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Apr 2021 13:55:33 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 13 Apr 2021 15:54:41 +0200
Message-Id: <20210413135441.121421-39-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210413135441.121421-1-zbigniew.kempczynski@intel.com>
References: <20210413135441.121421-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v34 38/38] lib/intel_allocator: Wait for
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
List-ID: <igt-dev@lists.freedesktop.org>

QmVmb3JlIGFsbG93aW5nIGFsbG9jYXRvciB3b3JraW5nIGluIG11bHRpcHJvY2VzcyBtb2RlIHdl
IGhhdmUgdG8KZW5zdXJlIGl0IGlzIHJlYWR5IGFuZCBhYmxlIHRvIHByb2Nlc3MgYWxsb2NhdG9y
IG1lc3NhZ2VzIHBhc3NlZApmcm9tIGNoaWxkcmVuLgoKU2lnbmVkLW9mZi1ieTogWmJpZ25pZXcg
S2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+CkNjOiBKYXNvbiBF
a3N0cmFuZCA8amFzb25Aamxla3N0cmFuZC5uZXQ+CkFja2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWwudmV0dGVyQGZmd2xsLmNoPgpBY2tlZC1ieTogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0
dmFsYUBpbnRlbC5jb20+Ci0tLQogbGliL2ludGVsX2FsbG9jYXRvci5jIHwgNyArKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvbGliL2ludGVsX2Fs
bG9jYXRvci5jIGIvbGliL2ludGVsX2FsbG9jYXRvci5jCmluZGV4IDhhMmU2MDdjMy4uOTZmODM5
ZDRiIDEwMDY0NAotLS0gYS9saWIvaW50ZWxfYWxsb2NhdG9yLmMKKysrIGIvbGliL2ludGVsX2Fs
bG9jYXRvci5jCkBAIC03OTQsMTAgKzc5NCwxNyBAQCB2b2lkIF9faW50ZWxfYWxsb2NhdG9yX211
bHRpcHJvY2Vzc19wcmVwYXJlKHZvaWQpCiAJY2hhbm5lbC0+aW5pdChjaGFubmVsKTsKIH0KIAor
I2RlZmluZSBTVEFSVF9USU1FT1VUX01TIDEwMAogdm9pZCBfX2ludGVsX2FsbG9jYXRvcl9tdWx0
aXByb2Nlc3Nfc3RhcnQodm9pZCkKIHsKKwlpbnQgdGltZV9sZWZ0ID0gU1RBUlRfVElNRU9VVF9N
UzsKKwogCXB0aHJlYWRfY3JlYXRlKCZhbGxvY2F0b3JfdGhyZWFkLCBOVUxMLAogCQkgICAgICAg
YWxsb2NhdG9yX3RocmVhZF9sb29wLCBOVUxMKTsKKworCS8qIFdhaXQgdW5sZXNzIGFsbG9jYXRv
ciB0aHJlYWQgZ2V0IHN0YXJ0ZWQgKi8KKwl3aGlsZSAodGltZV9sZWZ0LS0gPiAwICYmICFSRUFE
X09OQ0UoYWxsb2NhdG9yX3RocmVhZF9ydW5uaW5nKSkKKwkJdXNsZWVwKDEwMDApOwogfQogCiAv
KioKLS0gCjIuMjYuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
