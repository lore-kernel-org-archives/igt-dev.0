Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE2A06E039
 for <igt-dev@lists.freedesktop.org>; Thu, 23 May 2019 21:47:48 +0000 (UTC)
From: Antonio Argenziano <antonio.argenziano@intel.com>
Date: Thu, 23 May 2019 14:47:34 -0700
Message-Id: <20190523214734.16584-1-antonio.argenziano@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] man:meson.build: Fix build option check
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

dGhlIGJ1aWxkIHN5c3RlbSB0cmllcyB0byBldmFsdWF0ZSBhIHZhcmlhYmxlIHRoYXQgaGFzIGJl
ZW4gcmVtb3ZlZC4gVXNlCnRoZSBvcHRpb24gcGFzc2VkIGZyb20gdGhlIG91dHNpZGUgaW5zdGVh
ZC4KClNpZ25lZC1vZmYtYnk6IEFudG9uaW8gQXJnZW56aWFubyA8YW50b25pby5hcmdlbnppYW5v
QGludGVsLmNvbT4KQ2M6IEFya2FkaXVzeiBIaWxlciA8YXJrYWRpdXN6LmhpbGVyQGludGVsLmNv
bT4KQ2M6IEx1Y2FzIERlIE1hcmNoaSA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPgpDYzogUGV0
cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+Ci0tLQogbWFuL21lc29uLmJ1aWxk
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvbWFuL21lc29uLmJ1aWxkIGIvbWFuL21lc29uLmJ1aWxkCmluZGV4IDM1ZmFh
ZDI4Li4wZjBhNmRkNCAxMDA2NDQKLS0tIGEvbWFuL21lc29uLmJ1aWxkCisrKyBiL21hbi9tZXNv
bi5idWlsZApAQCAtNDAsNyArNDAsNyBAQCBpZiByc3QybWFuLmZvdW5kKCkKIAllbmRmb3JlYWNo
CiAJYnVpbGRfaW5mbyArPSAnQnVpbGQgbWFuIHBhZ2VzOiB0cnVlJwogZWxzZQotCWlmIF9tYW5f
cmVxdWlyZWQKKwlpZiBidWlsZF9tYW4gPT0gJ3llcycKIAkJZXJyb3IoJ0Nhbm5vdCBidWlsZCBt
YW4gcGFnZXMgZHVlIHRvIG1pc3NpbmcgZGVwZW5kZW5jaWVzJykKIAllbmRpZgogCWJ1aWxkX2lu
Zm8gKz0gJ0J1aWxkIG1hbiBwYWdlczogZmFsc2UnCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0Cmln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
