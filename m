Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C72396EEFE
 for <igt-dev@lists.freedesktop.org>; Fri, 18 May 2018 20:44:03 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Fri, 18 May 2018 23:41:54 +0300
Message-Id: <20180518204154.21990-3-ville.syrjala@linux.intel.com>
In-Reply-To: <20180518204154.21990-1-ville.syrjala@linux.intel.com>
References: <20180518204154.21990-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/3] tests/kms_plane_scaling: Reduce the fb
 size 8x8 from 9x9
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClRo
ZSA5eDkgd2FzIG1heWJlIGEgd29ya2Fyb3VuZCBmb3IgdGhlIGtlcm5lbCdzIHJvdW5kaW5nIGJl
aGF2aW91cj8KVGhlIGtlcm5lbCB3YXMgY2hhbmdlZCBzbyB0aGF0J3Mgbm8gbG9uZ2VyIG5lY2Vz
c2FyeS4gU28gbGV0J3MgZ28KZm9yIDh4OCBzaW5jZSB0aGF0IGFjdHVhbGx5IHdvcmtzIHdpdGgg
WVVWIGZvcm1hdHMuCgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmph
bGFAbGludXguaW50ZWwuY29tPgotLS0KIHRlc3RzL2ttc19wbGFuZV9zY2FsaW5nLmMgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS90ZXN0cy9rbXNfcGxhbmVfc2NhbGluZy5jIGIvdGVzdHMva21zX3BsYW5lX3NjYWxpbmcu
YwppbmRleCBhMTJhM2EwYWRlMmIuLmFhZDJhMjA3OTVlNyAxMDA2NDQKLS0tIGEvdGVzdHMva21z
X3BsYW5lX3NjYWxpbmcuYworKysgYi90ZXN0cy9rbXNfcGxhbmVfc2NhbGluZy5jCkBAIC0xMzAs
NyArMTMwLDcgQEAgc3RhdGljIHZvaWQgY2hlY2tfc2NhbGluZ19waXBlX3BsYW5lX3JvdChkYXRh
X3QgKmQsIGlndF9wbGFuZV90ICpwbGFuZSwKIAltb2RlID0gaWd0X291dHB1dF9nZXRfbW9kZShv
dXRwdXQpOwogCiAJLyogY3JlYXRlIGJ1ZmZlciBpbiB0aGUgcmFuZ2Ugb2YgIG1pbiBhbmQgbWF4
IHNvdXJjZSBzaWRlIGxpbWl0LiovCi0Jd2lkdGggPSBoZWlnaHQgPSA5OworCXdpZHRoID0gaGVp
Z2h0ID0gODsKIAlpZiAocGl4ZWxfZm9ybWF0ID09IERSTV9GT1JNQVRfTlYxMikKIAkJd2lkdGgg
PSBoZWlnaHQgPSAxNjsKIAlpZ3RfY3JlYXRlX2NvbG9yX2ZiKGRpc3BsYXktPmRybV9mZCwgd2lk
dGgsIGhlaWdodCwKLS0gCjIuMTYuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
Z3QtZGV2Cg==
