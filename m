Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81C01890C5
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Apr 2019 20:20:48 +0000 (UTC)
From: Lyude <lyude@redhat.com>
Date: Wed, 24 Apr 2019 16:20:25 -0400
Message-Id: <20190424202033.7601-2-lyude@redhat.com>
In-Reply-To: <20190424202033.7601-1-lyude@redhat.com>
References: <20190424202033.7601-1-lyude@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 1/9] lib/tests: Fix test failures with
 meson 0.50.0
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
Cc: Petri Latvala <petri.latvala@intel.com>, Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KClNpbmNlIG1lc29uIDAuNTAuMCwg
dW5pdCB0ZXN0cyB3aGljaCByZXR1cm4gdGhlIEdOVSBzdGFuZGFyZCByZXR1cm4gY29kZQo5OSB3
aWxsIGZhaWwsIHJlZ2FyZGxlc3Mgb2Ygd2hldGhlciBvciBub3Qgc2hvdWxkX2ZhaWw6dHJ1ZSBp
cyBwYXNzZWQgdG8KdGVzdCgpLiBVbmZvcnR1bmF0ZWx5LCBvdXIgc3RhbmRhcmQgZXJyb3IgY29k
ZSAoSUdUX0VYSVRfRkFJTFVSRSkgaXMKYWxzbyA5OS4KClNvLCBmaXggdGhpcyBieSBjaGFuZ2lu
ZyBvdXIgc3RhbmRhcmQgZXJyb3IgY29kZSB0byA5OC4KClNpZ25lZC1vZmYtYnk6IEx5dWRlIFBh
dWwgPGx5dWRlQHJlZGhhdC5jb20+Ci0tLQogbGliL2lndF9jb3JlLmggfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9saWIv
aWd0X2NvcmUuaCBiL2xpYi9pZ3RfY29yZS5oCmluZGV4IDQ3ZmZkOWU3Li40NDYzNGUwZiAxMDA2
NDQKLS0tIGEvbGliL2lndF9jb3JlLmgKKysrIGIvbGliL2lndF9jb3JlLmgKQEAgLTExOSw3ICsx
MTksNyBAQCBleHRlcm4gY2hhciAqaWd0X2ZyYW1lX2R1bXBfcGF0aDsKICAqCiAgKiBFeGl0IHN0
YXR1cyBpbmRpY2F0aW5nIGEgdGVzdCBmYWlsdXJlCiAgKi8KLSNkZWZpbmUgSUdUX0VYSVRfRkFJ
TFVSRSA5OQorI2RlZmluZSBJR1RfRVhJVF9GQUlMVVJFIDk4CiAKIGJvb2wgX19pZ3RfZml4dHVy
ZSh2b2lkKTsKIHZvaWQgX19pZ3RfZml4dHVyZV9jb21wbGV0ZSh2b2lkKTsKLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
