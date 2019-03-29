Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 780326E88D
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Mar 2019 09:42:50 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id h22so1447413edw.7
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Mar 2019 02:42:50 -0700 (PDT)
Date: Fri, 29 Mar 2019 10:42:46 +0100
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20190329094246.GJ2665@phenom.ffwll.local>
References: <20190328175727.3086-1-ville.syrjala@linux.intel.com>
 <20190328175727.3086-2-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190328175727.3086-2-ville.syrjala@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/4] tests/kms_plane: Reduce the plane
 size 64x64
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
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBNYXIgMjgsIDIwMTkgYXQgMDc6NTc6MjVQTSArMDIwMCwgVmlsbGUgU3lyamFsYSB3
cm90ZToKPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tPgo+IAo+IFJlZHVjZSB0aGUgcGxhbmUgc2l6ZSBmdXJ0aGVyIHRvIHNwZWVkIHVwIHRoZSB0
ZXN0LiA2NHg2NCBpcyB0aGUKPiB1bml2ZXJzYWwgaTkxNSBtaW5pbXVtIGN1cnNvciBzaXplIHNv
IHdlJ2xsIHVzZSB0aGF0LiBBbmQgc2luY2UKPiB3ZSBjaG9jZSB3aXNlbHkgd2UnbGwgbWFrZSBj
dXJzb3JzIHVzZSB0aGUgcmVkdWNlZCBzaXplIGFzIHdlbGwuCj4gCj4gU2lnbmVkLW9mZi1ieTog
VmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClJldmlld2Vk
LWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgoKPiAtLS0KPiAgdGVz
dHMva21zX3BsYW5lLmMgfCA2ICsrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS90ZXN0cy9rbXNfcGxhbmUuYyBi
L3Rlc3RzL2ttc19wbGFuZS5jCj4gaW5kZXggMTQzYmM1ZTZmM2I4Li40MDA3Yzg5NGY4N2EgMTAw
NjQ0Cj4gLS0tIGEvdGVzdHMva21zX3BsYW5lLmMKPiArKysgYi90ZXN0cy9rbXNfcGxhbmUuYwo+
IEBAIC00OTksMTIgKzQ5OSwxMiBAQCBzdGF0aWMgYm9vbCB0ZXN0X2Zvcm1hdF9wbGFuZShkYXRh
X3QgKmRhdGEsIGVudW0gcGlwZSBwaXBlLAo+ICAJCSBJR1RfRk9STUFUX0FSR1MoZm9ybWF0KSwK
PiAgCQkga21zdGVzdF9waXBlX25hbWUocGlwZSksIHBsYW5lLT5pbmRleCk7Cj4gIAo+IC0JaWYg
KHBsYW5lLT50eXBlICE9IERSTV9QTEFORV9UWVBFX0NVUlNPUiAmJiBkYXRhLT5kaXNwbGF5Lmlz
X2F0b21pYykgewo+ICsJaWYgKGRhdGEtPmRpc3BsYXkuaXNfYXRvbWljKSB7Cj4gIAkJc3RydWN0
IGlndF9mYiB0ZXN0X2ZiOwo+ICAJCWludCByZXQ7Cj4gIAo+IC0JCWlndF9jcmVhdGVfZmIoZGF0
YS0+ZHJtX2ZkLCAyNTYsIDI1NiwgZm9ybWF0LAo+IC0JCQkJICAgIExPQ0FMX0RSTV9GT1JNQVRf
TU9EX05PTkUsICZ0ZXN0X2ZiKTsKPiArCQlpZ3RfY3JlYXRlX2ZiKGRhdGEtPmRybV9mZCwgNjQs
IDY0LCBmb3JtYXQsCj4gKwkJCSAgICAgIExPQ0FMX0RSTV9GT1JNQVRfTU9EX05PTkUsICZ0ZXN0
X2ZiKTsKPiAgCj4gIAkJaWd0X3BsYW5lX3NldF9mYihwbGFuZSwgJnRlc3RfZmIpOwo+ICAKPiAt
LSAKPiAyLjE5LjIKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGlndC1kZXYgbWFpbGluZyBsaXN0Cj4gaWd0LWRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ln
dC1kZXYKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3Jh
dGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2lndC1kZXY=
