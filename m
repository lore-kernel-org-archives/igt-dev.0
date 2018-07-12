Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 12 Jul 2018 16:38:49 +0100
Message-Id: <20180712153849.12517-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] [PATCH i-g-t] igt/gem_render_copy_redux: Check for GEM
 before use
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

QXMgcmVuZGVyIGNvcHkgd2FudHMgdG8gdXNlIHRoZSBHUFUsIHdlIHNob3VsZCBtYWtlIHN1cmUg
aXQgaXMgbm90CndlZGdlZCBmaXJzdC4KClNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hy
aXNAY2hyaXMtd2lsc29uLmNvLnVrPgotLS0KIHRlc3RzL2dlbV9yZW5kZXJfY29weV9yZWR1eC5j
IHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS90ZXN0
cy9nZW1fcmVuZGVyX2NvcHlfcmVkdXguYyBiL3Rlc3RzL2dlbV9yZW5kZXJfY29weV9yZWR1eC5j
CmluZGV4IDI3MDk4ZWE2ZC4uYTg2MTg2MmQwIDEwMDY0NAotLS0gYS90ZXN0cy9nZW1fcmVuZGVy
X2NvcHlfcmVkdXguYworKysgYi90ZXN0cy9nZW1fcmVuZGVyX2NvcHlfcmVkdXguYwpAQCAtMjA5
LDYgKzIwOSw3IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikKIAogCWlndF9maXh0
dXJlIHsKIAkJZGF0YV9pbml0KCZkYXRhKTsKKwkJaWd0X3JlcXVpcmVfZ2VtKGRhdGEuZmQpOwog
CX0KIAogCWlndF9zdWJ0ZXN0KCJub3JtYWwiKSB7Ci0tIAoyLjE4LjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0Cmln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
