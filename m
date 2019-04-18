Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74CF86E1B8
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Apr 2019 19:40:50 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Thu, 18 Apr 2019 22:40:40 +0300
Message-Id: <20190418194043.5184-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20190418194043.5184-1-ville.syrjala@linux.intel.com>
References: <20190418194043.5184-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/5] lib/igt_fb: Fix 32bit integer overflow
 in the shadow buffer size calculation
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCjE2
ayoxNmsqMTYgPT0gMTw8MzIsIHNvIDMyYml0cyBpc24ndCBlbm91Z2ggZm9yIHRoZSByZXN1bHQg
d2hlbgp3ZSBzdGFydCB0byBoYXZlIGJpZyBmcmFtZWJ1ZmZlcnMuCgpTaWduZWQtb2ZmLWJ5OiBW
aWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgotLS0KIGxpYi9p
Z3RfZmIuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3RfZmIuYyBiL2xpYi9pZ3RfZmIuYwppbmRleCBmMzYw
OTY4MDRmZGQuLmQ0OTI5MDE5OTcxYyAxMDA2NDQKLS0tIGEvbGliL2lndF9mYi5jCisrKyBiL2xp
Yi9pZ3RfZmIuYwpAQCAtMTkxMiw3ICsxOTEyLDcgQEAgc3RhdGljIHZvaWQgKmlndF9mYl9jcmVh
dGVfY2Fpcm9fc2hhZG93X2J1ZmZlcihpbnQgZmQsCiAJCUlHVF9DT0xPUl9ZQ0JDUl9CVDcwOSwg
SUdUX0NPTE9SX1lDQkNSX0xJTUlURURfUkFOR0UpOwogCiAJc2hhZG93LT5zdHJpZGVzWzBdID0g
QUxJR04od2lkdGggKiAoc2hhZG93LT5wbGFuZV9icHBbMF0gLyA4KSwgMTYpOwotCXNoYWRvdy0+
c2l6ZSA9IEFMSUdOKHNoYWRvdy0+c3RyaWRlc1swXSAqIGhlaWdodCwKKwlzaGFkb3ctPnNpemUg
PSBBTElHTigodWludDY0X3Qpc2hhZG93LT5zdHJpZGVzWzBdICogaGVpZ2h0LAogCQkJICAgICBz
eXNjb25mKF9TQ19QQUdFU0laRSkpOwogCXB0ciA9IG1tYXAoTlVMTCwgc2hhZG93LT5zaXplLCBQ
Uk9UX1JFQUQgfCBQUk9UX1dSSVRFLAogCQkgICBNQVBfUFJJVkFURSB8IE1BUF9BTk9OWU1PVVMs
IC0xLCAwKTsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3Qt
ZGV2
