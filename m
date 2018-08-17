Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F3206E0D8
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Aug 2018 20:51:30 +0000 (UTC)
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Fri, 17 Aug 2018 13:51:25 -0700
Message-Id: <20180817205125.2340-1-rodrigo.vivi@intel.com>
Subject: [igt-dev] [PATCH i-g-t] pm_rpm: Require DMC loaded before testing
 runtime_pm for gen9+
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

U2luY2Ugd2UgYmxvY2sgcnVudGltZSBQTSBpZiBETUMgaXMgbm90IGxvYWRlZCwgbGV0J3Mgc2tp
cAp0aGUgdGVzdC4KCkNjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4K
Q2M6IEltcmUgRGVhayA8aW1yZS5kZWFrQGludGVsLmNvbT4KQ2M6IEFudXNoYSBTcml2YXRzYSA8
YW51c2hhLnNyaXZhdHNhQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogUm9kcmlnbyBWaXZpIDxy
b2RyaWdvLnZpdmlAaW50ZWwuY29tPgotLS0KIHRlc3RzL3BtX3JwbS5jIHwgMTMgKysrKysrKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90ZXN0
cy9wbV9ycG0uYyBiL3Rlc3RzL3BtX3JwbS5jCmluZGV4IGJiZTM2ZTU5Li5mODQ0MmU0YSAxMDA2
NDQKLS0tIGEvdGVzdHMvcG1fcnBtLmMKKysrIGIvdGVzdHMvcG1fcnBtLmMKQEAgLTY5Myw2ICs2
OTMsMTYgQEAgc3RhdGljIHZvaWQgc2V0dXBfcGM4KHZvaWQpCiAJaGFzX3BjOCA9IHRydWU7CiB9
CiAKK3N0YXRpYyBib29sIGRtY19sb2FkZWQodm9pZCkKK3sKKwljaGFyIGJ1ZlsxNV07CisKKwlp
Z3RfZGVidWdmc19yZWFkKGRybV9mZCwgImk5MTVfZG1jX2luZm8iLCBidWYpOworCisJaWd0X2lu
Zm8oIkRNQzogJXNcbiIsIGJ1Zik7CisJcmV0dXJuIHN0cnN0cihidWYsICJmdyBsb2FkZWQ6IHll
cyIpOworfQorCiBzdGF0aWMgYm9vbCBzZXR1cF9lbnZpcm9ubWVudCh2b2lkKQogewogCWlmICho
YXNfcnVudGltZV9wbSkKQEAgLTcxNiw2ICs3MjYsOSBAQCBzdGF0aWMgYm9vbCBzZXR1cF9lbnZp
cm9ubWVudCh2b2lkKQogCWlndF9pbmZvKCJQQzggcmVzaWRlbmN5IHN1cHBvcnQ6ICVkXG4iLCBo
YXNfcGM4KTsKIAlpZ3RfcmVxdWlyZShoYXNfcnVudGltZV9wbSk7CiAKKwlpZiAoaW50ZWxfZ2Vu
KG1zX2RhdGEuZGV2aWQpID49IDkpCisJCWlndF9yZXF1aXJlKGRtY19sb2FkZWQoKSk7CisKIG91
dDoKIAlkaXNhYmxlX2FsbF9zY3JlZW5zKCZtc19kYXRhKTsKIAlyZXR1cm4gd2FpdF9mb3Jfc3Vz
cGVuZGVkKCk7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0
LWRldgo=
