Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 19 Feb 2019 17:11:24 +0000
Message-Id: <20190219171124.23724-1-chris@chris-wilson.co.uk>
In-Reply-To: <20190217143556.9482-2-chris@chris-wilson.co.uk>
References: <20190217143556.9482-2-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t] i915/gem_eio: Check we only ban the
 context
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Mika Kuoppala <mika.kuoppala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

SW4gdHJpZ2dlciB0aGUgYmFuLCB3ZSBvbmx5IHdhbnQgdG8gb2JzZXJ2ZSB0aGUgbG9jYWwgY29u
dGV4dCBiZSBiYW5uZWQKYW5kIG5vdCB0aGUgZnByaXYgYXMgYSB3aG9sZS4KCnYyOiBBbmQgc2Vu
ZCBhbiBleGVjYnVmIGRvd24gdGhlIG5ldyBjb250ZXh0LgoKU2lnbmVkLW9mZi1ieTogQ2hyaXMg
V2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CkNjOiBNaWthIEt1b3BwYWxhIDxtaWth
Lmt1b3BwYWxhQGludGVsLmNvbT4KQ2M6IEFudG9uaW8gQXJnZW56aWFubyA8YW50b25pby5hcmdl
bnppYW5vQGludGVsLmNvbT4KLS0tCiB0ZXN0cy9pOTE1L2dlbV9laW8uYyB8IDEyICsrKysrKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90ZXN0
cy9pOTE1L2dlbV9laW8uYyBiL3Rlc3RzL2k5MTUvZ2VtX2Vpby5jCmluZGV4IGFjODVhMmVmZi4u
YjBiZTEyOGVmIDEwMDY0NAotLS0gYS90ZXN0cy9pOTE1L2dlbV9laW8uYworKysgYi90ZXN0cy9p
OTE1L2dlbV9laW8uYwpAQCAtMzEzLDggKzMxMywyMCBAQCBzdGF0aWMgdm9pZCBfX3Rlc3RfYmFu
bmVkKGludCBmZCkKIAkJaWd0X3NwaW5fdCAqaGFuZzsKIAogCQlpZiAoX19nZW1fZXhlY2J1Zihm
ZCwgJmV4ZWNidWYpID09IC1FSU8pIHsKKwkJCXVpbnQzMl90IGN0eCA9IDA7CisKIAkJCWlndF9p
bmZvKCJCYW5uZWQgYWZ0ZXIgY2F1c2luZyAlbHUgaGFuZ3NcbiIsIGNvdW50KTsKIAkJCWlndF9h
c3NlcnQoY291bnQgPiAxKTsKKworCQkJLyogT25seSB0aGlzIGNvbnRleHQsIG5vdCB0aGUgZmls
ZSwgc2hvdWxkIGJlIGJhbm5lZCAqLworCQkJaWd0X2Fzc2VydF9uZXEoX19nZW1fY29udGV4dF9j
cmVhdGUoZmQsICZjdHgpLCAtRUlPKTsKKwkJCWlndF9hc3NlcnRfbmVxKGN0eCwgMCk7CisKKwkJ
CS8qIEFuZCBjaGVjayBpdCBhY3R1YWxseSB3b3JrcyEgKi8KKwkJCWV4ZWNidWYucnN2ZDEgPSBj
dHg7CisJCQlnZW1fZXhlY2J1ZihmZCwgJmV4ZWNidWYpOworCisJCQlnZW1fY29udGV4dF9kZXN0
cm95KGZkLCBjdHgpOwogCQkJcmV0dXJuOwogCQl9CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlz
dApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4
