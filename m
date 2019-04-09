Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F117891FA
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Apr 2019 18:01:20 +0000 (UTC)
References: <20190327200331.28602-1-jose.souza@intel.com>
 <20190327200331.28602-8-jose.souza@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <d411e82d-a001-e91c-8e42-180d8b3b4516@linux.intel.com>
Date: Tue, 9 Apr 2019 20:01:11 +0200
MIME-Version: 1.0
In-Reply-To: <20190327200331.28602-8-jose.souza@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v2 8/8] tests/fbcon_fbt: Do not keep
 opening debugfs_fd at every setup_drm() call
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
To: =?UTF-8?Q?Jos=c3=a9_Roberto_de_Souza?= <jose.souza@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T3AgMjctMDMtMjAxOSBvbSAyMTowMyBzY2hyZWVmIEpvc8OpIFJvYmVydG8gZGUgU291emE6Cj4g
QXMgZGVidWdmc19mZCBpcyB1c2VkIGV2ZW4gYWZ0ZXIgdGhlIHRlYXJkb3duX2RybSgpIGNhbGws
IGl0IGRvIG5vdAo+IGNsb3NlcyBpdCBjYXVzaW5nIGl0IHRvIG9wZW4gYW5vdGhlciBkZWJ1Z2Zz
X2ZkIGF0IGV2ZXJ5IGNhbGwgdG8KPiBzZXR1cF9kcm0oKS4KPiBMZXQgbW92ZSB0aGUgb3Blbmlu
ZyBvZiBkZWJ1Z2ZzX2ZkIHRvIHNldHVwX2Vudmlyb25tZW50KCkgYW5kIG9ubHkKPiBvcGVuIGl0
IG9uY2UsIGFsc28gbGV0cyBjbG9zZSBpdCBiZWZvcmUgbGVhdmUgdGhlIHRlc3QuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4K
PiAtLS0KPiAgdGVzdHMva21zX2ZiY29uX2ZidC5jIHwgNCArKystCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS90ZXN0cy9r
bXNfZmJjb25fZmJ0LmMgYi90ZXN0cy9rbXNfZmJjb25fZmJ0LmMKPiBpbmRleCA2NmYyMTRjNS4u
ZjdmZjY3MWIgMTAwNjQ0Cj4gLS0tIGEvdGVzdHMva21zX2ZiY29uX2ZidC5jCj4gKysrIGIvdGVz
dHMva21zX2ZiY29uX2ZidC5jCj4gQEAgLTY0LDcgKzY0LDYgQEAgc3RhdGljIHZvaWQgc2V0dXBf
ZHJtKHN0cnVjdCBkcm1faW5mbyAqZHJtKQo+ICAJCXJldHVybjsKPiAgCj4gIAlkcm0tPmZkID0g
ZHJtX29wZW5fZHJpdmVyX21hc3RlcihEUklWRVJfSU5URUwpOwo+IC0JZHJtLT5kZWJ1Z2ZzX2Zk
ID0gaWd0X2RlYnVnZnNfZGlyKGRybS0+ZmQpOwo+ICAKPiAgCWRybS0+cmVzID0gZHJtTW9kZUdl
dFJlc291cmNlcyhkcm0tPmZkKTsKPiAgCWlndF9yZXF1aXJlKGRybS0+cmVzKTsKPiBAQCAtMjk1
LDYgKzI5NCw3IEBAIHN0YXRpYyB2b2lkIHNldHVwX2Vudmlyb25tZW50KHN0cnVjdCBkcm1faW5m
byAqZHJtKQo+ICAKPiAgCWRybV9mZCA9IGRybV9vcGVuX2RyaXZlcl9tYXN0ZXIoRFJJVkVSX0lO
VEVMKTsKPiAgCWlndF9yZXF1aXJlKGRybV9mZCA+PSAwKTsKPiArCWRybS0+ZGVidWdmc19mZCA9
IGlndF9kZWJ1Z2ZzX2Rpcihkcm1fZmQpOwo+ICAJaWd0X2Fzc2VydChjbG9zZShkcm1fZmQpID09
IDApOwo+ICAKPiAgCS8qCj4gQEAgLTMxMSw2ICszMTEsOCBAQCBzdGF0aWMgdm9pZCB0ZWFyZG93
bl9lbnZpcm9ubWVudChzdHJ1Y3QgZHJtX2luZm8gKmRybSkKPiAgewo+ICAJaWYgKGRybS0+ZmQg
Pj0gMCkKPiAgCQl0ZWFyZG93bl9kcm0oZHJtKTsKPiArCj4gKwljbG9zZShkcm0tPmRlYnVnZnNf
ZmQpOwo+ICB9Cj4gIAo+ICBpZ3RfbWFpbgoKRm9yIHdob2xlIHNlcmllcywgd2hlbiBtZXJnaW5n
IHBhdGNoIDQvOCBhbmQgNS84LCBwb3NzaWJseSB3aXRoIDMvODoKClJldmlld2VkLWJ5OiBNYWFy
dGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5n
IGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
