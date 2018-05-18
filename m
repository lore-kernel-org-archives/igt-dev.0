Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60E706E26D
 for <igt-dev@lists.freedesktop.org>; Fri, 18 May 2018 20:41:57 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Fri, 18 May 2018 23:41:52 +0300
Message-Id: <20180518204154.21990-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/3] tests/kms_ccs: Don't populate igt_fb
 structs with stack garbage
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkNs
ZWFyIHRoZSBpZ3RfZmIgc3RydWN0IHRvIG1ha2Ugc3VyZSBubyBzdGFjayBnYXJiYWdlIGlzIGxl
ZnQgaW4gYW55Cm1lbWJlcnMgd2UgZG9uJ3QgZXhwbGljaXRseSBpbml0aWFsaXplLgoKU2lnbmVk
LW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4K
LS0tCiB0ZXN0cy9rbXNfY2NzLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvdGVzdHMva21zX2Njcy5jIGIvdGVzdHMva21zX2Njcy5jCmluZGV4
IDYzMjk4ZjEzN2FiYi4uZTFlZTU4ODAxYWMzIDEwMDY0NAotLS0gYS90ZXN0cy9rbXNfY2NzLmMK
KysrIGIvdGVzdHMva21zX2Njcy5jCkBAIC0yODAsNiArMjgwLDggQEAgc3RhdGljIHZvaWQgZ2Vu
ZXJhdGVfZmIoZGF0YV90ICpkYXRhLCBzdHJ1Y3QgaWd0X2ZiICpmYiwKIAlpbnQgcmV0OwogCXVp
bnQzMl90IGNjc19oYW5kbGU7CiAKKwltZW1zZXQoZmIsIDAsIHNpemVvZigqZmIpKTsKKwogCS8q
IFVzZSBlaXRoZXIgY29tcHJlc3NlZCBvciBZLXRpbGVkIHRvIHRlc3QuIEhvd2V2ZXIsIGdpdmVu
IHRoZSBsYWNrIG9mCiAJICogYXZhaWxhYmxlIGJhbmR3aWR0aCwgd2UgdXNlIGxpbmVhciBmb3Ig
dGhlIHByaW1hcnkgcGxhbmUgd2hlbgogCSAqIHRlc3Rpbmcgc3ByaXRlcywgc2luY2Ugd2UgY2Fu
bm90IGZpdCB0d28gQ0NTIHBsYW5lcyBpbnRvIHRoZQotLSAKMi4xNi4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdApp
Z3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
