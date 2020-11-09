Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B4489991
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Nov 2020 12:06:37 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Mon,  9 Nov 2020 14:06:31 +0200
Message-Id: <20201109120632.389212-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/intel_batchbuffer: Fix relocs across
 the 4GB address boundary
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

SWYgdGhlIGRlbHRhIG9mIGEgcmVsb2NhdGlvbiB0YXJnZXQgd3J0LiB0aGUgb2JqZWN0IGJhc2Ug
YWRkcmVzcyBjcm9zc2VzCnRoZSA0R0IgYWRkcmVzcyBib3VuZGFyeSB0aGUgdXBwZXIgMzJiaXQg
b2YgdGhlIHRhcmdldCBhZGRyZXNzIHdpbGwgYmUKaW5jb3JyZWN0LCBmaXggdGhpcy4KCkNjOiBa
YmlnbmlldyBLZW1wY3p5xYRza2kgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT4KQ2M6
IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgpTaWduZWQtb2ZmLWJ5OiBJ
bXJlIERlYWsgPGltcmUuZGVha0BpbnRlbC5jb20+Ci0tLQogbGliL2ludGVsX2JhdGNoYnVmZmVy
LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9saWIvaW50ZWxfYmF0Y2hidWZmZXIuYyBiL2xpYi9pbnRlbF9iYXRjaGJ1
ZmZlci5jCmluZGV4IGZjNzM0OTVjMC4uN2I0Y2ZiMGRkIDEwMDY0NAotLS0gYS9saWIvaW50ZWxf
YmF0Y2hidWZmZXIuYworKysgYi9saWIvaW50ZWxfYmF0Y2hidWZmZXIuYwpAQCAtMTg1MCw3ICsx
ODUwLDcgQEAgc3RhdGljIHVpbnQ2NF90IF9faW50ZWxfYmJfZW1pdF9yZWxvYyhzdHJ1Y3QgaW50
ZWxfYmIgKmliYiwKIAogCWludGVsX2JiX291dChpYmIsIGRlbHRhICsgYWRkcmVzcyk7CiAJaWYg
KGliYi0+Z2VuID49IDgpCi0JCWludGVsX2JiX291dChpYmIsIGFkZHJlc3MgPj4gMzIpOworCQlp
bnRlbF9iYl9vdXQoaWJiLCAoZGVsdGEgKyBhZGRyZXNzKSA+PiAzMik7CiAKIAlyZXR1cm4gYWRk
cmVzczsKIH0KLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3Qt
ZGV2Cg==
