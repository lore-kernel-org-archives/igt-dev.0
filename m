Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 813866E253
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Sep 2018 20:58:26 +0000 (UTC)
From: Carlos Santa <carlos.santa@intel.com>
Date: Fri, 21 Sep 2018 12:54:12 -0700
Message-Id: <1537559653-88736-1-git-send-email-carlos.santa@intel.com>
Subject: [igt-dev] [PATCH i-g-t] tests/gem_watchdog: GPU engine reset
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

ClRoaXMgSUdUIHRlc3QgY29tcGxlbWVudHMgdGhlIEdlbjgrIGVuZ2luZS1yZXNldCBmZWF0dXJl
IHBhdGNoCnNlcmllcyBha2EgVGltZW91dCBEZXRlY3Rpb24gYW5kIFJlY292ZXJ5IChURFIpIHRo
YXQgTWljaGVsIFRoaWVycnkKc3VibWl0dGVkIGhlcmU6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVk
ZXNrdG9wLm9yZy9zZXJpZXMvMjE4NjgvLCBzcGVjaWZpY2FsbHkKdGhlIFdhdGNoZG9nIHRpbWVy
IGZlYXR1cmUgb2YgdGhlIG9yaWdpbmFsIHRoYXQgaXMgc3RpbGwgbm90IGluCnVwc3RyZWFtLiAK
ClRoZXJlIGFyZSBzZXZlcmFsIHBpZWNlcyB0aGF0IGFyZSByZXF1aXJlZCBpbiBvcmRlciB0bwpn
ZXQgKFREUikgV2F0Y2hkb2cgdGltZXIgaW4gdXBzdHJlYW06CgooMSkgaGF2aW5nIGEgcHJvcGVy
IElHVCBzZXQgb2YgdGVzdHMgdGhhdCBjYW4gZXhlcmNpc2UgdGhlIGZlYXR1cmUKKDIpIGJ1dCBt
b3JlIGltcG9yYW50bHksIGhhdmluZyBhIHF1YWxpZmllZCB1c2VyIHNwYWNlIGNsaWVudCBzdWNo
CmFzIGEgbWVkaWEgZHJpdmVyIHRoYXQgY2FuIHRyaWdnZXIgdGhlIHdhdGNoZG9nIHRpbWVyIGFm
dGVyIHN1Ym1pdHRpbmcKR1BVIHdvcmsgdGhhdCBjb3VsZCByZXNldCB0aGUgbWVkaWEgZW5naW5l
IGFmdGVyIGVuY291bnRlcmluZyBhCmh1bmcgZW5naW5lIGZvciBleGFtcGxlLgoKVGhpcyBJR1Qg
dGVzdCBpcyB0byBjb3ZlciByZXF1aXJlbWVudCAoMSkgYWJvdmUuCgpDYXJsb3MgU2FudGEgKDEp
OgogIHRlc3RzL2dlbV93YXRjaGRvZzogSW5pdGlhbCBzZXQgb2YgdGVzdHMgZm9yIEdQVSB3YXRj
aGRvZwoKIHRlc3RzL01ha2VmaWxlLnNvdXJjZXMgfCAgIDEgKwogdGVzdHMvZ2VtX3dhdGNoZG9n
LmMgICB8IDI1MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrCiB0ZXN0cy9tZXNvbi5idWlsZCAgICAgIHwgICAxICsKIDMgZmlsZXMgY2hhbmdlZCwgMjU0
IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0cy9nZW1fd2F0Y2hkb2cuYwoK
LS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
