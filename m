Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4870A6E25C
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Dec 2018 23:09:50 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Tue,  4 Dec 2018 15:09:40 -0800
Message-Id: <20181204230944.7753-4-jose.souza@intel.com>
In-Reply-To: <20181204230944.7753-1-jose.souza@intel.com>
References: <20181204230944.7753-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/8] lib/psr: Make psr_active() only cares
 about PSR1
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
Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UFNSMiB3aWxsIGhhdmUgaXQgb3duIGZ1bmN0aW9uIHRvIGRldGVjdCBpZiBpcyBhY3RpdmUgc28g
d2UgY2FuIGRyb3AKdGhlIHNsZWVwIHN0YXRlIHNlYXJjaCBhbmQgYWxzbyB0byBtYWtlIHN1cmUg
dGhhdCBQU1IxIGlzIGFjdGl2ZSBsZXRzCnNlYXJjaCBmb3IgIlBTUjEgZW5hYmxlZCIuCgpDYzog
Um9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPgpDYzogRGhpbmFrYXJhbiBQYW5k
aXlhbiA8ZGhpbmFrYXJhbi5wYW5kaXlhbkBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEpvc8Op
IFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPgotLS0KIGxpYi9pZ3RfcHNy
LmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3RfcHNyLmMgYi9saWIvaWd0X3Bzci5jCmluZGV4IGVlY2Vl
NDU5Li5jNmQ2MzkwZiAxMDA2NDQKLS0tIGEvbGliL2lndF9wc3IuYworKysgYi9saWIvaWd0X3Bz
ci5jCkBAIC0zNyw3ICszNyw4IEBAIHN0YXRpYyBib29sIHBzcl9hY3RpdmUoaW50IGRlYnVnZnNf
ZmQsIGJvb2wgY2hlY2tfYWN0aXZlKQogCiAJYWN0aXZlID0gc3Ryc3RyKGJ1ZiwgIkhXIEVuYWJs
ZWQgJiBBY3RpdmUgYml0OiB5ZXNcbiIpIHx8CiAJCSBzdHJzdHIoYnVmLCAiU291cmNlIFBTUiBj
dGw6IGVuYWJsZWQiKTsKLQlhY3RpdmUgJj0gISEoc3Ryc3RyKGJ1ZiwgIlNSREVOVCIpIHx8IHN0
cnN0cihidWYsICJTTEVFUCIpKTsKKwlhY3RpdmUgJj0gISFzdHJzdHIoYnVmLCAiU1JERU5UIik7
CisJYWN0aXZlICY9ICEhc3Ryc3RyKGJ1ZiwgIlN0YXR1czogUFNSMSBlbmFibGVkIik7CiAJcmV0
dXJuIGNoZWNrX2FjdGl2ZSA/IGFjdGl2ZSA6ICFhY3RpdmU7CiB9CiAKLS0gCjIuMTkuMgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWls
aW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
