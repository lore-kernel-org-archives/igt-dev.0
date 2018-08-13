Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81DBF6E126
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Aug 2018 10:26:24 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Mon, 13 Aug 2018 13:26:13 +0300
Message-Id: <20180813102613.21493-2-arkadiusz.hiler@intel.com>
In-Reply-To: <20180813102613.21493-1-arkadiusz.hiler@intel.com>
References: <20180813102613.21493-1-arkadiusz.hiler@intel.com>
Subject: [igt-dev] [PATCH i-g-t 2/2] runner/meson: Add support for use_rpath
 option
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
List-ID: <igt-dev@lists.freedesktop.org>

Q2M6IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5
OiBBcmthZGl1c3ogSGlsZXIgPGFya2FkaXVzei5oaWxlckBpbnRlbC5jb20+Ci0tLQogcnVubmVy
L21lc29uLmJ1aWxkIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9ydW5uZXIvbWVzb24uYnVpbGQgYi9ydW5uZXIvbWVzb24uYnVpbGQKaW5kZXgg
YmVhMWQ4OTcuLjZjNGI0ODYyIDEwMDY0NAotLS0gYS9ydW5uZXIvbWVzb24uYnVpbGQKKysrIGIv
cnVubmVyL21lc29uLmJ1aWxkCkBAIC0yMiwxOCArMjIsMjEgQEAgaWYgX2J1aWxkX3J1bm5lciBh
bmQganNvbmMuZm91bmQoKQogCQkJICAgIGxpbmtfd2l0aCA6IHJ1bm5lcmxpYiwKIAkJCSAgICBp
bnN0YWxsIDogdHJ1ZSwKIAkJCSAgICBpbnN0YWxsX2RpciA6IGJpbmRpciwKKwkJCSAgICBpbnN0
YWxsX3JwYXRoIDogYmluZGlyX3JwYXRoZGlyLAogCQkJICAgIGRlcGVuZGVuY2llcyA6IGlndF9k
ZXBzKQogCiAJcmVzdW1lID0gZXhlY3V0YWJsZSgnaWd0X3Jlc3VtZScsIHJlc3VtZV9zb3VyY2Vz
LAogCQkJICAgIGxpbmtfd2l0aCA6IHJ1bm5lcmxpYiwKIAkJCSAgICBpbnN0YWxsIDogdHJ1ZSwK
IAkJCSAgICBpbnN0YWxsX2RpciA6IGJpbmRpciwKKwkJCSAgICBpbnN0YWxsX3JwYXRoIDogYmlu
ZGlyX3JwYXRoZGlyLAogCQkJICAgIGRlcGVuZGVuY2llcyA6IGlndF9kZXBzKQogCiAJcmVzdWx0
cyA9IGV4ZWN1dGFibGUoJ2lndF9yZXN1bHRzJywgcmVzdWx0c19zb3VyY2VzLAogCQkJICAgICBs
aW5rX3dpdGggOiBydW5uZXJsaWIsCiAJCQkgICAgIGluc3RhbGwgOiB0cnVlLAogCQkJICAgICBp
bnN0YWxsX2RpciA6IGJpbmRpciwKKwkJCSAgICAgaW5zdGFsbF9ycGF0aCA6IGJpbmRpcl9ycGF0
aGRpciwKIAkJCSAgICAgZGVwZW5kZW5jaWVzIDogaWd0X2RlcHMpCiAKIAlydW5uZXJfdGVzdCA9
IGV4ZWN1dGFibGUoJ3J1bm5lcl90ZXN0JywgcnVubmVyX3Rlc3Rfc291cmNlcywKLS0gCjIuMTcu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRl
diBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
