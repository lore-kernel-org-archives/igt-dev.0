Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm0-x244.google.com (mail-wm0-x244.google.com
 [IPv6:2a00:1450:400c:c09::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF7A6E290
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Aug 2018 15:05:34 +0000 (UTC)
Received: by mail-wm0-x244.google.com with SMTP id s12-v6so12650048wmc.0
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Aug 2018 08:05:34 -0700 (PDT)
From: Tvrtko Ursulin <tursulin@ursulin.net>
Date: Tue, 14 Aug 2018 16:05:16 +0100
Message-Id: <20180814150519.20204-5-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20180814150519.20204-1-tvrtko.ursulin@linux.intel.com>
References: <20180814150519.20204-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t 4/7] gem_wsim: Stop keeping batches mapped
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KClRoZSByZWFz
b24sIHdoaWNoIEkgYXNzdW1lIHdhcyB0aGVyZSBhdCBzb21lIHBvaW50LCB0byBrZWVwIHRoZSBi
YXRjaGVzCnBlcnNpc3RlbnRseSBtZW1vcnkgbWFwcGVkIGRvZXMgbm90IGFwcGVhciB0byBiZSB0
aGVyZS4gU28gdW5tYXAgdGhlbQphZnRlciBjcmVhdGlvbiBhbmQgcmVtb3ZlIHRoZSB1bnVzZWQg
c3RydWN0dXJlIG1lbWJlcnMuCgpTaWduZWQtb2ZmLWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtv
LnVyc3VsaW5AaW50ZWwuY29tPgotLS0KIGJlbmNobWFya3MvZ2VtX3dzaW0uYyB8IDUgKy0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9iZW5jaG1hcmtzL2dlbV93c2ltLmMgYi9iZW5jaG1hcmtzL2dlbV93c2ltLmMKaW5kZXgg
MzQ3NTg0MTkyNTRhLi4yNGY1MThhNzc3MGYgMTAwNjQ0Ci0tLSBhL2JlbmNobWFya3MvZ2VtX3dz
aW0uYworKysgYi9iZW5jaG1hcmtzL2dlbV93c2ltLmMKQEAgLTEyOCw3ICsxMjgsNiBAQCBzdHJ1
Y3Qgd19zdGVwCiAJc3RydWN0IGRybV9pOTE1X2dlbV9yZWxvY2F0aW9uX2VudHJ5IHJlbG9jWzRd
OwogCXVuc2lnbmVkIGxvbmcgYmJfc3o7CiAJdWludDMyX3QgYmJfaGFuZGxlOwotCXVpbnQzMl90
ICptYXBwZWRfYmF0Y2g7CiAJdWludDMyX3QgKnNlcW5vX3ZhbHVlOwogCXVpbnQzMl90ICpzZXFu
b19hZGRyZXNzOwogCXVpbnQzMl90ICpydDBfdmFsdWU7CkBAIC0xMzYsNyArMTM1LDYgQEAgc3Ry
dWN0IHdfc3RlcAogCXVpbnQzMl90ICpydDFfYWRkcmVzczsKIAl1aW50MzJfdCAqbGF0Y2hfdmFs
dWU7CiAJdWludDMyX3QgKmxhdGNoX2FkZHJlc3M7Ci0JdW5zaWduZWQgaW50IG1hcHBlZF9sZW47
CiB9OwogCiBERUNMQVJFX0VXTUEodWludDY0X3QsIHJ0LCA0LCAyKQpAQCAtNzU1LDggKzc1Myw3
IEBAIHRlcm1pbmF0ZV9iYihzdHJ1Y3Qgd19zdGVwICp3LCB1bnNpZ25lZCBpbnQgZmxhZ3MpCiAK
IAkqY3MgPSBiYmU7CiAKLQl3LT5tYXBwZWRfYmF0Y2ggPSBwdHI7Ci0Jdy0+bWFwcGVkX2xlbiA9
IG1tYXBfbGVuOworCW11bm1hcChwdHIsIG1tYXBfbGVuKTsKIH0KIAogc3RhdGljIGNvbnN0IHVu
c2lnbmVkIGludCBlYl9lbmdpbmVfbWFwW05VTV9FTkdJTkVTXSA9IHsKLS0gCjIuMTcuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWls
aW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
