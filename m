Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BC916E86B
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2020 09:17:54 +0000 (UTC)
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Date: Tue,  3 Nov 2020 10:17:34 +0100
Message-Id: <20201103091735.8302-1-dominik.grzegorzek@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 0/1] tools: Remove libdrm dependency
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
LgoKdjI6IGFzIGludGVsX2JiIGhhcyBjaGFuZ2VkLCBtZWV0IHRoZSBkZW1hbmQgb2YgYWRkaW5n
IG9iamVjdCB0byBiYgogICAgZHJvcCBtZXJnZWQgcGF0Y2gKCnYzOiBhbGlnbm1lbnQgNDA5NiAt
PiAwLCB0byBhdm9pZCBjb25mdXNpbmcgdGhlIHJlYWRlcgoKU2lnbmVkLW9mZi1ieTogRG9taW5p
ayBHcnplZ29yemVrIDxkb21pbmlrLmdyemVnb3J6ZWtAaW50ZWwuY29tPgpDYzogWmJpZ25pZXcg
S2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+CkNjOiBDaHJpcyBX
aWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KCkRvbWluaWsgR3J6ZWdvcnplayAoMSk6
CiAgdG9vbHMvaW50ZWxfcGVyZl9jb3VudGVyczogUmVtb3ZlIGxpYmRybSBkZXBlbmRlbmN5Cgog
dG9vbHMvaW50ZWxfcGVyZl9jb3VudGVycy5jIHwgMTA5ICsrKysrKysrKysrKysrKysrKy0tLS0t
LS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDU2IGluc2VydGlvbnMoKyksIDUzIGRlbGV0
aW9ucygtKQoKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3Qt
ZGV2Cg==
