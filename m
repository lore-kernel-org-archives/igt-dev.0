Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0918789E33
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2020 12:23:04 +0000 (UTC)
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Date: Tue, 29 Sep 2020 14:20:41 +0200
Message-Id: <20200929122043.26068-1-dominik.grzegorzek@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/2] tools: Remove libdrm dependency
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
ZXJpZXMuClRoaXMgb25lIHJlbW92ZXMgbGliZHJtIGZyb20gaW50ZWxfcGVyZl9jb3VudGVycy5j
LgoKU2lnbmVkLW9mZi1ieTogRG9taW5payBHcnplZ29yemVrIDxkb21pbmlrLmdyemVnb3J6ZWtA
aW50ZWwuY29tPgpDYzogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNr
aUBpbnRlbC5jb20+CkNjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4K
CkRvbWluaWsgR3J6ZWdvcnplayAoMSk6CiAgdG9vbHMvaW50ZWxfcGVyZl9jb3VudGVyczogUmVt
b3ZlIGxpYmRybSBkZXBlbmRlbmN5CgpaYmlnbmlldyBLZW1wY3p5xYRza2kgKDEpOgogIGxpYi9p
bnRlbF9idWZvcHM6IEF2b2lkIG92ZXJhbGxvY2F0ZSB4LXRpbGluZyBhbmQgbGluZWFyIHN1cmZh
Y2VzCgogbGliL2ludGVsX2J1Zm9wcy5jICAgICAgICAgIHwgICA0ICstCiB0b29scy9pbnRlbF9w
ZXJmX2NvdW50ZXJzLmMgfCAxMDYgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0t
CiAyIGZpbGVzIGNoYW5nZWQsIDU2IGluc2VydGlvbnMoKyksIDU0IGRlbGV0aW9ucygtKQoKLS0g
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
aWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
