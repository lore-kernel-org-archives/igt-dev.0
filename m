Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9590F89F75
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Feb 2019 16:29:18 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
Date: Thu,  7 Feb 2019 21:53:22 +0530
Message-Id: <1549556602-27228-3-git-send-email-ramalingam.c@intel.com>
In-Reply-To: <1549556602-27228-1-git-send-email-ramalingam.c@intel.com>
References: <1549556602-27228-1-git-send-email-ramalingam.c@intel.com>
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
cy4KClNpZ25lZC1vZmYtYnk6IFJhbWFsaW5nYW0gQyA8cmFtYWxpbmdhbS5jQGludGVsLmNvbT4K
LS0tCiB0ZXN0cy9rbXNfY29udGVudF9wcm90ZWN0aW9uLmMgfCA5ICsrKysrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19jb250ZW50
X3Byb3RlY3Rpb24uYyBiL3Rlc3RzL2ttc19jb250ZW50X3Byb3RlY3Rpb24uYwppbmRleCA4OTVl
OWU4ZDhiMTEuLjdhNjQ1MDUzOWY1ZCAxMDA2NDQKLS0tIGEvdGVzdHMva21zX2NvbnRlbnRfcHJv
dGVjdGlvbi5jCisrKyBiL3Rlc3RzL2ttc19jb250ZW50X3Byb3RlY3Rpb24uYwpAQCAtMjE0LDYg
KzIxNCwxNCBAQCBzdGF0aWMgYm9vbCBpZ3RfcGlwZV9pc19mcmVlKGlndF9kaXNwbGF5X3QgKmRp
c3BsYXksIGVudW0gcGlwZSBwaXBlKQogCXJldHVybiB0cnVlOwogfQogCitzdGF0aWMgdm9pZCB0
ZXN0X2NwX2xpYyhpZ3Rfb3V0cHV0X3QgKm91dHB1dCkKK3sKKwlib29sIHJldDsKKworCS8qIFdh
aXQgZm9yIDRTZWNzIChtaW4gMiBjeWNsZXMgb2YgTGluayBJbnRlZ3JpdHkgQ2hlY2spICovCisJ
cmV0ID0gd2FpdF9mb3JfcHJvcF92YWx1ZShvdXRwdXQsIDEsIDQgKiAxMDAwKTsKKwlpZ3RfYXNz
ZXJ0X2YoIXJldCwgIkNvbnRlbnQgUHJvdGVjdGlvbiBMSUMgRmFpbGVkXG4iKTsKK30KIAogc3Rh
dGljIHZvaWQgdGVzdF9jb250ZW50X3Byb3RlY3Rpb25fb25fb3V0cHV0KGlndF9vdXRwdXRfdCAq
b3V0cHV0LAogCQkJCQkgICAgICBlbnVtIGlndF9jb21taXRfc3R5bGUgcykKQEAgLTIzNyw2ICsy
NDUsNyBAQCBzdGF0aWMgdm9pZCB0ZXN0X2NvbnRlbnRfcHJvdGVjdGlvbl9vbl9vdXRwdXQoaWd0
X291dHB1dF90ICpvdXRwdXQsCiAKIAkJbW9kZXNldF93aXRoX2ZiKHBpcGUsIG91dHB1dCwgcyk7
CiAJCXRlc3RfY3BfZW5hYmxlX3dpdGhfcmV0cnkob3V0cHV0LCBzLCAzKTsKKwkJdGVzdF9jcF9s
aWMob3V0cHV0KTsKIAkJdGVzdF9jcF9kaXNhYmxlKG91dHB1dCwgcyk7CiAKIAkJcHJpbWFyeSA9
IGlndF9vdXRwdXRfZ2V0X3BsYW5lX3R5cGUob3V0cHV0LAotLSAKMi43LjQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0
CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
