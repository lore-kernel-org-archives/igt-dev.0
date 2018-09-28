Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Deepak Rawat <drawat@vmware.com>
Date: Thu, 27 Sep 2018 17:43:50 -0700
Message-ID: <20180928004350.2346-7-drawat@vmware.com>
In-Reply-To: <20180928004350.2346-1-drawat@vmware.com>
References: <20180928004350.2346-1-drawat@vmware.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 7/7] tests/plane_damage: Integrate kernel
 selftest test-drm_damage_helper
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
To: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-graphics-maintainer@vmware.com, thellstrom@vmware.com, syeh@vmware.com
Cc: Deepak Rawat <drawat@vmware.com>
List-ID: <igt-dev@lists.freedesktop.org>

Q2FsbCBrZXJuZWwgc2VsZnRlc3QgbW9kdWxlIHRlc3QtZHJtX2RhbWFnZV9oZWxwZXIgZnJvbSBp
Z3QuCgpTaWduZWQtb2ZmLWJ5OiBEZWVwYWsgUmF3YXQgPGRyYXdhdEB2bXdhcmUuY29tPgotLS0K
IHRlc3RzL01ha2VmaWxlLnNvdXJjZXMgICB8ICAxICsKIHRlc3RzL2RybV9wbGFuZV9kYW1hZ2Uu
YyB8IDEwICsrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQogY3Jl
YXRlIG1vZGUgMTAwNjQ0IHRlc3RzL2RybV9wbGFuZV9kYW1hZ2UuYwoKZGlmZiAtLWdpdCBhL3Rl
c3RzL01ha2VmaWxlLnNvdXJjZXMgYi90ZXN0cy9NYWtlZmlsZS5zb3VyY2VzCmluZGV4IDI2OTMz
NmFkLi4zMWVhODgxOSAxMDA2NDQKLS0tIGEvdGVzdHMvTWFrZWZpbGUuc291cmNlcworKysgYi90
ZXN0cy9NYWtlZmlsZS5zb3VyY2VzCkBAIC0yMjksNiArMjI5LDcgQEAgVEVTVFNfcHJvZ3MgPSBc
CiAJdG9vbHNfdGVzdCBcCiAJdmdlbV9iYXNpYyBcCiAJdmdlbV9zbG93IFwKKwlkcm1fcGxhbmVf
ZGFtYWdlIFwKIAkkKE5VTEwpCiAKIFRFU1RTX3Byb2dzX1ggPSBcCmRpZmYgLS1naXQgYS90ZXN0
cy9kcm1fcGxhbmVfZGFtYWdlLmMgYi90ZXN0cy9kcm1fcGxhbmVfZGFtYWdlLmMKbmV3IGZpbGUg
bW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAuLmMyYjc5M2NjCi0tLSAvZGV2L251bGwKKysrIGIv
dGVzdHMvZHJtX3BsYW5lX2RhbWFnZS5jCkBAIC0wLDAgKzEsMTAgQEAKKy8qIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBHUEwtMi4wICovCisjaW5jbHVkZSAiaWd0LmgiCisjaW5jbHVkZSAiaWd0
X2ttb2QuaCIKKworSUdUX1RFU1RfREVTQ1JJUFRJT04oIkJhc2ljIHNhbml0eSBjaGVjayBvZiBE
Uk0ncyBwbGFuZSBkYW1hZ2UgaGVscGVyIGl0ZXJhdG9yLiIpOworCitpZ3RfbWFpbgoreworCWln
dF9rc2VsZnRlc3RzKCJ0ZXN0LWRybV9kYW1hZ2VfaGVscGVyIiwgTlVMTCwgTlVMTCwgTlVMTCk7
Cit9Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
