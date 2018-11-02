Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A4776E5E4
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Nov 2018 20:54:06 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id u12-v6so2844023eds.4
 for <igt-dev@lists.freedesktop.org>; Fri, 02 Nov 2018 13:54:06 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri,  2 Nov 2018 21:53:49 +0100
Message-Id: <20181102205350.29021-7-daniel.vetter@ffwll.ch>
In-Reply-To: <20181102205350.29021-1-daniel.vetter@ffwll.ch>
References: <20181102205350.29021-1-daniel.vetter@ffwll.ch>
Subject: [igt-dev] [PATCH i-g-t 7/8] tests/kms_lease|sequence: Make sure
 we're master
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
To: IGT development <igt-dev@lists.freedesktop.org>
Cc: Keith Packard <keithp@keithp.com>
List-ID: <igt-dev@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KLS0t
CiB0ZXN0cy9rbXNfbGVhc2UuYyAgICB8IDIgKy0KIHRlc3RzL2ttc19zZXF1ZW5jZS5jIHwgMiAr
LQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvdGVzdHMva21zX2xlYXNlLmMgYi90ZXN0cy9rbXNfbGVhc2UuYwppbmRleCBmNWI2
NmQ4NjM5OGUuLjk0MmVhZjViOTkyMSAxMDA2NDQKLS0tIGEvdGVzdHMva21zX2xlYXNlLmMKKysr
IGIvdGVzdHMva21zX2xlYXNlLmMKQEAgLTYyMyw3ICs2MjMsNyBAQCBpZ3RfbWFpbgogCWlndF9z
a2lwX29uX3NpbXVsYXRpb24oKTsKIAogCWlndF9maXh0dXJlIHsKLQkJZGF0YS5tYXN0ZXIuZmQg
PSBkcm1fb3Blbl9kcml2ZXIoRFJJVkVSX0FOWSk7CisJCWRhdGEubWFzdGVyLmZkID0gZHJtX29w
ZW5fZHJpdmVyX21hc3RlcihEUklWRVJfQU5ZKTsKIAkJa21zdGVzdF9zZXRfdnRfZ3JhcGhpY3Nf
bW9kZSgpOwogCQlpZ3RfZGlzcGxheV9pbml0KCZkYXRhLm1hc3Rlci5kaXNwbGF5LCBkYXRhLm1h
c3Rlci5mZCk7CiAJfQpkaWZmIC0tZ2l0IGEvdGVzdHMva21zX3NlcXVlbmNlLmMgYi90ZXN0cy9r
bXNfc2VxdWVuY2UuYwppbmRleCA3ODNkZGEyNTMwOGYuLmM2OGY3NzA3YzdhNCAxMDA2NDQKLS0t
IGEvdGVzdHMva21zX3NlcXVlbmNlLmMKKysrIGIvdGVzdHMva21zX3NlcXVlbmNlLmMKQEAgLTI5
OCw3ICsyOTgsNyBAQCBpZ3RfbWFpbgogCWlndF9za2lwX29uX3NpbXVsYXRpb24oKTsKIAogCWln
dF9maXh0dXJlIHsKLQkJZmQgPSBkcm1fb3Blbl9kcml2ZXIoRFJJVkVSX0FOWSk7CisJCWZkID0g
ZHJtX29wZW5fZHJpdmVyX21hc3RlcihEUklWRVJfQU5ZKTsKIAkJa21zdGVzdF9zZXRfdnRfZ3Jh
cGhpY3NfbW9kZSgpOwogCQlpZ3RfZGlzcGxheV9pbml0KCZkYXRhLmRpc3BsYXksIGZkKTsKIAl9
Ci0tIAoyLjE0LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
