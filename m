Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B9C9897C8
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2019 15:06:58 +0000 (UTC)
References: <20190410113205.3486-1-stanislav.lisovskiy@intel.com>
 <20190410113205.3486-4-stanislav.lisovskiy@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <a1ad3421-2d3e-2a35-45a9-4a23ff8aad57@linux.intel.com>
Date: Wed, 10 Apr 2019 17:06:53 +0200
MIME-Version: 1.0
In-Reply-To: <20190410113205.3486-4-stanislav.lisovskiy@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v9 3/3] igt/tests/kms_atomic_transition:
 Tolerate if can't have all planes
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
To: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, igt-dev@lists.freedesktop.org
Cc: ville.syrjala@intel.com, martin.peres@intel.com, juha-pekka.heikkila@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

T3AgMTAtMDQtMjAxOSBvbSAxMzozMiBzY2hyZWVmIFN0YW5pc2xhdiBMaXNvdnNraXk6Cj4gV2l0
aCBzb21lIHVwY29taW5nIGNoYW5nZXMgaTkxNSBtaWdodCBub3QgYWxsb3cKPiBhbGwgc3ByaXRl
IHBsYW5lcyBlbmFibGVkLCBkZXBlbmRpbmcgb24gYXZhaWxhYmxlCj4gYmFuZHdpZHRoIGxpbWl0
YXRpb24uIFRodXMgdGhlIHRlc3QgbmVlZCB0byBkZWNyZW1lbnQKPiBhbW91bnQgb2YgcGxhbmVz
IGFuZCB0cnkgYWdhaW4sIGluc3RlYWQgb2YgcGFuaWNraW5nLgo+Cj4gdjI6IFJlbW92ZWQgZXhj
ZXNzaXZlIG5lc3RlZCBjb25kaXRpb25zLCBtYWtpbmcgY29kZSBhIGJpdAo+ICAgICBtb3JlIHJl
YWRhYmxlKGhvcGVmdWxseSkuCj4KPiB2MzogU3RvcHBlZCB1c2luZyBnbG9iYWwgbl9wbGFuZXMg
dmFyaWFibGUgYXMgaXQgbWlnaHQgY2F1c2UKPiAgICAgcmVzb3VyY2VzIGJlaW5nIHVucmVsZWFz
ZWQuCj4gICAgIFVzaW5nIG5vdyBwYXJtc1tpXS5tYXNrIGFzIGEgd2F5IHRvIGRldGVybWluZSBp
ZiBwbGFuZQo+ICAgICBoYXMgdG8gYmUgaW5jbHVkZWQgaW50byBjb21taXQuCj4KPiB2NDogUmVt
b3ZlZCB1bm5lZWRlZCBuX292ZXJsYXlzIGluaXRpYWxpemF0aW9uLgo+Cj4gdjU6IFJhbmRvbWl6
ZSB3aGljaCBvZiBzcHJpdGUgcGxhbmVzIHRvIHJlbW92ZSBpZiBoaXR0aW5nCj4gICAgIHJlc291
cmNlIGxpbWl0cy4KPgo+IHY2OiBSZXBsYWNlIGlndF93YXJuIHdpdGggaWd0X2luZm8sIHRvIG1h
a2UgSUdUIHRlc3RzIGhhcHBpZXIuCj4KPiB2NzogUmVtb3ZlZCB1bm5lZWRlZCByZXRyeSBsb2dp
YywgbWFkZSBwbGFuZSByYW5kb20gcmVtb3ZhbCBzaW1wbGllci4KPiAgICAgR3JlYXQgdGhhbmtz
IHRvIE1hYXJ0ZW4gTGFua2hvcnN0IGZvciBzdWdnZXN0aW9ucy4KPgo+IHY4OiBGYWlsIGlmIHdl
IGhhdmUgbGVzcyB0aGFuIDMgcGxhbmVzCj4KPiB2OTogUmVtb3ZlIHVubmVlZGVkIGRpZmZzCj4K
PiBTaWduZWQtb2ZmLWJ5OiBTdGFuaXNsYXYgTGlzb3Zza2l5IDxzdGFuaXNsYXYubGlzb3Zza2l5
QGludGVsLmNvbT4KPiAtLS0KPiAgdGVzdHMva21zX2F0b21pY190cmFuc2l0aW9uLmMgfCA3OCAr
KysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNDcg
aW5zZXJ0aW9ucygrKSwgMzEgZGVsZXRpb25zKC0pCgpBc3N1bWluZyBDSSBpcyBoYXBweToKClJl
dmlld2VkLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50
ZWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
aWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
