Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36C55892E3
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2019 13:55:47 +0000 (UTC)
From: Simon Ser <simon.ser@intel.com>
Date: Fri, 26 Apr 2019 16:55:40 +0300
Message-Id: <20190426135540.5878-1-simon.ser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/igt_audio: fix filemode not specified
 in open(O_CREAT)
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
Cc: petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

b3BlbigzKSB0YWtlcyB2YV9hcmdzIGFmdGVyIHRoZSBmbGFncyBhbmQgT19DUkVBVCB3aWxsIHJl
YWQgdGhlIGZpcnN0IG9uZS4gSWYKd2UgZG9uJ3QgcHJvdmlkZSBvbmUsIHRoaXMgaXMgdW5kZWZp
bmVkIGJlaGF2aW91ci4KCihTb21lb25lIHJlcG9ydGVkIGl0IGJyb2tlIHRoZSBidWlsZCBmb3Ig
dGhlbSkKClNpZ25lZC1vZmYtYnk6IFNpbW9uIFNlciA8c2ltb24uc2VyQGludGVsLmNvbT4KRml4
ZXM6IDMxMWJhZmYxNTFmOTBjMWRiNmY1N2VlOTUxNTIxNmI0ZjlkYTVkYjcKLS0tCiBsaWIvaWd0
X2F1ZGlvLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9saWIvaWd0X2F1ZGlvLmMgYi9saWIvaWd0X2F1ZGlvLmMKaW5k
ZXggNWIwODYwZTYuLmZkOGNmMDdjIDEwMDY0NAotLS0gYS9saWIvaWd0X2F1ZGlvLmMKKysrIGIv
bGliL2lndF9hdWRpby5jCkBAIC00NDcsNyArNDQ3LDcgQEAgaW50IGF1ZGlvX2NyZWF0ZV93YXZf
ZmlsZV9zMzJfbGUoY29uc3QgY2hhciAqcXVhbGlmaWVyLCB1aW50MzJfdCBzYW1wbGVfcmF0ZSwK
IAkJKnBhdGggPSBzdHJkdXAoX3BhdGgpOwogCiAJaWd0X2RlYnVnKCJEdW1waW5nICVzIGF1ZGlv
IHRvICVzXG4iLCBxdWFsaWZpZXIsIF9wYXRoKTsKLQlmZCA9IG9wZW4oX3BhdGgsIE9fV1JPTkxZ
IHwgT19DUkVBVCB8IE9fVFJVTkMpOworCWZkID0gb3BlbihfcGF0aCwgT19XUk9OTFkgfCBPX0NS
RUFUIHwgT19UUlVOQywgMDY0NCk7CiAJaWYgKGZkIDwgMCkgewogCQlpZ3Rfd2Fybigib3BlbiBm
YWlsZWQ6ICVzXG4iLCBzdHJlcnJvcihlcnJubykpOwogCQlyZXR1cm4gLTE7Ci0tIAoyLjIxLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYg
bWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
