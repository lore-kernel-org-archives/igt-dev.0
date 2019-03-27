Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D826E28B
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2019 20:03:35 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Wed, 27 Mar 2019 13:03:31 -0700
Message-Id: <20190327200331.28602-8-jose.souza@intel.com>
In-Reply-To: <20190327200331.28602-1-jose.souza@intel.com>
References: <20190327200331.28602-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 8/8] tests/fbcon_fbt: Do not keep opening
 debugfs_fd at every setup_drm() call
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

QXMgZGVidWdmc19mZCBpcyB1c2VkIGV2ZW4gYWZ0ZXIgdGhlIHRlYXJkb3duX2RybSgpIGNhbGws
IGl0IGRvIG5vdApjbG9zZXMgaXQgY2F1c2luZyBpdCB0byBvcGVuIGFub3RoZXIgZGVidWdmc19m
ZCBhdCBldmVyeSBjYWxsIHRvCnNldHVwX2RybSgpLgpMZXQgbW92ZSB0aGUgb3BlbmluZyBvZiBk
ZWJ1Z2ZzX2ZkIHRvIHNldHVwX2Vudmlyb25tZW50KCkgYW5kIG9ubHkKb3BlbiBpdCBvbmNlLCBh
bHNvIGxldHMgY2xvc2UgaXQgYmVmb3JlIGxlYXZlIHRoZSB0ZXN0LgoKU2lnbmVkLW9mZi1ieTog
Sm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+Ci0tLQogdGVzdHMv
a21zX2ZiY29uX2ZidC5jIHwgNCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMva21zX2ZiY29uX2ZidC5jIGIvdGVz
dHMva21zX2ZiY29uX2ZidC5jCmluZGV4IDY2ZjIxNGM1Li5mN2ZmNjcxYiAxMDA2NDQKLS0tIGEv
dGVzdHMva21zX2ZiY29uX2ZidC5jCisrKyBiL3Rlc3RzL2ttc19mYmNvbl9mYnQuYwpAQCAtNjQs
NyArNjQsNiBAQCBzdGF0aWMgdm9pZCBzZXR1cF9kcm0oc3RydWN0IGRybV9pbmZvICpkcm0pCiAJ
CXJldHVybjsKIAogCWRybS0+ZmQgPSBkcm1fb3Blbl9kcml2ZXJfbWFzdGVyKERSSVZFUl9JTlRF
TCk7Ci0JZHJtLT5kZWJ1Z2ZzX2ZkID0gaWd0X2RlYnVnZnNfZGlyKGRybS0+ZmQpOwogCiAJZHJt
LT5yZXMgPSBkcm1Nb2RlR2V0UmVzb3VyY2VzKGRybS0+ZmQpOwogCWlndF9yZXF1aXJlKGRybS0+
cmVzKTsKQEAgLTI5NSw2ICsyOTQsNyBAQCBzdGF0aWMgdm9pZCBzZXR1cF9lbnZpcm9ubWVudChz
dHJ1Y3QgZHJtX2luZm8gKmRybSkKIAogCWRybV9mZCA9IGRybV9vcGVuX2RyaXZlcl9tYXN0ZXIo
RFJJVkVSX0lOVEVMKTsKIAlpZ3RfcmVxdWlyZShkcm1fZmQgPj0gMCk7CisJZHJtLT5kZWJ1Z2Zz
X2ZkID0gaWd0X2RlYnVnZnNfZGlyKGRybV9mZCk7CiAJaWd0X2Fzc2VydChjbG9zZShkcm1fZmQp
ID09IDApOwogCiAJLyoKQEAgLTMxMSw2ICszMTEsOCBAQCBzdGF0aWMgdm9pZCB0ZWFyZG93bl9l
bnZpcm9ubWVudChzdHJ1Y3QgZHJtX2luZm8gKmRybSkKIHsKIAlpZiAoZHJtLT5mZCA+PSAwKQog
CQl0ZWFyZG93bl9kcm0oZHJtKTsKKworCWNsb3NlKGRybS0+ZGVidWdmc19mZCk7CiB9CiAKIGln
dF9tYWluCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRl
dg==
