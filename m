Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC21D6F0D5
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Jun 2018 20:16:55 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Wed,  6 Jun 2018 23:16:42 +0300
Message-Id: <20180606201642.24618-4-ville.syrjala@linux.intel.com>
In-Reply-To: <20180606201642.24618-1-ville.syrjala@linux.intel.com>
References: <20180606201642.24618-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/4] lib/igt_fb: Round to nearest when
 clamping rgb
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkkg
dGhpbmsgcm91bmQgdG8gbmVhcmVzdCBpcyBtYXliZSBtb3JlIGNvcnJlY3QgaGVyZS4gQWxzbyBk
byB0aGUKY2xhbXAgd2l0aCBpbnRlZ2VycyBhcyBpdCBhY3R1YWxseSBtYWtlcyB0aGUgcmVzdWx0
aW5nIGNvZGUKbWVhc3VyYWJseSBmYXN0ZXIuCgpDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0
ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOk
bMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiBsaWIvaWd0X2ZiLmMgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9saWIvaWd0X2ZiLmMgYi9saWIvaWd0X2ZiLmMKaW5kZXggYTkyNmEwOGQ0NGUxLi42
ZmY5MGQ1M2Y0MzMgMTAwNjQ0Ci0tLSBhL2xpYi9pZ3RfZmIuYworKysgYi9saWIvaWd0X2ZiLmMK
QEAgLTEzMjMsNyArMTMyMyw3IEBAIHN0cnVjdCBmYl9jb252ZXJ0X2JsaXRfdXBsb2FkIHsKIAog
c3RhdGljIHVpbnQ4X3QgY2xhbXByZ2IoZmxvYXQgdmFsKQogewotCXJldHVybiBjbGFtcCh2YWws
IDAuMGYsIDI1NS4wZik7CisJcmV0dXJuIGNsYW1wKChpbnQpKHZhbCArIDAuNWYpLCAwLCAyNTUp
OwogfQogCiBzdGF0aWMgdm9pZCBjb252ZXJ0X252MTJfdG9fcmdiMjQoc3RydWN0IGlndF9mYiAq
ZmIsIHN0cnVjdCBmYl9jb252ZXJ0X2JsaXRfdXBsb2FkICpibGl0KQotLSAKMi4xNi40CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxp
bmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
