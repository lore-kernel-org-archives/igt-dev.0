Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54456E38A
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Sep 2020 08:09:27 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri, 11 Sep 2020 10:07:51 +0200
Message-Id: <20200911080757.12766-35-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200911080757.12766-1-zbigniew.kempczynski@intel.com>
References: <20200911080757.12766-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v34 34/40] lib/intel_batchbuffer: address
 review comments (canonical types cleanup)
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Q2hhbmdlIHRvIGludC9pbnQ2NF90IGluc3RlYWQgX19zOC9fX3M2NCB0byBhdm9pZCBtaXhpbmcg
dHlwZSBuYW1lcy4KClNpZ25lZC1vZmYtYnk6IFpiaWduaWV3IEtlbXBjennFhHNraSA8emJpZ25p
ZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPgpDYzogRG9taW5payBHcnplZ29yemVrIDxkb21pbmlr
LmdyemVnb3J6ZWtAaW50ZWwuY29tPgpDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxz
b24uY28udWs+Ci0tLQogbGliL2ludGVsX2JhdGNoYnVmZmVyLmMgfCA0ICsrLS0KIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbGli
L2ludGVsX2JhdGNoYnVmZmVyLmMgYi9saWIvaW50ZWxfYmF0Y2hidWZmZXIuYwppbmRleCBlM2Ez
MWJlYi4uYmU3NjQ2NDYgMTAwNjQ0Ci0tLSBhL2xpYi9pbnRlbF9iYXRjaGJ1ZmZlci5jCisrKyBi
L2xpYi9pbnRlbF9iYXRjaGJ1ZmZlci5jCkBAIC0xMjE1LDkgKzEyMTUsOSBAQCBzdGF0aWMgdm9p
ZCBfX3JlYWxsb2NhdGVfb2JqZWN0cyhzdHJ1Y3QgaW50ZWxfYmIgKmliYikKICNkZWZpbmUgR0VO
OF9ISUdIX0FERFJFU1NfQklUIDQ3CiBzdGF0aWMgdWludDY0X3QgZ2VuOF9jYW5vbmljYWxfYWRk
cih1aW50NjRfdCBhZGRyZXNzKQogewotCV9fdTggc2hpZnQgPSA2MyAtIEdFTjhfSElHSF9BRERS
RVNTX0JJVDsKKwlpbnQgc2hpZnQgPSA2MyAtIEdFTjhfSElHSF9BRERSRVNTX0JJVDsKIAotCXJl
dHVybiAoX19zNjQpKGFkZHJlc3MgPDwgc2hpZnQpID4+IHNoaWZ0OworCXJldHVybiAoaW50NjRf
dCkoYWRkcmVzcyA8PCBzaGlmdCkgPj4gc2hpZnQ7CiB9CiAKIHN0YXRpYyBpbmxpbmUgdWludDY0
X3QgX19pbnRlbF9iYl9wcm9wb3NlX29mZnNldChzdHJ1Y3QgaW50ZWxfYmIgKmliYikKLS0gCjIu
MjYuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0
LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
