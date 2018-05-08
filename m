Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26A896EB1C
 for <igt-dev@lists.freedesktop.org>; Tue,  8 May 2018 18:09:26 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Tue,  8 May 2018 19:09:12 +0100
Message-Id: <20180508180915.552-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] [PATCH i-g-t v2 0/3] intel: per context powergating tests
 & benchmark
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

SGkgYWxsLAoKSGVyZSBpcyBhbiB1cGRhdGUgZm9yIHRoZSB0ZXN0cyBmb3IgYSBjb3JyZXNwb25k
aW5nIGk5MTUgc2VyaWVzIHRvCmVuYWJsZSBwZXIgY29udGV4dCBwb3dlcmdhdGluZy4KCkNoZWVy
cywKCkxpb25lbCBMYW5kd2VybGluICgzKToKICBoZWFkZXJzOiBidW1wCiAgdGVzdHM6IGFkZCBz
bGljZSBwb3dlciBwcm9ncmFtbWluZyB0ZXN0CiAgYmVuY2htYXJrOiBhZGQgZ2VtX2V4ZWNfZGVs
YXkKCiBiZW5jaG1hcmtzL2dlbV9leGVjX2RlbGF5LmMgICAgfCA1MTYgKysrKysrKysrKysrKysr
KysrKysrKysrKysKIGJlbmNobWFya3MvbWVzb24uYnVpbGQgICAgICAgICB8ICAgMSArCiBpbmNs
dWRlL2RybS11YXBpL2FtZGdwdV9kcm0uaCAgfCAgIDMgKwogaW5jbHVkZS9kcm0tdWFwaS9kcm1f
bW9kZS5oICAgIHwgICA5ICstCiBpbmNsdWRlL2RybS11YXBpL2V0bmF2aXZfZHJtLmggfCAgIDYg
KwogaW5jbHVkZS9kcm0tdWFwaS9pOTE1X2RybS5oICAgIHwgIDM4ICsrCiBpbmNsdWRlL2RybS11
YXBpL21zbV9kcm0uaCAgICAgfCAgIDIgKwogaW5jbHVkZS9kcm0tdWFwaS92aXJ0Z3B1X2RybS5o
IHwgICAxICsKIHRlc3RzL01ha2VmaWxlLnNvdXJjZXMgICAgICAgICB8ICAgMSArCiB0ZXN0cy9n
ZW1fY3R4X3BhcmFtLmMgICAgICAgICAgfCAgIDQgKy0KIHRlc3RzL2dlbV9jdHhfcnBjcy5jICAg
ICAgICAgICB8IDY1MyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIHRlc3RzL21l
c29uLmJ1aWxkICAgICAgICAgICAgICB8ICAgMSArCiAxMiBmaWxlcyBjaGFuZ2VkLCAxMjMxIGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgYmVuY2htYXJr
cy9nZW1fZXhlY19kZWxheS5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMvZ2VtX2N0eF9ycGNz
LmMKCi0tCjIuMTcuMApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
