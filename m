Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1451A6EAB2
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Apr 2018 20:38:08 +0000 (UTC)
References: <20180427200123.22903-1-paulo.r.zanoni@intel.com>
 <20180427200123.22903-3-paulo.r.zanoni@intel.com>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <a1abc5ba-4951-79e7-d29e-7f9ba59fdd3f@intel.com>
Date: Fri, 27 Apr 2018 13:38:06 -0700
MIME-Version: 1.0
In-Reply-To: <20180427200123.22903-3-paulo.r.zanoni@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH igt 3/3] lib/instdone.c: Add Gen11 Support
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
To: Paulo Zanoni <paulo.r.zanoni@intel.com>, igt-dev@lists.freedesktop.org
Cc: Javier Villavicencio <javier.villavicencio@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

CgpPbiAyNy8wNC8xOCAxMzowMSwgUGF1bG8gWmFub25pIHdyb3RlOgo+IEZyb206IEphdmllciBW
aWxsYXZpY2VuY2lvIDxqYXZpZXIudmlsbGF2aWNlbmNpb0BpbnRlbC5jb20+Cj4gCj4gQnNwZWM6
IDExNDMxCj4gCj4gU2lnbmVkLW9mZi1ieTogSmF2aWVyIFZpbGxhdmljZW5jaW8gPGphdmllci52
aWxsYXZpY2VuY2lvQGludGVsLmNvbT4KCkZvciB0aGUgd2hvbGUgc2VyaWVzOgoKQWNrZWQtYnk6
IEFudG9uaW8gQXJnZW56aWFubyA8YW50b25pby5hcmdlbnppYW5vQGludGVsLmNvbT4KCj4gLS0t
Cj4gICBsaWIvaW5zdGRvbmUuYyB8IDEyICsrKysrKysrKysrLQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDExIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvbGliL2lu
c3Rkb25lLmMgYi9saWIvaW5zdGRvbmUuYwo+IGluZGV4IDUxMGZjZTY0Li5hODNmODgzNiAxMDA2
NDQKPiAtLS0gYS9saWIvaW5zdGRvbmUuYwo+ICsrKyBiL2xpYi9pbnN0ZG9uZS5jCj4gQEAgLTQx
NywxMCArNDE3LDIwIEBAIGluaXRfZ2VuOF9pbnN0ZG9uZSh2b2lkKQo+ICAgCWluaXRfZ2VuNzVf
aW5zdGRvbmUoKTsKPiAgIH0KPiAgIAo+ICtzdGF0aWMgdm9pZAo+ICtpbml0X2dlbjExX2luc3Rk
b25lKHZvaWQpCj4gK3sKPiArCWdlbjZfaW5zdGRvbmUxX2JpdCgxIDw8IDI0LCAiVFNHMSIpOwo+
ICsJZ2VuNl9pbnN0ZG9uZTFfYml0KDEgPDwgMTEsICJUREcxIik7Cj4gKwlpbml0X2dlbjhfaW5z
dGRvbmUoKTsKPiArfQo+ICsKPiAgIGJvb2wKPiAgIGluaXRfaW5zdGRvbmVfZGVmaW5pdGlvbnMo
dWludDMyX3QgZGV2aWQpCj4gICB7Cj4gLQlpZiAoSVNfR0VOOChkZXZpZCkgfHwgSVNfR0VOOShk
ZXZpZCkgfHwgSVNfR0VOMTAoZGV2aWQpKSB7Cj4gKwlpZiAoSVNfR0VOMTEoZGV2aWQpKSB7Cj4g
KwkJaW5pdF9nZW4xMV9pbnN0ZG9uZSgpOwo+ICsJfSBlbHNlIGlmIChJU19HRU44KGRldmlkKSB8
fCBJU19HRU45KGRldmlkKSB8fCBJU19HRU4xMChkZXZpZCkpIHsKPiAgIAkJaW5pdF9nZW44X2lu
c3Rkb25lKCk7Cj4gICAJfSBlbHNlIGlmIChJU19HRU43KGRldmlkKSkgewo+ICAgCQlpbml0X2dl
bjdfaW5zdGRvbmUoKTsKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
Cg==
