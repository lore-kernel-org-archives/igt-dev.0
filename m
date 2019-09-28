Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A21056E2E3
 for <igt-dev@lists.freedesktop.org>; Sat, 28 Sep 2019 00:16:27 +0000 (UTC)
From: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Fri, 27 Sep 2019 17:16:09 -0700
Message-Id: <20190928001609.54083-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] igt_kmod: handle EPIPE on kmsg
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

SWYga21zZyByb3RhdGVzIGR1ZSB0byBhIGh1Z2UgbG9nLCB0aGUgcmVhZCgpIHdpbGwgZmFpbCB3
aXRoIEVQSVBFIHNpbmNlCnRoZSBzZWVrKCkgd2UgZGlkIGlzIG5vdCB2YWxpZCBhbnltb3JlLiBX
aGVuIHdlIGdldCBhbiBFUElQRSwgdGhlIGtlcm5lbAp3aWxsIHNldCBvdXIgcG9pbnRlciB0byB0
aGUgbGFzdCBlbnRyeSBhdmFpbGFibGUsIHNvIGp1c3QgcmV0cnkgYW5vdGhlcgpyZWFkLgoKU2ln
bmVkLW9mZi1ieTogTHVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+Ci0t
LQogbGliL2lndF9rbW9kLmMgfCA5ICsrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3Rfa21vZC5jIGIvbGli
L2lndF9rbW9kLmMKaW5kZXggMDFmYWNhMzkuLmMzZGE0NjY3IDEwMDY0NAotLS0gYS9saWIvaWd0
X2ttb2QuYworKysgYi9saWIvaWd0X2ttb2QuYwpAQCAtMzkxLDggKzM5MSwxNSBAQCBzdGF0aWMg
dm9pZCBrbXNnX2R1bXAoaW50IGZkKQogCQlpZiAociA8IDApIHsKIAkJCWlmIChlcnJubyA9PSBF
SU5UUikKIAkJCQljb250aW51ZTsKKworCQkJaWYgKGVycm5vID09IEVQSVBFKSB7CisJCQkJaWd0
X3dhcm4oImttc2cgdHJ1bmNhdGVkOiB0b28gbWFueSBtZXNzYWdlcy4gWW91IG1heSB3YW50IHRv
IGluY3JlYXNlIGxvZ19idWZfbGVuIGluIGttY2RsaW5lXG4iKTsKKwkJCQljb250aW51ZTsKKwkJ
CX0KKwogCQkJaWYgKGVycm5vICE9IEVBR0FJTikKLQkJCQlpZ3Rfd2Fybigia21zZyB0cnVuY2F0
ZWQgZHVlIHRvIHVua25vd24gZXJyb3I6ICVtXG4iKTsKKwkJCQlpZ3Rfd2Fybigia21zZyB0cnVu
Y2F0ZWQ6IHVua25vd24gZXJyb3IgKCVtKVxuIik7CisKIAkJCWJyZWFrOwogCQl9CiAKLS0gCjIu
MjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0
LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
