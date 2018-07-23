Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F546E298
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Jul 2018 11:47:06 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id g6-v6so408863wrp.0
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Jul 2018 04:47:06 -0700 (PDT)
From: Tvrtko Ursulin <tursulin@ursulin.net>
Date: Mon, 23 Jul 2018 12:46:58 +0100
Message-Id: <20180723114658.13025-4-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20180723114658.13025-1-tvrtko.ursulin@linux.intel.com>
References: <20180723114658.13025-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t 4/4] tests/perf_pmu: Restore runtime PM
 status at rc6 test exit
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
Cc: intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KCkF2b2lkIHJ1
bm5pbmcgc3Vic2VxdWVudCBzdWJ0ZXN0cyBpbiBub24tZGVmYXVsdCBzZXR1cCBieSByZXN0b3Jp
bmcgdGhlCnJ1bnRpbWUgUE0gY29uZmlnIGluIG9uZSBwYXJ0aWN1bGFyIHN1YnRlc3QuCgpTaWdu
ZWQtb2ZmLWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgotLS0K
IHRlc3RzL3BlcmZfcG11LmMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL3Rlc3RzL3BlcmZfcG11LmMgYi90ZXN0cy9wZXJmX3BtdS5jCmluZGV4
IGExZDM2YWM0ZmE5ZC4uOWEyMGFiYjZiOTVjIDEwMDY0NAotLS0gYS90ZXN0cy9wZXJmX3BtdS5j
CisrKyBiL3Rlc3RzL3BlcmZfcG11LmMKQEAgLTE0NDEsNiArMTQ0MSw5IEBAIHRlc3RfcmM2KGlu
dCBnZW1fZmQsIHVuc2lnbmVkIGludCBmbGFncykKIAljbG9zZShmdyk7CiAJY2xvc2UoZmQpOwog
CisJaWYgKGZsYWdzICYgVEVTVF9SVU5USU1FX1BNKQorCQlpZ3RfcmVzdG9yZV9ydW50aW1lX3Bt
KCk7CisKIAlhc3NlcnRfd2l0aGluX2Vwc2lsb24oYnVzeSAtIHByZXYsIDAuMCwgdG9sZXJhbmNl
KTsKIH0KIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1k
ZXYK
