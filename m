Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 180DC6E141
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Jul 2021 11:52:58 +0000 (UTC)
From: Andrzej Turko <andrzej.turko@linux.intel.com>
Date: Fri,  2 Jul 2021 13:52:30 +0200
Message-Id: <20210702115234.6256-1-andrzej.turko@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v4 i-g-t 0/4] Keep tests working without
 relocations
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
aW50ZWwuY29tPgoKCkFuZHJ6ZWogVHVya28gKDQpOgogIHRlc3RzL2k5MTUvZ2VtX2V4ZWNfc3Rv
cmU6IFN1cHBvcnQgZ2VucyB3aXRob3V0IHJlbG9jYXRpb25zCiAgdGVzdHMvaTkxNS9nZW1fZXhl
Y19ndHRmaWxsOiBSZXF1aXJlIHJlbG9jYXRpb24gc3VwcG9ydAogIHRlc3RzL2k5MTUvZ2VtX3Nv
ZnRwaW46IEV4ZXJjaXNlIGV2aWN0aW9uIHdpdGggc29mdHBpbm5pbmcKICB0ZXN0cy9pOTE1L2dl
bV9leGVjX2NhcHR1cmU6IFN1cHBvcnQgZ2VucyB3aXRob3V0IHJlbG9jYXRpb25zCgogdGVzdHMv
aTkxNS9nZW1fZXhlY19jYXB0dXJlLmMgfCAyMTMgKysrKysrKysrKysrKysrKysrKysrKystLS0t
LS0tLS0KIHRlc3RzL2k5MTUvZ2VtX2V4ZWNfZ3R0ZmlsbC5jIHwgICAxICsKIHRlc3RzL2k5MTUv
Z2VtX2V4ZWNfc3RvcmUuYyAgIHwgMTk0ICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tCiB0
ZXN0cy9pOTE1L2dlbV9zb2Z0cGluLmMgICAgICB8IDIyMSArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCiA0IGZpbGVzIGNoYW5nZWQsIDUyNSBpbnNlcnRpb25zKCspLCAxMDQgZGVs
ZXRpb25zKC0pCgotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ln
dC1kZXYK
