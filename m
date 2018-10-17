Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B92486E371
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Oct 2018 12:15:56 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Wed, 17 Oct 2018 15:15:45 +0300
Message-Id: <20181017121545.29096-3-arkadiusz.hiler@intel.com>
In-Reply-To: <20181017121545.29096-1-arkadiusz.hiler@intel.com>
References: <20181017121545.29096-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/3] intel-ci: Prepend fast-feedback with
 i915_load@load
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
Cc: Tomi Sarvela <tomi.p.sarvela@intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

TWFrZSB0aGUgaTkxNS1sb2FkaW5nIHN1YnRlc3QgZmlyc3QgdGhpbmcgaW4gZmFzdC1mZWVkYmFj
ay50ZXN0bGlzdCwKc28gd2UgaGF2ZSBhIG5pY2UgY2F0Y2gtYWxsIGZvciBhbGwgdGhlIGlzc3Vl
cyBsdXJpbmcgaW4gZG1lc2cgcmVsYXRlZAp0byBodyBpbml0aWFsaXphdGlvbi4KClRoaXMgcmVx
dWlyZWQgaTkxNSBtb2R1bGUgdG8gYmUgYmxhY2tsaXN0ZWQgaW4gb3JkZXIgdG8gd29yay4KCkNj
OiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4KQ2M6IFZpbGxlIFN5cmrD
pGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+CkNjOiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWwudmV0dGVyQGZmd2xsLmNoPgpDYzogVG9taSBTYXJ2ZWxhIDx0b21pLnAuc2FydmVsYUBp
bnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEFya2FkaXVzeiBIaWxlciA8YXJrYWRpdXN6LmhpbGVy
QGludGVsLmNvbT4KLS0tCiB0ZXN0cy9pbnRlbC1jaS9mYXN0LWZlZWRiYWNrLnRlc3RsaXN0IHwg
NSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rl
c3RzL2ludGVsLWNpL2Zhc3QtZmVlZGJhY2sudGVzdGxpc3QgYi90ZXN0cy9pbnRlbC1jaS9mYXN0
LWZlZWRiYWNrLnRlc3RsaXN0CmluZGV4IDVkZmE0ZWI3Li4yMjk2NDM2YyAxMDA2NDQKLS0tIGEv
dGVzdHMvaW50ZWwtY2kvZmFzdC1mZWVkYmFjay50ZXN0bGlzdAorKysgYi90ZXN0cy9pbnRlbC1j
aS9mYXN0LWZlZWRiYWNrLnRlc3RsaXN0CkBAIC0xLDUgKzEsMTAgQEAKICMgS2VlcCBhbHBoYWJl
dGljYWxseSBzb3J0ZWQgYnkgZGVmYXVsdAogCisjIFNwZWNpYWwgY2F0Y2gtYWxsIHRlc3RzIGZv
ciBkcml2ZXIgbG9hZGluZy4KKyMgQ0kgdGFyZ2V0cyBzaG91bGQgYmUgc3RhcnRlZCB3aXRoIGk5
MTUgYmxhY2tsaXN0ZWQsCisjIHNvIHRoZSBtb2R1bGUgd29uJ3QgYmUgbG9hZGVkIGJlZm9yZSB3
ZSBzdGFydCBleGVjdXRpbmcuCitpZ3RAaTkxNV9sb2FkQGxvYWQKKwogaWd0QGNvcmVfYXV0aEBi
YXNpYy1hdXRoCiBpZ3RAY29yZV9wcm9wX2Jsb2JAYmFzaWMKIGlndEBkZWJ1Z2ZzX3Rlc3RAcmVh
ZF9hbGxfZW50cmllcwotLSAKMi4xNy4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2lndC1kZXYK
