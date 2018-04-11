Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C1EE6E119
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Apr 2018 02:37:59 +0000 (UTC)
From: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Date: Tue, 10 Apr 2018 19:37:17 -0700
Message-Id: <20180411023732.32362-5-dhinakaran.pandiyan@intel.com>
In-Reply-To: <20180411023732.32362-1-dhinakaran.pandiyan@intel.com>
References: <20180411023732.32362-1-dhinakaran.pandiyan@intel.com>
Subject: [igt-dev] [PATCH i-g-t 05/20] tests/psr: Assert sink CRC length and
 make use of igt_sysfs_read()
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
Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>, rodrigo.vivi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

SW5jbHVkZSBtaW5vciBmb21hdHRpbmcgY2hhbmdlIHRvby4KU2lnbmVkLW9mZi1ieTogRGhpbmFr
YXJhbiBQYW5kaXlhbiA8ZGhpbmFrYXJhbi5wYW5kaXlhbkBpbnRlbC5jb20+Ci0tLQogdGVzdHMv
a21zX3Bzcl9zaW5rX2NyYy5jIHwgOSArKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMva21zX3Bzcl9zaW5r
X2NyYy5jIGIvdGVzdHMva21zX3Bzcl9zaW5rX2NyYy5jCmluZGV4IDM1YzdiODQ1Li5hZjYzZTY4
OSAxMDA2NDQKLS0tIGEvdGVzdHMva21zX3Bzcl9zaW5rX2NyYy5jCisrKyBiL3Rlc3RzL2ttc19w
c3Jfc2lua19jcmMuYwpAQCAtMjMwLDE0ICsyMzAsMTMgQEAgc3RhdGljIHZvaWQgZ2V0X3Npbmtf
Y3JjKGRhdGFfdCAqZGF0YSwgY2hhciAqY3JjKQogCWlmIChpZ3RfaW50ZXJhY3RpdmVfZGVidWcp
CiAJCXJldHVybjsKIAotCWlndF9yZXF1aXJlX2YoaWd0X3N5c2ZzX3NjYW5mKGRhdGEtPmRlYnVn
ZnNfZmQsICJpOTE1X3NpbmtfY3JjX2VEUDEiLAotCQkJCSAgICAgICIlc1xuIiwgY3JjKSwKKwlp
Z3RfcmVxdWlyZV9mKGlndF9zeXNmc19yZWFkKGRhdGEtPmRlYnVnZnNfZmQsICJpOTE1X3Npbmtf
Y3JjX2VEUDEiLAorCQkJCSAgICAgY3JjLCBDUkNfTEVOKSA9PSBDUkNfTEVOLAogCQkgICAgICAi
U2luayBDUkMgaXMgdW5yZWxpYWJsZSBvbiB0aGlzIG1hY2hpbmUuIFRyeSBtYW51YWwgZGVidWcg
d2l0aCAtLWludGVyYWN0aXZlLWRlYnVnPW5vLWNyY1xuIik7Ci0KLQlpZ3RfZGVidWcoIiVzXG4i
LCBjcmMpOworCWlndF9kZWJ1Zygic2luayBDUkM6ICUuKnNcbiIsIENSQ19MRU4sIGNyYyk7CiAK
IAkvKiBCbGFjayBzY3JlZW4gaXMgYWx3YXlzIGludmFsaWQgKi8KLQlpZ3RfYXNzZXJ0KHN0cm5j
bXAoY3JjLCBDUkNfQkxBQ0ssIENSQ19MRU4pICE9IDApOworCWlndF9hc3NlcnQoc3RybmNtcChj
cmMsIENSQ19CTEFDSywgQ1JDX0xFTikpOwogfQogCiBzdGF0aWMgYm9vbCBpc19ncmVlbihjaGFy
ICpjcmMpCi0tIAoyLjE0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRl
dgo=
