Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C8116E986
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Jan 2019 22:16:23 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id u6so10015550plm.8
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Jan 2019 14:16:23 -0800 (PST)
Date: Wed, 30 Jan 2019 03:46:19 +0530
From: Mamta Shukla <mamtashukla555@gmail.com>
Message-ID: <1b6a96ff29d736af3301851a672db9ae6eace761.1548799569.git.mamtashukla555@gmail.com>
References: <7fe5b67752b0d53137360a0a4539572df0287e7d.1548799569.git.mamtashukla555@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7fe5b67752b0d53137360a0a4539572df0287e7d.1548799569.git.mamtashukla555@gmail.com>
Subject: [igt-dev] [PATCH i-g-t, v2,
 2/2] tests/kms_cursor_crc.c: Remove framebuffer at the end of the
 test
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
To: igt-dev@lists.freedesktop.org, daniel@ffwll.ch, harry.wentland@amd.com, hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com
List-ID: <igt-dev@lists.freedesktop.org>

VXNlIGlndF9yZW1vdmVfZmIoZGF0YS0+ZHJtX2ZkLCAmZGF0YS0+ZmIpIHRvIHJlbW92ZSBsb2Nh
bGx5IGNyZWF0ZWQKZnJhbWVidWZmZXIgYXQgdGhlIGVuZCBvZiB0aGUgaGFyZHdhcmUgdGVzdC4K
ClNpZ25lZC1vZmYtYnk6IE1hbXRhIFNodWtsYSA8bWFtdGFzaHVrbGE1NTVAZ21haWwuY29tPgot
LS0KTm8gY2hhbmdlcyBpbiB2Mi4KCiB0ZXN0cy9rbXNfY3Vyc29yX2NyYy5jIHwgMSArCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS90ZXN0cy9rbXNfY3Vyc29y
X2NyYy5jIGIvdGVzdHMva21zX2N1cnNvcl9jcmMuYwppbmRleCAxNDRiNDRiMC4uZmQ3NGZkYTUg
MTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19jdXJzb3JfY3JjLmMKKysrIGIvdGVzdHMva21zX2N1cnNv
cl9jcmMuYwpAQCAtNTgzLDYgKzU4Myw3IEBAIHN0YXRpYyB2b2lkIHRlc3RfY3Vyc29yX3NpemUo
ZGF0YV90ICpkYXRhKQogCQlpZ3RfcGlwZV9jcmNfY29sbGVjdF9jcmMocGlwZV9jcmMsICZjcmNb
aV0pOwogCX0KIAljdXJzb3JfZGlzYWJsZShkYXRhKTsKKwlpZ3RfcmVtb3ZlX2ZiKGRhdGEtPmRy
bV9mZCwgJmRhdGEtPmZiKTsKIAkvKiBTb2Z0d2FyZSB0ZXN0IGxvb3AgKi8KIAlmb3IgKGkgPSAw
LCBzaXplID0gY3Vyc29yX21heF9zaXplOyBzaXplID49IDY0OyBzaXplIC89IDIsIGkrKykgewog
CQkvKiBOb3cgcmVuZGVyIHRoZSBzYW1lIGluIHNvZnR3YXJlIGFuZCBjb2xsZWN0IGNyYyAqLwot
LSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
