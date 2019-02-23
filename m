Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Sat, 23 Feb 2019 09:49:35 +0000
Message-Id: <20190223094935.20311-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_eio: Skip context creation tests
 if lacking contexts
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

SWYgdGhlIGRldmljZSBkb2Vzbid0IHN1cHBvcnQgY29udGV4dHMsIHdlIGV4cGVjdCB0aGVtIHRv
IGZhaWwgd2l0aAotRU5PREVWIGJlZm9yZSByZXBvcnRpbmcgLUVJTyBpZiB3ZWRnZWQuCgpTaWdu
ZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KLS0tCiB0
ZXN0cy9pOTE1L2dlbV9laW8uYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS90ZXN0cy9pOTE1L2dlbV9laW8uYyBiL3Rlc3RzL2k5MTUvZ2VtX2Vp
by5jCmluZGV4IDIxYmY2NDI4NS4uMjkyNTA4NTIxIDEwMDY0NAotLS0gYS90ZXN0cy9pOTE1L2dl
bV9laW8uYworKysgYi90ZXN0cy9pOTE1L2dlbV9laW8uYwpAQCAtMTIyLDYgKzEyMiw4IEBAIHN0
YXRpYyB2b2lkIHRlc3RfY29udGV4dF9jcmVhdGUoaW50IGZkKQogewogCXVpbnQzMl90IGN0eDsK
IAorCWdlbV9yZXF1aXJlX2NvbnRleHRzKGZkKTsKKwogCXdlZGdlX2dwdShmZCk7CiAKIAlpZ3Rf
YXNzZXJ0X2VxKF9fZ2VtX2NvbnRleHRfY3JlYXRlKGZkLCAmY3R4KSwgLUVJTyk7Ci0tIAoyLjIw
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1k
ZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
