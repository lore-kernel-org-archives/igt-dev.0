Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 429966E02D
 for <igt-dev@lists.freedesktop.org>; Wed, 12 May 2021 05:39:14 +0000 (UTC)
From: Andrzej Turko <andrzej.turko@linux.intel.com>
Date: Wed, 12 May 2021 07:38:44 +0200
Message-Id: <20210512053846.5662-1-andrzej.turko@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/2] Keep tests working without relocations
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

V2l0aCByZWxvY2F0aW9ucyBkaXNhYmxlZCBmb3IgbmV3ZXIgZ2VuZXJhdGlvbnMKdGhlIGFkZHJl
c3NlcyBvZiBidWZmZXIgb2JqZWN0cyBpbiBtZW1vcnkgbmVlZAp0byBiZSBrbm93biBpbiBhZHZh
bmNlIGFuZCwgaGVuY2UsIGFzc2lnbmVkIGluCnVzZXJzcGFjZS4KSWYgcmVsb2NhdGlvbnMgYXJl
IG5vdCBzdXBwb3J0ZWQsIHRoZSB0ZXN0cyBub3cKdXNlIHRoZSBpbnRlbCBhbGxvY2F0b3IgdG8g
ZmluZCBvZmZzZXRzIGFuZAp1cGRhdGUgdGhlIGNvbnRlbnRzIG9mIGJhdGNoZXMgY29ycmVzcG9u
ZGluZ2x5LgoKQ2M6IFpiaWduaWV3IEtlbXBjennFhHNraSA8emJpZ25pZXcua2VtcGN6eW5za2lA
aW50ZWwuY29tPgoKQW5kcnplaiBUdXJrbyAoMik6CiAgdGVzdHMvaTkxNS9nZW1fZXhlY19ndHRm
aWxsOiBTdXBwb3J0IGdlbnMgd2l0aG91dCByZWxvY2F0aW9ucwogIHRlc3RzL2k5MTUvZ2VtX2V4
ZWNfc3RvcmU6IFN1cHBvcnQgZ2VucyB3aXRob3V0IHJlbG9jYXRpb25zCgogdGVzdHMvaTkxNS9n
ZW1fZXhlY19ndHRmaWxsLmMgfCAgNzUgKysrKysrKysrKystLQogdGVzdHMvaTkxNS9nZW1fZXhl
Y19zdG9yZS5jICAgfCAxOTQgKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQogMiBm
aWxlcyBjaGFuZ2VkLCAyMDkgaW5zZXJ0aW9ucygrKSwgNjAgZGVsZXRpb25zKC0pCgotLSAKMi4y
NS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3Qt
ZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
