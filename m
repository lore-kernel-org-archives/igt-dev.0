Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B4989F3C
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2019 12:55:27 +0000 (UTC)
From: Simon Ser <simon.ser@intel.com>
Date: Tue, 18 Jun 2019 15:55:42 +0300
Message-Id: <20190618125543.646-1-simon.ser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/igt_eld: fix potential read from
 undefined value
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
Cc: martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

SWYgdGhlIEVMRCBkb2Vzbid0IGNvbnRhaW4gYSBtb25pdG9yX3ByZXNlbnQgbGluZSAodGhpcyBz
aG91bGRuJ3QgaGFwcGVuKSwgdGhlbgp0aGUgdmFsdWUgaXMgZ2FyYmFnZS4gRGVmaW5lIHRoZSB2
YXJpYWJsZSBhcyBhIHNhZmV0eSBuZXQuCgpTaWduZWQtb2ZmLWJ5OiBTaW1vbiBTZXIgPHNpbW9u
LnNlckBpbnRlbC5jb20+Ci0tLQogbGliL2lndF9lbGQuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3RfZWxk
LmMgYi9saWIvaWd0X2VsZC5jCmluZGV4IDE1ZGQ4YWM5NTE4OS4uM2Q3ZmQ0ZGQwYTgyIDEwMDY0
NAotLS0gYS9saWIvaWd0X2VsZC5jCisrKyBiL2xpYi9pZ3RfZWxkLmMKQEAgLTE1Miw3ICsxNTIs
NyBAQCBzdGF0aWMgYm9vbCBlbGRfcGFyc2VfZW50cnkoY29uc3QgY2hhciAqcGF0aCwgc3RydWN0
IGVsZF9lbnRyeSAqZWxkKQogCWNoYXIgYnVmWzEwMjRdOwogCWNoYXIgKmtleSwgKnZhbHVlLCAq
c2FkX2tleTsKIAlzaXplX3QgbGVuOwotCWJvb2wgbW9uaXRvcl9wcmVzZW50OworCWJvb2wgbW9u
aXRvcl9wcmVzZW50ID0gZmFsc2U7CiAJaW50IHNhZF9pbmRleDsKIAogCW1lbXNldChlbGQsIDAs
IHNpemVvZigqZWxkKSk7Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaWd0LWRldg==
