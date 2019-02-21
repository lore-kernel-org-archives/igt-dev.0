Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 21 Feb 2019 10:19:44 +0000
Message-Id: <20190221101944.19711-2-chris@chris-wilson.co.uk>
In-Reply-To: <20190221101944.19711-1-chris@chris-wilson.co.uk>
References: <20190221101944.19711-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] igt/drv_hangman: Skip if resets are
 disallowed
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

SWYgd2UgdGVsbCB0aGUgbWFjaGluZSB0byByZXNldCBidXQgdGhleSBhcmUgZGlzYWxsb3dlZCwg
d2Ugd2lsbCBsZWF2ZQp0aGUgc3lzdGVtIGluIGEgd2VkZ2VkIHN0YXRlLCBwcmV2ZW50aW5nIHRo
ZSBtYWpvcml0eSBvZiBzdWJzZXF1ZW50CnRlc3RzLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2ls
c29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Ci0tLQogdGVzdHMvaTkxNS9pOTE1X2hhbmdt
YW4uYyB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL3Rlc3RzL2k5MTUvaTkxNV9oYW5nbWFuLmMgYi90ZXN0cy9pOTE1L2k5MTVfaGFuZ21h
bi5jCmluZGV4IGRmMWUwYWZlZC4uNGU1MTVlM2EwIDEwMDY0NAotLS0gYS90ZXN0cy9pOTE1L2k5
MTVfaGFuZ21hbi5jCisrKyBiL3Rlc3RzL2k5MTUvaTkxNV9oYW5nbWFuLmMKQEAgLTI1Nyw2ICsy
NTcsNyBAQCBzdGF0aWMgdm9pZCBoYW5nY2hlY2tfdW50ZXJtaW5hdGVkKHZvaWQpCiBpZ3RfbWFp
bgogewogCWNvbnN0IHN0cnVjdCBpbnRlbF9leGVjdXRpb25fZW5naW5lICplOworCWlndF9oYW5n
X3QgaGFuZyA9IHt9OwogCiAJaWd0X3NraXBfb25fc2ltdWxhdGlvbigpOwogCkBAIC0yNjYsNiAr
MjY3LDggQEAgaWd0X21haW4KIAkJZGV2aWNlID0gZHJtX29wZW5fZHJpdmVyKERSSVZFUl9JTlRF
TCk7CiAJCWlndF9yZXF1aXJlX2dlbShkZXZpY2UpOwogCisJCWhhbmcgPSBpZ3RfYWxsb3dfaGFu
ZyhkZXZpY2UsIDAsIEhBTkdfQUxMT1dfQ0FQVFVSRSk7CisKIAkJc3lzZnMgPSBpZ3Rfc3lzZnNf
b3BlbihkZXZpY2UsICZpZHgpOwogCQlpZ3RfYXNzZXJ0KHN5c2ZzICE9IC0xKTsKIApAQCAtMjg4
LDQgKzI5MSw4IEBAIGlndF9tYWluCiAKIAlpZ3Rfc3VidGVzdCgiaGFuZ2NoZWNrLXVudGVybWlu
YXRlZCIpCiAJCWhhbmdjaGVja191bnRlcm1pbmF0ZWQoKTsKKworCWlndF9maXh0dXJlIHsKKwkJ
aWd0X2Rpc2FsbG93X2hhbmcoZGV2aWNlLCBoYW5nKTsKKwl9CiB9Ci0tIAoyLjIwLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGlu
ZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
