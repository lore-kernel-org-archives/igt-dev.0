Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10B53892D6
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Feb 2018 09:00:30 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Tue, 20 Feb 2018 11:00:21 +0200
Message-Id: <20180220090022.31902-1-arkadiusz.hiler@intel.com>
Subject: [igt-dev] [PATCH i-g-t 1/2] meson: Use bufmgr stubs headers if
 libdrm_intel is not found
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
Cc: Liviu Dudau <liviu.dudau@arm.com>
List-ID: <igt-dev@lists.freedesktop.org>

SnVzdCBhZGRpbmcgdGhlIC5oIGZpbGUgdG8gbGliX2hlYWRlcnMgaXMgbm90IGVub3VnaC4KCldl
IGhhdmUgdG8gcGFzcyAnc3R1YnMvZHJtJyBhcyBhIHBhcnQgb2YgaW5jbHVkZV9kaXJlY3Rvcmll
cyB3aGVuCmJ1aWxkaW5nLCBzbyBhIHByb3BlciAtSSB3aWxsIGJlIGlzc3VlZCB0byB0aGUgY29t
cGlsZXIuIFRoaXMgY2FuIGJlCmRvbmUgYnkgdHVybmluZyAnaW5jJyBpbnRvIGEgbGlzdCBvZiBp
bmNsdWRlX2RpcmVjdG9yaWVzKCktZ2VuZXJhdGVkCm9iamVjdHMuCgpDYzogTGl2aXUgRHVkYXUg
PGxpdml1LmR1ZGF1QGFybS5jb20+CkNjOiBFcmljIEFuaG9sdCA8ZXJpY0BhbmhvbHQubmV0PgpT
aWduZWQtb2ZmLWJ5OiBBcmthZGl1c3ogSGlsZXIgPGFya2FkaXVzei5oaWxlckBpbnRlbC5jb20+
Ci0tLQogbGliL21lc29uLmJ1aWxkIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykKCmRpZmYgLS1naXQgYS9saWIvbWVzb24uYnVpbGQgYi9saWIvbWVzb24uYnVpbGQKaW5kZXgg
OTRlYTA3OTkuLjA0YjRmZmY2IDEwMDY0NAotLS0gYS9saWIvbWVzb24uYnVpbGQKKysrIGIvbGli
L21lc29uLmJ1aWxkCkBAIC0xMjEsNiArMTIxLDcgQEAgaWYgbGliZHJtX2ludGVsLmZvdW5kKCkK
IGVsc2UKIAlsaWJfaGVhZGVycyArPSAnc3R1YnMvZHJtL2ludGVsX2J1Zm1nci5oJwogCWxpYl9z
b3VyY2VzICs9ICdzdHVicy9kcm0vaW50ZWxfYnVmbWdyLmMnCisJaW5jID0gWyBpbmMsIGluY2x1
ZGVfZGlyZWN0b3JpZXMoJ3N0dWJzL2RybScpIF0KIGVuZGlmCiAKIGlmIHZhbGdyaW5kLmZvdW5k
KCkKLS0gCjIuMTQuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
