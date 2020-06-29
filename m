Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A4C389FEC
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jun 2020 09:21:37 +0000 (UTC)
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Date: Mon, 29 Jun 2020 11:21:02 +0200
Message-Id: <20200629092107.10664-1-dominik.grzegorzek@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/5] Remove libdrm dependency from
 gem_[caching/hang]
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

VGhpcyBzZXJpZXMgY29udGFpbnMgYSBzbWFsbGVyIHBvcnRpb24gb2YgWmJpZ25pZXcncyBjaGFu
Z2VzIGluIGludGVsX2JiCmFuZCBpbnRlbF9idWYgbmVlZGVkIGZvciB0aGlzIGxpYmRybSByZW1v
dmFsLiAKCkRvbWluaWsgR3J6ZWdvcnplayAoMyk6CiAgaTkxNS9nZW1fY2FjaGluZzogUmVtb3Zl
IGxpYmRybSBkZXBlbmRlbmN5CiAgaTkxNS9nZW1faGFuZzogUmVtb3ZlIGxpYmRybSBkZXBlbmRl
bmN5CiAgSEFYOiBjaGVjayBnZW1fY2FjaGluZyBhbmQgZ2VtX2hhbmcKClpiaWduaWV3IEtlbXBj
ennFhHNraSAoMik6CiAgbGliL2ludGVsX2J1Zm9wczogQWRkIGludGVsX2J1ZiBjcmVhdGUvZGVz
dHJveSBmdW5jdGlvbnMKICBsaWIvaW50ZWxfYmF0Y2hidWZmZXI6IEV4dGVuZCBpbnRlbF9iYgoK
IGxpYi9pbnRlbF9iYXRjaGJ1ZmZlci5jICAgICAgICAgICAgICAgfCAxODkgKysrKysrKysrKysr
KysrKysrKysrKystLS0KIGxpYi9pbnRlbF9iYXRjaGJ1ZmZlci5oICAgICAgICAgICAgICAgfCAg
MTIgKysKIGxpYi9pbnRlbF9idWZvcHMuYyAgICAgICAgICAgICAgICAgICAgfCAgMzIgKysrKy0K
IGxpYi9pbnRlbF9idWZvcHMuaCAgICAgICAgICAgICAgICAgICAgfCAgIDggKy0KIHRlc3RzL2k5
MTUvZ2VtX2NhY2hpbmcuYyAgICAgICAgICAgICAgfCAxNzQgKysrKysrKysrKysrKystLS0tLS0t
LS0tCiB0ZXN0cy9pOTE1L2dlbV9oYW5nLmMgICAgICAgICAgICAgICAgIHwgIDM1ICsrLS0tCiB0
ZXN0cy9pbnRlbC1jaS9mYXN0LWZlZWRiYWNrLnRlc3RsaXN0IHwgMTYzICstLS0tLS0tLS0tLS0t
LS0tLS0tLS0KIDcgZmlsZXMgY2hhbmdlZCwgMzQxIGluc2VydGlvbnMoKyksIDI3MiBkZWxldGlv
bnMoLSkKCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRl
dgo=
