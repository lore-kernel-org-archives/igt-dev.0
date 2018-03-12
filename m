Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 322566E0EC
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Mar 2018 17:30:18 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Mon, 12 Mar 2018 18:30:08 +0100
Message-Id: <20180312173013.50903-1-maarten.lankhorst@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t 0/5] tests/kms_frontbuffer_tracking: Rework
 to prevent modesets!
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

Tm93IHRoYXQgRkJDIGNhbiBiZSB0b2dnbGVkIGF0IHJ1bnRpbWUsIEkgd2FudGVkIHRvIG1ha2Ug
c3VyZSB0aGF0IHdlIHRyeSB0byBwcmV2ZW50Cm1vZGVzZXRzIGFzIG11Y2ggYXMgd2UgY2FuLgpQ
YXRjaCA0IGlzIHN0aWxsIGV4cGVyaW1lbnRhbCwgYW5kIG5lZWRzIGtlcm5lbCBzdXBwb3J0IHRv
IHdvcmsuIFN0aWxsIHdhbnRlZCB0byBhZGQgaXQsCmJ1dCBjYW4gYmUgc2tpcHBlZCBpbiByZXZp
ZXdzLgoKTWFhcnRlbiBMYW5raG9yc3QgKDUpOgogIGxpYi9pZ3RfYXV4OiBBZGQgaWd0X2dldF9t
b2R1bGVfcGFyYW1faW50LgogIHRlc3RzL2ttc19mcm9udGJ1ZmZlcl90cmFja2luZzogUmV3b3Jr
IHRvZ2dsaW5nIGRycnMvZmJjL3Bzci4KICB0ZXN0cy9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmc6
IEZpeCBiYXNpYyBzdWJ0ZXN0CiAgdGVzdHMva21zX2Zyb250YnVmZmVyX3RyYWNraW5nOiBBZGQg
c3VwcG9ydCBmb3IgdG9nZ2xpbmcgZWRwIHBzcgogICAgdGhyb3VnaCBkZWJ1Z2ZzLCB0byBwcmV2
ZW50IGEgbW9kZXNldAogIHRlc3RzL2ttc19mcm9udGJ1ZmZlcl90cmFja2luZzogUmVtb3ZlIHJl
ZHVuZGFudCBtb2Rlc2V0cyBkdXJpbmcKICAgIHN1YnRlc3Qgc3RhcnQsIHYyLgoKIGxpYi9pZ3Rf
YXV4LmMgICAgICAgICAgICAgICAgICAgIHwgIDYxICsrKysrKysrKysrKysrKysrKwogbGliL2ln
dF9hdXguaCAgICAgICAgICAgICAgICAgICAgfCAgIDMgKwogdGVzdHMva21zX2Zyb250YnVmZmVy
X3RyYWNraW5nLmMgfCAxMzYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0t
CiAzIGZpbGVzIGNoYW5nZWQsIDE2NiBpbnNlcnRpb25zKCspLCAzNCBkZWxldGlvbnMoLSkKCi0t
IAoyLjE2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
