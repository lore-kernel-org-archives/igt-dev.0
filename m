Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon,  4 Nov 2019 15:29:09 +0000
Message-Id: <20191104152909.21736-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_ctx_shared: Use the supplied ring
 for smoketest
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

QWxsb3cgdGhlIHN1YnRlc3RzIHRoYXQgd2FudCB0byBsaW1pdCB0aGUgdGVzdCB0byBhIHNpbmds
ZSBlbmdpbmUsIHRvCmxpbWl0IHRoZSB0ZXN0IHRvIGEgc2luZ2xlIGVuZ2luZS4KClNpZ25lZC1v
ZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgpDYzogTWlrYSBL
dW9wcGFsYSA8bWlrYS5rdW9wcGFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQogdGVzdHMvaTkxNS9n
ZW1fY3R4X3NoYXJlZC5jIHwgOCArKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9pOTE1L2dlbV9jdHhfc2hh
cmVkLmMgYi90ZXN0cy9pOTE1L2dlbV9jdHhfc2hhcmVkLmMKaW5kZXggNmQ4Y2JjY2UyLi40ZDlm
ZmFmY2UgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2k5MTUvZ2VtX2N0eF9zaGFyZWQuYworKysgYi90ZXN0
cy9pOTE1L2dlbV9jdHhfc2hhcmVkLmMKQEAgLTc0MCw4ICs3NDAsMTIgQEAgc3RhdGljIHZvaWQg
c21va2V0ZXN0KGludCBpOTE1LCB1bnNpZ25lZCByaW5nLCB1bnNpZ25lZCB0aW1lb3V0KQogCXVp
bnQzMl90ICpwdHI7CiAKIAluZW5naW5lID0gMDsKLQlmb3JfZWFjaF9waHlzaWNhbF9lbmdpbmUo
ZSwgaTkxNSkKLQkJZW5naW5lc1tuZW5naW5lKytdID0gZWJfcmluZyhlKTsKKwlpZiAocmluZyA9
PSAtMSkgeworCQlmb3JfZWFjaF9waHlzaWNhbF9lbmdpbmUoZSwgaTkxNSkKKwkJCWVuZ2luZXNb
bmVuZ2luZSsrXSA9IGViX3JpbmcoZSk7CisJfSBlbHNlIHsKKwkJZW5naW5lc1tuZW5naW5lKytd
ID0gcmluZzsKKwl9CiAJaWd0X3JlcXVpcmUobmVuZ2luZSk7CiAKIAlzY3JhdGNoID0gZ2VtX2Ny
ZWF0ZShpOTE1LCA0MDk2KTsKLS0gCjIuMjQuMC5yYzIKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaWd0LWRldg==
