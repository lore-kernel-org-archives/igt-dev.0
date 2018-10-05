Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AEB46E8A6
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Oct 2018 18:04:47 +0000 (UTC)
From: Tomasz Lis <tomasz.lis@intel.com>
Date: Fri,  5 Oct 2018 20:04:33 +0200
Message-Id: <1538762676-15259-1-git-send-email-tomasz.lis@intel.com>
Subject: [igt-dev] [PATCH i-g-t v2 0/3] Data Port Cache Coherency test.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: bartosz.dunajski@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

VGhpcyBhZGRzIGEgbmV3IHRlc3QgYmluYXJ5LCBjb250YWluaW5nIHRlc3QgZm9yIHRoZSBEYXRh
IFBvcnQgQ29oZXJlbmN5Cm9wdGlvbi4gVGhlIHRlc3RzIGNoZWNrIHdoZXRoZXIgdGhlIG9wdGlv
biBoYXMgcmVhbCBlZmZlY3Qgb24gZXhlY3V0aW9uLApieSBzdWJtaXR0aW5nIGdwZ3B1IGZpbGwg
am9iIHdpdGggYW5kIHdpdGhvdXQgdGhlIGNvaGVyZW5jeS4KCkNjOiBKb29uYXMgTGFodGluZW4g
PGpvb25hcy5sYWh0aW5lbkBsaW51eC5pbnRlbC5jb20+CkNjOiBDaHJpcyBXaWxzb24gPGNocmlz
QGNocmlzLXdpbHNvbi5jby51az4KQ2M6IE1pY2hhbCBXaW5pYXJza2kgPG1pY2hhbC53aW5pYXJz
a2lAaW50ZWwuY29tPgoKU2lnbmVkLW9mZi1ieTogVG9tYXN6IExpcyA8dG9tYXN6Lmxpc0BpbnRl
bC5jb20+CgpMaXMsIFRvbWFzeiAoMyk6CiAgbGliOiBTZXBhcmF0ZWQgZW1pdCBwYXJ0IG9mIGdw
Z3B1X2ZpbGwuCiAgbGliOiBVcGRhdGUgc3VyZmFjZSBzdGF0ZSB0byBzZXQgTU9DUyBhbmQgY29o
ZXJlbmN5LgogIGlndDogQWRkIGEgdGVzdCBmb3IgRGF0YSBQb3J0IENvaGVyZW5jeS4KCiBpbmNs
dWRlL2RybS11YXBpL2k5MTVfZHJtLmggICAgIHwgICA3ICsKIGxpYi9ncGdwdV9maWxsLmMgICAg
ICAgICAgICAgICAgfCAgNTkgKysrLS0tLS0KIGxpYi9ncGdwdV9maWxsLmggICAgICAgICAgICAg
ICAgfCAgIDggKy0KIGxpYi9ncHVfY21kcy5jICAgICAgICAgICAgICAgICAgfCAgIDMgKwogbGli
L2ludGVsX2JhdGNoYnVmZmVyLmMgICAgICAgICB8ICAxMiArLQogbGliL2ludGVsX2JhdGNoYnVm
ZmVyLmggICAgICAgICB8ICAgMiArLQogdGVzdHMvTWFrZWZpbGUuc291cmNlcyAgICAgICAgICB8
ICAgMSArCiB0ZXN0cy9nZW1fZ3BncHVfZmlsbC5jICAgICAgICAgIHwgIDE5ICsrLQogdGVzdHMv
Z2VtX2dwZ3B1X2ZpbGxfY29oZXJlbnQuYyB8IDI5NiArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCiA5IGZpbGVzIGNoYW5nZWQsIDM1MiBpbnNlcnRpb25zKCspLCA1NSBk
ZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0cy9nZW1fZ3BncHVfZmlsbF9jb2hl
cmVudC5jCgotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRl
dgo=
