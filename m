Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EDF189998
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Feb 2019 00:02:47 +0000 (UTC)
From: Caz Yokoyama <caz.yokoyama@intel.com>
Date: Sat, 23 Feb 2019 06:54:20 +0000
Message-Id: <3c1d471aaff359e7dc2c9c7d34325e78858f0913.1550904761.git.caz.yokoyama@intel.com>
Subject: [igt-dev] [igt PATCH v1 1/1] i915/gem_ctx_switch: evenly run 4
 child processes
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
List-ID: <igt-dev@lists.freedesktop.org>

Z2VtX2N0eF9zd2l0Y2hAYmFzaWMtYWxsLWxpZ2h0IHRlc3QgY3JlYXRlcyA0IGNoaWxkIHByb2Nl
c3NlcyBmb3IgZWFjaAplbmdpbmUgYW5kIHdhaXQuIHJlbmRlciBlbmdpbmUgcnVucyBzbG93ZXIg
dGhhbiBvdGhlcnMuIEJ5IHRoaXMgcGF0Y2gsCjQgY2hpbGQgcHJvY2Vzc2VzIHJ1biBmYWlybHkg
ZXZlbmx5LiBBcyBhIHJlc3VsdCwgcGFyZW50IHByb2Nlc3MgcnVucwpmYXN0ZXIuIE9uIG15IE5V
QywgaXRzIGV4ZWN1dGlvbiB0aW1lIGJlY29tZXMgYWJvdXQgaGFsZi4KClNpZ25lZC1vZmYtYnk6
IENheiBZb2tveWFtYSA8Y2F6Lnlva295YW1hQGludGVsLmNvbT4KLS0tCiB0ZXN0cy9pOTE1L2dl
bV9jdHhfc3dpdGNoLmMgfCA0ICsrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9pOTE1L2dlbV9jdHhfc3dpdGNoLmMg
Yi90ZXN0cy9pOTE1L2dlbV9jdHhfc3dpdGNoLmMKaW5kZXggMTIwOGNiOGQuLjllZDIyZjM1IDEw
MDY0NAotLS0gYS90ZXN0cy9pOTE1L2dlbV9jdHhfc3dpdGNoLmMKKysrIGIvdGVzdHMvaTkxNS9n
ZW1fY3R4X3N3aXRjaC5jCkBAIC0yNDcsNyArMjQ3LDkgQEAgc3RhdGljIHZvaWQgYWxsKGludCBm
ZCwgdWludDMyX3QgaGFuZGxlLCB1bnNpZ25lZCBmbGFncywgaW50IHRpbWVvdXQpCiAKIAkJCQlj
bG9ja19nZXR0aW1lKENMT0NLX01PTk9UT05JQywgJnN0YXJ0KTsKIAkJCQlkbyB7Ci0JCQkJCWZv
ciAoaW50IGxvb3AgPSAwOyBsb29wIDwgcWxlbjsgbG9vcCsrKSB7CisJCQkJCWludCB4ID0gc3Ry
Y21wKG5hbWVbY2hpbGRdLCAicmVuZGVyIikgPT0gMCA/IHFsZW4vMiA6IHFsZW47CisKKwkJCQkJ
Zm9yIChpbnQgbG9vcCA9IDA7IGxvb3AgPCB4OyBsb29wKyspIHsKIAkJCQkJCWV4ZWNidWYucnN2
ZDEgPSBjb250ZXh0c1tsb29wICUgbmN0eF07CiAJCQkJCQlnZW1fZXhlY2J1ZihmZCwgJmV4ZWNi
dWYpOwogCQkJCQl9Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aWd0LWRldg==
