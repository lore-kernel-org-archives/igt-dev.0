Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A8A66E2BC
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jul 2019 00:45:52 +0000 (UTC)
From: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Date: Wed, 17 Jul 2019 17:43:30 -0700
Message-Id: <20190718004331.4603-1-dhinakaran.pandiyan@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] tools/vbt_decode: Fix VBT parsing for
 the PSR section
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
Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

QSBzaW5nbGUgMzItYml0IFBTUjIgdHJhaW5pbmcgcGF0dGVybiBmaWVsZCBmb2xsb3dzIHRoZSBz
aXh0ZWVuIGVsZW1lbnQKYXJyYXkgb2YgUFNSIHRhYmxlIGVudHJpZXMgYXMgcGVyIFZCVCBzcGVj
LiBCdXQsIHdlIGluY29ycmVjdGx5IGRlZmluZQp0aGlzIFBTUjIgZmllbGQgZm9yIGVhY2ggb2Yg
UFNSIHRhYmxlIGVudHJpZXMuIFRoZSByZXN1bHQgb2YgdGhpcyBpcwp0aGF0IHRoZSBQU1IxIHRy
YWluaW5nIHBhdHRlcm4gZHVyYXRpb24gZm9yIGFueSBwYW5lbF90eXBlICE9IDAgd2lsbCBiZQpw
YXJzZWQgaW5jb3JyZWN0bHkuCgpDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxp
bnV4LmludGVsLmNvbT4KQ2M6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50
ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBEaGluYWthcmFuIFBhbmRpeWFuIDxkaGluYWthcmFuLnBh
bmRpeWFuQGludGVsLmNvbT4KLS0tCiB0b29scy9pbnRlbF92YnRfZGVmcy5oIHwgNiArKystLS0K
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvdG9vbHMvaW50ZWxfdmJ0X2RlZnMuaCBiL3Rvb2xzL2ludGVsX3ZidF9kZWZzLmgKaW5k
ZXggODllZjE0Y2EuLmM5MDNjZGEzIDEwMDY0NAotLS0gYS90b29scy9pbnRlbF92YnRfZGVmcy5o
CisrKyBiL3Rvb2xzL2ludGVsX3ZidF9kZWZzLmgKQEAgLTQ3NSwxMyArNDc1LDEzIEBAIHN0cnVj
dCBwc3JfdGFibGUgewogCS8qIFRQIHdha2UgdXAgdGltZSBpbiBtdWx0aXBsZSBvZiAxMDAgKi8K
IAl1MTYgdHAxX3dha2V1cF90aW1lOwogCXUxNiB0cDJfdHAzX3dha2V1cF90aW1lOwotCi0JLyog
UFNSMiBUUDIvVFAzIHdha2V1cCB0aW1lIGZvciAxNiBwYW5lbHMgKi8KLQl1MzIgcHNyMl90cDJf
dHAzX3dha2V1cF90aW1lOwogfSBfX3BhY2tlZDsKIAogc3RydWN0IGJkYl9wc3IgewogCXN0cnVj
dCBwc3JfdGFibGUgcHNyX3RhYmxlWzE2XTsKKworCS8qIFBTUjIgVFAyL1RQMyB3YWtldXAgdGlt
ZSBmb3IgMTYgcGFuZWxzICovCisJdTMyIHBzcjJfdHAyX3RwM193YWtldXBfdGltZTsKIH0gX19w
YWNrZWQ7CiAKIC8qCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aWd0LWRldg==
