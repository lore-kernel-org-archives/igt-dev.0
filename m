Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 16 Aug 2018 07:06:46 +0100
Message-Id: <20180816060646.10081-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] [PATCH i-g-t] intel-ci: Exclude pm_rpm module-reload from
 full testing
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
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

VGhlIHBtX3JwbSBtb2R1bGUtcmVsb2FkIGV4aXN0cyB0byBleGVyY2lzZSBhIHJwbSB3YWtlcmVm
IGxlYWssIGFuZAphZmZlY3RzIHRoZSByYW5kb20gc2VsZWN0aW9uIG9mIHRlc3RzIHJ1biBhZnRl
ciBpdC4gU2ltaWxhciB0byB0aGUKbm9ybWFsIG1vZHVsZS1yZWxvYWQgdGVzdHMsIGNhcmUgbXVz
dCBiZSB0YWtlbiBpbiBpdHMgZXhlY3V0aW9uIHRvIGF2b2lkCmNhdXNpbmcgc3B1cmlvdXMgZmFp
bHVyZXMgZWxzZXdoZXJlLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJp
cy13aWxzb24uY28udWs+Ci0tLQogdGVzdHMvaW50ZWwtY2kvYmxhY2tsaXN0LnR4dCB8IDEgKwog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwt
Y2kvYmxhY2tsaXN0LnR4dCBiL3Rlc3RzL2ludGVsLWNpL2JsYWNrbGlzdC50eHQKaW5kZXggYzkz
NTU0YTM3Li44OGIyZmUzMTMgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ludGVsLWNpL2JsYWNrbGlzdC50
eHQKKysrIGIvdGVzdHMvaW50ZWwtY2kvYmxhY2tsaXN0LnR4dApAQCAtMTMsNiArMTMsNyBAQCBp
Z3RAZHJtX21tKEAuKik/CiAjIGZhaWx1cmVzIGluIHRlc3RzIHJ1biBhZnRlcndhcmRzLgogIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIGlndEBkcnZfbW9k
dWxlX3JlbG9hZChALiopPworaWd0QHBtX3JwbUBtb2R1bGUtcmVsb2FkCiAjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogIyBHRU0KICMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCi0tIAoyLjE4LjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0
CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
