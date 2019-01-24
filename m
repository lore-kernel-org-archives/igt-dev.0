Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3370189BAC
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Jan 2019 05:57:07 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id t13so2180545pgr.11
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jan 2019 21:57:07 -0800 (PST)
Date: Thu, 24 Jan 2019 11:27:01 +0530
From: Mamta Shukla <mamtashukla555@gmail.com>
Message-ID: <1ef7d6c23ee8e68f1017ed7063192e065db4d279.1548308153.git.mamtashukla555@gmail.com>
References: <61cd2e1cee3485a7236e8fd5fe57931d291dac21.1548308153.git.mamtashukla555@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <61cd2e1cee3485a7236e8fd5fe57931d291dac21.1548308153.git.mamtashukla555@gmail.com>
Subject: [igt-dev] [PATCH i-g-t,
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
To: igt-dev@lists.freedesktop.org, harry.wentland@amd.com, daniel@ffwll.ch, hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com
List-ID: <igt-dev@lists.freedesktop.org>

VXNlIGlndF9yZW1vdmVfZmIoZGF0YS0+ZHJtX2ZkLCAmZGF0YS0+ZmIpIHRvIHJlbW92ZSBsb2Nh
bGx5IGNyZWF0ZWQKZnJhbWVidWZmZXIgYXQgdGhlIGVuZCBvZiB0aGUgaGFyZHdhcmUgdGVzdC4K
ClNpZ25lZC1vZmYtYnk6IE1hbXRhIFNodWtsYSA8bWFtdGFzaHVrbGE1NTVAZ21haWwuY29tPgot
LS0KIHRlc3RzL2ttc19jdXJzb3JfY3JjLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19jdXJzb3JfY3JjLmMgYi90ZXN0cy9rbXNf
Y3Vyc29yX2NyYy5jCmluZGV4IGMxZWE3ZmFmLi4wYWMyYzIyNiAxMDA2NDQKLS0tIGEvdGVzdHMv
a21zX2N1cnNvcl9jcmMuYworKysgYi90ZXN0cy9rbXNfY3Vyc29yX2NyYy5jCkBAIC01ODMsNiAr
NTgzLDcgQEAgc3RhdGljIHZvaWQgdGVzdF9jdXJzb3Jfc2l6ZShkYXRhX3QgKmRhdGEpCiAJCWln
dF9waXBlX2NyY19jb2xsZWN0X2NyYyhwaXBlX2NyYywgJmNyY1tpXSk7CiAJfQogCWN1cnNvcl9k
aXNhYmxlKGRhdGEpOworCWlndF9yZW1vdmVfZmIoZGF0YS0+ZHJtX2ZkLCAmZGF0YS0+ZmIpOwog
CS8qIFNvZnR3YXJlIHRlc3QgbG9vcCAqLwogCWZvciAoaSA9IDAsIHNpemUgPSBjdXJzb3JfbWF4
X3NpemU7IHNpemUgPj0gNjQ7IHNpemUgLz0gMiwgaSsrKSB7CiAJCS8qIE5vdyByZW5kZXIgdGhl
IHNhbWUgaW4gc29mdHdhcmUgYW5kIGNvbGxlY3QgY3JjICovCi0tIAoyLjE3LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
