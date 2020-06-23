Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E72E6E05A
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2020 09:03:05 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 23 Jun 2020 11:02:45 +0200
Message-Id: <20200623090249.12162-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 0/4] *Add api_intel_bb test
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
YXBwaW5nCiAKWmJpZ25pZXcgS2VtcGN6ecWEc2tpICg0KToKICBsaWIvaW50ZWxfYmF0Y2hidWZm
ZXI6IEV4dGVuZCBpbnRlbF9iYgogIGxpYi9pbnRlbF9idWZvcHM6IEFkZCBuZXcgZnVuY3Rpb25z
IGFuZCBpbnRlbF9idWYgZmllbGRzCiAgdGVzdHMvYXBpX2ludGVsX2JiOiBBZGQgaW50ZWxfYmIg
QVBJIHRlc3QKICBIQVg6IHJ1biBhcGlfaW50ZWxfYmIgdGVzdHMgYW5kIGNoZWNrIChncGdwdXxt
ZWRpYSlfZmlsbCBhcmUgb2sKCiBsaWIvaW50ZWxfYmF0Y2hidWZmZXIuYyAgICAgICAgICAgICAg
IHwgMzg3ICsrKysrKysrKysrKysrKystLQogbGliL2ludGVsX2JhdGNoYnVmZmVyLmggICAgICAg
ICAgICAgICB8ICA1MiArKy0KIGxpYi9pbnRlbF9idWZvcHMuYyAgICAgICAgICAgICAgICAgICAg
fCAxMzUgKysrKysrLQogbGliL2ludGVsX2J1Zm9wcy5oICAgICAgICAgICAgICAgICAgICB8ICAy
NCArLQogdGVzdHMvaTkxNS9hcGlfaW50ZWxfYmIuYyAgICAgICAgICAgICB8IDU2MSArKysrKysr
KysrKysrKysrKysrKysrKysrKwogdGVzdHMvaW50ZWwtY2kvZmFzdC1mZWVkYmFjay50ZXN0bGlz
dCB8IDE2NCArLS0tLS0tLQogdGVzdHMvbWVzb24uYnVpbGQgICAgICAgICAgICAgICAgICAgICB8
ICAgMSArCiA3IGZpbGVzIGNoYW5nZWQsIDExMjUgaW5zZXJ0aW9ucygrKSwgMTk5IGRlbGV0aW9u
cygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RzL2k5MTUvYXBpX2ludGVsX2JiLmMKCi0tIAoy
LjI2LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmln
dC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
