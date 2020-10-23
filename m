Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2CA96E364
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2020 17:57:36 +0000 (UTC)
From: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
Date: Fri, 23 Oct 2020 23:21:56 +0530
Message-Id: <20201023175158.391450-1-ayaz.siddiqui@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/2] tools/intel_gpu_top: Fix Device
 selection issues
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
Cc: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

VGhlcmUgd2FzIHR3byBpc3N1ZXMgaWRlbnRpZmllZCBkdXJpbmcgaW50ZWxfZ3B1X3RvcCB0ZXN0
aW5nLgoxLiBJbiBjYXNlIG9mIG11bHRpcGxlIGRpc2NyZXRlIEdQVSBwbGF0Zm9ybSwgIGlmIGZp
cnN0IGNhcmQgaXMgbm90CmludGVsIGNhcmQgdGhlbiBleGVjdXRpb24gIGZhaWxlZCB3aXRoIGVy
cm9yLiBUbyBzb2x2ZSB0aGlzIGlzc3VlIGEgY2hlY2sgZm9yCmludGVsIGRldmljZSAoODA4Nikg
aXMgYWRkZWQgZHVyaW5nIGRldmljZSBzZWxlY3Rpb24uCjIuIEludGVsX2dwdV90b3Agd2FzIGZh
aWxpbmcgdG8gZXhlY3V0ZSBpZiBkZXZpY2Ugc2VsZWN0aW9uIGZpbHRlciB3YXMgb3RoZXIgdGhh
bgrigJxwY2nigJ0uIGludGVsX2dwdV90b3AgcmVxdWlyZXMgY2FyZCBpbmZvcm1hdGlvbiBhbmQg
UENJX1NMT1RfTkFNRSBmb3IgZEdQVS4KT25seSBwY2kgc3Vic3lzdGVtIGNvbnRhaW5zIGJvdGgg
aW5mb3JtYXRpb24uCkluIGNhc2Ugb2YgdXNlciBmaWx0ZXIgaXMgb3RoZXIgdGhhbiBwY2kgc3Vi
c3lzdGVtIHRoZW4gd2UgbmVlZCBjYXJkCmluZm9ybWF0aW9uIG9mIGFzc29jaWF0ZWQgcGNpIHN1
YnN5c3RlbSB3aGljaCBpcyBzdG9yZWQgYXMgcGFyZW50IG9mCnJlcXVlc3RlZCBjYXJkIGlmIGF2
YWlsYWJsZS4KCkF5YXogQSBTaWRkaXF1aSAoMik6CiAgbGliL2lndF9kZXZpY2Vfc2NhbjpBZGQg
ZnVuY3Rpb24gdG8gZ2V0IHBjaSBzdWJzeXN0ZW0gb2YgcmVxdWVzdGVkCiAgICBjYXJkCiAgbGli
L2lndF9kZXZpY2Vfc2NhbjogU2VsZWN0IGludGVsIGFzIGRlZmF1bHQgdmVuZG9yIGZvciBpbnRl
bF9ncHVfdG9wCgogbGliL2lndF9kZXZpY2Vfc2Nhbi5jIHwgOTUgKysrKysrKysrKysrKysrKysr
KysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQogbGliL2lndF9kZXZpY2Vfc2Nhbi5oIHwgIDIgKwog
dG9vbHMvaW50ZWxfZ3B1X3RvcC5jIHwgIDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgNjQgaW5zZXJ0
aW9ucygrKSwgMzUgZGVsZXRpb25zKC0pCgotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2lndC1kZXYK
