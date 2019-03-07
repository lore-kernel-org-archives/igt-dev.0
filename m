Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A9C6E2A9
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Mar 2019 12:09:44 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190307112427.29146-2-petri.latvala@intel.com>
References: <20190307112427.29146-1-petri.latvala@intel.com>
 <20190307112427.29146-2-petri.latvala@intel.com>
Message-ID: <155196056610.27405.4667014904169326192@skylake-alporthouse-com>
Date: Thu, 07 Mar 2019 12:09:26 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 2/5] lib/aux: Plug memory leak in
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

UXVvdGluZyBQZXRyaSBMYXR2YWxhICgyMDE5LTAzLTA3IDExOjI0OjI0KQo+IEZyZWUgdGVzdF9s
aW5lIGluIGFsbCBwYXRocyBvdXQgb2YgdGhlIGZ1bmN0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgo+IC0tLQo+ICBsaWIvaWd0
X2F1eC5jIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3RfYXV4LmMgYi9saWIvaWd0X2F1eC5j
Cj4gaW5kZXggZTVkNDFlMzIuLmY0OTM5YmI1IDEwMDY0NAo+IC0tLSBhL2xpYi9pZ3RfYXV4LmMK
PiArKysgYi9saWIvaWd0X2F1eC5jCj4gQEAgLTcxOCw2ICs3MTgsOCBAQCBzdGF0aWMgZW51bSBp
Z3Rfc3VzcGVuZF90ZXN0IGdldF9zdXNwZW5kX3Rlc3QoaW50IHBvd2VyX2RpcikKPiAgICAgICAg
ICAgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgICAgICAgICAgfQo+ICAKPiArICAgICAg
IGZyZWUodGVzdF9saW5lKTsKPiArCj4gICAgICAgICBpZiAoIXRlc3RfbmFtZSkKPiAgICAgICAg
ICAgICAgICAgcmV0dXJuIFNVU1BFTkRfVEVTVF9OT05FOwo+ICAKPiBAQCAtNzI3LDggKzcyOSw2
IEBAIHN0YXRpYyBlbnVtIGlndF9zdXNwZW5kX3Rlc3QgZ2V0X3N1c3BlbmRfdGVzdChpbnQgcG93
ZXJfZGlyKQo+ICAKPiAgICAgICAgIGlndF9hc3NlcnQodGVzdCA8IFNVU1BFTkRfVEVTVF9OVU0p
Owo+ICAKPiAtICAgICAgIGZyZWUodGVzdF9saW5lKTsKPiAtCgpSZXZpZXdlZC1ieTogQ2hyaXMg
V2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Ci1DaHJpcwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3Qt
ZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
