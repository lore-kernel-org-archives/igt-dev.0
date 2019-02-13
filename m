Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 100EC6E70A
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Feb 2019 10:36:04 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id a2so1510633edi.0
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Feb 2019 02:36:03 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 13 Feb 2019 11:35:47 +0100
Message-Id: <20190213103551.5438-5-daniel.vetter@ffwll.ch>
In-Reply-To: <20190213103551.5438-1-daniel.vetter@ffwll.ch>
References: <20190213103551.5438-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 5/9] tests/gem_exec_reuse: Don't leak the
 hang detector
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
To: IGT development <igt-dev@lists.freedesktop.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

TXkgbmV3ICJhcmUgdGhlcmUgYW55IGNoaWxkIHByb2Nlc3NlcyBsZWZ0PyIgY2hlY2sgaW4gaWd0
X2V4aXQgY2F0Y2hlZAp0aGlzIG9uZS4KClJldmlld2VkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlz
QGNocmlzLXdpbHNvbi5jby51az4KU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVs
LnZldHRlckBpbnRlbC5jb20+Ci0tLQogdGVzdHMvaTkxNS9nZW1fZXhlY19yZXVzZS5jIHwgMyAr
KysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90ZXN0cy9p
OTE1L2dlbV9leGVjX3JldXNlLmMgYi90ZXN0cy9pOTE1L2dlbV9leGVjX3JldXNlLmMKaW5kZXgg
ZGYyMjBiZTdiYWI4Li41NTkwNDcxODhmYmQgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2k5MTUvZ2VtX2V4
ZWNfcmV1c2UuYworKysgYi90ZXN0cy9pOTE1L2dlbV9leGVjX3JldXNlLmMKQEAgLTIxMyw0ICsy
MTMsNyBAQCBpZ3RfbWFpbgogCQlmb3IgKG4gPSAwOyBuIDwgbmNvbnRleHRzOyBuKyspCiAJCQln
ZW1fY29udGV4dF9kZXN0cm95KG5vLmZkLCBjb250ZXh0c1tuXSk7CiAJfQorCisJaWd0X2ZpeHR1
cmUKKwkJaWd0X3N0b3BfaGFuZ19kZXRlY3RvcigpOwogfQotLSAKMi4yMC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlz
dAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
