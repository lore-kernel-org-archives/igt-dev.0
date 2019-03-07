Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E41B86E29D
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Mar 2019 11:25:43 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu,  7 Mar 2019 13:24:24 +0200
Message-Id: <20190307112427.29146-2-petri.latvala@intel.com>
In-Reply-To: <20190307112427.29146-1-petri.latvala@intel.com>
References: <20190307112427.29146-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/5] lib/aux: Plug memory leak in
 get_suspend_test
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

RnJlZSB0ZXN0X2xpbmUgaW4gYWxsIHBhdGhzIG91dCBvZiB0aGUgZnVuY3Rpb24uCgpTaWduZWQt
b2ZmLWJ5OiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4KLS0tCiBsaWIv
aWd0X2F1eC5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3RfYXV4LmMgYi9saWIvaWd0X2F1eC5jCmlu
ZGV4IGU1ZDQxZTMyLi5mNDkzOWJiNSAxMDA2NDQKLS0tIGEvbGliL2lndF9hdXguYworKysgYi9s
aWIvaWd0X2F1eC5jCkBAIC03MTgsNiArNzE4LDggQEAgc3RhdGljIGVudW0gaWd0X3N1c3BlbmRf
dGVzdCBnZXRfc3VzcGVuZF90ZXN0KGludCBwb3dlcl9kaXIpCiAJCQlicmVhazsKIAkJfQogCisJ
ZnJlZSh0ZXN0X2xpbmUpOworCiAJaWYgKCF0ZXN0X25hbWUpCiAJCXJldHVybiBTVVNQRU5EX1RF
U1RfTk9ORTsKIApAQCAtNzI3LDggKzcyOSw2IEBAIHN0YXRpYyBlbnVtIGlndF9zdXNwZW5kX3Rl
c3QgZ2V0X3N1c3BlbmRfdGVzdChpbnQgcG93ZXJfZGlyKQogCiAJaWd0X2Fzc2VydCh0ZXN0IDwg
U1VTUEVORF9URVNUX05VTSk7CiAKLQlmcmVlKHRlc3RfbGluZSk7Ci0KIAlyZXR1cm4gdGVzdDsK
IH0KIAotLSAKMi4xOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
