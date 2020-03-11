Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFAFF89DA7
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2020 00:41:36 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Tue, 10 Mar 2020 17:42:34 -0700
Message-Id: <20200311004235.138072-3-jose.souza@intel.com>
In-Reply-To: <20200311004235.138072-1-jose.souza@intel.com>
References: <20200311004235.138072-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v2 3/4] tests/kms_frontbuffer_tracking: Enable
 positive test on linear tiling
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

aTkxNSBpcyBtYWtpbmcgZmVuY2VzIG5vdCBtYW5kYXRvcnkgdG8gZW5hYmxlIEZCQyBpbiBuZXdl
ciBwbGF0Zm9ybXMuCkFzIEJTcGVjIGRvIG5vdCBoYXZlIHJlc3RyaWN0aW9ucyBhZ2FpbnN0IHRp
bGluZyBmb3JtYXRzIHRvIGVuYWJsZQpGQkMgaXQgd2lsbCBiZSBwb3NzaWJsZSB0byBlbmFibGUg
RkJDIHdpdGggbGluZWFyIHRpbGluZywgc28gbGV0cyB0ZXN0Cml0LgoKdjI6Ci0gY2hhbmdlZCBm
cm9tIEdFTjExIHRvIEdFTjkgZm9sbG93aW5nIGtlcm5lbCBwYXRjaGVzCgpDYzogVmlsbGUgU3ly
asOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogSm9z
w6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+Ci0tLQogdGVzdHMva21z
X2Zyb250YnVmZmVyX3RyYWNraW5nLmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS90ZXN0cy9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYyBi
L3Rlc3RzL2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5jCmluZGV4IDEyYmE5YmJhLi43NmJkMjJl
NiAxMDA2NDQKLS0tIGEvdGVzdHMva21zX2Zyb250YnVmZmVyX3RyYWNraW5nLmMKKysrIGIvdGVz
dHMva21zX2Zyb250YnVmZmVyX3RyYWNraW5nLmMKQEAgLTIxNzIsMTEgKzIxNzIsMTUgQEAgc3Rh
dGljIHZvaWQgZm9ybWF0X2RyYXdfc3VidGVzdChjb25zdCBzdHJ1Y3QgdGVzdF9tb2RlICp0KQog
CiBzdGF0aWMgYm9vbCB0aWxpbmdfaXNfdmFsaWQoaW50IGZlYXR1cmVfZmxhZ3MsIGVudW0gdGls
aW5nX3R5cGUgdGlsaW5nKQogeworCWludCBkZXZpZCA9IGludGVsX2dldF9kcm1fZGV2aWQoZHJt
LmZkKTsKKwogCWlmICghKGZlYXR1cmVfZmxhZ3MgJiBGRUFUVVJFX0ZCQykpCiAJCXJldHVybiB0
cnVlOwogCiAJc3dpdGNoICh0aWxpbmcpIHsKIAljYXNlIFRJTElOR19MSU5FQVI6CisJCWlmIChB
VF9MRUFTVF9HRU4oZGV2aWQsIDkpKQorCQkJcmV0dXJuIHRydWU7CiAJCXJldHVybiBmYWxzZTsK
IAljYXNlIFRJTElOR19YOgogCWNhc2UgVElMSU5HX1k6Ci0tIAoyLjI1LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0
CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
