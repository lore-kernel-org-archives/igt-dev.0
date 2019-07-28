Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Sun, 28 Jul 2019 10:23:22 +0100
Message-Id: <20190728092322.23239-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t] i915/gem_exec_schedule: Only require the
 scheduler
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
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

SWYgdGhlIGxlZ2FjeSByaW5nYnVmZmVyIGRvZXNuJ3Qgc3VwcG9ydCBzY2hlZHVsaW5nLCBpdCBk
b2Vzbid0IHNldCB0aGUKY2FwISBIeXBvdGhldGljYWxseSBpZiBvbmUgd2VyZSB0byBlbmFibGUg
cmluZ2J1ZmZlciBzY2hlZHVsaW5nLCB0aGlzIGlzCnBhcnQgb2YgaXRzIHRlc3Rpbmcgc3VpdGUu
CgpTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4K
LS0tCiB0ZXN0cy9pOTE1L2dlbV9leGVjX3NjaGVkdWxlLmMgfCAzIC0tLQogMSBmaWxlIGNoYW5n
ZWQsIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9nZW1fZXhlY19zY2hl
ZHVsZS5jIGIvdGVzdHMvaTkxNS9nZW1fZXhlY19zY2hlZHVsZS5jCmluZGV4IDdiNDE4NjIyOC4u
NGNjYWNiYTQxIDEwMDY0NAotLS0gYS90ZXN0cy9pOTE1L2dlbV9leGVjX3NjaGVkdWxlLmMKKysr
IGIvdGVzdHMvaTkxNS9nZW1fZXhlY19zY2hlZHVsZS5jCkBAIC0xNzc0LDkgKzE3NzQsNiBAQCBp
Z3RfbWFpbgogCQlpZ3RfZml4dHVyZSB7CiAJCQlpZ3RfcmVxdWlyZShnZW1fc2NoZWR1bGVyX2Vu
YWJsZWQoZmQpKTsKIAkJCWlndF9yZXF1aXJlKGdlbV9zY2hlZHVsZXJfaGFzX2N0eF9wcmlvcml0
eShmZCkpOwotCi0JCQkvKiBuZWVkIHNlcGFyYXRlIHJpbmdzICovCi0JCQlpZ3RfcmVxdWlyZShn
ZW1faGFzX2V4ZWNsaXN0cyhmZCkpOwogCQl9CiAKIAkJZm9yIChlID0gaW50ZWxfZXhlY3V0aW9u
X2VuZ2luZXM7IGUtPm5hbWU7IGUrKykgewotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVs
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZng=
