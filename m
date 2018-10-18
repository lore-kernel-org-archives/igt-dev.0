Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C4EF89F6F
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Oct 2018 15:28:30 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id f17-v6so2417662wrs.12
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Oct 2018 08:28:30 -0700 (PDT)
From: Tvrtko Ursulin <tursulin@ursulin.net>
Date: Thu, 18 Oct 2018 16:28:04 +0100
Message-Id: <20181018152815.31816-7-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20181018152815.31816-1-tvrtko.ursulin@linux.intel.com>
References: <20181018152815.31816-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t 06/17] gem_wsim: Fix shadowed local
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

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KClNpZ25lZC1v
ZmYtYnk6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+Ci0tLQogYmVu
Y2htYXJrcy9nZW1fd3NpbS5jIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL2JlbmNobWFya3MvZ2VtX3dzaW0uYyBiL2JlbmNobWFya3MvZ2VtX3dzaW0u
YwppbmRleCBhZGZjMmIxYmM4MTkuLjI1NjE4MTc2MjJmNiAxMDA2NDQKLS0tIGEvYmVuY2htYXJr
cy9nZW1fd3NpbS5jCisrKyBiL2JlbmNobWFya3MvZ2VtX3dzaW0uYwpAQCAtMTE3MCw3ICsxMTcw
LDYgQEAgcHJlcGFyZV93b3JrbG9hZCh1bnNpZ25lZCBpbnQgaWQsIHN0cnVjdCB3b3JrbG9hZCAq
d3JrLCB1bnNpZ25lZCBpbnQgZmxhZ3MpCiAJICovCiAJZm9yIChpID0gMCwgdyA9IHdyay0+c3Rl
cHM7IGkgPCB3cmstPm5yX3N0ZXBzOyBpKyssIHcrKykgewogCQlzdHJ1Y3Qgd19zdGVwICp3MjsK
LQkJaW50IGo7CiAKIAkJaWYgKHctPnR5cGUgIT0gUFJFRU1QVElPTikKIAkJCWNvbnRpbnVlOwot
LSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
