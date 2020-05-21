Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15AC46E0FC
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2020 08:39:29 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Thu, 21 May 2020 10:39:21 +0200
Message-Id: <20200521083926.20428-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 0/5] Change media fill to be libdrm-free
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

Q29udGludWUgbWlncmF0aW9uIHByb2Nlc3MgdG8gYmUgbGliZHJtIGZyZWUgaW4gZ3BncHUvbWVk
aWEvcmVuZGVyCnRlc3RzLgoKdjI6IGZpeCBpbmNpZGVudGFsbHkgY2hhbmdlZCAnZWxzZSBpZicg
LT4gJ2lmJwoKWmJpZ25pZXcgS2VtcGN6ecWEc2tpICg1KToKICBsaWIvZ3B1X2NtZHM6IEFkZCBt
ZWRpYSBwaXBlbGluZSBmdW5jdGlvbnMgYmFzZWQgb24gaW50ZWxfYmIKICBsaWIvbWVkaWFfZmls
bDogbGliZHJtLWZyZWUgbWVkaWEgcGlwZWxpbmUgY3JlYXRpb24KICBsaWIvaW50ZWxfYmF0Y2hi
dWZmZXI6IEFkZCBuZXcgbWVkaWEgZmlsbGZ1bmMgdjIKICBpOTE1L2dlbV9tZWRpYV9maWxsOiBS
ZW1vdmUgbGliZHJtIGRlcGVuZGVuY3kKICBIQVg6IHJ1biBtZWRpYV9maWxsIGluIEJBVCBvbmx5
CgogbGliL2dwdV9jbWRzLmMgICAgICAgICAgICAgICAgICAgICAgICB8ICA0MyArKysrKysrCiBs
aWIvZ3B1X2NtZHMuaCAgICAgICAgICAgICAgICAgICAgICAgIHwgIDExICsrCiBsaWIvaW50ZWxf
YmF0Y2hidWZmZXIuYyAgICAgICAgICAgICAgIHwgIDI2ICsrKysKIGxpYi9pbnRlbF9iYXRjaGJ1
ZmZlci5oICAgICAgICAgICAgICAgfCAgIDEgKwogbGliL21lZGlhX2ZpbGwuYyAgICAgICAgICAg
ICAgICAgICAgICB8IDE2OCArKysrKysrKysrKysrKysrKysrKysrKysrKwogbGliL21lZGlhX2Zp
bGwuaCAgICAgICAgICAgICAgICAgICAgICB8ICAyOSArKysrKwogdGVzdHMvaTkxNS9nZW1fbWVk
aWFfZmlsbC5jICAgICAgICAgICB8IDEyNyArKysrKysrKysrKysrKy0tLS0tCiB0ZXN0cy9pbnRl
bC1jaS9mYXN0LWZlZWRiYWNrLnRlc3RsaXN0IHwgMTYxICstLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQogOCBmaWxlcyBjaGFuZ2VkLCAzNzggaW5zZXJ0aW9ucygrKSwgMTg4IGRlbGV0aW9ucygtKQoK
LS0gCjIuMjYuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
