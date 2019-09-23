Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B2B6E8A2
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2019 12:43:48 +0000 (UTC)
Date: Mon, 23 Sep 2019 15:43:37 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20190923124337.GH1208@intel.com>
References: <1569235233-15674-1-git-send-email-juhapekka.heikkila@gmail.com>
 <1569235233-15674-2-git-send-email-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1569235233-15674-2-git-send-email-juhapekka.heikkila@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_big_fb: Add over 32k HW
 stride tests
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
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMDE6NDA6MzNQTSArMDMwMCwgSnVoYS1QZWtrYSBIZWlr
a2lsYSB3cm90ZToKPiBPbiBJQ0wgd2hlbiB1c2luZyA2NGJwcCBmb3JtYXRzIHN0cmlkZXMgY2Fu
IHJlYWNoIHVwIHRvCj4gNjRrLiBUaGVzZSB0ZXN0IHRyeSBleGFjdCBtYXhpbXVtIEhXIHN0cmlk
ZXMgc28gZ3R0Cj4gcmVtYXBwaW5nIHdpbGwgbm90IGNvbWUgaW4gcGxheS4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBKdWhhLVBla2thIEhlaWtraWxhIDxqdWhhcGVra2EuaGVpa2tpbGFAZ21haWwuY29t
Pgo+IC0tLQo+ICB0ZXN0cy9rbXNfYmlnX2ZiLmMgfCAxMDMgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDEwMyBp
bnNlcnRpb25zKCspCgpJIGJlbGlldmUgYWxsIHlvdSBzaG91bGQgbmVlZCBpcyBzb21ldGhpbmcg
bGlrZToKCi0tLSBhL3Rlc3RzL2ttc19iaWdfZmIuYworKysgYi90ZXN0cy9rbXNfYmlnX2ZiLmMK
QEAgLTE2MSw5ICsxNjEsNiBAQCBzdGF0aWMgdm9pZCBtYXhfZmJfc2l6ZShkYXRhX3QgKmRhdGEs
IGludCAqd2lkdGgsIGludCAqaGVpZ2h0LAogCXVpbnQ2NF90IHNpemU7CiAJaW50IGkgPSAwOwog
Ci0JKndpZHRoID0gZGF0YS0+bWF4X2ZiX3dpZHRoOwotCSpoZWlnaHQgPSBkYXRhLT5tYXhfZmJf
aGVpZ2h0OwotCiAJLyogbWF4IGZlbmNlIHN0cmlkZSBpcyBvbmx5IDhrIGJ5dGVzIG9uIGdlbjMg
Ki8KIAlpZiAoaW50ZWxfZ2VuKGRhdGEtPmRldmlkKSA8IDQgJiYKIAkgICAgZm9ybWF0ID09IERS
TV9GT1JNQVRfWFJHQjg4ODgpCkBAIC00MTUsOCArNDEyLDE2IEBAIHN0YXRpYyBib29sIHRlc3Rf
cGlwZShkYXRhX3QgKmRhdGEpCiAJcmV0dXJuIHJldDsKIH0KIAotc3RhdGljIHZvaWQgdGVzdF9z
Y2Fub3V0KGRhdGFfdCAqZGF0YSkKK3N0YXRpYyB2b2lkIHRlc3Rfc2Nhbm91dChkYXRhX3QgKmRh
dGEsIGJvb2wgdGVzdF9tYXhfaHdfc3RyaWRlKQogeworCWlmICh0ZXN0X21heF9od19zdHJpZGUp
IHsKKwkJZGF0YS0+YmlnX2ZiX3dpZHRoID0gQklHOworCQlkYXRhLT5iaWdfZmJfaGVpZ2h0ID0g
QklHOworCX0gZWxzZSB7CisJCWRhdGEtPmJpZ19mYl93aWR0aCA9IGRhdGEtPm1heF9mYl93aWR0
aDsKKwkJZGF0YS0+YmlnX2ZiX2hlaWdodCA9IGRhdGEtPm1heF9mYl9oZWlnaHQ7CisJfQorCiAJ
bWF4X2ZiX3NpemUoZGF0YSwgJmRhdGEtPmJpZ19mYl93aWR0aCwgJmRhdGEtPmJpZ19mYl9oZWln
aHQsCiAJCSAgICBkYXRhLT5mb3JtYXQsIGRhdGEtPm1vZGlmaWVyKTsKIAotLSAKVmlsbGUgU3ly
asOkbMOkCkludGVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
