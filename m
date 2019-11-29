Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E29006E91E
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Nov 2019 14:30:51 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Fri, 29 Nov 2019 16:30:46 +0200
Message-Id: <20191129143048.1936-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/3] lib/igt_draw: BCS_SWCTRL is gen6+
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkxl
dCdzIG1ha2Ugc3VyZSB3ZSBhcmUgcnVuaW5nIG9uIGdlbjYrIGJlZm9yZSB0cnlpbmcKdG8gcG9r
ZSBCQ1NfU1dDVFJMLgoKU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJq
YWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiBsaWIvaWd0X2RyYXcuYyB8IDIgKysKIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9saWIvaWd0X2RyYXcuYyBiL2xp
Yi9pZ3RfZHJhdy5jCmluZGV4IGJlYTg2YzYxMmRmOC4uMTFiYmZkMGExMzUzIDEwMDY0NAotLS0g
YS9saWIvaWd0X2RyYXcuYworKysgYi9saWIvaWd0X2RyYXcuYwpAQCAtMjczLDYgKzI3Myw4IEBA
IHN0YXRpYyB2b2lkIHN3aXRjaF9ibHRfdGlsaW5nKHN0cnVjdCBpbnRlbF9iYXRjaGJ1ZmZlciAq
YmF0Y2gsIHVpbnQzMl90IHRpbGluZywKIAlpZiAodGlsaW5nICE9IEk5MTVfVElMSU5HX1kpCiAJ
CXJldHVybjsKIAorCWlndF9yZXF1aXJlKGJhdGNoLT5nZW4gPj0gNik7CisKIAliY3Nfc3djdHJs
ID0gKDB4MyA8PCAxNikgfCAob24gPyAweDMgOiAweDApOwogCiAJLyogVG8gY2hhbmdlIHRoZSB0
aWxlIHJlZ2lzdGVyLCBpbnNlcnQgYW4gTUlfRkxVU0hfRFcgZm9sbG93ZWQgYnkgYW4KLS0gCjIu
MjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0
LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
