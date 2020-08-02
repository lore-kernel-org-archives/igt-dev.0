Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52B246E114
 for <igt-dev@lists.freedesktop.org>; Sun,  2 Aug 2020 15:23:21 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Sun,  2 Aug 2020 17:22:53 +0200
Message-Id: <20200802152309.4826-4-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200802152309.4826-1-zbigniew.kempczynski@intel.com>
References: <20200802152309.4826-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v22 03/19] lib/intel_bufops: change stride
 requirements for Grantsdale
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

U2lnbmVkLW9mZi1ieTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNr
aUBpbnRlbC5jb20+Ci0tLQogbGliL2ludGVsX2J1Zm9wcy5jIHwgOSArKysrKy0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
bGliL2ludGVsX2J1Zm9wcy5jIGIvbGliL2ludGVsX2J1Zm9wcy5jCmluZGV4IDJiYTRkYmY2Li5k
MDc3YjFhYyAxMDA2NDQKLS0tIGEvbGliL2ludGVsX2J1Zm9wcy5jCisrKyBiL2xpYi9pbnRlbF9i
dWZvcHMuYwpAQCAtNzUyLDggKzc1Miw3IEBAIHN0YXRpYyB2b2lkIF9faW50ZWxfYnVmX2luaXQo
c3RydWN0IGJ1Zl9vcHMgKmJvcHMsCiAKIAkJCWlmIChib3BzLT5pbnRlbF9nZW4gPCAzKQogCQkJ
CXRpbGVfd2lkdGggPSAxMjg7Ci0JCQllbHNlIGlmIChJU185MTVHTShkZXZpZCkgfHwgSVNfOTE1
RyhkZXZpZCkgfHwKLQkJCQkgYnVmLT50aWxpbmcgPT0gSTkxNV9USUxJTkdfWCkKKwkJCWVsc2Ug
aWYgKElTXzkxNUcoZGV2aWQpIHx8IGJ1Zi0+dGlsaW5nID09IEk5MTVfVElMSU5HX1gpCiAJCQkJ
dGlsZV93aWR0aCA9IDUxMjsKIAkJCWVsc2UKIAkJCQl0aWxlX3dpZHRoID0gMTI4OwpAQCAtMTAz
NywxMSArMTAzNiwxMyBAQCBzdGF0aWMgYm9vbCBwcm9iZV9od190aWxpbmcoc3RydWN0IGJ1Zl9v
cHMgKmJvcHMsIHVpbnQzMl90IHRpbGluZywKIHsKIAl1aW50NjRfdCBzaXplID0gMjU2ICogMjU2
OwogCXVpbnQzMl90IGhhbmRsZSwgYnVmX3RpbGluZywgYnVmX3N3aXp6bGUsIHBoeXNfc3dpenps
ZTsKLQl1aW50MzJfdCBzdHJpZGU7CisJdWludDMyX3QgZGV2aWQsIHN0cmlkZTsKIAlpbnQgcmV0
OwogCWJvb2wgaXNfc2V0ID0gZmFsc2U7CiAKLQlpZiAodGlsaW5nID09IEk5MTVfVElMSU5HX1gp
CisJZGV2aWQgPSAgaW50ZWxfZ2V0X2RybV9kZXZpZChib3BzLT5mZCk7CisKKwlpZiAodGlsaW5n
ID09IEk5MTVfVElMSU5HX1ggfHwgSVNfOTE1RyhkZXZpZCkpCiAJCXN0cmlkZSA9IDUxMjsKIAll
bHNlIGlmICh0aWxpbmcgPT0gSTkxNV9USUxJTkdfWSkKIAkJc3RyaWRlID0gMTI4OwotLSAKMi4y
Ni4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3Qt
ZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
