Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 779F56E088
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Jan 2019 11:54:40 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Mon, 28 Jan 2019 12:54:36 +0100
Message-Id: <20190128115436.14527-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] debugfs: Fix writing an extra zero out of
 bounds in igt_crc_to_string_extended()
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

U2lnbmVkLW9mZi1ieTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4
LmludGVsLmNvbT4KLS0tCiBsaWIvaWd0X2RlYnVnZnMuYyB8IDggKysrKy0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbGli
L2lndF9kZWJ1Z2ZzLmMgYi9saWIvaWd0X2RlYnVnZnMuYwppbmRleCAzNjU2YzY2YTU2NzQuLmQx
ZmMwZmY3ZjcxMCAxMDA2NDQKLS0tIGEvbGliL2lndF9kZWJ1Z2ZzLmMKKysrIGIvbGliL2lndF9k
ZWJ1Z2ZzLmMKQEAgLTQ1OCwxNyArNDU4LDE3IEBAIGNoYXIgKmlndF9jcmNfdG9fc3RyaW5nX2V4
dGVuZGVkKGlndF9jcmNfdCAqY3JjLCBjaGFyIGRlbGltaXRlciwgaW50IGNyY19zaXplKQogCWlu
dCBpOwogCWludCBsZW4gPSAwOwogCWludCBmaWVsZF93aWR0aCA9IDIgKiBjcmNfc2l6ZTsgLyog
VHdvIGNoYXJzIHBlciBieXRlLiAqLwotCWNoYXIgKmJ1ZiA9IG1hbGxvYygoZmllbGRfd2lkdGgr
MSkgKiBjcmMtPm5fd29yZHMgKiBzaXplb2YoY2hhcikpOworCWNoYXIgKmJ1ZiA9IG1hbGxvYygo
ZmllbGRfd2lkdGgrMSkgKiBjcmMtPm5fd29yZHMpOwogCiAJaWYgKCFidWYpCiAJCXJldHVybiBO
VUxMOwogCi0JZm9yIChpID0gMDsgaSA8IGNyYy0+bl93b3JkczsgaSsrKQorCWZvciAoaSA9IDA7
IGkgPCBjcmMtPm5fd29yZHMgLSAxOyBpKyspCiAJCWxlbiArPSBzcHJpbnRmKGJ1ZiArIGxlbiwg
IiUwKnglYyIsIGZpZWxkX3dpZHRoLAogCQkJICAgICAgIGNyYy0+Y3JjW2ldLCBkZWxpbWl0ZXIp
OwogCi0JLyogRWF0IHRoZSBsYXN0IGRlbGltaXRlciAqLwotCWJ1ZltsZW4gLSAxXSA9ICdcMCc7
CisJc3ByaW50ZihidWYgKyBsZW4sICIlMCp4IiwgZmllbGRfd2lkdGgsIGNyYy0+Y3JjW2ldKTsK
KwogCXJldHVybiBidWY7CiB9CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pZ3QtZGV2Cg==
