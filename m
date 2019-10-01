Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16EA86E7E5
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Oct 2019 14:28:12 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Tue,  1 Oct 2019 16:27:24 +0200
Message-Id: <20191001142724.16472-2-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20191001142724.16472-1-janusz.krzysztofik@linux.intel.com>
References: <20191001142724.16472-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 1/1] tests/i915_module_load: Use new name
 of fault injection module parameter
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
PgpDYzogSm9vbmFzIExhaHRpbmVuIDxqb29uYXMubGFodGluZW5AbGludXguaW50ZWwuY29tPgpS
ZXZpZXdlZC1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Ci0tLQog
dGVzdHMvaTkxNS9pOTE1X21vZHVsZV9sb2FkLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9pOTE1L2k5MTVf
bW9kdWxlX2xvYWQuYyBiL3Rlc3RzL2k5MTUvaTkxNV9tb2R1bGVfbG9hZC5jCmluZGV4IDdmZTgz
NTIwLi5hNjIwYWI0MSAxMDA2NDQKLS0tIGEvdGVzdHMvaTkxNS9pOTE1X21vZHVsZV9sb2FkLmMK
KysrIGIvdGVzdHMvaTkxNS9pOTE1X21vZHVsZV9sb2FkLmMKQEAgLTM1Niw3ICszNTYsNyBAQCBp
Z3RfbWFpbgogCiAJCWlndF9pOTE1X2RyaXZlcl91bmxvYWQoKTsKIAotCQl3aGlsZSAoaW5qZWN0
X2ZhdWx0KCJpOTE1IiwgImluamVjdF9sb2FkX2ZhaWx1cmUiLCArK2kpID09IDApCisJCXdoaWxl
IChpbmplY3RfZmF1bHQoImk5MTUiLCAiaW5qZWN0X3Byb2JlX2ZhaWx1cmUiLCArK2kpID09IDAp
CiAJCQk7CiAKIAkJLyogV2UgZXhwZWN0IHRvIGhpdCBhdCBsZWFzdCBvbmUgZmF1bHQhICovCi0t
IAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
