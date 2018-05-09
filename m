Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A68466E91C
 for <igt-dev@lists.freedesktop.org>; Wed,  9 May 2018 17:38:09 +0000 (UTC)
From: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Date: Wed,  9 May 2018 10:37:43 -0700
Message-Id: <20180509173746.23405-12-dhinakaran.pandiyan@intel.com>
In-Reply-To: <20180509173746.23405-1-dhinakaran.pandiyan@intel.com>
References: <20180509173746.23405-1-dhinakaran.pandiyan@intel.com>
Subject: [igt-dev] [PATCH i-g-t 11/14] tests/sink_crc_basic: Debug print CRC
 values
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
Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>, rodrigo.vivi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

VGhlIENSQyB2YWx1ZXMgYXJlIHVzZWZ1bCBhcyBhIHJlZmVyZW5jZSB0byBjb21wYXJlIHRoZW0g
d2l0aCB2YWx1ZXMKZ2VuZXJhdGVkIGZyb20gb3RoZXIgZmVhdHVyZSAoUFNSKSB0ZXN0cy4KClNp
Z25lZC1vZmYtYnk6IERoaW5ha2FyYW4gUGFuZGl5YW4gPGRoaW5ha2FyYW4ucGFuZGl5YW5AaW50
ZWwuY29tPgotLS0KIHRlc3RzL2ttc19zaW5rX2NyY19iYXNpYy5jIHwgMiArKwogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19zaW5rX2NyY19i
YXNpYy5jIGIvdGVzdHMva21zX3NpbmtfY3JjX2Jhc2ljLmMKaW5kZXggMTU5NjgzZTIuLjFjMzFl
MzBhIDEwMDY0NAotLS0gYS90ZXN0cy9rbXNfc2lua19jcmNfYmFzaWMuYworKysgYi90ZXN0cy9r
bXNfc2lua19jcmNfYmFzaWMuYwpAQCAtNjMsMTEgKzYzLDEzIEBAIHN0YXRpYyB2b2lkIGFzc2Vy
dF9jb2xvcihpbnQgZGlyLCBlbnVtIGNvbG9yIGNvbG9yKQogCQlpZ3RfYXNzZXJ0X2x0KDAsIHIp
OwogCQlpZ3RfYXNzZXJ0X2VxKDAsIGcpOwogCQlpZ3RfYXNzZXJ0X2VxKDAsIGIpOworCQlpZ3Rf
ZGVidWcoInNpbmsgQ1JDIGZvciByZWQgJS40eCUuNHglLjR4XG4iLCByLCBnLCBiKTsKIAkJYnJl
YWs7CiAJY2FzZSBHUkVFTjoKIAkJaWd0X2Fzc2VydF9lcSgwLCByKTsKIAkJaWd0X2Fzc2VydF9s
dCgwLCBnKTsKIAkJaWd0X2Fzc2VydF9lcSgwLCBiKTsKKwkJaWd0X2RlYnVnKCJzaW5rIENSQyBm
b3IgZ3JlZW4gJS40eCUuNHglLjR4XG4iLCByLCBnLCBiKTsKIAkJYnJlYWs7CiAJZGVmYXVsdDoK
IAkJaWd0X2ZhaWwoSUdUX0VYSVRfRkFJTFVSRSk7Ci0tIAoyLjE0LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0Cmln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
