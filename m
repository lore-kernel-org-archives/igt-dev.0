Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF2476E29C
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Mar 2019 11:25:43 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu,  7 Mar 2019 13:24:25 +0200
Message-Id: <20190307112427.29146-3-petri.latvala@intel.com>
In-Reply-To: <20190307112427.29146-1-petri.latvala@intel.com>
References: <20190307112427.29146-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/5] lib/debugfs: Ensure null-termination in
 igt_hpd_storm_detected
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

UmVhZCBzaXplb2YgLSAxIHRvIGJ1ZiBzbyBpdCBzdGF5cyBudWxsLXRlcm1pbmF0ZWQuCgpTaWdu
ZWQtb2ZmLWJ5OiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4KLS0tCiBs
aWIvaWd0X2RlYnVnZnMuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3RfZGVidWdmcy5jIGIvbGliL2lndF9k
ZWJ1Z2ZzLmMKaW5kZXggNjQwYzc4ZTkuLmIwZTVjZmE1IDEwMDY0NAotLS0gYS9saWIvaWd0X2Rl
YnVnZnMuYworKysgYi9saWIvaWd0X2RlYnVnZnMuYwpAQCAtNjI4LDcgKzYyOCw3IEBAIGJvb2wg
aWd0X2hwZF9zdG9ybV9kZXRlY3RlZChpbnQgZHJtX2ZkKQogCWlmIChmZCA8IDApCiAJCXJldHVy
biBmYWxzZTsKIAotCWlndF9hc3NlcnRfbHQoMCwgcmVhZChmZCwgYnVmLCBzaXplb2YoYnVmKSkp
OworCWlndF9hc3NlcnRfbHQoMCwgcmVhZChmZCwgYnVmLCBzaXplb2YoYnVmKSAtIDEpKTsKIAlp
Z3RfYXNzZXJ0KHN0YXJ0X2xvYyA9IHN0cnN0cihidWYsICJEZXRlY3RlZDogIikpOwogCWlndF9h
c3NlcnRfZXEoc3NjYW5mKHN0YXJ0X2xvYywgIkRldGVjdGVkOiAlc1xuIiwgZGV0ZWN0ZWRfc3Ry
KSwgMSk7CiAKLS0gCjIuMTkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3Qt
ZGV2
