Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD8B6E520
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Mar 2018 15:04:15 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Mon, 19 Mar 2018 16:04:09 +0100
Message-Id: <20180319150411.4937-1-maarten.lankhorst@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t 0/2] tests/kms_frontbuffer_tracking: Rework
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
YXRjaCAxIGtpbmQgb2YgbmVlZHMga2VybmVsIHN1cHBvcnQgdG8gd29yay4KCmh0dHBzOi8vcGF0
Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMzk5NTUvCgpNYWFydGVuIExhbmtob3JzdCAo
Mik6CiAgdGVzdHMva21zX2Zyb250YnVmZmVyX3RyYWNraW5nOiBBZGQgc3VwcG9ydCBmb3IgdG9n
Z2xpbmcgZWRwIHBzcgogICAgdGhyb3VnaCBkZWJ1Z2ZzLCB2Mi4KICB0ZXN0cy9rbXNfZnJvbnRi
dWZmZXJfdHJhY2tpbmc6IFJlbW92ZSByZWR1bmRhbnQgbW9kZXNldHMgZHVyaW5nCiAgICBzdWJ0
ZXN0IHN0YXJ0LCB2My4KCiB0ZXN0cy9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYyB8IDkzICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3
OCBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKCi0tIAoyLjE2LjIKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0
CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
