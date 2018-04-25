Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DFD76E5A6
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Apr 2018 11:48:31 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Wed, 25 Apr 2018 12:48:25 +0100
Message-Id: <20180425114828.9688-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] [PATCH i-g-t 0/3] intel: per context powergating tests &
 benchmark
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

SGkgYWxsLAoKSGVyZSBpcyBhIHRlc3QgZm9yIGEgY29ycmVzcG9uZGluZyBpOTE1IHNlcmllcyB0
byBlbmFibGUgcGVyIGNvbnRleHQKcG93ZXJnYXRpbmcuCgpUaGlzIGluY2x1ZGVzIGEgdGVzdHMg
Zm9yIHRoZSBpOTE1IGRyaXZlciBhbmQgYSBiZW5jaG1hcmsgdG8gbWVhc3VyZQp0aGUgaW1wYWN0
IG9mIGNoYW5naW5nIHRoaXMgY29uZmlndXJhdGlvbi4KCkNoZWVycywKCkxpb25lbCBMYW5kd2Vy
bGluICgzKToKICBoZWFkZXJzOiBidW1wCiAgdGVzdHM6IGFkZCBzbGljZSBwb3dlciBwcm9ncmFt
bWluZyB0ZXN0CiAgYmVuY2htYXJrOiBhZGQgZ2VtX2V4ZWNfZGVsYXkKCiBiZW5jaG1hcmtzL01h
a2VmaWxlLnNvdXJjZXMgICAgfCAgIDEgKwogYmVuY2htYXJrcy9nZW1fZXhlY19kZWxheS5jICAg
IHwgNTEzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogYmVuY2htYXJrcy9tZXNv
bi5idWlsZCAgICAgICAgIHwgICAxICsKIGluY2x1ZGUvZHJtLXVhcGkvYW1kZ3B1X2RybS5oICB8
ICAgMyArCiBpbmNsdWRlL2RybS11YXBpL2RybV9tb2RlLmggICAgfCAgIDkgKy0KIGluY2x1ZGUv
ZHJtLXVhcGkvZXRuYXZpdl9kcm0uaCB8ICAgNiArCiBpbmNsdWRlL2RybS11YXBpL2k5MTVfZHJt
LmggICAgfCAgMjggKysKIGluY2x1ZGUvZHJtLXVhcGkvbXNtX2RybS5oICAgICB8ICAgMiArCiBp
bmNsdWRlL2RybS11YXBpL3ZpcnRncHVfZHJtLmggfCAgIDEgKwogdGVzdHMvTWFrZWZpbGUuc291
cmNlcyAgICAgICAgIHwgICAxICsKIHRlc3RzL2dlbV9jdHhfcnBjcy5jICAgICAgICAgICB8IDQ2
OCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIHRlc3RzL21lc29uLmJ1aWxkICAgICAg
ICAgICAgICB8ICAgMSArCiAxMiBmaWxlcyBjaGFuZ2VkLCAxMDMxIGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgYmVuY2htYXJrcy9nZW1fZXhlY19kZWxh
eS5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMvZ2VtX2N0eF9ycGNzLmMKCi0tCjIuMTcuMApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1h
aWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
