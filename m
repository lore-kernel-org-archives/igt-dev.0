Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from b-painless.mh.aa.net.uk (b-painless.mh.aa.net.uk [81.187.30.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D718B6E395
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Apr 2018 23:28:22 +0000 (UTC)
Received: from cartman.offog.org ([2001:8b0:83b:b53f::a])
 by b-painless.mh.aa.net.uk with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <ats@offog.org>) id 1f3Uje-0003qy-9b
 for igt-dev@lists.freedesktop.org; Tue, 03 Apr 2018 23:49:02 +0100
From: Adam Sampson <ats@offog.org>
Date: Tue,  3 Apr 2018 23:48:44 +0100
Message-Id: <20180403224844.10146-2-ats@offog.org>
In-Reply-To: <20180403224844.10146-1-ats@offog.org>
References: <20180403224844.10146-1-ats@offog.org>
Subject: [igt-dev] [PATCH i-g-t 2/2] Test that register types are accepted
 in all valid forms.
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
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Cc: Adam Sampson <ats@offog.org>
List-ID: <igt-dev@lists.freedesktop.org>

VGhlIGFzc2VtYmxlciBzaG91bGQgYWNjZXB0IHViLCA6dWIsIFVCIGFuZCA6VUIuCgpTaWduZWQt
b2ZmLWJ5OiBBZGFtIFNhbXBzb24gPGF0c0BvZmZvZy5vcmc+Ci0tLQogYXNzZW1ibGVyL01ha2Vm
aWxlLmFtICAgICAgICAgICB8IDEgKwogYXNzZW1ibGVyL21lc29uLmJ1aWxkICAgICAgICAgICB8
IDEgKwogYXNzZW1ibGVyL3Rlc3QvcmVndHlwZS5leHBlY3RlZCB8IDAKIGFzc2VtYmxlci90ZXN0
L3JlZ3R5cGUuZzRhICAgICAgfCA2ICsrKysrKwogNCBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlv
bnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhc3NlbWJsZXIvdGVzdC9yZWd0eXBlLmV4cGVjdGVk
CiBjcmVhdGUgbW9kZSAxMDA2NDQgYXNzZW1ibGVyL3Rlc3QvcmVndHlwZS5nNGEKCmRpZmYgLS1n
aXQgYS9hc3NlbWJsZXIvTWFrZWZpbGUuYW0gYi9hc3NlbWJsZXIvTWFrZWZpbGUuYW0KaW5kZXgg
ODU1ZTMzYWIuLjQ5NDIyZTAyIDEwMDY0NAotLS0gYS9hc3NlbWJsZXIvTWFrZWZpbGUuYW0KKysr
IGIvYXNzZW1ibGVyL01ha2VmaWxlLmFtCkBAIC01Miw2ICs1Miw3IEBAIGNoZWNrX1NDUklQVFMg
PSB0ZXN0L3J1bi10ZXN0LnNoCiBURVNUUyA9IFwKIAl0ZXN0L21vdiBcCiAJdGVzdC9mcmMgXAor
CXRlc3QvcmVndHlwZSBcCiAJdGVzdC9ybmRkIFwKIAl0ZXN0L3JuZHUgXAogCXRlc3Qvcm5kZSBc
CmRpZmYgLS1naXQgYS9hc3NlbWJsZXIvbWVzb24uYnVpbGQgYi9hc3NlbWJsZXIvbWVzb24uYnVp
bGQKaW5kZXggYzg1OGJjMGYuLmNlZmRiYTkzIDEwMDY0NAotLS0gYS9hc3NlbWJsZXIvbWVzb24u
YnVpbGQKKysrIGIvYXNzZW1ibGVyL21lc29uLmJ1aWxkCkBAIC00Nyw2ICs0Nyw3IEBAIGNvbmZp
Z3VyZV9maWxlKGlucHV0IDogJ2ludGVsLWdlbjRhc20ucGMuaW4nLCBvdXRwdXQgOiAnaW50ZWwt
Z2VuNGFzbS5wYycsCiBnZW40YXNtX3Rlc3RjYXNlcyA9IFsKIAkndGVzdC9tb3YnLAogCSd0ZXN0
L2ZyYycsCisJJ3Rlc3QvcmVndHlwZScsCiAJJ3Rlc3Qvcm5kZCcsCiAJJ3Rlc3Qvcm5kdScsCiAJ
J3Rlc3Qvcm5kZScsCmRpZmYgLS1naXQgYS9hc3NlbWJsZXIvdGVzdC9yZWd0eXBlLmV4cGVjdGVk
IGIvYXNzZW1ibGVyL3Rlc3QvcmVndHlwZS5leHBlY3RlZApuZXcgZmlsZSBtb2RlIDEwMDY0NApp
bmRleCAwMDAwMDAwMC4uZTY5ZGUyOWIKZGlmZiAtLWdpdCBhL2Fzc2VtYmxlci90ZXN0L3JlZ3R5
cGUuZzRhIGIvYXNzZW1ibGVyL3Rlc3QvcmVndHlwZS5nNGEKbmV3IGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggMDAwMDAwMDAuLjhkN2Y4ZGQyCi0tLSAvZGV2L251bGwKKysrIGIvYXNzZW1ibGVyL3Rl
c3QvcmVndHlwZS5nNGEKQEAgLTAsMCArMSw2IEBACisvLyBUZXN0IHRoYXQgcmVnaXN0ZXIgdHlw
ZXMgYXJlIGFjY2VwdGVkIGluIHVwcGVyIG9yIGxvd2VyIGNhc2UsIHdpdGggYW5kCisvLyB3aXRo
b3V0IHRoZSA6IHByZWZpeC4KKy5kZWZhdWx0X3JlZ2lzdGVyX3R5cGUgOnViCisuZGVmYXVsdF9y
ZWdpc3Rlcl90eXBlIDpVQgorLmRlZmF1bHRfcmVnaXN0ZXJfdHlwZSB1YgorLmRlZmF1bHRfcmVn
aXN0ZXJfdHlwZSBVQgotLSAKMi4xNy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2lndC1kZXYK
