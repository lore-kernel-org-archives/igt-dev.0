Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 264BF6E07B
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jul 2020 09:16:24 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Thu,  2 Jul 2020 11:14:03 +0200
Message-Id: <20200702091407.25393-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v15 0/4] Add api_intel_bb test
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
ZCBpOTE1X3BtX3NzZXUgd2hpY2ggd2VyZSBwcmV2aW91c2x5IG1pZ3JhdGVkLgoKLCwsCnYxMzog
YWRkIGZlbmNlcyBhcyBwcmltYXJ5IHN5bmNocm9uaXNhdGlvbiwgYWRkIG5vbmUveC95CiAgICAg
YmxpdHRpbmcgdGVzdHMgdG8gZW5zdXJlIG5vbmUtPj8tPm5vbmUgYmxpdCBnaXZlIHNhbWUKICAg
ICByZXN1bHQKdjE0OiBza2lwIGdlbnMyLzMKdjE1OiBmaXhpbmcgYmxpdHRpbmcgWSBzdXJmYWNl
cywgc2tpcHBpbmcgdGVzdGluZyBZIGJsaXQgb24gZ2VucyA8IDYKClpiaWduaWV3IEtlbXBjennF
hHNraSAoNCk6CiAgbGliL2ludGVsX2JhdGNoYnVmZmVyOiBFeHRlbmQgaW50ZWxfYmIKICBsaWIv
aW50ZWxfYnVmb3BzOiBBZGQgbmV3IGZ1bmN0aW9ucyBhbmQgaW50ZWxfYnVmIGZpZWxkcwogIHRl
c3RzL2FwaV9pbnRlbF9iYjogQWRkIGludGVsX2JiIEFQSSB0ZXN0CiAgaW50ZWwtY2kvZmFzdC1m
ZWVkYmFjazogYWRkIGFwaV9pbnRlbF9iYiB0ZXN0cwoKIGxpYi9pbnRlbF9iYXRjaGJ1ZmZlci5j
ICAgICAgICAgICAgICAgfCA0MzIgKysrKysrKysrKysrKysrLQogbGliL2ludGVsX2JhdGNoYnVm
ZmVyLmggICAgICAgICAgICAgICB8ICA4MCArKy0KIGxpYi9pbnRlbF9idWZvcHMuYyAgICAgICAg
ICAgICAgICAgICAgfCAxMzUgKysrKy0KIGxpYi9pbnRlbF9idWZvcHMuaCAgICAgICAgICAgICAg
ICAgICAgfCAgMjQgKy0KIHRlc3RzL2k5MTUvYXBpX2ludGVsX2JiLmMgICAgICAgICAgICAgfCA3
MDggKysrKysrKysrKysrKysrKysrKysrKysrKysKIHRlc3RzL2ludGVsLWNpL2Zhc3QtZmVlZGJh
Y2sudGVzdGxpc3QgfCAgMTEgKwogdGVzdHMvbWVzb24uYnVpbGQgICAgICAgICAgICAgICAgICAg
ICB8ICAgMSArCiA3IGZpbGVzIGNoYW5nZWQsIDEzNTIgaW5zZXJ0aW9ucygrKSwgMzkgZGVsZXRp
b25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMvaTkxNS9hcGlfaW50ZWxfYmIuYwoKLS0g
CjIuMjYuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
aWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
