Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Sun, 11 Feb 2018 18:54:33 +0000
Message-Id: <20180211185433.22500-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] [PATCH igt] igt/kms_frontbuffer_tracking: Disable FBC
 testing for -ENODEV
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

U2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Ci0t
LQogdGVzdHMva21zX2Zyb250YnVmZmVyX3RyYWNraW5nLmMgfCAzICsrKwogMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19mcm9udGJ1ZmZlcl90
cmFja2luZy5jIGIvdGVzdHMva21zX2Zyb250YnVmZmVyX3RyYWNraW5nLmMKaW5kZXggNjAyNzA3
Zjk4Li42ZDNmZThkMDIgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19mcm9udGJ1ZmZlcl90cmFja2lu
Zy5jCisrKyBiL3Rlc3RzL2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5jCkBAIC0xNTg4LDYgKzE1
ODgsOSBAQCBzdGF0aWMgYm9vbCBmYmNfc3VwcG9ydGVkX29uX2NoaXBzZXQodm9pZCkKIAljaGFy
IGJ1ZlsxMjhdOwogCiAJZGVidWdmc19yZWFkKCJpOTE1X2ZiY19zdGF0dXMiLCBidWYpOworCWlm
ICgqYnVmID09ICdcMCcpCisJCXJldHVybiBmYWxzZTsKKwogCXJldHVybiAhc3Ryc3RyKGJ1Ziwg
IkZCQyB1bnN1cHBvcnRlZCBvbiB0aGlzIGNoaXBzZXRcbiIpOwogfQogCi0tIAoyLjE2LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFp
bGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
