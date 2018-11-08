Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECBEF6E5F8
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Nov 2018 11:25:14 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Thu,  8 Nov 2018 11:25:10 +0000
Message-Id: <20181108112510.16764-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/i915/query: more accurate
 available/fused topology printout
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
Cc: tvrtko.ursulin@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

TWFrZSBhdmFpbGFiaWxpdHkgb2YgYWxsIGVsZW1lbnRzIG1vcmUgdmlzaWJsZSBmb3IgZGVidWcg
cHVycG9zZXMuCgpTaWduZWQtb2ZmLWJ5OiBMaW9uZWwgTGFuZHdlcmxpbiA8bGlvbmVsLmcubGFu
ZHdlcmxpbkBpbnRlbC5jb20+Ci0tLQogdGVzdHMvaTkxNS9xdWVyeS5jIHwgMTIgKysrKysrKysr
Ky0tCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS90ZXN0cy9pOTE1L3F1ZXJ5LmMgYi90ZXN0cy9pOTE1L3F1ZXJ5LmMKaW5kZXgg
MDhhYWJmOTQuLjNlN2ZkMTQwIDEwMDY0NAotLS0gYS90ZXN0cy9pOTE1L3F1ZXJ5LmMKKysrIGIv
dGVzdHMvaTkxNS9xdWVyeS5jCkBAIC0zNzMsMTIgKzM3MywyMCBAQCB0ZXN0X3F1ZXJ5X3RvcG9s
b2d5X21hdGNoZXNfZXVfdG90YWwoaW50IGZkKQogCWZvciAocyA9IDA7IHMgPCB0b3BvX2luZm8t
Pm1heF9zbGljZXM7IHMrKykgewogCQlpbnQgc3M7CiAKLQkJaWd0X2RlYnVnKCJzbGljZSVpOlxu
Iiwgcyk7CisJCWlndF9kZWJ1Zygic2xpY2UlaTogKCVzKVxuIiwgcywKKwkJCSAgc2xpY2VfYXZh
aWxhYmxlKHRvcG9faW5mbywgcykgPyAiYXZhaWxhYmxlIiA6ICJmdXNlZCIpOworCisJCWlmICgh
c2xpY2VfYXZhaWxhYmxlKHRvcG9faW5mbywgcykpCisJCQljb250aW51ZTsKIAogCQlmb3IgKHNz
ID0gMDsgc3MgPCB0b3BvX2luZm8tPm1heF9zdWJzbGljZXM7IHNzKyspIHsKIAkJCWludCBldSwg
bl9zdWJzbGljZV9ldXMgPSAwOwogCi0JCQlpZ3RfZGVidWcoIlx0c3Vic2xpY2U6ICVpXG4iLCBz
cyk7CisJCQlpZ3RfZGVidWcoIlx0c3Vic2xpY2UlaTogKCVzKVxuIiwgc3MsCisJCQkJICBzdWJz
bGljZV9hdmFpbGFibGUodG9wb19pbmZvLCBzLCBzcykgPyAiYXZhaWxhYmxlIiA6ICJmdXNlZCIp
OworCisJCQlpZiAoIXN1YnNsaWNlX2F2YWlsYWJsZSh0b3BvX2luZm8sIHMsIHNzKSkKKwkJCQlj
b250aW51ZTsKIAogCQkJaWd0X2RlYnVnKCJcdFx0ZXVfbWFzazogMGIiKTsKIAkJCWZvciAoZXUg
PSAwOyBldSA8IHRvcG9faW5mby0+bWF4X2V1c19wZXJfc3Vic2xpY2U7IGV1KyspIHsKLS0gCjIu
MTkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0
LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
