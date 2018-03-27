Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 27 Mar 2018 09:37:11 +0100
Message-Id: <20180327083711.21549-1-chris@chris-wilson.co.uk>
Subject: [Intel-gfx] [PATCH igt] igt/perf_pmu: Most-busy requires at least
 one busy engine
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

VGhlIHRlc3QgaXMgd2hldGhlciB3aXRoIGFsbCBidXQgb25lIGVuZ2luZSBidXN5IHdlIHJlY29y
ZCB0aGUgY29ycmVjdApsb2FkIG9uIGVhY2ggZW5naW5lLiBJZiB3ZSBvbmx5IGhhdmUgb25lIGVu
Z2luZSwgdGhpcyB0ZXN0IGRlZ2VuZXJhdGVzCmludG8gYWxsLWlkbGUvYWxsLWJ1c3ksIHNvIHdl
IGNhbiBza2lwIHRvIGF2b2lkIGNyYXNoaW5nIG9uIHRoZQphc3N1bXB0aW9uIHRoYXQgd2UgaGF2
ZSBhIGJ1c3kgc3Bpbm5lci4KClNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hy
aXMtd2lsc29uLmNvLnVrPgpDYzogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVs
LmNvbT4KLS0tCiB0ZXN0cy9wZXJmX3BtdS5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykKCmRpZmYgLS1naXQgYS90ZXN0cy9wZXJmX3BtdS5jIGIvdGVzdHMvcGVyZl9wbXUu
YwppbmRleCBmMjdiN2VjNy4uYjU5YWY4MTggMTAwNjQ0Ci0tLSBhL3Rlc3RzL3BlcmZfcG11LmMK
KysrIGIvdGVzdHMvcGVyZl9wbXUuYwpAQCAtNTEzLDYgKzUxMyw3IEBAIG1vc3RfYnVzeV9jaGVj
a19hbGwoaW50IGdlbV9mZCwgY29uc3Qgc3RydWN0IGludGVsX2V4ZWN1dGlvbl9lbmdpbmUyICpl
LAogCQl2YWxbaSsrXSA9IEk5MTVfUE1VX0VOR0lORV9CVVNZKGVfLT5jbGFzcywgZV8tPmluc3Rh
bmNlKTsKIAl9CiAJaWd0X2Fzc2VydChpID09IG51bV9lbmdpbmVzKTsKKwlpZ3RfcmVxdWlyZShz
cGluKTsgLyogYXQgbGVhc3Qgb25lIGJ1c3kgZW5naW5lICovCiAKIAlmZFswXSA9IC0xOwogCWZv
ciAoaSA9IDA7IGkgPCBudW1fZW5naW5lczsgaSsrKQotLSAKMi4xNi4zCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1nZnggbWFpbGluZyBsaXN0
CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
