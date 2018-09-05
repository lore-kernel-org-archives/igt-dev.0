Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 337286E11F
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Sep 2018 21:05:11 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Wed,  5 Sep 2018 14:05:04 -0700
Message-Id: <20180905210505.28867-2-jose.souza@intel.com>
In-Reply-To: <20180905210505.28867-1-jose.souza@intel.com>
References: <20180905210505.28867-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/3] lib/psr: Read enable_psr instead of
 relly in a value assumption
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
Cc: Maarten@freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

SW5zdGVhZCBvZiBoYXZpbmcgYSBzdGF0aWMgdmFyaWFibGUgd2l0aCBhIGFzc3VtZWQgdmFsdWUg
bGV0cyBiZSBtb3JlCmFjY3VyYXRlIGFuZCByZWFkIHRoZSBwYXJhbWV0ZXIuCgpDYzogTWFhcnRl
biBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbQpTaWduZWQtb2Zm
LWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4KLS0tCiBs
aWIvaWd0X3Bzci5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3RfcHNyLmMgYi9saWIvaWd0X3Bzci5j
CmluZGV4IGJjMTQyNjMyLi43NTIwMDM0MiAxMDA2NDQKLS0tIGEvbGliL2lndF9wc3IuYworKysg
Yi9saWIvaWd0X3Bzci5jCkBAIC02OCwxNCArNjgsMTQgQEAgc3RhdGljIGludCBoYXNfcHNyX2Rl
YnVnZnMoaW50IGZkKQogCiBzdGF0aWMgYm9vbCBwc3JfbW9kcGFyYW1fc2V0KGludCB2YWwpCiB7
Ci0Jc3RhdGljIGludCBvbGR2YWwgPSAtMTsKKwlpbnQgb2xkdmFsID0gLTE7CiAKKwlpZ3RfZ2V0
X21vZHVsZV9wYXJhbV9pbnQoImVuYWJsZV9wc3IiLCAmb2xkdmFsKTsKIAlpZ3Rfc2V0X21vZHVs
ZV9wYXJhbV9pbnQoImVuYWJsZV9wc3IiLCB2YWwpOwogCiAJaWYgKHZhbCA9PSBvbGR2YWwpCiAJ
CXJldHVybiBmYWxzZTsKIAotCW9sZHZhbCA9IHZhbDsKIAlyZXR1cm4gdHJ1ZTsKIH0KIAotLSAK
Mi4xOC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
