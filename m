Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A57106E3F4
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jan 2020 14:25:45 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Tue, 14 Jan 2020 16:25:19 +0200
Message-Id: <20200114142523.10603-3-ville.syrjala@linux.intel.com>
In-Reply-To: <20200114142523.10603-1-ville.syrjala@linux.intel.com>
References: <20200114142523.10603-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/7] tests/perf: Fix compiler warn on 32bit
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCi4u
L3Rlc3RzL3BlcmYuYzo4OTA6MTI6IHdhcm5pbmc6IGZvcm1hdCDigJglbHXigJkgZXhwZWN0cyBh
cmd1bWVudCBvZiB0eXBlIOKAmGxvbmcgdW5zaWduZWQgaW504oCZLCBidXQgYXJndW1lbnQgNCBo
YXMgdHlwZSDigJh1aW50NjRfdOKAmSB7YWthIOKAmGxvbmcgbG9uZyB1bnNpZ25lZCBpbnTigJl9
IFstV2Zvcm1hdD1dCgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmph
bGFAbGludXguaW50ZWwuY29tPgotLS0KIHRlc3RzL3BlcmYuYyB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL3Bl
cmYuYyBiL3Rlc3RzL3BlcmYuYwppbmRleCA5ODIyNzdkZmQwYTcuLmE4Mzc1NTFjYjBhOSAxMDA2
NDQKLS0tIGEvdGVzdHMvcGVyZi5jCisrKyBiL3Rlc3RzL3BlcmYuYwpAQCAtODg3LDcgKzg4Nyw3
IEBAIGluaXRfc3lzX2luZm8odm9pZCkKIAlpZ3RfYXNzZXJ0X25lcShkZXZpZCwgMCk7CiAKIAl0
aW1lc3RhbXBfZnJlcXVlbmN5ID0gZ2V0X2NzX3RpbWVzdGFtcF9mcmVxdWVuY3koKTsKLQlpZ3Rf
ZGVidWcoInRpbWVzdGFtcF9mcmVxdWVuY3kgPSAlbHVcbiIsIHRpbWVzdGFtcF9mcmVxdWVuY3kp
OworCWlndF9kZWJ1ZygidGltZXN0YW1wX2ZyZXF1ZW5jeSA9ICUiUFJJdTY0IlxuIiwgdGltZXN0
YW1wX2ZyZXF1ZW5jeSk7CiAJaWd0X2Fzc2VydF9uZXEodGltZXN0YW1wX2ZyZXF1ZW5jeSwgMCk7
CiAKIAlpZiAoSVNfSEFTV0VMTChkZXZpZCkpIHsKLS0gCjIuMjQuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
