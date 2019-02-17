Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Sun, 17 Feb 2019 14:35:50 +0000
Message-Id: <20190217143556.9482-2-chris@chris-wilson.co.uk>
In-Reply-To: <20190217143556.9482-1-chris@chris-wilson.co.uk>
References: <20190217143556.9482-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/8] i915/gem_eio: Check we only ban the
 context
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
Cc: igt-dev@lists.freedesktop.org, Mika Kuoppala <mika.kuoppala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

SW4gdHJpZ2dlciB0aGUgYmFuLCB3ZSBvbmx5IHdhbnQgdG8gb2JzZXJ2ZSB0aGUgbG9jYWwgY29u
dGV4dCBiZSBiYW5uZWQKYW5kIG5vdCB0aGUgZnByaXYgYXMgYSB3aG9sZS4KClNpZ25lZC1vZmYt
Ynk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgpDYzogTWlrYSBLdW9w
cGFsYSA8bWlrYS5rdW9wcGFsYUBpbnRlbC5jb20+Ci0tLQogdGVzdHMvaTkxNS9nZW1fZWlvLmMg
fCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS90ZXN0cy9pOTE1L2dlbV9laW8uYyBiL3Rlc3RzL2k5MTUvZ2VtX2Vpby5jCmluZGV4IDNjNTQ4
MjBjOS4uM2FmZGJkNjllIDEwMDY0NAotLS0gYS90ZXN0cy9pOTE1L2dlbV9laW8uYworKysgYi90
ZXN0cy9pOTE1L2dlbV9laW8uYwpAQCAtMzI0LDggKzMyNCwxNSBAQCBzdGF0aWMgdm9pZCBfX3Rl
c3RfYmFubmVkKGludCBmZCkKIAkJaWd0X3NwaW5fdCAqaGFuZzsKIAogCQlpZiAoX19nZW1fZXhl
Y2J1ZihmZCwgJmV4ZWNidWYpID09IC1FSU8pIHsKKwkJCXVpbnQzMl90IGN0eCA9IDA7CisKIAkJ
CWlndF9pbmZvKCJCYW5uZWQgYWZ0ZXIgY2F1c2luZyAlbHUgaGFuZ3NcbiIsIGNvdW50KTsKIAkJ
CWlndF9hc3NlcnQoY291bnQgPiAxKTsKKworCQkJLyogT25seSB0aGlzIGNvbnRleHQsIG5vdCB0
aGUgZmlsZSwgc2hvdWxkIGJlIGJhbm5lZCAqLworCQkJaWd0X2Fzc2VydF9uZXEoX19nZW1fY29u
dGV4dF9jcmVhdGUoZmQsICZjdHgpLCAtRUlPKTsKKwkJCWlndF9hc3NlcnRfbmVxKGN0eCwgMCk7
CisJCQlnZW1fY29udGV4dF9kZXN0cm95KGZkLCBjdHgpOwogCQkJcmV0dXJuOwogCQl9CiAKLS0g
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
aWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
