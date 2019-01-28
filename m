Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 28 Jan 2019 10:18:49 +0000
Message-Id: <20190128101849.21355-1-chris@chris-wilson.co.uk>
In-Reply-To: <20190128101415.21163-1-chris@chris-wilson.co.uk>
References: <20190128101415.21163-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/perf_pmu: Check for hangs allowed
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
Cc: igt-dev@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Q2hlY2sgd2UgY2FuIHJlc2V0IHRoZSBHUFUgYmVmb3JlIHJ1bm5pbmcgdGhlIHJlc2V0IHRlc3Qu
CgpTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4K
Q2M6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+Ci0tLQpEaWZmZXJl
bnQgbWVhbmluZyBvZiBmbGFncywgaXQncyBub3QgdGhlIHJpbmcgaWQhCi0tLQogdGVzdHMvcGVy
Zl9wbXUuYyB8IDcgKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL3BlcmZfcG11LmMgYi90ZXN0cy9wZXJmX3Bt
dS5jCmluZGV4IDIxMjkyYmYzYS4uYzk4ODFlNTlmIDEwMDY0NAotLS0gYS90ZXN0cy9wZXJmX3Bt
dS5jCisrKyBiL3Rlc3RzL3BlcmZfcG11LmMKQEAgLTE4MTIsOCArMTgxMiwxMyBAQCBpZ3RfbWFp
bgogCQkJCQlhY2N1cmFjeShmZCwgZSwgcGN0W2ldLCAxMCk7CiAJCQl9CiAKLQkJCWlndF9zdWJ0
ZXN0X2YoImJ1c3ktaGFuZy0lcyIsIGUtPm5hbWUpCisJCQlpZ3Rfc3VidGVzdF9mKCJidXN5LWhh
bmctJXMiLCBlLT5uYW1lKSB7CisJCQkJaWd0X2hhbmdfdCBoYW5nID0gaWd0X2FsbG93X2hhbmco
ZmQsIDAsIDApOworCiAJCQkJc2luZ2xlKGZkLCBlLCBURVNUX0JVU1kgfCBGTEFHX0hBTkcpOwor
CisJCQkJaWd0X2Rpc2FsbG93X2hhbmcoZmQsIGhhbmcpOworCQkJfQogCQl9CiAKIAkJLyoqCi0t
IAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
