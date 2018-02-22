Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 22 Feb 2018 08:27:37 +0000
Message-Id: <20180222082737.4719-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] [PATCH igt] igt/gem_ctx_isolation: Fix checking for
 context support
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

TWlzc2VkIHRoZSBuZXcgbWV0aG9kIGZvciBpZ3RfcmVxdWlyZShnZW1faGFzX2NvbnRleHRzKCkp
IGluIHRoZSByZWJhc2UuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlz
LXdpbHNvbi5jby51az4KLS0tCiB0ZXN0cy9nZW1fY3R4X2lzb2xhdGlvbi5jIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
dGVzdHMvZ2VtX2N0eF9pc29sYXRpb24uYyBiL3Rlc3RzL2dlbV9jdHhfaXNvbGF0aW9uLmMKaW5k
ZXggY2I4MjJjNWIuLmQ4MTA5YWEwIDEwMDY0NAotLS0gYS90ZXN0cy9nZW1fY3R4X2lzb2xhdGlv
bi5jCisrKyBiL3Rlc3RzL2dlbV9jdHhfaXNvbGF0aW9uLmMKQEAgLTYzMCw4ICs2MzAsOCBAQCBp
Z3RfbWFpbgogCiAJCWZkID0gZHJtX29wZW5fZHJpdmVyKERSSVZFUl9JTlRFTCk7CiAJCWlndF9y
ZXF1aXJlX2dlbShmZCk7CisJCWlndF9yZXF1aXJlKGdlbV9oYXNfY29udGV4dHMoZmQpKTsKIAot
CQlnZW1fY29udGV4dF9kZXN0cm95KGZkLCBnZW1fY29udGV4dF9jcmVhdGUoZmQpKTsKIAkJaGFz
X2NvbnRleHRfaXNvbGF0aW9uID0gX19oYXNfY29udGV4dF9pc29sYXRpb24oZmQpOwogCQlpZ3Rf
cmVxdWlyZShoYXNfY29udGV4dF9pc29sYXRpb24pOwogCi0tIAoyLjE2LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0
CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
