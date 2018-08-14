Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1322A6E294
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Aug 2018 15:05:37 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id c13-v6so17540719wrt.1
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Aug 2018 08:05:37 -0700 (PDT)
From: Tvrtko Ursulin <tursulin@ursulin.net>
Date: Tue, 14 Aug 2018 16:05:19 +0100
Message-Id: <20180814150519.20204-8-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20180814150519.20204-1-tvrtko.ursulin@linux.intel.com>
References: <20180814150519.20204-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t 7/7] gem_wsim: Fix BCS usage under VCS2
 remap warning
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

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KCk5lZWQgdG8g
Y2hlY2sgd2UgYWN0dWFsbHkgYXJlIGluIFZDUzIgcmVtYXBwaW5nIG1vZGUhCgpTaWduZWQtb2Zm
LWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgotLS0KIGJlbmNo
bWFya3MvZ2VtX3dzaW0uYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2JlbmNobWFya3MvZ2VtX3dzaW0uYyBiL2JlbmNo
bWFya3MvZ2VtX3dzaW0uYwppbmRleCBmZDI2OGIzYWI0NTYuLjg1MGM4OTcyZjZlYiAxMDA2NDQK
LS0tIGEvYmVuY2htYXJrcy9nZW1fd3NpbS5jCisrKyBiL2JlbmNobWFya3MvZ2VtX3dzaW0uYwpA
QCAtNjYxLDcgKzY2MSw3IEBAIGFkZF9zdGVwOgogCQl9CiAJfQogCi0JaWYgKGJjc191c2VkICYm
IHZlcmJvc2UpCisJaWYgKGJjc191c2VkICYmIChmbGFncyAmIFZDUzJSRU1BUCkgJiYgdmVyYm9z
ZSkKIAkJcHJpbnRmKCJCQ1MgdXNhZ2UgaW4gd29ya2xvYWQgd2l0aCBWQ1MyIHJlbWFwcGluZyBl
bmFibGVkIVxuIik7CiAKIAlyZXR1cm4gd3JrOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3Qt
ZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
