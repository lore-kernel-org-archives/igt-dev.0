Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B4C6EFCE
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jan 2019 11:21:04 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed, 16 Jan 2019 13:20:49 +0200
Message-Id: <20190116112050.27647-21-petri.latvala@intel.com>
In-Reply-To: <20190116112050.27647-1-petri.latvala@intel.com>
References: <20190116112050.27647-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 20/21] lib/igt_x86: Mock-use variable to
 silence static analysis
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

eDg2X2ZlYXR1cmVzX3RvX3N0cmluZygpIHVzZXMgYSByZXBlYXRhYmxlIHBhdHRlcm4gdGhhdCBp
bmNyZW1lbnRzIGEKcG9pbnRlciBmb3IgZWFjaCBmZWF0dXJlIHN0cmluZywgbGVhdmluZyBhIGRl
YWQgYXNzaWdubWVudCBmb3IgdGhlCmxhc3Qgb25lLiBBZGQgYSAodm9pZClsaW5lIHRvIHRoZSBl
bmQganVzdCB0byBzaWxlbmNlIHN0YXRpYyBhbmFseXNpcy4KClNpZ25lZC1vZmYtYnk6IFBldHJp
IExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgpDYzogQ2hyaXMgV2lsc29uIDxjaHJp
c0BjaHJpcy13aWxzb24uY28udWs+Ci0tLQogbGliL2lndF94ODYuYyB8IDIgKysKIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9saWIvaWd0X3g4Ni5jIGIvbGli
L2lndF94ODYuYwppbmRleCBjYjFlMGE3Mi4uODhlNTE0ZGYgMTAwNjQ0Ci0tLSBhL2xpYi9pZ3Rf
eDg2LmMKKysrIGIvbGliL2lndF94ODYuYwpAQCAtMTc1LDYgKzE3NSw4IEBAIGNoYXIgKmlndF94
ODZfZmVhdHVyZXNfdG9fc3RyaW5nKHVuc2lnbmVkIGZlYXR1cmVzLCBjaGFyICpsaW5lKQogCWlm
IChmZWF0dXJlcyAmIEFWWDIpCiAJCWxpbmUgKz0gc3ByaW50ZihsaW5lLCAiLCBhdngyIik7CiAK
Kwkodm9pZClsaW5lOworCiAJcmV0dXJuIHJldDsKIH0KICNlbmRpZgotLSAKMi4xOS4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxp
bmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
