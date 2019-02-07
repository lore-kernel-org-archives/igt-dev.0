Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AA816EC63
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Feb 2019 15:07:11 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id a2so164122edi.0
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Feb 2019 07:07:11 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu,  7 Feb 2019 16:07:04 +0100
Message-Id: <20190207150704.31264-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20190207145707.27623-4-daniel.vetter@ffwll.ch>
References: <20190207145707.27623-4-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/tests: make sure we catch igt_fork leaks
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

VGVzdHMgaGF2ZSB0byBjYWxsIGlndF93YWl0Y2hpbGRyZW4oX3RpbWVvdXQpIGJlZm9yZSB0aGV5
IGZpbmlzaAooZWl0aGVyIHdpdGggc3VjY2VzcyBvciBhbiBpZ3RfZmFpbC9hc3NlcnQvc2tpcC93
aGF0ZXZlcikuCgpNYWtlIHN1cmUgd2UgY2F0Y2ggdGhpcy4KCnYyOiBBbm90aGVyIHRlc3RjYXNl
IHRvIG1ha2Ugc3VyZSBpZ3Rfd2FpdGNoaWxkcmVuX3RpbWVvdXQgY2xlYW5zIHVwLgoKU2lnbmVk
LW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Ci0tLQogbGli
L3Rlc3RzL2lndF9mb3JrLmMgfCAyNCArKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvbGliL3Rlc3RzL2lndF9mb3Jr
LmMgYi9saWIvdGVzdHMvaWd0X2ZvcmsuYwppbmRleCA1ZmYyOTU2ZGQwYWIuLjBlYTIyYmEzMGJi
OSAxMDA2NDQKLS0tIGEvbGliL3Rlc3RzL2lndF9mb3JrLmMKKysrIGIvbGliL3Rlc3RzL2lndF9m
b3JrLmMKQEAgLTYxLDYgKzYxLDIyIEBAIHN0YXRpYyB2b2lkIGlndF9mb3JrX3ZzX2Fzc2VydCh2
b2lkKQogCWlndF93YWl0Y2hpbGRyZW4oKTsKIH0KIAorc3RhdGljIHZvaWQgaWd0X2ZvcmtfbGVh
ayh2b2lkKQoreworCWlndF9mb3JrKGksIDEpIHsKKwkJc2xlZXAoMTApOworCX0KK30KKworc3Rh
dGljIHZvaWQgaWd0X2ZvcmtfdGltZW91dF9sZWFrKHZvaWQpCit7CisJaWd0X2ZvcmsoaSwgMSkg
eworCQlzbGVlcCgxMCk7CisJfQorCisJaWd0X3dhaXRjaGlsZHJlbl90aW1lb3V0KDEsICJsaWJy
YXJ5IHRlc3QiKTsKK30KKwogc3RhdGljIGludCBkb19mb3JrKHZvaWQgKCp0ZXN0X3RvX3J1biko
dm9pZCkpCiB7CiAJaW50IHBpZCwgc3RhdHVzOwpAQCAtOTgsNCArMTE0LDEyIEBAIGludCBtYWlu
KGludCBhcmdjLCBjaGFyICoqYXJndikKIAkvKiBjaGVjayB0aGF0IGlndF9za2lwIHdpdGhpbiBh
IGZvcmsgYmxvd3MgdXAgKi8KIAlyZXQgPSBkb19mb3JrKGlndF9mb3JrX3ZzX3NraXApOwogCWlu
dGVybmFsX2Fzc2VydChyZXQgPT0gU0lHQUJSVCArIDEyOCk7CisKKwkvKiBjaGVjayB0aGF0IGZh
aWx1cmUgdG8gY2xlYW4gdXAgZmFpbHMgKi8KKwlyZXQgPSBkb19mb3JrKGlndF9mb3JrX2xlYWsp
OworCWludGVybmFsX2Fzc2VydChyZXQgPT0gU0lHQUJSVCArIDEyOCk7CisKKwkvKiBjaGVjayB0
aGF0IGlndF93YWl0Y2hpbGRyZW5fdGltZW91dCBjbGVhbnMgdXAqLworCXJldCA9IGRvX2Zvcmso
aWd0X2ZvcmtfdGltZW91dF9sZWFrKTsKKwlpbnRlcm5hbF9hc3NlcnQocmV0ID09IFNJR0FCUlQg
KyAxMjgpOwogfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ln
dC1kZXYK
