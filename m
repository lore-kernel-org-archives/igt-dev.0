Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F606E2B1
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Mar 2019 12:39:33 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190307123724.4436-1-petri.latvala@intel.com>
References: <20190307112427.29146-2-petri.latvala@intel.com>
 <20190307123724.4436-1-petri.latvala@intel.com>
Message-ID: <155196235423.27405.1827185516146409760@skylake-alporthouse-com>
Date: Thu, 07 Mar 2019 12:39:14 +0000
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/5] lib/aux: Plug memory leak in
 get_suspend_test
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
To: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBQZXRyaSBMYXR2YWxhICgyMDE5LTAzLTA3IDEyOjM3OjI0KQo+IEZyZWUgdGVzdF9s
aW5lIGluIGFsbCBwYXRocyBvdXQgb2YgdGhlIGZ1bmN0aW9uLgo+IAo+IHYyOiBBdm9pZCBmcmVl
aW5nIHRvbyBzb29uIChDaHJpcykKPiAKPiBTaWduZWQtb2ZmLWJ5OiBQZXRyaSBMYXR2YWxhIDxw
ZXRyaS5sYXR2YWxhQGludGVsLmNvbT4KPiBDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13
aWxzb24uY28udWs+Cj4gLS0tCj4gIGxpYi9pZ3RfYXV4LmMgfCA1ICsrKy0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2xpYi9pZ3RfYXV4LmMgYi9saWIvaWd0X2F1eC5jCj4gaW5kZXggZTVkNDFlMzIuLjZlYWY1NDZl
IDEwMDY0NAo+IC0tLSBhL2xpYi9pZ3RfYXV4LmMKPiArKysgYi9saWIvaWd0X2F1eC5jCj4gQEAg
LTcxOCw4ICs3MTgsMTAgQEAgc3RhdGljIGVudW0gaWd0X3N1c3BlbmRfdGVzdCBnZXRfc3VzcGVu
ZF90ZXN0KGludCBwb3dlcl9kaXIpCj4gICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4g
ICAgICAgICAgICAgICAgIH0KPiAgCj4gLSAgICAgICBpZiAoIXRlc3RfbmFtZSkKPiArICAgICAg
IGlmICghdGVzdF9uYW1lKSB7Cj4gKyAgICAgICAgICAgICAgIGZyZWUodGVzdF9saW5lKTsKPiAg
ICAgICAgICAgICAgICAgcmV0dXJuIFNVU1BFTkRfVEVTVF9OT05FOwo+ICsgICAgICAgfQo+ICAK
PiAgICAgICAgIGZvciAodGVzdCA9IFNVU1BFTkRfVEVTVF9OT05FOyB0ZXN0IDwgU1VTUEVORF9U
RVNUX05VTTsgdGVzdCsrKQo+ICAgICAgICAgICAgICAgICBpZiAoc3RyY21wKHN1c3BlbmRfdGVz
dF9uYW1lW3Rlc3RdLCB0ZXN0X25hbWUpID09IDApCj4gQEAgLTcyOCw3ICs3MzAsNiBAQCBzdGF0
aWMgZW51bSBpZ3Rfc3VzcGVuZF90ZXN0IGdldF9zdXNwZW5kX3Rlc3QoaW50IHBvd2VyX2RpcikK
PiAgICAgICAgIGlndF9hc3NlcnQodGVzdCA8IFNVU1BFTkRfVEVTVF9OVU0pOwo+ICAKPiAgICAg
ICAgIGZyZWUodGVzdF9saW5lKTsKPiAtCj4gICAgICAgICByZXR1cm4gdGVzdDsKClJldmlld2Vk
LWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KLUNocmlzCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGlu
ZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
