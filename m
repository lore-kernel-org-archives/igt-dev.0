Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64234892D5
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Feb 2019 23:43:54 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id j89so12139807edb.9
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Feb 2019 15:43:54 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 21 Feb 2019 00:43:45 +0100
Message-Id: <20190220234345.18692-2-daniel.vetter@ffwll.ch>
In-Reply-To: <20190220234345.18692-1-daniel.vetter@ffwll.ch>
References: <20190220234345.18692-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] lib: disallow fixtures/subtest groups
 in simple tests
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
To: IGT development <igt-dev@lists.freedesktop.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

VGhleSBkb24ndCB3b3JrLCBzZWUgaWd0X2Nhbl9mYWlsKCkuIFdlIGFscmVhZHkgY2hlY2sgZm9y
CnRlc3Rfd2l0aF9zdWJ0ZXN0cyBpbiBpZ3Rfc3VidGVzdC4KClJldmlld2VkLWJ5OiBBcmthZGl1
c3ogSGlsZXIgPGFya2FkaXVzei5oaWxlckBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IERhbmll
bCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgotLS0KIGxpYi9pZ3RfY29yZS5jIHwg
MyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9saWIv
aWd0X2NvcmUuYyBiL2xpYi9pZ3RfY29yZS5jCmluZGV4IDcxYjA1ZDNiYmQzYi4uNmViNDc5OGUy
NGVmIDEwMDY0NAotLS0gYS9saWIvaWd0X2NvcmUuYworKysgYi9saWIvaWd0X2NvcmUuYwpAQCAt
NDYzLDYgKzQ2Myw3IEBAIHVpbnQ2NF90IGlndF9uc2VjX2VsYXBzZWQoc3RydWN0IHRpbWVzcGVj
ICpzdGFydCkKIGJvb2wgX19pZ3RfZml4dHVyZSh2b2lkKQogewogCWFzc2VydCghaW5fZml4dHVy
ZSk7CisJYXNzZXJ0KHRlc3Rfd2l0aF9zdWJ0ZXN0cyk7CiAKIAlpZiAoaWd0X29ubHlfbGlzdF9z
dWJ0ZXN0cygpKQogCQlyZXR1cm4gZmFsc2U7CkBAIC05NzUsNiArOTc2LDggQEAgYm9vbCBpZ3Rf
b25seV9saXN0X3N1YnRlc3RzKHZvaWQpCiAKIHZvaWQgX19pZ3Rfc3VidGVzdF9ncm91cF9zYXZl
KGludCAqc2F2ZSkKIHsKKwlhc3NlcnQodGVzdF93aXRoX3N1YnRlc3RzKTsKKwogCSpzYXZlID0g
c2tpcF9zdWJ0ZXN0c19oZW5jZWZvcnRoOwogfQogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0Cmln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
