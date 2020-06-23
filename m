Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D456E944
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2020 06:20:04 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 23 Jun 2020 08:19:56 +0200
Message-Id: <20200623062000.17889-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/4] Add api_intel_bb test
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

U2xvd2x5IGFzIExvbmRvbiBidXMgbW92ZSB0b3dhcmQgc2F5IGdvb2RieWUgdG8gbGliZHJtIGlu
IHRoZQpyZW5kZXJjb3B5IHRlc3RzLgoKU2VyaW91c2x5IC0gYWRkIHNvbWUgbmV3IGZ1bmN0aW9u
cyBpbiBpbnRlbF9idWYvaW50ZWxfYmIgYW5kCnZlcmlmeSBtb3N0IG9mIHRoZW0gd29yayBwcm9w
ZXJseSBhbmQgZG9lc24ndCBhZmZlY3QgZ2VtX2dwZ3B1X2ZpbGwsCmdlbV9tZWRpYV9maWxsIGFu
ZCBpOTE1X3BtX3NzZXUgd2hpY2ggd2VyZSBwcmV2aW91c2x5IG1pZ3JhdGVkLgogClpiaWduaWV3
IEtlbXBjennFhHNraSAoNCk6CiAgbGliL2ludGVsX2JhdGNoYnVmZmVyOiBFeHRlbmQgaW50ZWxf
YmIKICBsaWIvaW50ZWxfYnVmb3BzOiBBZGQgbmV3IGZ1bmN0aW9ucyBhbmQgaW50ZWxfYnVmIGZp
ZWxkcwogIHRlc3RzL2FwaV9pbnRlbF9iYjogQWRkIGludGVsX2JiIEFQSSB0ZXN0CiAgSEFYOiBy
dW4gYXBpX2ludGVsX2JiIHRlc3RzIGFuZCBjaGVjayAoZ3BncHV8bWVkaWEpX2ZpbGwgYXJlIG9r
CgogbGliL2ludGVsX2JhdGNoYnVmZmVyLmMgICAgICAgICAgICAgICB8IDM4NyArKysrKysrKysr
KysrKysrLS0KIGxpYi9pbnRlbF9iYXRjaGJ1ZmZlci5oICAgICAgICAgICAgICAgfCAgNTIgKyst
CiBsaWIvaW50ZWxfYnVmb3BzLmMgICAgICAgICAgICAgICAgICAgIHwgMTM1ICsrKysrKy0KIGxp
Yi9pbnRlbF9idWZvcHMuaCAgICAgICAgICAgICAgICAgICAgfCAgMjQgKy0KIHRlc3RzL2k5MTUv
YXBpX2ludGVsX2JiLmMgICAgICAgICAgICAgfCA1NTkgKysrKysrKysrKysrKysrKysrKysrKysr
KysKIHRlc3RzL2ludGVsLWNpL2Zhc3QtZmVlZGJhY2sudGVzdGxpc3QgfCAxNjQgKy0tLS0tLS0K
IHRlc3RzL21lc29uLmJ1aWxkICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogNyBmaWxlcyBj
aGFuZ2VkLCAxMTIzIGluc2VydGlvbnMoKyksIDE5OSBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCB0ZXN0cy9pOTE1L2FwaV9pbnRlbF9iYi5jCgotLSAKMi4yNi4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlz
dAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
