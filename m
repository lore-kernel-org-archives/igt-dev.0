Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B156E112
 for <igt-dev@lists.freedesktop.org>; Fri, 24 May 2019 15:03:59 +0000 (UTC)
From: Simon Ser <simon.ser@intel.com>
Date: Fri, 24 May 2019 18:03:32 +0300
Message-Id: <20190524150334.15833-8-simon.ser@intel.com>
In-Reply-To: <20190524150334.15833-1-simon.ser@intel.com>
References: <20190524150334.15833-1-simon.ser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 7/9] lib/igt_audio: make
 audio_extract_channel_s32_le support a NULL dst
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

VGhpcyBhZGRzIGEgc25wcmludGYtbGlrZSBiZWhhdmlvdXIgdG8gYXVkaW9fZXh0cmFjdF9jaGFu
bmVsX3MzMl9sZS4KClNpZ25lZC1vZmYtYnk6IFNpbW9uIFNlciA8c2ltb24uc2VyQGludGVsLmNv
bT4KLS0tCiBsaWIvaWd0X2F1ZGlvLmMgfCAxMSArKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQs
IDEwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9saWIvaWd0X2F1
ZGlvLmMgYi9saWIvaWd0X2F1ZGlvLmMKaW5kZXggZjJhYWMwZTIzYTM3Li5jNzQwN2ZhMWE5N2Ig
MTAwNjQ0Ci0tLSBhL2xpYi9pZ3RfYXVkaW8uYworKysgYi9saWIvaWd0X2F1ZGlvLmMKQEAgLTQ0
NSw3ICs0NDUsMTMgQEAgYm9vbCBhdWRpb19zaWduYWxfZGV0ZWN0KHN0cnVjdCBhdWRpb19zaWdu
YWwgKnNpZ25hbCwgaW50IHNhbXBsaW5nX3JhdGUsCiB9CiAKIC8qKgotICogRXh0cmFjdHMgYSBz
aW5nbGUgY2hhbm5lbCBmcm9tIGEgbXVsdGktY2hhbm5lbCBTMzJfTEUgaW5wdXQgYnVmZmVyLgor
ICogYXVkaW9fZXh0cmFjdF9jaGFubmVsX3MzMl9sZTogZXh0cmFjdHMgYSBzaW5nbGUgY2hhbm5l
bCBmcm9tIGEgbXVsdGktY2hhbm5lbAorICogUzMyX0xFIGlucHV0IGJ1ZmZlci4KKyAqCisgKiBJ
ZiBkc3RfY2FwIGlzIHplcm8sIG5vIGNvcHkgaXMgcGVyZm9ybWVkLiBUaGlzIGNhbiBiZSB1c2Vk
IHRvIGNvbXB1dGUgdGhlCisgKiBtaW5pbXVtIHJlcXVpcmVkIGNhcGFjaXR5LgorICoKKyAqIFJl
dHVybnM6IHRoZSBudW1iZXIgb2Ygc2FtcGxlcyBleHRyYWN0ZWQuCiAgKi8KIHNpemVfdCBhdWRp
b19leHRyYWN0X2NoYW5uZWxfczMyX2xlKGRvdWJsZSAqZHN0LCBzaXplX3QgZHN0X2NhcCwKIAkJ
CQkgICAgaW50MzJfdCAqc3JjLCBzaXplX3Qgc3JjX2xlbiwKQEAgLTQ1Niw2ICs0NjIsOSBAQCBz
aXplX3QgYXVkaW9fZXh0cmFjdF9jaGFubmVsX3MzMl9sZShkb3VibGUgKmRzdCwgc2l6ZV90IGRz
dF9jYXAsCiAJaWd0X2Fzc2VydChjaGFubmVsIDwgbl9jaGFubmVscyk7CiAJaWd0X2Fzc2VydChz
cmNfbGVuICUgbl9jaGFubmVscyA9PSAwKTsKIAlkc3RfbGVuID0gc3JjX2xlbiAvIG5fY2hhbm5l
bHM7CisJaWYgKGRzdF9jYXAgPT0gMCkKKwkJcmV0dXJuIGRzdF9sZW47CisKIAlpZ3RfYXNzZXJ0
KGRzdF9sZW4gPD0gZHN0X2NhcCk7CiAJZm9yIChpID0gMDsgaSA8IGRzdF9sZW47IGkrKykKIAkJ
ZHN0W2ldID0gKGRvdWJsZSkgc3JjW2kgKiBuX2NoYW5uZWxzICsgY2hhbm5lbF0gLyBJTlQzMl9N
QVg7Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
