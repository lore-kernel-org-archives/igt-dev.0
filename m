Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 274D56E1B6
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Apr 2019 19:40:48 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Thu, 18 Apr 2019 22:40:39 +0300
Message-Id: <20190418194043.5184-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/5] lib/igt_fb: Fix the cairo shadow buffer
 stride
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCldl
J3JlIGN1cnJlbnRseSBvdmVyYWxsb2NhdGluZyB0aGUgc2hhZG93IGJ1ZmZlciBzdHJpZGUgYnkg
YQpmYWN0b3Igb2YgOC4gVGhpcyBkaWRuJ3QgZ28gZG93biBzbyB3ZWxsIHdoZW4gSSB0cmllZCB0
byB1c2UKYSAxNmt4MTZrIGZsb2F0IGZyYW1lYnVmZmVyLgoKQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0
IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkZpeGVzOiBiMDAzM2Q5MzEwYzEg
KCJsaWIvY29sb3JfZW5jb2Rpbmc6IFByZXBhcmUgc3VwcG9ydCBmb3IgSERSIG1vZGVzLCB2Mi4i
KQpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50
ZWwuY29tPgotLS0KIGxpYi9pZ3RfZmIuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3RfZmIuYyBiL2xpYi9p
Z3RfZmIuYwppbmRleCBiNGQzNTQ4MjViMTAuLmYzNjA5NjgwNGZkZCAxMDA2NDQKLS0tIGEvbGli
L2lndF9mYi5jCisrKyBiL2xpYi9pZ3RfZmIuYwpAQCAtMTkxMSw3ICsxOTExLDcgQEAgc3RhdGlj
IHZvaWQgKmlndF9mYl9jcmVhdGVfY2Fpcm9fc2hhZG93X2J1ZmZlcihpbnQgZmQsCiAJCWRybV9m
b3JtYXQsIExPQ0FMX0RSTV9GT1JNQVRfTU9EX05PTkUsCiAJCUlHVF9DT0xPUl9ZQ0JDUl9CVDcw
OSwgSUdUX0NPTE9SX1lDQkNSX0xJTUlURURfUkFOR0UpOwogCi0Jc2hhZG93LT5zdHJpZGVzWzBd
ID0gQUxJR04od2lkdGggKiBzaGFkb3ctPnBsYW5lX2JwcFswXSwgMTYpOworCXNoYWRvdy0+c3Ry
aWRlc1swXSA9IEFMSUdOKHdpZHRoICogKHNoYWRvdy0+cGxhbmVfYnBwWzBdIC8gOCksIDE2KTsK
IAlzaGFkb3ctPnNpemUgPSBBTElHTihzaGFkb3ctPnN0cmlkZXNbMF0gKiBoZWlnaHQsCiAJCQkg
ICAgIHN5c2NvbmYoX1NDX1BBR0VTSVpFKSk7CiAJcHRyID0gbW1hcChOVUxMLCBzaGFkb3ctPnNp
emUsIFBST1RfUkVBRCB8IFBST1RfV1JJVEUsCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaWd0LWRldg==
