Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm0-x241.google.com (mail-wm0-x241.google.com
 [IPv6:2a00:1450:400c:c09::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 618EE6E294
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Aug 2018 15:05:35 +0000 (UTC)
Received: by mail-wm0-x241.google.com with SMTP id s12-v6so12650109wmc.0
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Aug 2018 08:05:35 -0700 (PDT)
From: Tvrtko Ursulin <tursulin@ursulin.net>
Date: Tue, 14 Aug 2018 16:05:17 +0100
Message-Id: <20180814150519.20204-6-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20180814150519.20204-1-tvrtko.ursulin@linux.intel.com>
References: <20180814150519.20204-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t 5/7] gem_wsim: Make batches preemptable by
 default
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

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KCk1JX05PT1Ag
Y2Fubm90IGJlIHByZWVtcHRlZCB3aGljaCBtZWFucyB1cCB0byBub3cgZ2VtX3dzaW0gd29ya2xv
YWRzIHdlcmUKcHJlZW1wdGFibGUgb24gYmF0Y2ggYnVmZmVyIGdyYW51bGFyaXR5IG9ubHkuCgpB
ZGQgTUlfQVJCX0NISyBldmVyeSAxMDB1cyBzbyB0aGUgbmV3IGRlZmF1bHQgaXMgbWlkLWJhdGNo
IHByZWVtcHRpb24uCgpTaWduZWQtb2ZmLWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3Vs
aW5AaW50ZWwuY29tPgotLS0KIGJlbmNobWFya3MvZ2VtX3dzaW0uYyB8IDIwICsrKysrKysrKysr
KysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2JlbmNobWFya3MvZ2VtX3dzaW0uYyBiL2JlbmNobWFya3MvZ2VtX3dzaW0uYwppbmRleCAyNGY1
MThhNzc3MGYuLmY2MGMwODZhM2YxZSAxMDA2NDQKLS0tIGEvYmVuY2htYXJrcy9nZW1fd3NpbS5j
CisrKyBiL2JlbmNobWFya3MvZ2VtX3dzaW0uYwpAQCAtNjgzLDYgKzY4MywyNSBAQCBzdGF0aWMg
dW5zaWduZWQgbG9uZyBnZXRfYmJfc3oodW5zaWduZWQgaW50IGR1cmF0aW9uKQogCQkgICAgIG5v
cF9jYWxpYnJhdGlvbl91cywgc2l6ZW9mKHVpbnQzMl90KSk7CiB9CiAKK3N0YXRpYyB2b2lkCitp
bml0X2JiKHN0cnVjdCB3X3N0ZXAgKncsIHVuc2lnbmVkIGludCBmbGFncykKK3sKKwkvKiBQcmVl
bXB0aW9uIHBvaW50IGV2ZXJ5IDEwMHVzLiAqLworCWNvbnN0IHVuc2lnbmVkIGludCBhcmJfcGVy
aW9kID0gZ2V0X2JiX3N6KDEwMCkgLyBzaXplb2YodWludDMyX3QpOworCXVuc2lnbmVkIGludCBp
OworCXVpbnQzMl90ICpwdHI7CisKKwlnZW1fc2V0X2RvbWFpbihmZCwgdy0+YmJfaGFuZGxlLAor
CQkgICAgICAgSTkxNV9HRU1fRE9NQUlOX1dDLCBJOTE1X0dFTV9ET01BSU5fV0MpOworCisJcHRy
ID0gZ2VtX21tYXBfX3djKGZkLCB3LT5iYl9oYW5kbGUsIDAsIHctPmJiX3N6LCBQUk9UX1dSSVRF
KTsKKworCWZvciAoaSA9IGFyYl9wZXJpb2Q7IGkgPCB3LT5iYl9zeiAvIHNpemVvZih1aW50MzJf
dCk7IGkgKz0gYXJiX3BlcmlvZCkKKwkJcHRyW2ldID0gMHg1IDw8IDIzOyAvKiBNSV9BUkJfQ0hL
ICovCisKKwltdW5tYXAocHRyLCB3LT5iYl9zeik7Cit9CisKIHN0YXRpYyB2b2lkCiB0ZXJtaW5h
dGVfYmIoc3RydWN0IHdfc3RlcCAqdywgdW5zaWduZWQgaW50IGZsYWdzKQogewpAQCAtODM2LDYg
Kzg1NSw3IEBAIGFsbG9jX3N0ZXBfYmF0Y2goc3RydWN0IHdvcmtsb2FkICp3cmssIHN0cnVjdCB3
X3N0ZXAgKncsIHVuc2lnbmVkIGludCBmbGFncykKIAogCXctPmJiX3N6ID0gZ2V0X2JiX3N6KHct
PmR1cmF0aW9uLm1heCk7CiAJdy0+YmJfaGFuZGxlID0gdy0+b2JqW2pdLmhhbmRsZSA9IGdlbV9j
cmVhdGUoZmQsIHctPmJiX3N6KTsKKwlpbml0X2JiKHcsIGZsYWdzKTsKIAl0ZXJtaW5hdGVfYmIo
dywgZmxhZ3MpOwogCiAJaWYgKGZsYWdzICYgU0VRTk8pIHsKLS0gCjIuMTcuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxp
c3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
