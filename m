Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0771898BE
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jan 2020 14:25:38 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Tue, 14 Jan 2020 16:25:21 +0200
Message-Id: <20200114142523.10603-5-ville.syrjala@linux.intel.com>
In-Reply-To: <20200114142523.10603-1-ville.syrjala@linux.intel.com>
References: <20200114142523.10603-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 5/7] tests/kms_dp_tiled_display: Use labs()
 for long
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCid1
c2VjJyBpcyBhIGxvbmcgc28gd2UgbmVlZCBsYWJzKCkgaW5zdGVhZCBvZiBhYnMoKS4KClNpZ25l
ZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+
Ci0tLQogdGVzdHMva21zX2RwX3RpbGVkX2Rpc3BsYXkuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19k
cF90aWxlZF9kaXNwbGF5LmMgYi90ZXN0cy9rbXNfZHBfdGlsZWRfZGlzcGxheS5jCmluZGV4IDIx
OWRlMDFjN2IyNy4uYjExNjBmZWUzYjBlIDEwMDY0NAotLS0gYS90ZXN0cy9rbXNfZHBfdGlsZWRf
ZGlzcGxheS5jCisrKyBiL3Rlc3RzL2ttc19kcF90aWxlZF9kaXNwbGF5LmMKQEAgLTM2NCw3ICsz
NjQsNyBAQCBzdGF0aWMgdm9pZCBwYWdlX2ZsaXBfaGFuZGxlcihpbnQgZmQsIHVuc2lnbmVkIGlu
dCBzZXEsCiAJICogRm9yIHNlYW1sZXNzIHRlYXItZnJlZSBkaXNwbGF5LCB0aGUgcGFnZSBmbGlw
IGV2ZW50IHRpbWVzdGFtcHMKIAkgKiBmcm9tIGFsbCB0aGUgdGlsZXMgc2hvdWxkIG5vdCBkaWZm
ZXIgYnkgbW9yZSB0aGFuIDEwdXMuCiAJICovCi0JaWd0X2ZhaWxfb25fZihhYnModXNlYykgPj0g
MTAsICJEZWxheWVkIHBhZ2UgZmxpcCBldmVudCBmcm9tIENSVEM6JWQgYXQgJXU6JXVcbiIsCisJ
aWd0X2ZhaWxfb25fZihsYWJzKHVzZWMpID49IDEwLCAiRGVsYXllZCBwYWdlIGZsaXAgZXZlbnQg
ZnJvbSBDUlRDOiVkIGF0ICV1OiV1XG4iLAogCQkgICAgICBjcnRjX2lkLCB0dl9zZWMsIHR2X3Vz
ZWMpOwogfQogCi0tIAoyLjI0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0
LWRldgo=
