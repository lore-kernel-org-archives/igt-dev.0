Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA1B6E85C
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Feb 2021 21:09:57 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Tue, 23 Feb 2021 23:09:48 +0200
Message-Id: <20210223210950.13515-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20210223210950.13515-1-ville.syrjala@linux.intel.com>
References: <20210223210950.13515-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/4] tests: Remove pointless struct member
 initialization
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCklu
aXRpYWxpemluZyB0aGUgc2VlZCBhbmQgdXNlcl9zZWVkIGlzIHBvaW50bGVzczsgLnVzZXJfc2Vl
ZCBhbHJlYWR5CmRlZmF1bHRzIHRvIGZhbHNlLCBhbmQgLnNlZWQgd2lsbCBnZXQgb3ZlcndyaXR0
ZW4gYW55d2F5LgoKU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxh
QGxpbnV4LmludGVsLmNvbT4KLS0tCiB0ZXN0cy9rbXNfY29uY3VycmVudC5jICAgICB8IDIgLS0K
IHRlc3RzL2ttc19wbGFuZV9tdWx0aXBsZS5jIHwgMiAtLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19jb25jdXJyZW50LmMgYi90ZXN0cy9r
bXNfY29uY3VycmVudC5jCmluZGV4IGJkNzQxNmZkYTc2MC4uMTgzOGE4Y2E1YjQ3IDEwMDY0NAot
LS0gYS90ZXN0cy9rbXNfY29uY3VycmVudC5jCisrKyBiL3Rlc3RzL2ttc19jb25jdXJyZW50LmMK
QEAgLTQ2LDggKzQ2LDYgQEAgc3RydWN0IHsKIAlib29sIHJ1bjsKIH0gb3B0ID0gewogCS5pdGVy
YXRpb25zID0gMSwKLQkudXNlcl9zZWVkID0gZmFsc2UsCi0JLnNlZWQgPSAxLAogCS5ydW4gPSB0
cnVlLAogfTsKIApkaWZmIC0tZ2l0IGEvdGVzdHMva21zX3BsYW5lX211bHRpcGxlLmMgYi90ZXN0
cy9rbXNfcGxhbmVfbXVsdGlwbGUuYwppbmRleCA4MzEwOTgxY2Y5ZmEuLjQyMDIxMTdlYWI4MSAx
MDA2NDQKLS0tIGEvdGVzdHMva21zX3BsYW5lX211bHRpcGxlLmMKKysrIGIvdGVzdHMva21zX3Bs
YW5lX211bHRpcGxlLmMKQEAgLTU4LDggKzU4LDYgQEAgc3RydWN0IHsKIAlpbnQgc2VlZDsKIH0g
b3B0ID0gewogCS5pdGVyYXRpb25zID0gMSwKLQkudXNlcl9zZWVkID0gZmFsc2UsCi0JLnNlZWQg
PSAxLAogfTsKIAogLyoKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pZ3QtZGV2Cg==
