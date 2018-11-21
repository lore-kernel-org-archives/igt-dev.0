Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A39E6E463
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Nov 2018 00:33:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C44563154852
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Nov 2018 00:33:46 +0000 (UTC)
From: Lyude <lyude@redhat.com>
Date: Tue, 20 Nov 2018 19:33:37 -0500
Message-Id: <20181121003338.16956-3-lyude@redhat.com>
In-Reply-To: <20181121003338.16956-1-lyude@redhat.com>
References: <20181121003338.16956-1-lyude@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/3] tests/kms_chamelium: Increase HPD storm
 threshold to 10 from 1
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

RnJvbTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KClRoaXMgaXMgdG8gYWRqdXN0IGZv
ciB0aGUgY2hhbmdlcyB0byBob3cgbG9uZyBwdWxzZXMgYXJlIGNvdW50ZWQgdG93YXJkcwpIUEQg
c3Rvcm1zIHRoYXQgd2VyZSBtYWRlIGluIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9y
Zy9wYXRjaC8yNjA1OTcvCgpBbHNvLCB1cGRhdGUgdGhlIGFwcHJvcHJpYXRlIGRvY3VtZW50YXRp
b24gaW4gaWd0IHRvIHJlZmxlY3QgdGhpcy4KClNpZ25lZC1vZmYtYnk6IEx5dWRlIFBhdWwgPGx5
dWRlQHJlZGhhdC5jb20+Ci0tLQogbGliL2lndF9kZWJ1Z2ZzLmMgICAgIHwgMyArKysKIHRlc3Rz
L2ttc19jaGFtZWxpdW0uYyB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbGliL2lndF9kZWJ1Z2ZzLmMgYi9saWIvaWd0
X2RlYnVnZnMuYwppbmRleCBhM2FjYTg0Ni4uMzU4YjRjYWIgMTAwNjQ0Ci0tLSBhL2xpYi9pZ3Rf
ZGVidWdmcy5jCisrKyBiL2xpYi9pZ3RfZGVidWdmcy5jCkBAIC01NTcsNiArNTU3LDkgQEAgc3Rh
dGljIHZvaWQgaWd0X2hwZF9zdG9ybV9leGl0X2hhbmRsZXIoaW50IHNpZykKICAqIHRocm91Z2gg
ZGVidWdmcy4gVXNlZnVsIGZvciBob3RwbHVnZ2luZyB0ZXN0cyB3aGVyZSBIUEQgc3Rvcm0gZGV0
ZWN0aW9uCiAgKiBtaWdodCBnZXQgaW4gdGhlIHdheSBhbmQgc2xvdyB0aGluZ3MgZG93bi4KICAq
CisgKiBOb3RlIHRoYXQgZWFjaCBsb25nIEhQRCBwdWxzZSB3aWxsIGNvdW50IGFzIDEwIHRvd2Fy
ZHMgdGhlIHRocmVzaG9sZCwgYW5kCisgKiBzaG9ydCBIUEQgcHVsc2VzIChpZiBlbmFibGVkKSB3
aWxsIGNvdW50IGFzIDEgdG93YXJkcyB0aGUgdGhyZXNob2xkLgorICoKICAqIElmIHRoZSBzeXN0
ZW0gZG9lcyBub3Qgc3VwcG9ydCBIUEQgc3Rvcm0gZGV0ZWN0aW9uLCB0aGlzIGZ1bmN0aW9uIGRv
ZXMKICAqIG5vdGhpbmcuCiAgKgpkaWZmIC0tZ2l0IGEvdGVzdHMva21zX2NoYW1lbGl1bS5jIGIv
dGVzdHMva21zX2NoYW1lbGl1bS5jCmluZGV4IGYwNTEzNDRkLi4wMDk3ZGJjYyAxMDA2NDQKLS0t
IGEvdGVzdHMva21zX2NoYW1lbGl1bS5jCisrKyBiL3Rlc3RzL2ttc19jaGFtZWxpdW0uYwpAQCAt
NzQyLDcgKzc0Miw3IEBAIHRlc3RfaHBkX3N0b3JtX2RldGVjdChkYXRhX3QgKmRhdGEsIHN0cnVj
dCBjaGFtZWxpdW1fcG9ydCAqcG9ydCwgaW50IHdpZHRoKQogCWlndF9yZXF1aXJlX2hwZF9zdG9y
bV9jdGwoZGF0YS0+ZHJtX2ZkKTsKIAlyZXNldF9zdGF0ZShkYXRhLCBwb3J0KTsKIAotCWlndF9o
cGRfc3Rvcm1fc2V0X3RocmVzaG9sZChkYXRhLT5kcm1fZmQsIDEpOworCWlndF9ocGRfc3Rvcm1f
c2V0X3RocmVzaG9sZChkYXRhLT5kcm1fZmQsIDEwKTsKIAljaGFtZWxpdW1fZmlyZV9ocGRfcHVs
c2VzKGRhdGEtPmNoYW1lbGl1bSwgcG9ydCwgd2lkdGgsIDEwLCBmYWxzZSk7CiAJaWd0X2Fzc2Vy
dChpZ3RfaHBkX3N0b3JtX2RldGVjdGVkKGRhdGEtPmRybV9mZCkpOwogCi0tIAoyLjE5LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFp
bGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
