Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 584FA6E95E
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Jan 2021 21:38:09 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id m22so4657869lfg.5
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Jan 2021 13:38:09 -0800 (PST)
References: <20210111161658.3476-1-ville.syrjala@linux.intel.com>
From: =?UTF-8?Q?Juha-Pekka_Heikkil=c3=a4?= <juhapekka.heikkila@gmail.com>
Message-ID: <0f1bc159-e48e-d372-c200-de36c4814afe@gmail.com>
Date: Thu, 21 Jan 2021 23:38:05 +0200
MIME-Version: 1.0
In-Reply-To: <20210111161658.3476-1-ville.syrjala@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_async_flips: Skip the Y<->X
 tile test on pre-skl
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEp1aGEtUGVra2EgSGVpa2tpbGEgPGp1aGFwZWtrYS5oZWlra2lsYUBnbWFp
bC5jb20+CgpWaWxsZSBTeXJqYWxhIGtpcmpvaXR0aSAxMS4xLjIwMjEga2xvIDE4LjE2Ogo+IEZy
b206IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gCj4g
UHJlLXNrbCBkaXNwbGF5IGVuZ2luZSBkb2VzIG5vdCBzdXBwb3J0IFktdGlsaW5nIHNvIHRoZQo+
IGFkZGZiIHdpbGwgZmFpbC4gU2tpcCB0aGUgdGVzdCBvbiBzdWNoIHBsYXRmb3Jtcy4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tPgo+IC0tLQo+ICAgdGVzdHMva21zX2FzeW5jX2ZsaXBzLmMgfCAzICsrKwo+ICAgMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS90ZXN0cy9rbXNfYXN5
bmNfZmxpcHMuYyBiL3Rlc3RzL2ttc19hc3luY19mbGlwcy5jCj4gaW5kZXggZGVhMjNjZjllZjE1
Li5lMzk3YTU0Yjg3NGYgMTAwNjQ0Cj4gLS0tIGEvdGVzdHMva21zX2FzeW5jX2ZsaXBzLmMKPiAr
KysgYi90ZXN0cy9rbXNfYXN5bmNfZmxpcHMuYwo+IEBAIC0zMzUsNiArMzM1LDkgQEAgc3RhdGlj
IHZvaWQgdGVzdF9pbnZhbGlkKGRhdGFfdCAqZGF0YSkKPiAgIAl3aWR0aCA9IGRhdGEtPmNvbm5l
Y3Rvci0+bW9kZXNbMF0uaGRpc3BsYXk7Cj4gICAJaGVpZ2h0ID0gZGF0YS0+Y29ubmVjdG9yLT5t
b2Rlc1swXS52ZGlzcGxheTsKPiAgIAo+ICsJaWd0X3JlcXVpcmUoaWd0X2Rpc3BsYXlfaGFzX2Zv
cm1hdF9tb2QoJmRhdGEtPmRpc3BsYXksIERSTV9GT1JNQVRfWFJHQjg4ODgsCj4gKwkJCQkJICAg
ICAgIExPQ0FMX0k5MTVfRk9STUFUX01PRF9ZX1RJTEVEKSk7Cj4gKwo+ICAgCWlndF9jcmVhdGVf
ZmIoZGF0YS0+ZHJtX2ZkLCB3aWR0aCwgaGVpZ2h0LCBEUk1fRk9STUFUX1hSR0I4ODg4LAo+ICAg
CQkgICAgICBMT0NBTF9JOTE1X0ZPUk1BVF9NT0RfWV9USUxFRCwgJmZiKTsKPiAgIAo+IApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxp
bmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
