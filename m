Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C166E6E978
 for <igt-dev@lists.freedesktop.org>; Sat,  6 Oct 2018 02:09:41 +0000 (UTC)
From: Carlos Santa <carlos.santa@intel.com>
Date: Fri,  5 Oct 2018 18:05:24 -0700
Message-Id: <1538787925-144920-1-git-send-email-carlos.santa@intel.com>
Subject: [igt-dev] [PATCH i-g-t v2] tests/gem_watchdog: GPU engine reset
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
List-ID: <igt-dev@lists.freedesktop.org>

VGhpcyBJR1QgdGVzdCBjb21wbGVtZW50cyB0aGUgR2VuOCsgZW5naW5lLXJlc2V0IGZlYXR1cmUg
cGF0Y2gKc2VyaWVzIGFrYSBUaW1lb3V0IERldGVjdGlvbiBhbmQgUmVjb3ZlcnkgKFREUikgdGhh
dCBNaWNoZWwgVGhpZXJyeQpzdWJtaXR0ZWQgaGVyZTogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRl
c2t0b3Aub3JnL3Nlcmllcy8yMTg2OC8sIHNwZWNpZmljYWxseQp0aGUgV2F0Y2hkb2cgdGltZXIg
ZmVhdHVyZSBvZiB0aGUgb3JpZ2luYWwgdGhhdCBpcyBzdGlsbCBub3QgaW4KdXBzdHJlYW0uCgkK
VGhlcmUgYXJlIHNldmVyYWwgcGllY2VzIHRoYXQgYXJlIHJlcXVpcmVkIGluIG9yZGVyIHRvCmdl
dCAoVERSKSBXYXRjaGRvZyB0aW1lciBpbiB1cHN0cmVhbToKCQooMSkgaGF2aW5nIGEgcHJvcGVy
IElHVCBzZXQgb2YgdGVzdHMgdGhhdCBjYW4gZXhlcmNpc2UgdGhlIGZlYXR1cmUKKDIpIGJ1dCBt
b3JlIGltcG9yYW50bHksIGhhdmluZyBhIHF1YWxpZmllZCB1c2VyIHNwYWNlIGNsaWVudCBzdWNo
CmFzIGEgbWVkaWEgZHJpdmVyIHRoYXQgY2FuIHRyaWdnZXIgdGhlIHdhdGNoZG9nIHRpbWVyIGFm
dGVyIHN1Ym1pdHRpbmcKR1BVIHdvcmsgdGhhdCBjb3VsZCByZXNldCB0aGUgbWVkaWEgZW5naW5l
IGFmdGVyIGVuY291bnRlcmluZyBhCmh1bmcgZW5naW5lIGZvciBleGFtcGxlLgoJClRoaXMgSUdU
IHRlc3QgaXMgdG8gY292ZXIgcmVxdWlyZW1lbnQgKDEpIGFib3ZlLgoKQ2FybG9zIFNhbnRhICgx
KToKICB0ZXN0cy9nZW1fd2F0Y2hkb2c6IEluaXRpYWwgc2V0IG9mIHRlc3RzIGZvciBHUFUgd2F0
Y2hkb2cKCiB0ZXN0cy9NYWtlZmlsZS5zb3VyY2VzIHwgICAxICsKIHRlc3RzL2dlbV93YXRjaGRv
Zy5jICAgfCAxODYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwogdGVzdHMvbWVzb24uYnVpbGQgICAgICB8ICAgMSArCiAzIGZpbGVzIGNoYW5nZWQsIDE4
OCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMvZ2VtX3dhdGNoZG9nLmMK
Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
