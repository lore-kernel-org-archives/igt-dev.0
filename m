Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07FA86E6DF
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Aug 2018 21:13:37 +0000 (UTC)
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Fri, 17 Aug 2018 14:13:32 -0700
Message-Id: <20180817211332.28910-1-rodrigo.vivi@intel.com>
In-Reply-To: <153453958025.10736.6870367123314362272@skylake-alporthouse-com>
References: <153453958025.10736.6870367123314362272@skylake-alporthouse-com>
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
cAp0aGUgdGVzdC4KCnYyOiBVc2UgaTkxNV9kbWNfaW5mbyBwcmVzZW5jZSB0byBkZXRlY3QgZG1j
IHJlcXVpcmVtZW50CiAgICBpbnN0ZWFkIG9mIGdlbiBjaGVjayBhcyBDaHJpcyBzdWdnZXN0ZWQu
CgpDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CkNjOiBJbXJlIERl
YWsgPGltcmUuZGVha0BpbnRlbC5jb20+CkNjOiBBbnVzaGEgU3JpdmF0c2EgPGFudXNoYS5zcml2
YXRzYUBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZp
QGludGVsLmNvbT4KLS0tCiB0ZXN0cy9wbV9ycG0uYyB8IDEyICsrKysrKysrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90ZXN0cy9wbV9ycG0uYyBi
L3Rlc3RzL3BtX3JwbS5jCmluZGV4IGJiZTM2ZTU5Li4yNDMyNWZlYiAxMDA2NDQKLS0tIGEvdGVz
dHMvcG1fcnBtLmMKKysrIGIvdGVzdHMvcG1fcnBtLmMKQEAgLTY5Myw2ICs2OTMsMTcgQEAgc3Rh
dGljIHZvaWQgc2V0dXBfcGM4KHZvaWQpCiAJaGFzX3BjOCA9IHRydWU7CiB9CiAKK3N0YXRpYyBi
b29sIGRtY19sb2FkZWQodm9pZCkKK3sKKwljaGFyIGJ1ZlsxNV07CisKKwlpZiAoaWd0X3N5c2Zz
X3JlYWQoZGVidWdmcywgImk5MTVfZG1jX2luZm8iLCBidWYsIHNpemVvZihidWYpKSA8IDApCisJ
ICAgIHJldHVybiB0cnVlOyAvKiBubyBDU1Igc3VwcG9ydCwgbm8gRE1DIHJlcXVpcmVtZW50ICov
CisKKwlpZ3RfaW5mbygiRE1DOiAlc1xuIiwgYnVmKTsKKwlyZXR1cm4gc3Ryc3RyKGJ1ZiwgImZ3
IGxvYWRlZDogeWVzIik7Cit9CisKIHN0YXRpYyBib29sIHNldHVwX2Vudmlyb25tZW50KHZvaWQp
CiB7CiAJaWYgKGhhc19ydW50aW1lX3BtKQpAQCAtNzE1LDYgKzcyNiw3IEBAIHN0YXRpYyBib29s
IHNldHVwX2Vudmlyb25tZW50KHZvaWQpCiAJaWd0X2luZm8oIlJ1bnRpbWUgUE0gc3VwcG9ydDog
JWRcbiIsIGhhc19ydW50aW1lX3BtKTsKIAlpZ3RfaW5mbygiUEM4IHJlc2lkZW5jeSBzdXBwb3J0
OiAlZFxuIiwgaGFzX3BjOCk7CiAJaWd0X3JlcXVpcmUoaGFzX3J1bnRpbWVfcG0pOworCWlndF9y
ZXF1aXJlKGRtY19sb2FkZWQoKSk7CiAKIG91dDoKIAlkaXNhYmxlX2FsbF9zY3JlZW5zKCZtc19k
YXRhKTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
Cg==
