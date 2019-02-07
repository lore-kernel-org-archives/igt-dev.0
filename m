Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB0B96ECCD
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Feb 2019 19:37:35 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
Date: Fri,  8 Feb 2019 01:01:39 +0530
Message-Id: <1549567899-31800-3-git-send-email-ramalingam.c@intel.com>
In-Reply-To: <1549567899-31800-1-git-send-email-ramalingam.c@intel.com>
References: <1549567899-31800-1-git-send-email-ramalingam.c@intel.com>
Subject: [igt-dev] [PATCH i-g-t 3/3] kms_content_protection: Confirm that
 LIC is passed
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
To: igt-dev@lists.freedesktop.org, daniel@ffwll.ch
List-ID: <igt-dev@lists.freedesktop.org>

T25jZSB0aGUgSERDUCBpcyBlbmFibGVkLCBrZXJuZWwgd2lsbCBydW4gdGhlIGxpbmsgaW50ZWdy
aXR5IGNoZWNrKExJQykKYXRsZWFzdCBvbmNlIGluIDJTZWNzIGJhc2VkIG9uIHRoZSBIRENQIHZl
cnNpb25zLgoKU28gdG8gY29uZmlybSB0aGUgbGluayBpbnRlZ3JpdHkgY2hlY2sgaXMgcGFzc2Vk
LCB3ZSBvYmVydmUgdGhhdCBIRENQCnN0YXRlIHJlbWFpbnMgRU5BQkxFRCBmb3IgbmV4dCA0U2Vj
cy4KCnYyOgogIFJlYmFzZWQuCgpTaWduZWQtb2ZmLWJ5OiBSYW1hbGluZ2FtIEMgPHJhbWFsaW5n
YW0uY0BpbnRlbC5jb20+Ci0tLQogdGVzdHMva21zX2NvbnRlbnRfcHJvdGVjdGlvbi5jIHwgOSAr
KysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90
ZXN0cy9rbXNfY29udGVudF9wcm90ZWN0aW9uLmMgYi90ZXN0cy9rbXNfY29udGVudF9wcm90ZWN0
aW9uLmMKaW5kZXggZTJkNTEzNDQyMWFhLi4yMzRiYTA4ZmFlMGQgMTAwNjQ0Ci0tLSBhL3Rlc3Rz
L2ttc19jb250ZW50X3Byb3RlY3Rpb24uYworKysgYi90ZXN0cy9rbXNfY29udGVudF9wcm90ZWN0
aW9uLmMKQEAgLTIxNCw2ICsyMTQsMTQgQEAgc3RhdGljIGJvb2wgaWd0X3BpcGVfaXNfZnJlZShp
Z3RfZGlzcGxheV90ICpkaXNwbGF5LCBlbnVtIHBpcGUgcGlwZSkKIAlyZXR1cm4gdHJ1ZTsKIH0K
IAorc3RhdGljIHZvaWQgdGVzdF9jcF9saWMoaWd0X291dHB1dF90ICpvdXRwdXQpCit7CisJYm9v
bCByZXQ7CisKKwkvKiBXYWl0IGZvciA0U2VjcyAobWluIDIgY3ljbGVzIG9mIExpbmsgSW50ZWdy
aXR5IENoZWNrKSAqLworCXJldCA9IHdhaXRfZm9yX3Byb3BfdmFsdWUob3V0cHV0LCAxLCA0ICog
MTAwMCk7CisJaWd0X2Fzc2VydF9mKCFyZXQsICJDb250ZW50IFByb3RlY3Rpb24gTElDIEZhaWxl
ZFxuIik7Cit9CiAKIHN0YXRpYyB2b2lkIHRlc3RfY29udGVudF9wcm90ZWN0aW9uX29uX291dHB1
dChpZ3Rfb3V0cHV0X3QgKm91dHB1dCwKIAkJCQkJICAgICAgZW51bSBpZ3RfY29tbWl0X3N0eWxl
IHMsCkBAIC0yMzgsNiArMjQ2LDcgQEAgc3RhdGljIHZvaWQgdGVzdF9jb250ZW50X3Byb3RlY3Rp
b25fb25fb3V0cHV0KGlndF9vdXRwdXRfdCAqb3V0cHV0LAogCiAJCW1vZGVzZXRfd2l0aF9mYihw
aXBlLCBvdXRwdXQsIHMpOwogCQl0ZXN0X2NwX2VuYWJsZV93aXRoX3JldHJ5KG91dHB1dCwgcywg
Myk7CisJCXRlc3RfY3BfbGljKG91dHB1dCk7CiAKIAkJaWYgKGRwbXNfdGVzdCkgewogCQkJaWd0
X3BpcGVfc2V0X3Byb3BfdmFsdWUoZGlzcGxheSwgcGlwZSwgSUdUX0NSVENfQUNUSVZFLCAwKTsK
LS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
