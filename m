Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E681A89ADC
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jul 2021 14:11:52 +0000 (UTC)
From: Andrzej Turko <andrzej.turko@linux.intel.com>
Date: Mon,  5 Jul 2021 16:11:28 +0200
Message-Id: <20210705141133.10329-1-andrzej.turko@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v5 0/5] Keep tests working without
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
aW50ZWwuY29tPgoKCkFuZHJ6ZWogVHVya28gKDUpOgogIHRlc3RzL2k5MTUvZ2VtX2V4ZWNfc3Rv
cmU6IFN1cHBvcnQgZ2VucyB3aXRob3V0IHJlbG9jYXRpb25zCiAgdGVzdHMvaTkxNS9nZW1fZXhl
Y19ndHRmaWxsOiBSZXF1aXJlIHJlbG9jYXRpb24gc3VwcG9ydAogIHRlc3RzL2k5MTUvZ2VtX2V4
ZWNfY2FwdHVyZTogU3VwcG9ydCBnZW5zIHdpdGhvdXQgcmVsb2NhdGlvbnMKICB0ZXN0cy9pOTE1
L2dlbV9zb2Z0cGluOiBFeGVyY2lzZSBldmljdGlvbiB3aXRoIHNvZnRwaW5uaW5nCiAgdGVzdHMv
aTkxNS9nZW1fZXhlY19iaWc6IFJlcXVpcmUgcmVsb2NhdGlvbiBzdXBwb3J0CgogdGVzdHMvaTkx
NS9nZW1fZXhlY19iaWcuYyAgICAgfCAgIDEgKwogdGVzdHMvaTkxNS9nZW1fZXhlY19jYXB0dXJl
LmMgfCAyMTMgKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tCiB0ZXN0cy9pOTE1L2dl
bV9leGVjX2d0dGZpbGwuYyB8ICAgMSArCiB0ZXN0cy9pOTE1L2dlbV9leGVjX3N0b3JlLmMgICB8
IDE5NCArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0KIHRlc3RzL2k5MTUvZ2VtX3NvZnRw
aW4uYyAgICAgIHwgMjE1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDUgZmls
ZXMgY2hhbmdlZCwgNTIwIGluc2VydGlvbnMoKyksIDEwNCBkZWxldGlvbnMoLSkKCi0tIAoyLjI1
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1k
ZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
