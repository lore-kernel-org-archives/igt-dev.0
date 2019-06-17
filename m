Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4399789166
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jun 2019 07:26:42 +0000 (UTC)
References: <20190614105745.29648-1-simon.ser@intel.com>
From: Martin Peres <martin.peres@linux.intel.com>
Message-ID: <dd601731-fc61-c201-7801-bfcd1de37d99@linux.intel.com>
Date: Mon, 17 Jun 2019 10:26:37 +0300
MIME-Version: 1.0
In-Reply-To: <20190614105745.29648-1-simon.ser@intel.com>
Content-Language: en-PH
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_flip: improve logging when
 timing out
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
To: Simon Ser <simon.ser@intel.com>, igt-dev@lists.freedesktop.org
Cc: martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

T24gMTQvMDYvMjAxOSAxMzo1NywgU2ltb24gU2VyIHdyb3RlOgo+IFNpZ25lZC1vZmYtYnk6IFNp
bW9uIFNlciA8c2ltb24uc2VyQGludGVsLmNvbT4KPiBCdWd6aWxsYTogaHR0cHM6Ly9idWdzLmZy
ZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTA1MzYzCj4gLS0tCj4gIHRlc3RzL2ttc19m
bGlwLmMgfCA2ICsrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS90ZXN0cy9rbXNfZmxpcC5jIGIvdGVzdHMva21z
X2ZsaXAuYwo+IGluZGV4IDJhMTU4ZDk3YmJlYy4uMzAxNTgzNmMwMTg2IDEwMDc1NQo+IC0tLSBh
L3Rlc3RzL2ttc19mbGlwLmMKPiArKysgYi90ZXN0cy9rbXNfZmxpcC5jCj4gQEAgLTY4NiwxNCAr
Njg2LDE2IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgcnVuX3Rlc3Rfc3RlcChzdHJ1Y3QgdGVzdF9v
dXRwdXQgKm8pCj4gIAkgICAgIShvLT5wZW5kaW5nX2V2ZW50cyAmIEVWRU5UX1ZCTEFOSykgJiYg
by0+ZmxpcF9zdGF0ZS5jb3VudCA+IDApIHsKPiAgCQlzdHJ1Y3QgdmJsYW5rX3JlcGx5IHJlcGx5
Owo+ICAJCXVuc2lnbmVkIGludCBleHBfc2VxOwo+IC0JCXVuc2lnbmVkIGxvbmcgc3RhcnQ7Cj4g
KwkJdW5zaWduZWQgbG9uZyBzdGFydCwgZW5kOwo+IAo+ICAJCWV4cF9zZXEgPSBvLT5mbGlwX3N0
YXRlLmN1cnJlbnRfc2VxOwo+ICAJCXN0YXJ0ID0gZ2V0dGltZV91cygpOwo+ICAJCWRvX29yX2Rp
ZShfX3dhaXRfZm9yX3ZibGFuayhURVNUX1ZCTEFOS19BQlNPTFVURSB8Cj4gIAkJCQkJICAgIFRF
U1RfVkJMQU5LX0JMT0NLLCBvLT5waXBlLCBleHBfc2VxLAo+ICAJCQkJCSAgICAwLCAmcmVwbHkp
KTsKPiAtCQlpZ3RfYXNzZXJ0KGdldHRpbWVfdXMoKSAtIHN0YXJ0IDwgNTAwKTsKPiArCQllbmQg
PSBnZXR0aW1lX3VzKCk7Cj4gKwkJaWd0X2Fzc2VydF9mKGVuZCAtIHN0YXJ0IDwgNTAwLCAiV2Fp
dCB2YmxhbmsgdGltZWQgb3V0OiAlbHV1cyIsCj4gKwkJCSAgICAgZW5kIC0gc3RhcnQpOwoKVGhl
IG1lc3NhZ2UgaXMgbm90IHN1cGVyIGNsZWFyLiBIb3cgYWJvdXQ6CgoiVmJsYW5rIHdhaXQgdG9v
ayBsb25nZXIgdGhhbiBleHBlY3RlZDogJWx1dXMgdnMgJWx1dXNcbiIKCj4gIAkJaWd0X2Fzc2Vy
dF9lcShyZXBseS5zZXF1ZW5jZSwgZXhwX3NlcSk7Cj4gIAkJaWd0X2Fzc2VydCh0aW1lcmNtcCgm
cmVwbHkudHMsICZvLT5mbGlwX3N0YXRlLmxhc3RfdHMsID09KSk7Cj4gIAl9Cj4gLS0KPiAyLjIy
LjAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IGlndC1kZXYgbWFpbGluZyBsaXN0Cj4gaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYKPiAK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
