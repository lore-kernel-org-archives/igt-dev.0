Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECC396E154
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Aug 2019 14:17:04 +0000 (UTC)
From: Simon Ser <simon.ser@intel.com>
Date: Tue, 13 Aug 2019 17:17:47 +0300
Message-Id: <20190813141748.18876-3-simon.ser@intel.com>
In-Reply-To: <20190813141748.18876-1-simon.ser@intel.com>
References: <20190813141748.18876-1-simon.ser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/3] lib/igt_kms: add support for link-status
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

VGhpcyBwYXRjaCBzaW1wbHkgYWRkcyBsaW5rLXN0YXR1cyB0byBvdXIgbGlzdCBvZiBwcm9wZXJ0
aWVzLgoKU2lnbmVkLW9mZi1ieTogU2ltb24gU2VyIDxzaW1vbi5zZXJAaW50ZWwuY29tPgotLS0K
IGxpYi9pZ3Rfa21zLmMgfCAxICsKIGxpYi9pZ3Rfa21zLmggfCAxICsKIDIgZmlsZXMgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvbGliL2lndF9rbXMuYyBiL2xpYi9pZ3Rf
a21zLmMKaW5kZXggYjAxNjlmNzNiNzUyLi5lYjljZGQ5NTNjOTggMTAwNjQ0Ci0tLSBhL2xpYi9p
Z3Rfa21zLmMKKysrIGIvbGliL2lndF9rbXMuYwpAQCAtNDE0LDYgKzQxNCw3IEBAIGNvbnN0IGNo
YXIgKiBjb25zdCBpZ3RfY29ubmVjdG9yX3Byb3BfbmFtZXNbSUdUX05VTV9DT05ORUNUT1JfUFJP
UFNdID0gewogCVtJR1RfQ09OTkVDVE9SX0NPTlRFTlRfUFJPVEVDVElPTl0gPSAiQ29udGVudCBQ
cm90ZWN0aW9uIiwKIAlbSUdUX0NPTk5FQ1RPUl9WUlJfQ0FQQUJMRV0gPSAidnJyX2NhcGFibGUi
LAogCVtJR1RfQ09OTkVDVE9SX0hEQ1BfQ09OVEVOVF9UWVBFXSA9ICJIRENQIENvbnRlbnQgVHlw
ZSIsCisJW0lHVF9DT05ORUNUT1JfTElOS19TVEFUVVNdID0gImxpbmstc3RhdHVzIiwKIH07CiAK
IC8qCmRpZmYgLS1naXQgYS9saWIvaWd0X2ttcy5oIGIvbGliL2lndF9rbXMuaAppbmRleCBjMGRj
YjZmMmE5ZmYuLmU0ODg5MWUxYWVkYyAxMDA2NDQKLS0tIGEvbGliL2lndF9rbXMuaAorKysgYi9s
aWIvaWd0X2ttcy5oCkBAIC0xMjQsNiArMTI0LDcgQEAgZW51bSBpZ3RfYXRvbWljX2Nvbm5lY3Rv
cl9wcm9wZXJ0aWVzIHsKICAgICAgICBJR1RfQ09OTkVDVE9SX0NPTlRFTlRfUFJPVEVDVElPTiwK
ICAgICAgICBJR1RfQ09OTkVDVE9SX1ZSUl9DQVBBQkxFLAogICAgICAgIElHVF9DT05ORUNUT1Jf
SERDUF9DT05URU5UX1RZUEUsCisgICAgICAgSUdUX0NPTk5FQ1RPUl9MSU5LX1NUQVRVUywKICAg
ICAgICBJR1RfTlVNX0NPTk5FQ1RPUl9QUk9QUwogfTsKIAotLSAKMi4yMi4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlz
dAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
