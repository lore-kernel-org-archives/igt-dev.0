Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E5E6E907
 for <igt-dev@lists.freedesktop.org>; Mon,  3 May 2021 18:26:14 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id f24so9310679ejc.6
 for <igt-dev@lists.freedesktop.org>; Mon, 03 May 2021 11:26:14 -0700 (PDT)
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Mon,  3 May 2021 20:25:54 +0200
Message-Id: <20210503182555.12284-2-mario.kleiner.de@gmail.com>
In-Reply-To: <20210503182555.12284-1-mario.kleiner.de@gmail.com>
References: <20210503182555.12284-1-mario.kleiner.de@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] drm-uapi: Add fourcc's for 16 bpc fixed
 point framebuffer formats.
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
Cc: Alex Deucher <alexander.deucher@amd.com>, mario.kleiner.de@gmail.com
List-ID: <igt-dev@lists.freedesktop.org>

VGhlc2UgYXJlIDE2IGJpdHMgcGVyIGNvbG9yIGNoYW5uZWwgdW5zaWduZWQgbm9ybWFsaXplZCBm
b3JtYXRzLgpUaGV5IGFyZSBzdXBwb3J0ZWQgYnkgYXQgbGVhc3QgQU1EIGRpc3BsYXkgaHcsIGFu
ZCBzdWl0YWJsZSBmb3IKZGlyZWN0IHNjYW5vdXQgb2YgVnVsa2FuIHN3YXBjaGFpbiBpbWFnZXMg
aW4gdGhlIGZvcm1hdApWS19GT1JNQVRfUjE2RzE2QjE2QTE2X1VOT1JNLgoKU2lnbmVkLW9mZi1i
eTogTWFyaW8gS2xlaW5lciA8bWFyaW8ua2xlaW5lci5kZUBnbWFpbC5jb20+CkNjOiBWaWxsZSBT
eXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgpDYzogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGluY2x1ZGUvZHJtLXVhcGkvZHJtX2Zv
dXJjYy5oIHwgNyArKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9kcm0tdWFwaS9kcm1fZm91cmNjLmggYi9pbmNsdWRlL2RybS11YXBp
L2RybV9mb3VyY2MuaAppbmRleCBhN2JjMDU4Yy4uNWRiNGY1NWEgMTAwNjQ0Ci0tLSBhL2luY2x1
ZGUvZHJtLXVhcGkvZHJtX2ZvdXJjYy5oCisrKyBiL2luY2x1ZGUvZHJtLXVhcGkvZHJtX2ZvdXJj
Yy5oCkBAIC0xNDQsNiArMTQ0LDEzIEBAIGV4dGVybiAiQyIgewogI2RlZmluZSBEUk1fRk9STUFU
X1JHQkExMDEwMTAyCWZvdXJjY19jb2RlKCdSJywgJ0EnLCAnMycsICcwJykgLyogWzMxOjBdIFI6
RzpCOkEgMTA6MTA6MTA6MiBsaXR0bGUgZW5kaWFuICovCiAjZGVmaW5lIERSTV9GT1JNQVRfQkdS
QTEwMTAxMDIJZm91cmNjX2NvZGUoJ0InLCAnQScsICczJywgJzAnKSAvKiBbMzE6MF0gQjpHOlI6
QSAxMDoxMDoxMDoyIGxpdHRsZSBlbmRpYW4gKi8KIAorLyogNjQgYnBwIFJHQiAqLworI2RlZmlu
ZSBEUk1fRk9STUFUX1hSR0IxNjE2MTYxNglmb3VyY2NfY29kZSgnWCcsICdSJywgJzQnLCAnOCcp
IC8qIFs2MzowXSB4OlI6RzpCIDE2OjE2OjE2OjE2IGxpdHRsZSBlbmRpYW4gKi8KKyNkZWZpbmUg
RFJNX0ZPUk1BVF9YQkdSMTYxNjE2MTYJZm91cmNjX2NvZGUoJ1gnLCAnQicsICc0JywgJzgnKSAv
KiBbNjM6MF0geDpCOkc6UiAxNjoxNjoxNjoxNiBsaXR0bGUgZW5kaWFuICovCisKKyNkZWZpbmUg
RFJNX0ZPUk1BVF9BUkdCMTYxNjE2MTYJZm91cmNjX2NvZGUoJ0EnLCAnUicsICc0JywgJzgnKSAv
KiBbNjM6MF0gQTpSOkc6QiAxNjoxNjoxNjoxNiBsaXR0bGUgZW5kaWFuICovCisjZGVmaW5lIERS
TV9GT1JNQVRfQUJHUjE2MTYxNjE2CWZvdXJjY19jb2RlKCdBJywgJ0InLCAnNCcsICc4JykgLyog
WzYzOjBdIEE6QjpHOlIgMTY6MTY6MTY6MTYgbGl0dGxlIGVuZGlhbiAqLworCiAvKgogICogRmxv
YXRpbmcgcG9pbnQgNjRicHAgUkdCCiAgKiBJRUVFIDc1NC0yMDA4IGJpbmFyeTE2IGhhbGYtcHJl
Y2lzaW9uIGZsb2F0Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aWd0LWRldgo=
