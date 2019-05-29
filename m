Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E096E109
 for <igt-dev@lists.freedesktop.org>; Wed, 29 May 2019 13:32:40 +0000 (UTC)
From: Simon Ser <simon.ser@intel.com>
Date: Wed, 29 May 2019 16:32:45 +0300
Message-Id: <20190529133250.27817-1-simon.ser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/5] Add igt_audio self-tests and check for
 noise/pops
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

VGhpcyBzZXJpZXMgYWRkcyBzb21lIGlndF9hdWRpbyBzZWxmLXRlc3RzLCBzbyB3ZSBjYW4gcGF0
Y2ggdGhlIGxpYnJhcnkgd2l0aAptb3JlIGNvbmZpZGVuY2Ugd2l0aG91dCByZWx5aW5nIG9uIHJl
YWwgaGFyZHdhcmUuCgpJdCBhbHNvIGFkZHMgYSBjaGVjayBmb3IgcG9wcy9ub2lzZSBpbiBhdWRp
b19zaWduYWxfZGV0ZWN0ICh3aXRoIGEgbWF0Y2hpbmcKdGVzdCkuCgpUaGlzIHNlcmllcyBvYnNv
bGV0ZXMgdGhlIHByZXZpb3VzICJsaWIvaWd0X2F1ZGlvOiBhZGQgYmFzaWMKYXVkaW9fc2lnbmFs
X2RldGVjdCB0ZXN0cyIgcGF0Y2guCgpTaW1vbiBTZXIgKDUpOgogIGxpYi9pZ3RfYXVkaW86IGFk
ZCBiYXNpYyBhdWRpb19zaWduYWxfZGV0ZWN0IHRlc3RzCiAgbGliL3Rlc3RzL2lndF9hdWRpbzog
YWRkIHRlc3Qgd2l0aCBtaXNzaW5nIGZyZXF1ZW5jeQogIGxpYi90ZXN0cy9pZ3RfYXVkaW86IGFk
ZCB0ZXN0IHdpdGggYW4gZXh0cmEgZnJlcXVlbmN5CiAgbGliL2lndF9hdWRpbzogZGV0ZWN0IG5v
aXNlIGFuZCBwb3BzCiAgbGliL3Rlc3RzL2lndF9hdWRpbzogYWRkIGEgcG9wIHRlc3QKCiBsaWIv
aWd0X2F1ZGlvLmMgICAgICAgfCAgNDQgKysrKysrKysrLS0KIGxpYi90ZXN0cy9pZ3RfYXVkaW8u
YyB8IDE3NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIGxpYi90
ZXN0cy9tZXNvbi5idWlsZCB8ICAgNyArKwogMyBmaWxlcyBjaGFuZ2VkLCAyMjIgaW5zZXJ0aW9u
cygrKSwgNSBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBsaWIvdGVzdHMvaWd0X2F1
ZGlvLmMKCi0tCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
