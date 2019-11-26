Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C7B6E1E0
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Nov 2019 01:14:54 +0000 (UTC)
References: <20191122011036.136424-1-don.hiatt@intel.com>
From: Sujaritha <sujaritha.sundaresan@intel.com>
Message-ID: <6aec8095-d8e4-212f-5ef7-0eb97a144f8c@intel.com>
Date: Mon, 25 Nov 2019 16:49:47 -0800
MIME-Version: 1.0
In-Reply-To: <20191122011036.136424-1-don.hiatt@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] lib/aux: Ensure swap space prior to
 suspend to disk
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
To: don.hiatt@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDExLzIxLzE5IDU6MTAgUE0sIGRvbi5oaWF0dEBpbnRlbC5jb20gd3JvdGU6Cj4gRnJvbTog
RG9uIEhpYXR0IDxkb24uaGlhdHRAaW50ZWwuY29tPgo+Cj4gU3VzcGVuZGluZyB0byBkaXNrIHJl
cXVpcmVzIHN3YXAgc3BhY2UsIG1ha2Ugc3VyZSBpdCBleGlzdHMKPiBiZWZvcmUgYXR0ZW1wdGlu
ZyB0byBzdXNwZW5kIHRvIGRpc2suCj4KPiB2MjogVXNlIGlndF9za2lwKCkgW1RoYW5rcywgQ2hy
aXMhXQo+IHYzOiBVc2UgaWd0X3NraXBfb25fZigpCj4KPiBDYzogU3VqYXJpdGhhIFN1bmRhcmVz
YW4gPHN1amFyaXRoYS5zdW5kYXJlc2FuQGludGVsLmNvbT4KPiBDYzogQ2hyaXMgV2lsc29uIDxj
aHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gU2lnbmVkLW9mZi1ieTogRG9uIEhpYXR0IDxkb24u
aGlhdHRAaW50ZWwuY29tPgo+IC0tLQo+ICAgbGliL2lndF9hdXguYyB8IDQgKysrKwo+ICAgMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3RfYXV4
LmMgYi9saWIvaWd0X2F1eC5jCj4gaW5kZXggNTc4Zjg1NzkzM2YwLi5hNmIxMTRlZDdlNjUgMTAw
NjQ0Cj4gLS0tIGEvbGliL2lndF9hdXguYwo+ICsrKyBiL2xpYi9pZ3RfYXV4LmMKPiBAQCAtODY0
LDYgKzg2NCwxMCBAQCB2b2lkIGlndF9zeXN0ZW1fc3VzcGVuZF9hdXRvcmVzdW1lKGVudW0gaWd0
X3N1c3BlbmRfc3RhdGUgc3RhdGUsCj4gICAJaWd0X3JlcXVpcmUodGVzdCA9PSBTVVNQRU5EX1RF
U1RfTk9ORSB8fAo+ICAgCQkgICAgZmFjY2Vzc2F0KHBvd2VyX2RpciwgInBtX3Rlc3QiLCBSX09L
IHwgV19PSywgMCkgPT0gMCk7Cj4gICAKPiArCWlndF9za2lwX29uX2Yoc3RhdGUgPT0gU1VTUEVO
RF9TVEFURV9ESVNLICYmCj4gKwkJICAgICAgIWludGVsX2dldF90b3RhbF9zd2FwX21iKCksCj4g
KwkJICAgICAgIlN1c3BlbmQgdG8gZGlzayByZXF1aXJlcyBzd2FwIHNwYWNlLlxuIik7Cj4gKwo+
ICAgCW9yaWdfdGVzdCA9IGdldF9zdXNwZW5kX3Rlc3QocG93ZXJfZGlyKTsKPiAgIAlzZXRfc3Vz
cGVuZF90ZXN0KHBvd2VyX2RpciwgdGVzdCk7Cj4gICAKCgpUaGlzIHNob3VsZCBoZWxwIGZpeCBw
YXJ0IG9mIHRoZSByZWFzb24gZm9yIHRoZSBzdXNwZW5kIHRlc3RzIGZhaWxpbmcgb24gQ0kuCgpS
ZXZpZXdlZC1ieSA6IFN1amFyaXRoYSBTdW5kYXJlc2FuIDxzdWphcml0aGEuc3VuZGFyZXNhbkBp
bnRlbC5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
