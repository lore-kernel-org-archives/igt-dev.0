Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A69D66E3C1
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2020 13:01:00 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 23 Jun 2020 15:00:52 +0200
Message-Id: <20200623130056.20071-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 0/4] Add api_intel_bb test
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
ZCBpOTE1X3BtX3NzZXUgd2hpY2ggd2VyZSBwcmV2aW91c2x5IG1pZ3JhdGVkLgoKdjI6IGZpeCBt
YXBwaW5nCnYzOiBza2lwIHRlc3Qgd2hlcmUgbm8gY29udGV4dCBhcmUgYXZhaWxhYmxlCiAKWmJp
Z25pZXcgS2VtcGN6ecWEc2tpICg0KToKICBsaWIvaW50ZWxfYmF0Y2hidWZmZXI6IEV4dGVuZCBp
bnRlbF9iYgogIGxpYi9pbnRlbF9idWZvcHM6IEFkZCBuZXcgZnVuY3Rpb25zIGFuZCBpbnRlbF9i
dWYgZmllbGRzCiAgdGVzdHMvYXBpX2ludGVsX2JiOiBBZGQgaW50ZWxfYmIgQVBJIHRlc3QKICBI
QVg6IHJ1biBhcGlfaW50ZWxfYmIgdGVzdHMgYW5kIGNoZWNrIChncGdwdXxtZWRpYSlfZmlsbCBh
cmUgb2sKCiBsaWIvaW50ZWxfYmF0Y2hidWZmZXIuYyAgICAgICAgICAgICAgIHwgMzg3ICsrKysr
KysrKysrKysrKystLQogbGliL2ludGVsX2JhdGNoYnVmZmVyLmggICAgICAgICAgICAgICB8ICA1
MiArKy0KIGxpYi9pbnRlbF9idWZvcHMuYyAgICAgICAgICAgICAgICAgICAgfCAxMzUgKysrKyst
CiBsaWIvaW50ZWxfYnVmb3BzLmggICAgICAgICAgICAgICAgICAgIHwgIDI0ICstCiB0ZXN0cy9p
OTE1L2FwaV9pbnRlbF9iYi5jICAgICAgICAgICAgIHwgNTYzICsrKysrKysrKysrKysrKysrKysr
KysrKysrCiB0ZXN0cy9pbnRlbC1jaS9mYXN0LWZlZWRiYWNrLnRlc3RsaXN0IHwgMTY0ICstLS0t
LS0tCiB0ZXN0cy9tZXNvbi5idWlsZCAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKIDcgZmls
ZXMgY2hhbmdlZCwgMTEyNyBpbnNlcnRpb25zKCspLCAxOTkgZGVsZXRpb25zKC0pCiBjcmVhdGUg
bW9kZSAxMDA2NDQgdGVzdHMvaTkxNS9hcGlfaW50ZWxfYmIuYwoKLS0gCjIuMjYuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5n
IGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
