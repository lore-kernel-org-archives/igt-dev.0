Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 836D589CD8
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2020 10:48:42 +0000 (UTC)
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Date: Tue, 29 Sep 2020 12:48:15 +0200
Message-Id: <20200929104818.14717-1-dominik.grzegorzek@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/3] benchmarks: Remove libdrm dependency
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

SSBkZWNpZGVkIHRvIHNwbGl0IHByZXZpb3VzIHNlcmllcyBpbnRvIHNtYWxsZXIgY2h1bmtzLgoo
aHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy84MTc4Mi8pClRoZXJlIGFy
ZSBzb21lIGNvbW1vbiBwYXRjaGVzIGlubGN1ZGVkIGluIG1vcmUgdGhhbiBvbmUgc21hbGxlciBz
ZXJpZXMuClRoaXMgb25lIHJlbW92ZXMgbGliZHJtIHVzYWdlIGZyb20gaW50ZWxfdXBsb2FkX2Js
aXQgYmVuY2htYXJrcy4KClNpZ25lZC1vZmYtYnk6IERvbWluaWsgR3J6ZWdvcnplayA8ZG9taW5p
ay5ncnplZ29yemVrQGludGVsLmNvbT4KQ2M6IFpiaWduaWV3IEtlbXBjennFhHNraSA8emJpZ25p
ZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPgpDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13
aWxzb24uY28udWs+CgpEb21pbmlrIEdyemVnb3J6ZWsgKDEpOgogIGJlbmNobWFya3M6IFJlbW92
ZSBsaWJkcm0gZGVwZW5kZW5jeQoKWmJpZ25pZXcgS2VtcGN6ecWEc2tpICgyKToKICBsaWIvaW50
ZWxfYnVmb3BzOiBBdm9pZCBvdmVyYWxsb2NhdGUgeC10aWxpbmcgYW5kIGxpbmVhciBzdXJmYWNl
cwogIGxpYi9pbnRlbF9idWZvcHM6IEFkZCBzaW1wbGUgb2JqZWN0IGNhY2hlCgogYmVuY2htYXJr
cy9pbnRlbF91cGxvYWRfYmxpdF9sYXJnZS5jICAgICB8ICA3OSArKysrKystLS0tLS0tCiBiZW5j
aG1hcmtzL2ludGVsX3VwbG9hZF9ibGl0X2xhcmdlX2d0dC5jIHwgIDg0ICsrKysrKystLS0tLS0t
CiBiZW5jaG1hcmtzL2ludGVsX3VwbG9hZF9ibGl0X2xhcmdlX21hcC5jIHwgIDg0ICsrKysrKyst
LS0tLS0tCiBiZW5jaG1hcmtzL2ludGVsX3VwbG9hZF9ibGl0X3NtYWxsLmMgICAgIHwgIDc4ICsr
KysrKy0tLS0tLS0KIGxpYi9pbnRlbF9idWZvcHMuYyAgICAgICAgICAgICAgICAgICAgICAgfCAx
MzkgKysrKysrKysrKysrKysrKysrKysrKy0KIGxpYi9pbnRlbF9idWZvcHMuaCAgICAgICAgICAg
ICAgICAgICAgICAgfCAgIDIgKwogNiBmaWxlcyBjaGFuZ2VkLCAzMDAgaW5zZXJ0aW9ucygrKSwg
MTY2IGRlbGV0aW9ucygtKQoKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pZ3QtZGV2Cg==
