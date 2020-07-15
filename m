Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A19F6EB7F
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2020 15:06:13 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Wed, 15 Jul 2020 18:05:40 +0300
Message-Id: <20200715150542.30405-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/3] tools/intel_watermark: Deal with TGL
 planes
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClRH
TCBoYXMgdGhlIHNhbWUgYW1vdW50IG9mIHBsYW5lcyBhcyBJQ0wuIE1ha2UgaW50ZWxfd2F0ZXJt
YXJrCmF3YXJlIG9mIHRoYXQgZmFjdC4KClRPRE86IFJLTCsgaGF2ZSBsZXNzIHBsYW5lcywgYnV0
IHdlIGhhdmUgSVNfUktMKCkgYXRtLi4uCgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6Qg
PHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgotLS0KIHRvb2xzL2ludGVsX3dhdGVybWFy
ay5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvdG9vbHMvaW50ZWxfd2F0ZXJtYXJrLmMgYi90b29scy9pbnRlbF93YXRl
cm1hcmsuYwppbmRleCAxNGQxYWUwZDgwZjcuLjBkNGY2NTVjYTJhOCAxMDA2NDQKLS0tIGEvdG9v
bHMvaW50ZWxfd2F0ZXJtYXJrLmMKKysrIGIvdG9vbHMvaW50ZWxfd2F0ZXJtYXJrLmMKQEAgLTEy
Nyw3ICsxMjcsNyBAQCBzdGF0aWMgY2hhciBlbmRpc19hc3QoYm9vbCBlbmFibGVkKQogCiBzdGF0
aWMgaW50IHNrbF9udW1fcGxhbmVzKHVpbnQzMl90IGQsIGludCBwaXBlKQogewotCWlmIChJU19H
RU4xMShkKSkKKwlpZiAoSVNfR0VOMTIoZCkgfHwgSVNfR0VOMTEoZCkpCiAJCXJldHVybiA4Owog
CWVsc2UgaWYgKElTX0dFTjEwKGQpIHx8IElTX0dFTUlOSUxBS0UoZCkpCiAJCXJldHVybiA1Owot
LSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
