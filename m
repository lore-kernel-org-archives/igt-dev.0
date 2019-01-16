Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5BF16EFD2
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jan 2019 11:21:03 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed, 16 Jan 2019 13:20:41 +0200
Message-Id: <20190116112050.27647-13-petri.latvala@intel.com>
In-Reply-To: <20190116112050.27647-1-petri.latvala@intel.com>
References: <20190116112050.27647-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 12/21] benchmarks/gem_userptr_benchmark:
 Correctly free memory
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
Cc: Petri Latvala <petri.latvala@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

aWYgKHApIGZyZWUocCkgZG9lcyBhIHVzZWxlc3MgY2hlY2ssIGZyZWUoTlVMTCkgaXMgYSB2YWxp
ZCBjYWxsLiBBbHNvCmFzc2lnbiBOVUxMIHNvIHdlIGRvbid0IGVuZCB1cCBkb3VibGUtZnJlZWlu
ZyBtZW1vcnkgaWYgYW55b25lCnJlb3JkZXJzIG5yX2JvcyB0byBoYXZlIGEgMCBhZnRlciBvdGhl
ciB2YWx1ZXMuCgpTaWduZWQtb2ZmLWJ5OiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGlu
dGVsLmNvbT4KQ2M6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+Ci0t
LQogYmVuY2htYXJrcy9nZW1fdXNlcnB0cl9iZW5jaG1hcmsuYyB8IDUgKysrLS0KIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYmVu
Y2htYXJrcy9nZW1fdXNlcnB0cl9iZW5jaG1hcmsuYyBiL2JlbmNobWFya3MvZ2VtX3VzZXJwdHJf
YmVuY2htYXJrLmMKaW5kZXggZjc3MTZkZmEuLmJlZjJjY2M0IDEwMDY0NAotLS0gYS9iZW5jaG1h
cmtzL2dlbV91c2VycHRyX2JlbmNobWFyay5jCisrKyBiL2JlbmNobWFya3MvZ2VtX3VzZXJwdHJf
YmVuY2htYXJrLmMKQEAgLTM1NSw4ICszNTUsOSBAQCBzdGF0aWMgdm9pZCB0ZXN0X2ltcGFjdF9v
dmVybGFwKGludCBmZCwgY29uc3QgY2hhciAqcHJlZml4KQogCiAJCWZvciAoaSA9IDA7IGkgPCBu
cl9ib3Nbc3VidGVzdF07IGkrKykKIAkJCWdlbV9jbG9zZShmZCwgaGFuZGxlc1tpXSk7Ci0JCWlm
IChibG9jaykKLQkJCWZyZWUoYmxvY2spOworCisJCWZyZWUoYmxvY2spOworCQlibG9jayA9IE5V
TEw7CiAJfQogfQogCi0tIAoyLjE5LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aWd0LWRldgo=
