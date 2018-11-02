Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B81C16E5E0
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Nov 2018 20:54:01 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id w19-v6so2859464eds.1
 for <igt-dev@lists.freedesktop.org>; Fri, 02 Nov 2018 13:54:01 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri,  2 Nov 2018 21:53:46 +0100
Message-Id: <20181102205350.29021-4-daniel.vetter@ffwll.ch>
In-Reply-To: <20181102205350.29021-1-daniel.vetter@ffwll.ch>
References: <20181102205350.29021-1-daniel.vetter@ffwll.ch>
Subject: [igt-dev] [PATCH i-g-t 4/8] tests/kms_lease: Adjsut to
 universal_planes uapi changes
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

V2UgbmVlZCB0byBhbHNvIGFzayBmb3IgYSBwbGFuZSB3aGVuIHVuaXZlcnNhbCBwbGFuZXMgaXMg
ZW5hYmxlZCwKd2hpY2ggdGhlIGlndF9kaXNwbGF5IGxpYnJhcnkgZG9lcyBieSBkZWZhdWx0LgoK
U2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KLS0t
CiB0ZXN0cy9rbXNfbGVhc2UuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19sZWFzZS5jIGIvdGVzdHMva21zX2xlYXNlLmMK
aW5kZXggMDQ4ZTUyMDNkMmE1Li5mNGUxMDgyY2JiMmEgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19s
ZWFzZS5jCisrKyBiL3Rlc3RzL2ttc19sZWFzZS5jCkBAIC0yNDYsNiArMjQ2LDEwIEBAIHN0YXRp
YyBpbnQgbWFrZV9sZWFzZShkYXRhX3QgKmRhdGEsIGxlYXNlX3QgKmxlYXNlKQogCiAJb2JqZWN0
X2lkc1ttY2wub2JqZWN0X2NvdW50KytdID0gZGF0YS0+Y29ubmVjdG9yX2lkOwogCW9iamVjdF9p
ZHNbbWNsLm9iamVjdF9jb3VudCsrXSA9IGRhdGEtPmNydGNfaWQ7CisJLyogV2UgdXNlIHVuaXZl
cnNhbCBwbGFuZXMsIG11c3QgYWRkIHRoZSBwcmltYXJ5IHBsYW5lICovCisJb2JqZWN0X2lkc1tt
Y2wub2JqZWN0X2NvdW50KytdID0KKwkJaWd0X3BpcGVfZ2V0X3BsYW5lX3R5cGUoJmRhdGEtPm1h
c3Rlci5kaXNwbGF5LnBpcGVzW2RhdGEtPnBpcGVdLAorCQkJCQlEUk1fUExBTkVfVFlQRV9QUklN
QVJZKS0+ZHJtX3BsYW5lLT5wbGFuZV9pZDsKIAogCXJldCA9IGNyZWF0ZV9sZWFzZShkYXRhLT5t
YXN0ZXIuZmQsICZtY2wpOwogCi0tIAoyLjE0LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaWd0LWRldgo=
