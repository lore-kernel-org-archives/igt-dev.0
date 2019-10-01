Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B3B6E794
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Oct 2019 13:15:16 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Tue,  1 Oct 2019 15:14:17 +0200
Message-Id: <20191001131417.13898-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/i915_module_load: Use new name of
 fault injection module parameter
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
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

TmFtZSBvZiB0aGUgaTkxNSBtb2R1bGUgcGFyYW1ldGVyIHByb3ZpZGluZyBmYXVsdCBpbmplY3Rp
b24gZnVuY3Rpb24gaXMKY2hhbmdpbmcgZm9yIGNvbnNpc3RlbmN5IHdpdGggYSBuZXcgY29udmVu
dGlvbiBvZiBuYW1pbmcgaTkxNSBkcml2ZXIKaW50ZXJuYWwgZnVuY3Rpb25zIGNhbGxlZCBmcm9t
IHRoZSBkcml2ZXIgUENJIC5wcm9iZSBlbnRyeSBwb2ludC4gIEFkanVzdAp0aGUgdGVzdCB0byB1
c2UgdGhlIG5ldyBuYW1lLgoKU3VnZ2VzdGVkLWJ5OiBKb29uYXMgTGFodGluZW4gPGpvb25hcy5s
YWh0aW5lbkBsaW51eC5pbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEphbnVzeiBLcnp5c3p0b2Zp
ayA8amFudXN6LmtyenlzenRvZmlrQGxpbnV4LmludGVsLmNvbT4KQ2M6IE1pY2hhxYIgV2FqZGVj
emtvIDxtaWNoYWwud2FqZGVjemtvQGludGVsLmNvbT4KQ2M6IE1pY2hhxYIgV2luaWFyc2tpIDxt
aWNoYWwud2luaWFyc2tpQGludGVsLmNvbT4KQ2M6IFBpb3RyIFBpw7Nya293c2tpIDxwaW90ci5w
aW9ya293c2tpQGludGVsLmNvbT4KQ2M6IFRvbWFzeiBMaXMgPHRvbWFzei5saXNAaW50ZWwuY29t
PgpDYzogSm9vbmFzIExhaHRpbmVuIDxqb29uYXMubGFodGluZW5AbGludXguaW50ZWwuY29tPgot
LS0KIHRlc3RzL2k5MTUvaTkxNV9tb2R1bGVfbG9hZC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9p
OTE1X21vZHVsZV9sb2FkLmMgYi90ZXN0cy9pOTE1L2k5MTVfbW9kdWxlX2xvYWQuYwppbmRleCA3
ZmU4MzUyMC4uYTYyMGFiNDEgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2k5MTUvaTkxNV9tb2R1bGVfbG9h
ZC5jCisrKyBiL3Rlc3RzL2k5MTUvaTkxNV9tb2R1bGVfbG9hZC5jCkBAIC0zNTYsNyArMzU2LDcg
QEAgaWd0X21haW4KIAogCQlpZ3RfaTkxNV9kcml2ZXJfdW5sb2FkKCk7CiAKLQkJd2hpbGUgKGlu
amVjdF9mYXVsdCgiaTkxNSIsICJpbmplY3RfbG9hZF9mYWlsdXJlIiwgKytpKSA9PSAwKQorCQl3
aGlsZSAoaW5qZWN0X2ZhdWx0KCJpOTE1IiwgImluamVjdF9wcm9iZV9mYWlsdXJlIiwgKytpKSA9
PSAwKQogCQkJOwogCiAJCS8qIFdlIGV4cGVjdCB0byBoaXQgYXQgbGVhc3Qgb25lIGZhdWx0ISAq
LwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
