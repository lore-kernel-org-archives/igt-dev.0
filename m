Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEFC489359
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2019 16:21:19 +0000 (UTC)
From: Simon Ser <simon.ser@intel.com>
Date: Fri, 26 Apr 2019 19:21:08 +0300
Message-Id: <20190426162110.1768-6-simon.ser@intel.com>
In-Reply-To: <20190426162110.1768-1-simon.ser@intel.com>
References: <20190426162110.1768-1-simon.ser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 5/7] tests/kms_chamelium: enable audio test
 on HDMI ports
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
Cc: Martin Peres <martin.peres@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Tm93IHRoYXQgd2UgaGF2ZSBhbGwgdGhlIHJlcXVpcmVkIEVESUQgYml0cyBpbiBwbGFjZSwgd2Ug
Y2FuIGFkZCBhIG5ldwpoZG1pLWF1ZGlvIHRlc3QuCgpTaWduZWQtb2ZmLWJ5OiBTaW1vbiBTZXIg
PHNpbW9uLnNlckBpbnRlbC5jb20+Ci0tLQogdGVzdHMva21zX2NoYW1lbGl1bS5jIHwgMyArKysK
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90ZXN0cy9rbXNf
Y2hhbWVsaXVtLmMgYi90ZXN0cy9rbXNfY2hhbWVsaXVtLmMKaW5kZXggNzE4ZTRhYWQuLjdlODRj
ZDFjIDEwMDY0NAotLS0gYS90ZXN0cy9rbXNfY2hhbWVsaXVtLmMKKysrIGIvdGVzdHMva21zX2No
YW1lbGl1bS5jCkBAIC0xODUyLDYgKzE4NTIsOSBAQCBpZ3RfbWFpbgogCiAJCWNvbm5lY3Rvcl9z
dWJ0ZXN0KCJoZG1pLWZyYW1lLWR1bXAiLCBIRE1JQSkKIAkJCXRlc3RfZGlzcGxheV9mcmFtZV9k
dW1wKCZkYXRhLCBwb3J0KTsKKworCQljb25uZWN0b3Jfc3VidGVzdCgiaGRtaS1hdWRpbyIsIEhE
TUlBKQorCQkJdGVzdF9kaXNwbGF5X2F1ZGlvKCZkYXRhLCBwb3J0LCAiSERNSSIsIGRhdGEuZWRp
ZF9pZCk7CiAJfQogCiAJaWd0X3N1YnRlc3RfZ3JvdXAgewotLSAKMi4yMS4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlz
dAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
