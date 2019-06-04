Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue,  4 Jun 2019 17:29:12 +0100
Message-Id: <20190604162912.28359-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_ctx_shared: Fixup vec0 mmio base
 for icl
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

SSB0b2xkIHZlY3MwIHRvIHVzZSB2ZWNzMSByZWdpc3RlcnMuLi4KClNpZ25lZC1vZmYtYnk6IENo
cmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgotLS0KIHRlc3RzL2k5MTUvZ2Vt
X2N0eF9zaGFyZWQuYyB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUvZ2VtX2N0eF9zaGFyZWQuYyBi
L3Rlc3RzL2k5MTUvZ2VtX2N0eF9zaGFyZWQuYwppbmRleCA2N2VjZDA5NTMuLjA2OTk2NDU0NiAx
MDA2NDQKLS0tIGEvdGVzdHMvaTkxNS9nZW1fY3R4X3NoYXJlZC5jCisrKyBiL3Rlc3RzL2k5MTUv
Z2VtX2N0eF9zaGFyZWQuYwpAQCAtNTQ0LDkgKzU0NCwxMSBAQCBzdGF0aWMgdm9pZCBpbmRlcGVu
ZGVudChpbnQgaTkxNSwgdW5zaWduZWQgcmluZywgdW5zaWduZWQgZmxhZ3MpCiAJCW1taW9fYmFz
ZSA9IDB4MjIwMDA7CiAJCWJyZWFrOwogCisjZGVmaW5lIEdFTjExX1ZFQ1MwX0JBU0UgMHgxYzgw
MDAKKyNkZWZpbmUgR0VOMTFfVkVDUzFfQkFTRSAweDFkODAwMAogCWNhc2UgSTkxNV9FWEVDX1ZF
Qk9YOgogCQlpZiAoaW50ZWxfZ2VuKGludGVsX2dldF9kcm1fZGV2aWQoaTkxNSkpID49IDExKQot
CQkJbW1pb19iYXNlID0gMHgxZDgwMDA7CisJCQltbWlvX2Jhc2UgPSBHRU4xMV9WRUNTMF9CQVNF
OwogCQllbHNlCiAJCQltbWlvX2Jhc2UgPSAweDFhMDAwOwogCQlicmVhazsKLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
