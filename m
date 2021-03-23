Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 334E088F06
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Mar 2021 18:04:08 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 23 Mar 2021 19:03:47 +0100
Message-Id: <20210323180347.48355-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/gem_mmap_offset: Fix invalid munmap
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
Cc: Petri Latvala <petri.latvala@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Rml4IG5hc3R5IGJ1ZyB3aGljaCBsZWFkcyB0byBTSUdTRUdWIGluIGJsdC1jb2hlcmVuY3kgdGVz
dC4KSW5zdGVhZCBvZiBwb2ludGVyIHVubWFwIHdhcyBkb25lIG9uIGludGVsX2J1ZiB3aGF0IHdh
cyB3cm9uZy4KClNpZ25lZC1vZmYtYnk6IFpiaWduaWV3IEtlbXBjennFhHNraSA8emJpZ25pZXcu
a2VtcGN6eW5za2lAaW50ZWwuY29tPgpDYzogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBp
bnRlbC5jb20+CkNjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KLS0t
CiB0ZXN0cy9pOTE1L2dlbV9tbWFwX29mZnNldC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9nZW1f
bW1hcF9vZmZzZXQuYyBiL3Rlc3RzL2k5MTUvZ2VtX21tYXBfb2Zmc2V0LmMKaW5kZXggOGIyOWQw
YTBhLi5kZTkyN2UzMmUgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2k5MTUvZ2VtX21tYXBfb2Zmc2V0LmMK
KysrIGIvdGVzdHMvaTkxNS9nZW1fbW1hcF9vZmZzZXQuYwpAQCAtNTkxLDcgKzU5MSw3IEBAIHN0
YXRpYyBzdHJ1Y3QgaW50ZWxfYnVmICpjcmVhdGVfYm8oc3RydWN0IGJ1Zl9vcHMgKmJvcHMsIHVp
bnQzMl90IHZhbHVlLAogCWZvciAoaW50IGkgPSAwOyBpIDwgNjQgLyBzaXplb2YoKnYpOyBpKysp
CiAJCXZbaV0gPSB2YWx1ZTsKIAotCW11bm1hcChidWYsIHNpemUpOworCW11bm1hcCh2LCBzaXpl
KTsKIAogCXJldHVybiBidWY7CiB9Ci0tIAoyLjI2LjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaWd0LWRldgo=
