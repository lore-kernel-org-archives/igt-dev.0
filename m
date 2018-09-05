Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F786E560
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Sep 2018 21:05:25 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Wed,  5 Sep 2018 14:05:05 -0700
Message-Id: <20180905210505.28867-3-jose.souza@intel.com>
In-Reply-To: <20180905210505.28867-1-jose.souza@intel.com>
References: <20180905210505.28867-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/3] lib: Use newly added
 igt_get_module_param() in igt_save_module_param()
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

aWd0X2dldF9tb2R1bGVfcGFyYW0oKSBpcyBkb2luZyB0aGUgc2FtZSB0aGluZyBhcyBwYXJ0IG9m
CmlndF9zYXZlX21vZHVsZV9wYXJhbSgpIHNvIGxldHMgc2hhcmUgY29kZSBoZXJlLgoKU2lnbmVk
LW9mZi1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+Ci0t
LQogbGliL2lndF9hdXguYyB8IDExICstLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3RfYXV4LmMgYi9s
aWIvaWd0X2F1eC5jCmluZGV4IDU0NTFmNTFjLi43YmIwYjJkMSAxMDA2NDQKLS0tIGEvbGliL2ln
dF9hdXguYworKysgYi9saWIvaWd0X2F1eC5jCkBAIC0xMTY5LDggKzExNjksNiBAQCBzdGF0aWMg
dm9pZCBpZ3RfbW9kdWxlX3BhcmFtX2V4aXRfaGFuZGxlcihpbnQgc2lnKQogc3RhdGljIHZvaWQg
aWd0X3NhdmVfbW9kdWxlX3BhcmFtKGNvbnN0IGNoYXIgKm5hbWUsIGNvbnN0IGNoYXIgKmZpbGVf
cGF0aCkKIHsKIAlzdHJ1Y3QgbW9kdWxlX3BhcmFtX2RhdGEgKmRhdGE7Ci0Jc2l6ZV90IG47Ci0J
aW50IGZkOwogCiAJLyogQ2hlY2sgaWYgdGhpcyBwYXJhbWV0ZXIgaXMgYWxyZWFkeSBzYXZlZC4g
Ki8KIAlmb3IgKGRhdGEgPSBtb2R1bGVfcGFyYW1zOyBkYXRhICE9IE5VTEw7IGRhdGEgPSBkYXRh
LT5uZXh0KQpAQCAtMTE4NSwxNCArMTE4Myw3IEBAIHN0YXRpYyB2b2lkIGlndF9zYXZlX21vZHVs
ZV9wYXJhbShjb25zdCBjaGFyICpuYW1lLCBjb25zdCBjaGFyICpmaWxlX3BhdGgpCiAKIAlzdHJu
Y3B5KGRhdGEtPm5hbWUsIG5hbWUsIFBBUkFNX05BTUVfTUFYX1NaIC0gMSk7CiAKLQlmZCA9IG9w
ZW4oZmlsZV9wYXRoLCBPX1JET05MWSk7Ci0JaWd0X2Fzc2VydChmZCA+PSAwKTsKLQotCW4gPSBy
ZWFkKGZkLCBkYXRhLT5vcmlnaW5hbF92YWx1ZSwgUEFSQU1fVkFMVUVfTUFYX1NaKTsKLQlpZ3Rf
YXNzZXJ0X2YobiA+IDAgJiYgbiA8IFBBUkFNX1ZBTFVFX01BWF9TWiwKLQkJICAgICAiTmVlZCB0
byBpbmNyZWFzZSBQQVJBTV9WQUxVRV9NQVhfU1pcbiIpOwotCi0JaWd0X2Fzc2VydChjbG9zZShm
ZCkgPT0gMCk7CisJaWd0X2dldF9tb2R1bGVfcGFyYW0obmFtZSwgZGF0YS0+b3JpZ2luYWxfdmFs
dWUsIFBBUkFNX1ZBTFVFX01BWF9TWik7CiAKIAlkYXRhLT5uZXh0ID0gbW9kdWxlX3BhcmFtczsK
IAltb2R1bGVfcGFyYW1zID0gZGF0YTsKLS0gCjIuMTguMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9pZ3QtZGV2Cg==
