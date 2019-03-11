Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 11 Mar 2019 14:18:01 +0000
Message-Id: <20190311141801.5393-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t] i915/gem_ppgtt: Swap args to
 intel_require_memory()
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
Cc: igt-dev@lists.freedesktop.org, mika.kuoppala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

SXQgc2hvdWxkIGJlIChjb3VudCwgc2l6ZSkhCgpTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24g
PGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KLS0tCiB0ZXN0cy9pOTE1L2dlbV9wcGd0dC5jIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvdGVzdHMvaTkxNS9nZW1fcHBndHQuYyBiL3Rlc3RzL2k5MTUvZ2VtX3BwZ3R0LmMK
aW5kZXggOTQwOWJlZjE0Li5hZTk4NjljMmMgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2k5MTUvZ2VtX3Bw
Z3R0LmMKKysrIGIvdGVzdHMvaTkxNS9nZW1fcHBndHQuYwpAQCAtOTcsNyArOTcsNyBAQCBzdGF0
aWMgdm9pZCBmb3JrX3Jjc19jb3B5KGludCB0aW1lb3V0LCB1aW50MzJfdCBmaW5hbCwKIAltZW1f
cGVyX2NoaWxkID0gU0laRTsKIAlpZiAoZmxhZ3MgJiBDUkVBVEVfQ09OVEVYVCkKIAkJbWVtX3Bl
cl9jaGlsZCArPSAyICogMTI4ICogMTAyNDsgLyogcm91Z2ggY29udGV4dCBzaXplcyAqLwotCWlu
dGVsX3JlcXVpcmVfbWVtb3J5KG1lbV9wZXJfY2hpbGQsIGNvdW50LCBDSEVDS19SQU0pOworCWlu
dGVsX3JlcXVpcmVfbWVtb3J5KGNvdW50LCBtZW1fcGVyX2NoaWxkLCBDSEVDS19SQU0pOwogCiAJ
Zm9yIChpbnQgY2hpbGQgPSAwOyBjaGlsZCA8IGNvdW50OyBjaGlsZCsrKSB7CiAJCWludCBmZCA9
IGRybV9vcGVuX2RyaXZlcihEUklWRVJfSU5URUwpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1nZnggbWFpbGluZyBsaXN0
CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZng=
