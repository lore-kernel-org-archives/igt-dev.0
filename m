Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 879A56E161
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jul 2019 08:40:07 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Thu, 11 Jul 2019 10:39:57 +0200
Message-Id: <20190711083958.6935-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 0/1] tests/prime_vgem: Fix broken
 handling of interprocess pipes
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
To: Petri Latvala <petri.latvala@intel.com>, Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

SWYgYSBjaGlsZCBwcm9jZXNzIGRpZXMgZm9yIGFueSByZWFzb24gd2hpbGUgYmFzaWMtZmVuY2Ut
cmVhZCBvcgpiYXNpYy1mZW5jZS1tbWFwIHN1YnRlc3QgaXMgcnVuLCB0aGUgc3VidGVzdCBtYXkg
aGFuZyBpbmRlZmluaXRlbHkgb24KcmVhZCgpIGZyb20gYSBwaXBlIHdoaWNoIGlzIHN1cHBvc2Vk
IHRvIGJlIHdyaXR0ZW4gdG8gYnkgdGhhdCBjaGlsZCAoY2FuCmJlIGludGVycnVwdGVkIHRob3Vn
aCkuICBGaXggaXQgYnkgZmlyc3QgY2xvc2luZyB1bnVzZWQgcGlwZSBlbmRzIG9uIGJvdGgKcGFy
ZW50IGFuZCBjaGlsZCBzaWRlIGJlZm9yZSB1c2luZyB0aGUgcGlwZSwgYXMgcmVjb21tZW5kZWQg
YnkgcGlwZSgyKQptYW51YWwgcGFnZS4KClBsZWFzZSBub3RlIHRoYXQgZHVlIHRvIHRoZSBJR1Qg
bGlicmFyeSB3YXkgb2YgaGFuZGxpbmcgc2lnbmFscywgbm93IHRoZQpzdWJ0ZXN0cyBtYXkgZmFp
bCB3aXRoIGVycm9yIGNvZGUgMTQxICgxMjggKyBTSUdQSVBFKSBhbmQgbm8gdXN1YWwgREVCVUcK
bWVzc2FnZSBibG9jayBvbiBzdGRlcnIgbm9yIEZBSUwgbWVzc2FnZSBsaW5lIG9uIHN0ZG91dCwg
aG93ZXZlciBzb21lCm1lYW5pbmdmdWwgZXJyb3IgbWVzc2FnZXMgd2lsbCBzdGlsbCBiZSBwcmlu
dGVkIG9uIHN0ZGVyciBieSB0aGUgZmFpbGluZwpjaGlsZCBwcm9jZXNzZXMuCgp2MjogcmVzZW5k
IHdpdGggUmV2aWV3ZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVr
PgogICAgYWRkZWQKCkphbnVzeiBLcnp5c3p0b2ZpayAoMSk6CiAgdGVzdHMvcHJpbWVfdmdlbTog
Rml4IGJyb2tlbiBoYW5kbGluZyBvZiBpbnRlcnByb2Nlc3MgcGlwZXMKCiB0ZXN0cy9wcmltZV92
Z2VtLmMgfCAxMiArKysrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCgotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2lndC1kZXY=
