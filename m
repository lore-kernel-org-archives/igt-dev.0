Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2145588AEF
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Oct 2018 16:20:48 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Mon, 15 Oct 2018 17:20:39 +0100
Message-Id: <20181015162041.29140-3-lionel.g.landwerlin@intel.com>
In-Reply-To: <20181015162041.29140-1-lionel.g.landwerlin@intel.com>
References: <20181015162041.29140-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 2/4] tests/perf: buffer-fill: drop load
 helper usage
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
List-ID: <igt-dev@lists.freedesktop.org>

SXQgbWFrZXMgdGhlIHRlc3RzIG1vcmUgcmVsaWFibGUgYmVjYXVzZSB0aGUgZXhwZWN0ZWQgbnVt
YmVyIG9mCnJlcG9ydHMgaXMgbW9yZSBhY3VyYXRlIChnaXZlbiB0aGF0IHdlJ2xsIGhhdmUgYWxt
b3N0IG5vCmNvbnRleHQtc3dpdGNoIHJlcG9ydHMpLgoKU2lnbmVkLW9mZi1ieTogTGlvbmVsIExh
bmR3ZXJsaW4gPGxpb25lbC5nLmxhbmR3ZXJsaW5AaW50ZWwuY29tPgotLS0KIHRlc3RzL3BlcmYu
YyB8IDYgLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS90ZXN0cy9wZXJmLmMgYi90ZXN0cy9wZXJmLmMKaW5kZXggNGYwOWFlZjcuLjcyZTAwMTMyIDEw
MDY0NAotLS0gYS90ZXN0cy9wZXJmLmMKKysrIGIvdGVzdHMvcGVyZi5jCkBAIC0yMzc3LDkgKzIz
NzcsNiBAQCB0ZXN0X2J1ZmZlcl9maWxsKHZvaWQpCiAJaW50IG5fZnVsbF9vYV9yZXBvcnRzID0g
b2FfYnVmX3NpemUgLyByZXBvcnRfc2l6ZTsKIAl1aW50NjRfdCBmaWxsX2R1cmF0aW9uID0gbl9m
dWxsX29hX3JlcG9ydHMgKiBvYV9wZXJpb2Q7CiAKLQlsb2FkX2hlbHBlcl9pbml0KCk7Ci0JbG9h
ZF9oZWxwZXJfcnVuKEhJR0gpOwotCiAJaWd0X2Fzc2VydChmaWxsX2R1cmF0aW9uIDwgMTAwMDAw
MDAwMCk7CiAKIAlzdHJlYW1fZmQgPSBfX3BlcmZfb3Blbihkcm1fZmQsICZwYXJhbSwgdHJ1ZSAv
KiBwcmV2ZW50X3BtICovKTsKQEAgLTI0OTIsOSArMjQ4OSw2IEBAIHRlc3RfYnVmZmVyX2ZpbGwo
dm9pZCkKIAlmcmVlKGJ1Zik7CiAKIAlfX3BlcmZfY2xvc2Uoc3RyZWFtX2ZkKTsKLQotCWxvYWRf
aGVscGVyX3N0b3AoKTsKLQlsb2FkX2hlbHBlcl9maW5pKCk7CiB9CiAKIHN0YXRpYyB2b2lkCi0t
IAoyLjE5LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
