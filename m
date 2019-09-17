Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D79DF6E22B
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Sep 2019 09:00:49 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 17 Sep 2019 11:00:41 +0200
Message-Id: <20190917090043.19827-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 0/2] Add render copy tests on TGL
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UGF0Y2ggYWRkcyBiYXNpYyByZW5kZXIgY29weSB0ZXN0cyBvbiBUR0wuCgpDYzogS2F0YXJ6eW5h
IERlYyA8a2F0YXJ6eW5hLmRlY0BpbnRlbC5jb20+CkNjOiBEYW5pZWxlIENlcmFvbG8gU3B1cmlv
IDxkYW5pZWxlLmNlcmFvbG9zcHVyaW9AaW50ZWwuY29tPgpDYzogQW50b25pbyBBcmdlbnppYW5v
IDxhbnRvbmlvLmFyZ2Vuemlhbm9AaW50ZWwuY29tPgpDYzogTHVrYXN6IEthbGFtYXJ6IDxsdWth
c3oua2FsYW1hcnpAaW50ZWwuY29tPgpDYzogTHVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNo
aUBpbnRlbC5jb20+CkNjOiBBcmthZGl1c3ogSGlsZXIgPGFya2FkaXVzei5oaWxlckBpbnRlbC5j
b20+CgpLYWxhbWFyeiwgTHVrYXN6ICgxKToKICBsaWIvcmVuZGVyY29weS90Z2w6IEFkZCBzdXBw
b3J0IGZvciBnZW1fcmVuZGVyXyogdGVzdHMgb24gVEdMCgpaYmlnbmlldyBLZW1wY3p5xYRza2kg
KDEpOgogIEhBWDogcnVuIHJlbmRlciBjb3B5IHRlc3RzIGluIEJBVAoKIGxpYi9pOTE1L3NoYWRl
cnMvcHMvZ2VuMTJfcmVuZGVyX2NvcHkuYXNtIHwgMTYgKysrKysrKysrKysrCiBsaWIvaW50ZWxf
YmF0Y2hidWZmZXIuYyAgICAgICAgICAgICAgICAgICB8ICAyICsrCiBsaWIvcmVuZGVyY29weS5o
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA1ICsrKysKIGxpYi9yZW5kZXJjb3B5X2dlbjku
YyAgICAgICAgICAgICAgICAgICAgIHwgMzAgKysrKysrKysrKysrKysrKysrKysrKysKIHRlc3Rz
L2ludGVsLWNpL2Zhc3QtZmVlZGJhY2sudGVzdGxpc3QgICAgIHwgIDggKysrKysrCiA1IGZpbGVz
IGNoYW5nZWQsIDYxIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBsaWIvaTkxNS9z
aGFkZXJzL3BzL2dlbjEyX3JlbmRlcl9jb3B5LmFzbQoKLS0gCjIuMjMuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QK
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
