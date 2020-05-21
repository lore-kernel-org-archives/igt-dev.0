Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D276E90A
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2020 07:48:27 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Thu, 21 May 2020 09:48:18 +0200
Message-Id: <20200521074823.18632-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/5] Change media fill to be libdrm-free
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
aWEvcmVuZGVyCnRlc3RzLgoKWmJpZ25pZXcgS2VtcGN6ecWEc2tpICg1KToKICBsaWIvZ3B1X2Nt
ZHM6IEFkZCBtZWRpYSBwaXBlbGluZSBmdW5jdGlvbnMgYmFzZWQgb24gaW50ZWxfYmIKICBsaWIv
bWVkaWFfZmlsbDogbGliZHJtLWZyZWUgbWVkaWEgcGlwZWxpbmUgY3JlYXRpb24KICBsaWIvaW50
ZWxfYmF0Y2hidWZmZXI6IEFkZCBuZXcgbWVkaWEgZmlsbGZ1bmMgdjIKICBpOTE1L2dlbV9tZWRp
YV9maWxsOiBSZW1vdmUgbGliZHJtIGRlcGVuZGVuY3kKICBIQVg6IHJ1biBtZWRpYV9maWxsIGlu
IEJBVCBvbmx5CgogbGliL2dwdV9jbWRzLmMgICAgICAgICAgICAgICAgICAgICAgICB8ICA0MyAr
KysrKysrCiBsaWIvZ3B1X2NtZHMuaCAgICAgICAgICAgICAgICAgICAgICAgIHwgIDExICsrCiBs
aWIvaW50ZWxfYmF0Y2hidWZmZXIuYyAgICAgICAgICAgICAgIHwgIDI2ICsrKysKIGxpYi9pbnRl
bF9iYXRjaGJ1ZmZlci5oICAgICAgICAgICAgICAgfCAgIDEgKwogbGliL21lZGlhX2ZpbGwuYyAg
ICAgICAgICAgICAgICAgICAgICB8IDE2OCArKysrKysrKysrKysrKysrKysrKysrKysrKwogbGli
L21lZGlhX2ZpbGwuaCAgICAgICAgICAgICAgICAgICAgICB8ICAyOSArKysrKwogdGVzdHMvaTkx
NS9nZW1fbWVkaWFfZmlsbC5jICAgICAgICAgICB8IDEyNyArKysrKysrKysrKysrKy0tLS0tCiB0
ZXN0cy9pbnRlbC1jaS9mYXN0LWZlZWRiYWNrLnRlc3RsaXN0IHwgMTYxICstLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQogOCBmaWxlcyBjaGFuZ2VkLCAzNzggaW5zZXJ0aW9ucygrKSwgMTg4IGRlbGV0
aW9ucygtKQoKLS0gCjIuMjYuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3Qt
ZGV2Cg==
