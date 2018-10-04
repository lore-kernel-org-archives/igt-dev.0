Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE556E29D
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Oct 2018 13:21:38 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id c22-v6so8527401edc.4
 for <igt-dev@lists.freedesktop.org>; Thu, 04 Oct 2018 06:21:38 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu,  4 Oct 2018 15:21:28 +0200
Message-Id: <20181004132128.6412-4-daniel.vetter@ffwll.ch>
In-Reply-To: <20181004132128.6412-1-daniel.vetter@ffwll.ch>
References: <20181004132128.6412-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/4] lib/kms: warn if we commit without
 outputs
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

V2l0aCB0aGUgaGlnaC1sZXZlbCBoZWxwZXJzIHJlcXVpcmluZyBvdXRwdXRzIHRoZXJlJ3Mgbm90
IHBvaW50CmluIHNpbGVudGx5IGlnbm9yaW5nIGlzc3VlcyBhbnltb3JlLiBDb21wbGFpbiBhYm91
dCB0aGF0IGlmIGl0CmV2ZXIgaGFwcGVucy4KCkNjOiBBbnRvbmlvIEFyZ2Vuemlhbm8gPGFudG9u
aW8uYXJnZW56aWFub0BpbnRlbC5jb20+CkNjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdp
bHNvbi5jby51az4KU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBp
bnRlbC5jb20+Ci0tLQogbGliL2lndF9rbXMuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9saWIvaWd0X2ttcy5j
IGIvbGliL2lndF9rbXMuYwppbmRleCA0NTRhYjc0ODFjZGUuLjg2N2VhYTdhOTcxYyAxMDA2NDQK
LS0tIGEvbGliL2lndF9rbXMuYworKysgYi9saWIvaWd0X2ttcy5jCkBAIC0zMjY5LDcgKzMyNjks
NyBAQCBzdGF0aWMgaW50IGRvX2Rpc3BsYXlfY29tbWl0KGlndF9kaXNwbGF5X3QgKmRpc3BsYXks
CiAJZW51bSBwaXBlIHBpcGU7CiAJTE9HX0lOREVOVChkaXNwbGF5LCAiY29tbWl0Iik7CiAKLQlp
ZiAoIWRpc3BsYXktPm5fcGlwZXMgfHwgIWRpc3BsYXktPm5fb3V0cHV0cykKKwlpZiAoaWd0X3dh
cm5fb24oIWRpc3BsYXktPm5fcGlwZXMgfHwgIWRpc3BsYXktPm5fb3V0cHV0cykpCiAJCXJldHVy
biAwOyAvKiBub3RoaW5nIHRvIGRvICovCiAKIAlpZ3RfZGlzcGxheV9yZWZyZXNoKGRpc3BsYXkp
OwpAQCAtMzMyMiw3ICszMzIyLDcgQEAgaW50IGlndF9kaXNwbGF5X3RyeV9jb21taXRfYXRvbWlj
KGlndF9kaXNwbGF5X3QgKmRpc3BsYXksIHVpbnQzMl90IGZsYWdzLCB2b2lkICoKIHsKIAlpbnQg
cmV0OwogCi0JaWYgKCFkaXNwbGF5LT5uX3BpcGVzIHx8ICFkaXNwbGF5LT5uX291dHB1dHMpCisJ
aWYgKGlndF93YXJuX29uKCFkaXNwbGF5LT5uX3BpcGVzIHx8ICFkaXNwbGF5LT5uX291dHB1dHMp
KQogCQlyZXR1cm4gMDsgLyogbm90aGluZyB0byBkbyAqLwogCiAJTE9HX0lOREVOVChkaXNwbGF5
LCAiY29tbWl0Iik7Ci0tIAoyLjE5LjAucmMyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2lndC1kZXYK
