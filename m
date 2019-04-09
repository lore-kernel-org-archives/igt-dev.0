Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue,  9 Apr 2019 21:53:16 +0100
Message-Id: <20190409205316.1951-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_ppgtt: Enable libdrm bo reuse
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

VHJ5IHBhcGVyaW5nIG92ZXIgdGhlIGljbCBtZW1sZWFrIHdpdGggYSBzcG90IG9mIGJ1ZmZlciBy
ZWN5Y2xpbmcuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNv
bi5jby51az4KLS0tCiB0ZXN0cy9pOTE1L2dlbV9wcGd0dC5jIHwgMiArKwogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUvZ2VtX3BwZ3R0LmMg
Yi90ZXN0cy9pOTE1L2dlbV9wcGd0dC5jCmluZGV4IGFlOTg2OWMyYy4uNGJmZjVjZjk4IDEwMDY0
NAotLS0gYS90ZXN0cy9pOTE1L2dlbV9wcGd0dC5jCisrKyBiL3Rlc3RzL2k5MTUvZ2VtX3BwZ3R0
LmMKQEAgLTEwNyw2ICsxMDcsNyBAQCBzdGF0aWMgdm9pZCBmb3JrX3Jjc19jb3B5KGludCB0aW1l
b3V0LCB1aW50MzJfdCBmaW5hbCwKIAogCQlidWZtZ3IgPSBkcm1faW50ZWxfYnVmbWdyX2dlbV9p
bml0KGZkLCA0MDk2KTsKIAkJaWd0X2Fzc2VydChidWZtZ3IpOworCQlkcm1faW50ZWxfYnVmbWdy
X2dlbV9lbmFibGVfcmV1c2UoYnVmbWdyKTsKIAogCQlkc3RbY2hpbGRdID0gY3JlYXRlX2JvKGJ1
Zm1nciwgfjApOwogCkBAIC0xNzksNiArMTgwLDcgQEAgc3RhdGljIHZvaWQgZm9ya19iY3NfY29w
eShpbnQgdGltZW91dCwgdWludDMyX3QgZmluYWwsCiAKIAkJYnVmbWdyID0gZHJtX2ludGVsX2J1
Zm1ncl9nZW1faW5pdChmZCwgNDA5Nik7CiAJCWlndF9hc3NlcnQoYnVmbWdyKTsKKwkJZHJtX2lu
dGVsX2J1Zm1ncl9nZW1fZW5hYmxlX3JldXNlKGJ1Zm1ncik7CiAKIAkJZHN0W2NoaWxkXSA9IGNy
ZWF0ZV9ibyhidWZtZ3IsIH4wKTsKIAl9Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaWd0LWRldg==
