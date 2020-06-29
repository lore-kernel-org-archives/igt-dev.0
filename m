Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE476E0B6
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jun 2020 11:10:31 +0000 (UTC)
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Date: Mon, 29 Jun 2020 13:10:00 +0200
Message-Id: <20200629111004.20325-1-dominik.grzegorzek@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/4] Remove libdrm dependency from
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
dmFsLiBSZW1vdmFsIGxpYmRybSBkZXBlbmRlbmN5IGZyb20KZ2VtX2hhbmcgbWFkZSBieSBnaXQg
cm0gOikuCgpEb21pbmlrIEdyemVnb3J6ZWsgKDIpOgogIGk5MTUvZ2VtX2NhY2hpbmc6IFJlbW92
ZSBsaWJkcm0gZGVwZW5kZW5jeQogIGk5MTUvZ2VtX2hhbmc6IFJlbW92YWwKClpiaWduaWV3IEtl
bXBjennFhHNraSAoMik6CiAgbGliL2ludGVsX2J1Zm9wczogQWRkIGludGVsX2J1ZiBjcmVhdGUv
ZGVzdHJveSBmdW5jdGlvbnMKICBsaWIvaW50ZWxfYmF0Y2hidWZmZXI6IEV4dGVuZCBpbnRlbF9i
YgoKIGxpYi9pbnRlbF9iYXRjaGJ1ZmZlci5jICB8IDE4OSArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKy0tLS0KIGxpYi9pbnRlbF9iYXRjaGJ1ZmZlci5oICB8ICAxMiArKysKIGxp
Yi9pbnRlbF9idWZvcHMuYyAgICAgICB8ICAzMiArKysrKystCiBsaWIvaW50ZWxfYnVmb3BzLmgg
ICAgICAgfCAgIDggKy0KIHRlc3RzL2k5MTUvZ2VtX2NhY2hpbmcuYyB8IDE3NCArKysrKysrKysr
KysrKysrKysrKystLS0tLS0tLS0tLS0tLQogdGVzdHMvaTkxNS9nZW1faGFuZy5jICAgIHwgIDk4
IC0tLS0tLS0tLS0tLS0tLS0tLS0tCiB0ZXN0cy9tZXNvbi5idWlsZCAgICAgICAgfCAgIDEgLQog
NyBmaWxlcyBjaGFuZ2VkLCAzMjUgaW5zZXJ0aW9ucygrKSwgMTg5IGRlbGV0aW9ucygtKQogZGVs
ZXRlIG1vZGUgMTAwNjQ0IHRlc3RzL2k5MTUvZ2VtX2hhbmcuYwoKLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5n
IGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
