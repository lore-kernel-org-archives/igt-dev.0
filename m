Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1816D72EEE
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jul 2021 20:00:58 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 26 Jul 2021 21:59:43 +0200
Message-Id: <20210726200026.4815-10-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210726200026.4815-1-zbigniew.kempczynski@intel.com>
References: <20210726200026.4815-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 09/52] tests/gem_bad_reloc: Skip on gens
 where relocations are not supported
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

U2lnbmVkLW9mZi1ieTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNr
aUBpbnRlbC5jb20+CkNjOiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4K
Q2M6IEFzaHV0b3NoIERpeGl0IDxhc2h1dG9zaC5kaXhpdEBpbnRlbC5jb20+Ci0tLQogdGVzdHMv
aTkxNS9nZW1fYmFkX3JlbG9jLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUvZ2VtX2JhZF9yZWxvYy5jIGIvdGVzdHMvaTkxNS9n
ZW1fYmFkX3JlbG9jLmMKaW5kZXggM2NhMGYzNDUyLi4wZTljNGM3OWMgMTAwNjQ0Ci0tLSBhL3Rl
c3RzL2k5MTUvZ2VtX2JhZF9yZWxvYy5jCisrKyBiL3Rlc3RzL2k5MTUvZ2VtX2JhZF9yZWxvYy5j
CkBAIC0xOTUsNiArMTk1LDcgQEAgaWd0X21haW4KIAkJLyogQ2hlY2sgaWYgcmVsb2NhdGlvbnMg
c3VwcG9ydGVkIGJ5IHBsYXRmb3JtICovCiAJCWlndF9yZXF1aXJlKGdlbV9oYXNfcmVsb2NhdGlv
bnMoZmQpKTsKIAkJZ2VtX3JlcXVpcmVfYmxpdHRlcihmZCk7CisJCWlndF9yZXF1aXJlKGdlbV9o
YXNfcmVsb2NhdGlvbnMoZmQpKTsKIAl9CiAKIAlpZ3Rfc3VidGVzdCgibmVnYXRpdmUtcmVsb2Mi
KQotLSAKMi4yNi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
