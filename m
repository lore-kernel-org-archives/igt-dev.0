Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D50E46EE0C
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Jan 2019 19:11:13 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Mon,  7 Jan 2019 11:10:51 -0800
Message-Id: <20190107191056.22759-3-jose.souza@intel.com>
In-Reply-To: <20190107191056.22759-1-jose.souza@intel.com>
References: <20190107191056.22759-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/8] tests/fbcon_fbt: Use psr_wait_entry()
 to wait PSR be enabled
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
Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

a21zX2ZiY29uX2ZidCB3YXMgZG9pbmcgaXRzIG93biBoYW5kbGluZyB0byB3YWl0IGZvciBQU1Ig
dG8gZ2V0CmVuYWJsZWQgd2hpbGUgaXQgaXMgYWxyZWFkeSBhdmFpbGFibGUgaW4gbGliLgoKdjI6
IHNwbGl0dGVkIHByZXZpb3VzIHBhdGNoIGludG8gdGhpcyBvbmUgYW5kIHRoZSBwcmV2aW91cyBv
bmUoRGhpbmFrYXJhbikKCkNjOiBEaGluYWthcmFuIFBhbmRpeWFuIDxkaGluYWthcmFuLnBhbmRp
eWFuQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9z
ZS5zb3V6YUBpbnRlbC5jb20+Ci0tLQogdGVzdHMva21zX2ZiY29uX2ZidC5jIHwgMTEgKy0tLS0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMTAgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvdGVzdHMva21zX2ZiY29uX2ZidC5jIGIvdGVzdHMva21zX2ZiY29uX2ZidC5j
CmluZGV4IDI4MjNiNDdhLi4zZGI2MGMwZCAxMDA2NDQKLS0tIGEvdGVzdHMva21zX2ZiY29uX2Zi
dC5jCisrKyBiL3Rlc3RzL2ttc19mYmNvbl9mYnQuYwpAQCAtMTgyLDE4ICsxODIsOSBAQCBzdGF0
aWMgdm9pZCBwc3JfcHJpbnRfc3RhdHVzKGludCBkZWJ1Z2ZzX2ZkKQogCWlndF9kZWJ1ZygiUFNS
IHN0YXR1czogJXNcbiIsIGJ1Zik7CiB9CiAKLXN0YXRpYyBib29sIHBzcl9pc19lbmFibGVkKGlu
dCBkZWJ1Z2ZzX2ZkKQotewotCWNoYXIgYnVmW1BTUl9TVEFUVVNfTUFYX0xFTl07Ci0KLQlpZ3Rf
ZGVidWdmc19zaW1wbGVfcmVhZChkZWJ1Z2ZzX2ZkLCAiaTkxNV9lZHBfcHNyX3N0YXR1cyIsIGJ1
ZiwKLQkJCQlzaXplb2YoYnVmKSk7Ci0JcmV0dXJuIHN0cnN0cihidWYsICJcbkhXIEVuYWJsZWQg
JiBBY3RpdmUgYml0OiB5ZXNcbiIpOwotfQotCiBzdGF0aWMgYm9vbCBwc3Jfd2FpdF91bnRpbF9l
bmFibGVkKGludCBkZWJ1Z2ZzX2ZkKQogewotCWJvb2wgciA9IGlndF93YWl0KHBzcl9pc19lbmFi
bGVkKGRlYnVnZnNfZmQpLCA1MDAwLCAxKTsKKwlib29sIHIgPSBwc3Jfd2FpdF9lbnRyeShkZWJ1
Z2ZzX2ZkKTsKIAogCXBzcl9wcmludF9zdGF0dXMoZGVidWdmc19mZCk7CiAJcmV0dXJuIHI7Ci0t
IAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
