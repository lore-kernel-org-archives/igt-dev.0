Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A986EB7D
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Oct 2019 19:11:29 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Wed, 23 Oct 2019 22:10:02 +0300
Message-Id: <20191023191002.8220-1-imre.deak@intel.com>
Subject: [igt-dev] [PATCH i-g-t] tests/i915_pm_dc: Increase timeout and poll
 interval
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

VGhlIGVEUCBwYW5lbCBwb3dlciBjeWNsZSBkZWxheSBwcmV2ZW50cyBEQyBlbnRyeSBhZnRlciBh
IGZ1bGwgbW9kZXNldCwKd2hpY2ggbWFrZXMgdGhlIHRlc3QgZmFpbCBvbiBzb21lIHBhbmVscy4g
TGV0J3MgaW5jcmVhc2UgdGhlIHRpbWVvdXQgdG8KdGFrZSBpbnRvIGFjY291bnQgdGhhdCBkZWxh
eSAoYXRtIGluIHRoZSB3b3JzdCBjYXNlIHRoZSBwb3dlciBjeWNsZQpkZWxheSBpcyAzIHNlY29u
ZHMpIGFuZCBhbHNvIGluY3JlYXNlIHRoZSBwb2xsaW5nIGludGVydmFsIHRvIGdpdmUgbW9yZQp0
aW1lIGZvciB0aGUgZGV2aWNlIHRvIGVudGVyIGEgbG93IHBvd2VyIHN0YXRlLgoKQ2M6IEFuc2h1
bWFuIEd1cHRhIDxhbnNodW1hbi5ndXB0YUBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEltcmUg
RGVhayA8aW1yZS5kZWFrQGludGVsLmNvbT4KLS0tCiB0ZXN0cy9pOTE1L2k5MTVfcG1fZGMuYyB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL3Rlc3RzL2k5MTUvaTkxNV9wbV9kYy5jIGIvdGVzdHMvaTkxNS9pOTE1X3BtX2Rj
LmMKaW5kZXggY2UzMzE5YjcuLmVmOTZhODZlIDEwMDY0NAotLS0gYS90ZXN0cy9pOTE1L2k5MTVf
cG1fZGMuYworKysgYi90ZXN0cy9pOTE1L2k5MTVfcG1fZGMuYwpAQCAtMTUzLDcgKzE1Myw3IEBA
IHN0YXRpYyB1aW50MzJfdCByZWFkX2RjX2NvdW50ZXIodWludDMyX3QgZHJtX2ZkLCBpbnQgZGNf
ZmxhZykKIHN0YXRpYyBib29sIGRjX3N0YXRlX3dhaXRfZW50cnkoaW50IGRybV9mZCwgaW50IGRj
X2ZsYWcsIGludCBwcmV2X2RjX2NvdW50KQogewogCXJldHVybiBpZ3Rfd2FpdChyZWFkX2RjX2Nv
dW50ZXIoZHJtX2ZkLCBkY19mbGFnKSA+Ci0JCQlwcmV2X2RjX2NvdW50LCAzMDAwLCAxMDApOwor
CQkJcHJldl9kY19jb3VudCwgNjAwMCwgMTAwMCk7CiB9CiAKIHN0YXRpYyB2b2lkIGNoZWNrX2Rj
X2NvdW50ZXIoaW50IGRybV9mZCwgaW50IGRjX2ZsYWcsIHVpbnQzMl90IHByZXZfZGNfY291bnQp
Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
