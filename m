Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C4D6F9AA
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2019 14:24:51 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id o9so4148874plk.6
 for <igt-dev@lists.freedesktop.org>; Fri, 08 Nov 2019 06:24:51 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Fri,  8 Nov 2019 16:24:42 +0200
Message-Id: <1573223082-29928-1-git-send-email-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] [PATCH i-g-t] tests/kms_cursor: use safe values for test
 image to avoid rounding errors
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
List-ID: <igt-dev@lists.freedesktop.org>

aW5zdGVhZCBvZiAwLjUgdXNlIDEuMCBmb3Igd2hpdGUgY29sb3IsIHRoaXMgaXMgZHVlIHRvIGJp
dCByZXBsaWNhdGlvbgplZmZlY3QuIEFsc28gc2V0IGNhaXJvIHRvIHVzZSBzYW1lIGJsZW5kaW5n
IG1vZGUgYXMgd2hhdCBIVyB1c2VzLgoKU2lnbmVkLW9mZi1ieTogSnVoYS1QZWtrYSBIZWlra2ls
YSA8anVoYXBla2thLmhlaWtraWxhQGdtYWlsLmNvbT4KLS0tCiB0ZXN0cy9rbXNfY3Vyc29yX2Ny
Yy5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS90ZXN0cy9rbXNfY3Vyc29yX2NyYy5jIGIvdGVzdHMva21zX2N1cnNv
cl9jcmMuYwppbmRleCBkMGZiOGYxLi4wMTI1MTIyIDEwMDY0NAotLS0gYS90ZXN0cy9rbXNfY3Vy
c29yX2NyYy5jCisrKyBiL3Rlc3RzL2ttc19jdXJzb3JfY3JjLmMKQEAgLTc4LDEyICs3OCwxMyBA
QCBzdGF0aWMgdm9pZCBkcmF3X2N1cnNvcihjYWlyb190ICpjciwgaW50IHgsIGludCB5LCBpbnQg
Y3csIGludCBjaCwgZG91YmxlIGEpCiAJLyogQ2Fpcm8gZG9lc24ndCBsaWtlIHRvIGJlIGZlZCBu
dW1iZXJzIHRoYXQgYXJlIHRvbyB3aWxkICovCiAJaWYgKCh4IDwgU0hSVF9NSU4pIHx8ICh4ID4g
U0hSVF9NQVgpIHx8ICh5IDwgU0hSVF9NSU4pIHx8ICh5ID4gU0hSVF9NQVgpKQogCQlyZXR1cm47
CisJY2Fpcm9fc2V0X29wZXJhdG9yKGNyLCBDQUlST19PUEVSQVRPUl9TT1VSQ0UpOwogCWNhaXJv
X3NldF9hbnRpYWxpYXMoY3IsIENBSVJPX0FOVElBTElBU19OT05FKTsKIAkvKiA0IGNvbG9yIHJl
Y3RhbmdsZXMgaW4gdGhlIGNvcm5lcnMsIFJHQlkgKi8KIAlpZ3RfcGFpbnRfY29sb3JfYWxwaGEo
Y3IsIHgsICAgICAgeSwgICAgICB3bCwgaHQsIDEuMCwgMC4wLCAwLjAsIGEpOwogCWlndF9wYWlu
dF9jb2xvcl9hbHBoYShjciwgeCArIHdsLCB5LCAgICAgIHdyLCBodCwgMC4wLCAxLjAsIDAuMCwg
YSk7CiAJaWd0X3BhaW50X2NvbG9yX2FscGhhKGNyLCB4LCAgICAgIHkgKyBodCwgd2wsIGhiLCAw
LjAsIDAuMCwgMS4wLCBhKTsKLQlpZ3RfcGFpbnRfY29sb3JfYWxwaGEoY3IsIHggKyB3bCwgeSAr
IGh0LCB3ciwgaGIsIDAuNSwgMC41LCAwLjUsIGEpOworCWlndF9wYWludF9jb2xvcl9hbHBoYShj
ciwgeCArIHdsLCB5ICsgaHQsIHdyLCBoYiwgMS4wLCAxLjAsIDEuMCwgYSk7CiB9CiAKIHN0YXRp
YyB2b2lkIGN1cnNvcl9lbmFibGUoZGF0YV90ICpkYXRhKQotLSAKMi43LjQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0
CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
