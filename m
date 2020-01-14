Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4702A891CB
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jan 2020 14:25:26 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Tue, 14 Jan 2020 16:25:17 +0200
Message-Id: <20200114142523.10603-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/7] tests/kms_vrr: Fix compiler warn on
 32bit
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
L3Rlc3RzL2ttc192cnIuYzozMDc6MTE6IHdhcm5pbmc6IGZvcm1hdCDigJglbHXigJkgZXhwZWN0
cyBhcmd1bWVudCBvZiB0eXBlIOKAmGxvbmcgdW5zaWduZWQgaW504oCZLCBidXQgYXJndW1lbnQg
NiBoYXMgdHlwZSDigJh1aW50NjRfdOKAmSB7YWthIOKAmGxvbmcgbG9uZyB1bnNpZ25lZCBpbnTi
gJl9IFstV2Zvcm1hdD1dCgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5
cmphbGFAbGludXguaW50ZWwuY29tPgotLS0KIHRlc3RzL2ttc192cnIuYyB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rl
c3RzL2ttc192cnIuYyBiL3Rlc3RzL2ttc192cnIuYwppbmRleCA3YmM0ZmM4YTIwZDEuLjczMTE1
ZmVmN2IyMSAxMDA2NDQKLS0tIGEvdGVzdHMva21zX3Zyci5jCisrKyBiL3Rlc3RzL2ttc192cnIu
YwpAQCAtMzA0LDcgKzMwNCw3IEBAIGZsaXBfYW5kX21lYXN1cmUoZGF0YV90ICpkYXRhLCBpZ3Rf
b3V0cHV0X3QgKm91dHB1dCwgZW51bSBwaXBlIHBpcGUsCiAJCXdoaWxlIChnZXRfdGltZV9ucygp
IDwgdGFyZ2V0X25zKTsKIAl9CiAKLQlpZ3RfaW5mbygiQ29tcGxldGVkICV1IGZsaXBzLCAldSB3
ZXJlIGluIHRocmVzaG9sZCBmb3IgJWx1bnMuXG4iLAorCWlndF9pbmZvKCJDb21wbGV0ZWQgJXUg
ZmxpcHMsICV1IHdlcmUgaW4gdGhyZXNob2xkIGZvciAlIlBSSXU2NCJucy5cbiIsCiAJCSB0b3Rh
bF9mbGlwLCB0b3RhbF9wYXNzLCByYXRlX25zKTsKIAogCXJldHVybiB0b3RhbF9mbGlwID8gKCh0
b3RhbF9wYXNzICogMTAwKSAvIHRvdGFsX2ZsaXApIDogMDsKLS0gCjIuMjQuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxp
c3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
