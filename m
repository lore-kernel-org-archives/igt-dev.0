Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD1D6895CA
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jun 2019 08:12:52 +0000 (UTC)
From: Simon Ser <simon.ser@intel.com>
Date: Wed,  5 Jun 2019 11:12:55 +0300
Message-Id: <20190605081255.29205-1-simon.ser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/igt_eld: fix autotools build
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
Cc: petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Rm9yZ290IHRvIGFkZCB0aGUgbmV3IGxpYiB0byBhdXRvdG9vbHMuCgpTaWduZWQtb2ZmLWJ5OiBT
aW1vbiBTZXIgPHNpbW9uLnNlckBpbnRlbC5jb20+CkZpeGVzOiA3YmRmNTI3NTI4ZDYgKCJsaWIv
aWd0X2VsZDogaW50cm9kdWNlIGFuIEVMRCBsaWJyYXJ5IikKLS0tCiBsaWIvTWFrZWZpbGUuc291
cmNlcyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9saWIvTWFrZWZpbGUuc291cmNlcyBiL2xpYi9NYWtlZmlsZS5zb3VyY2VzCmluZGV4IDA0NjI3
YTc3YmU1Mi4uZTE2ZGU4NmVhYTA4IDEwMDY0NAotLS0gYS9saWIvTWFrZWZpbGUuc291cmNlcwor
KysgYi9saWIvTWFrZWZpbGUuc291cmNlcwpAQCAtMzEsNiArMzEsOCBAQCBsaWJfc291cmNlX2xp
c3QgPQkgCVwKIAlpZ3RfY29sb3JfZW5jb2RpbmcuaAlcCiAJaWd0X2VkaWQuYwkJXAogCWlndF9l
ZGlkLmgJCVwKKwlpZ3RfZWxkLmMJCVwKKwlpZ3RfZWxkLmgJCVwKIAlpZ3RfZ3B1X3Bvd2VyLmMJ
CVwKIAlpZ3RfZ3B1X3Bvd2VyLmgJCVwKIAlpZ3RfZ3QuYwkJXAotLQoyLjIxLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
