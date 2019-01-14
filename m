Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 790EF6E8B5
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jan 2019 12:42:58 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Mon, 14 Jan 2019 14:42:53 +0200
Message-Id: <20190114124253.26937-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/tools_test: Print the starting cwd
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
Cc: Tomi Sarvela <tomi.p.sarvela@intel.com>, Petri Latvala <petri.latvala@intel.com>, Martin Peres <martin.peres@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T2NjYXNpb25hbGx5IGluIENJIHRvb2xzX3Rlc3QgZ29lcyBsb29raW5nIGZvciB0b29scyBiaW5h
cmllcyBpbiAvYmluLAppbnN0ZWFkIG9mIC9vcHQvaWd0L2JpbiB3aGVyZSB0aGV5IHNob3VsZCBi
ZS4gUHJpbnQgb3V0IHRoZSBjd2QgYmVmb3JlCnRoZSBjaGRpcigpIGRhbmNlIHRvIGZpZ3VyZSBv
dXQgd2hhdCdzIGdvaW5nIG9uLgoKU2lnbmVkLW9mZi1ieTogUGV0cmkgTGF0dmFsYSA8cGV0cmku
bGF0dmFsYUBpbnRlbC5jb20+CkNjOiBBcmthZGl1c3ogSGlsZXIgPGFya2FkaXVzei5oaWxlckBp
bnRlbC5jb20+CkNjOiBUb21pIFNhcnZlbGEgPHRvbWkucC5zYXJ2ZWxhQGludGVsLmNvbT4KQ2M6
IE1hcnRpbiBQZXJlcyA8bWFydGluLnBlcmVzQGxpbnV4LmludGVsLmNvbT4KLS0tCiB0ZXN0cy90
b29sc190ZXN0LmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS90ZXN0cy90b29sc190ZXN0LmMgYi90ZXN0cy90b29sc190ZXN0LmMKaW5kZXgg
ODhhNmFlOTYuLmRlNTc0ZmE4IDEwMDY0NAotLS0gYS90ZXN0cy90b29sc190ZXN0LmMKKysrIGIv
dGVzdHMvdG9vbHNfdGVzdC5jCkBAIC04Miw2ICs4MiwxMCBAQCBpZ3RfbWFpbgogCWlndF9maXh0
dXJlIHsKIAkJY2hhciAqcGF0aDsKIAorCQlwYXRoID0gZ2V0X2N1cnJlbnRfZGlyX25hbWUoKTsK
KwkJaWd0X2luZm8oIkxvb2tpbmcgZm9yIHRvb2xzLCBjd2QgaXMgJXNcbiIsIHBhdGgpOworCQlm
cmVlKHBhdGgpOworCiAJCWlndF9yZXF1aXJlX2YoY2hkaXJfdG9fdG9vbHNfZGlyKCksCiAJCQkg
ICAgICAiVW5hYmxlIHRvIGRldGVybWluZSB0aGUgdG9vbHMgZGlyZWN0b3J5LCBleHBlY3Rpbmcg
dGhlbSBpbiAkY3dkLyIgVE9PTFMgIiBvciAkcGF0aC8iIFRPT0xTICJcbiIpOwogCQlwYXRoID0g
Z2V0X2N1cnJlbnRfZGlyX25hbWUoKTsKLS0gCjIuMTkuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9pZ3QtZGV2Cg==
