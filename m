Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0ECC898C4
 for <igt-dev@lists.freedesktop.org>; Fri, 17 May 2019 10:27:17 +0000 (UTC)
From: Simon Ser <simon.ser@intel.com>
Date: Fri, 17 May 2019 13:27:09 +0300
Message-Id: <20190517102709.22026-1-simon.ser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_chamelium: document capture audio
 buffer size constraints
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

RXhwbGFpbiB3aHkgd2UgbmVlZCB0byBjaG9vc2UgYSBiaWcgZW5vdWdoIGJ1ZmZlciBmb3IgYXVk
aW8gY2FwdHVyZS4KClNpZ25lZC1vZmYtYnk6IFNpbW9uIFNlciA8c2ltb24uc2VyQGludGVsLmNv
bT4KLS0tCiB0ZXN0cy9rbXNfY2hhbWVsaXVtLmMgfCA5ICsrKysrKysrLQogMSBmaWxlIGNoYW5n
ZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2tt
c19jaGFtZWxpdW0uYyBiL3Rlc3RzL2ttc19jaGFtZWxpdW0uYwppbmRleCBjOGI2YjIyZDdiNGEu
LjRkYjYwNGQzMmNhZSAxMDA2NDQKLS0tIGEvdGVzdHMva21zX2NoYW1lbGl1bS5jCisrKyBiL3Rl
c3RzL2ttc19jaGFtZWxpdW0uYwpAQCAtOTI0LDcgKzkyNCwxNCBAQCBkb190ZXN0X2Rpc3BsYXlf
YXVkaW8oZGF0YV90ICpkYXRhLCBzdHJ1Y3QgY2hhbWVsaXVtX3BvcnQgKnBvcnQsCgogCS8qIE5l
ZWRzIHRvIGJlIGEgbXVsdGlwbGUgb2YgMTI4LCBiZWNhdXNlIHRoYXQncyB0aGUgbnVtYmVyIG9m
IHNhbXBsZXMKIAkgKiB3ZSBnZXQgcGVyIGNoYW5uZWwgZWFjaCB0aW1lIHdlIHJlY2VpdmUgYW4g
YXVkaW8gcGFnZSBmcm9tIHRoZQotCSAqIENoYW1lbGl1bSBkZXZpY2UuICovCisJICogQ2hhbWVs
aXVtIGRldmljZS4KKwkgKgorCSAqIEFkZGl0aW9uYWxseSwgdGhpcyB2YWx1ZSBuZWVkcyB0byBi
ZSBoaWdoIGVub3VnaCB0byBndWFyYW50ZWUgd2UKKwkgKiBjYXB0dXJlIGEgZnVsbCBwZXJpb2Qg
b2YgZWFjaCBzaW5lIHdlIGdlbmVyYXRlLiBJZiB3ZSBjYXB0dXJlIDIwNDgKKwkgKiBzYW1wbGVz
IGF0IGEgMTkyS0h6IHNhbXBsaW5nIHJhdGUsIHdlIGdldCBhIGZ1bGwgcGVyaW9kIGZvciBhID45
NEh6CisJICogc2luZXMuIEZvciBsb3dlciBzYW1wbGluZyByYXRlcywgdGhlIGNhcHR1cmUgZHVy
YXRpb24gd2lsbCBiZQorCSAqIGxvbmdlci4KKwkgKi8KIAljaGFubmVsX2xlbiA9IENBUFRVUkVf
U0FNUExFUzsKIAljaGFubmVsID0gbWFsbG9jKHNpemVvZihkb3VibGUpICogY2hhbm5lbF9sZW4p
OwoKLS0KMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
