Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE68D6EB7F
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2020 15:06:22 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Wed, 15 Jul 2020 18:05:42 +0300
Message-Id: <20200715150542.30405-3-ville.syrjala@linux.intel.com>
In-Reply-To: <20200715150542.30405-1-ville.syrjala@linux.intel.com>
References: <20200715150542.30405-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/3] tests/kms_color_helper: Respect
 --skip-crc-compare
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClVu
bGlrZSBpZ3RfYXNzZXJ0X2NyY19lcXVhbCgpIGNyY19lcXVhbCgpIGRvZXMgbm90IHJlc3BlY3Qg
dGhlCi0tc2tpcC1jcmMtY29tcGFyZSBjb21tYW5kIGxpbmUgYXJndW1lbnQuIExldCdzIHJlbWVk
eSB0aGF0LgoKU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxp
bnV4LmludGVsLmNvbT4KLS0tCiB0ZXN0cy9rbXNfY29sb3JfaGVscGVyLmMgfCAzICsrLQogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L3Rlc3RzL2ttc19jb2xvcl9oZWxwZXIuYyBiL3Rlc3RzL2ttc19jb2xvcl9oZWxwZXIuYwppbmRl
eCAyNjA1MTQ2YWU2YzMuLmFjOGU4NDU0OGIzZiAxMDA2NDQKLS0tIGEvdGVzdHMva21zX2NvbG9y
X2hlbHBlci5jCisrKyBiL3Rlc3RzL2ttc19jb2xvcl9oZWxwZXIuYwpAQCAtMjQ3LDcgKzI0Nyw4
IEBAIGdldF9ibG9iKGRhdGFfdCAqZGF0YSwgaWd0X3BpcGVfdCAqcGlwZSwgZW51bSBpZ3RfYXRv
bWljX2NydGNfcHJvcGVydGllcyBwcm9wKQogCiBib29sIGNyY19lcXVhbChpZ3RfY3JjX3QgKmEs
IGlndF9jcmNfdCAqYikKIHsKLQlyZXR1cm4gbWVtY21wKGEtPmNyYywgYi0+Y3JjLCBzaXplb2Yo
YS0+Y3JjWzBdKSAqIGEtPm5fd29yZHMpID09IDA7CisJcmV0dXJuIGlndF9za2lwX2NyY19jb21w
YXJlIHx8CisJCW1lbWNtcChhLT5jcmMsIGItPmNyYywgc2l6ZW9mKGEtPmNyY1swXSkgKiBhLT5u
X3dvcmRzKSA9PSAwOwogfQogCiBpbnQKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9pZ3QtZGV2Cg==
