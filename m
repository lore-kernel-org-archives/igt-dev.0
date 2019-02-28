Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C1456E1D5
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Feb 2019 14:49:21 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id b20so17178608edw.11
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Feb 2019 06:49:21 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 28 Feb 2019 15:49:05 +0100
Message-Id: <20190228144910.26488-3-daniel.vetter@ffwll.ch>
In-Reply-To: <20190228144910.26488-1-daniel.vetter@ffwll.ch>
References: <20190228144910.26488-1-daniel.vetter@ffwll.ch>
Subject: [igt-dev] [PATCH 2/7] drm/lease: Drop recursive leads checks
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
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: IGT development <igt-dev@lists.freedesktop.org>, Keith Packard <keithp@keithp.com>, Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

V2UgZGlzYWxsb3cgc3VibGVhc2luZywgc28gbm8gcG9pbnQgY2hlY2tpbmcgd2hldGhlciB0aGUg
bWFzdGVyIGhvbGRzCmFsbCB0aGUgbGVhc2VzIC0gaXQgd2lsbC4KClNwb3R0ZWQgd2hpbGUgdHlw
aW5nIGV4aGF1c3RpdmUgaWd0IGNvdmVyYWdlIGZvciBhbGwgdGhlc2UgY29ybmVyCmNhc2VzLgoK
Q2M6IEtlaXRoIFBhY2thcmQgPGtlaXRocEBrZWl0aHAuY29tPgpTaWduZWQtb2ZmLWJ5OiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
ZHJtX2xlYXNlLmMgfCAyIC0tCiAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2xlYXNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X2xlYXNlLmMKaW5kZXggMTE3NmQ4MTRjZjdmLi5jY2U1ZDlkZDUyZmYgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fbGVhc2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2xlYXNl
LmMKQEAgLTIyMCw4ICsyMjAsNiBAQCBzdGF0aWMgc3RydWN0IGRybV9tYXN0ZXIgKmRybV9sZWFz
ZV9jcmVhdGUoc3RydWN0IGRybV9tYXN0ZXIgKmxlc3Nvciwgc3RydWN0IGlkcgogCQllcnJvciA9
IDA7CiAJCWlmICghaWRyX2ZpbmQoJmRldi0+bW9kZV9jb25maWcub2JqZWN0X2lkciwgb2JqZWN0
KSkKIAkJCWVycm9yID0gLUVOT0VOVDsKLQkJZWxzZSBpZiAoIV9kcm1fbGVhc2VfaGVsZF9tYXN0
ZXIobGVzc29yLCBvYmplY3QpKQotCQkJZXJyb3IgPSAtRUFDQ0VTOwogCQllbHNlIGlmIChfZHJt
X2hhc19sZWFzZWQobGVzc29yLCBvYmplY3QpKQogCQkJZXJyb3IgPSAtRUJVU1k7CiAKLS0gCjIu
MTQuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0
LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
