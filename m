Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5AD06E2FF
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2020 14:18:48 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Tue, 10 Mar 2020 16:18:30 +0200
Message-Id: <20200310141830.8040-6-ville.syrjala@linux.intel.com>
In-Reply-To: <20200310141830.8040-1-ville.syrjala@linux.intel.com>
References: <20200310141830.8040-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 6/6] HACK: lib/igt_fb: Paint diagonals
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClBh
aW50IGRpYWdvbmFscyBvbiB0aGUgc3RhbmRhcmQgdGVzdCBwYXR0ZXJuIHNvIHRoYXQgc2NhbGlu
ZwphcnRpZmFjdHMgYXJlIG1vcmUgcmVhZGlseSB2aXNpYmxlLgoKU2lnbmVkLW9mZi1ieTogVmls
bGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiBsaWIvaWd0
X2ZiLmMgfCAxNCArKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9saWIvaWd0X2ZiLmMgYi9saWIvaWd0X2ZiLmMKaW5kZXggMGM0ZmRj
NWQ0ODg5Li5jYzU3NDkzZTAxYzUgMTAwNjQ0Ci0tLSBhL2xpYi9pZ3RfZmIuYworKysgYi9saWIv
aWd0X2ZiLmMKQEAgLTE0NzksNiArMTQ3OSwxOCBAQCBwYWludF9tYXJrZXIoY2Fpcm9fdCAqY3Is
IGludCB4LCBpbnQgeSkKIAlpZ3RfY2Fpcm9fcHJpbnRmX2xpbmUoY3IsIGFsaWduLCAwLCAiKCVk
LCAlZCkiLCB4LCB5KTsKIH0KIAorc3RhdGljIHZvaWQKK3BhaW50X2RpYWdvbmFscyhjYWlyb190
ICpjciwgaW50IHcsIGludCBoKQoreworCWNhaXJvX21vdmVfdG8oY3IsIDAsIDApOworCWNhaXJv
X2xpbmVfdG8oY3IsIHcsIGgpOworCWNhaXJvX21vdmVfdG8oY3IsIDAsIGgpOworCWNhaXJvX2xp
bmVfdG8oY3IsIHcsIDApOworCWNhaXJvX3NldF9zb3VyY2VfcmdiKGNyLCAxLCAxLCAxKTsKKwlj
YWlyb19zZXRfbGluZV93aWR0aChjciwgMSk7CisJY2Fpcm9fc3Ryb2tlKGNyKTsKK30KKwogLyoq
CiAgKiBpZ3RfcGFpbnRfdGVzdF9wYXR0ZXJuOgogICogQGNyOiBjYWlybyBkcmF3aW5nIGNvbnRl
eHQKQEAgLTE0OTksNiArMTUxMSw4IEBAIHZvaWQgaWd0X3BhaW50X3Rlc3RfcGF0dGVybihjYWly
b190ICpjciwgaW50IHdpZHRoLCBpbnQgaGVpZ2h0KQogCiAJY2Fpcm9fc2V0X2xpbmVfY2FwKGNy
LCBDQUlST19MSU5FX0NBUF9TUVVBUkUpOwogCisJcGFpbnRfZGlhZ29uYWxzKGNyLCB3aWR0aCwg
aGVpZ2h0KTsKKwogCS8qIFBhaW50IGNvcm5lciBtYXJrZXJzICovCiAJcGFpbnRfbWFya2VyKGNy
LCAwLCAwKTsKIAlwYWludF9tYXJrZXIoY3IsIHdpZHRoLCAwKTsKLS0gCjIuMjQuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5n
IGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
