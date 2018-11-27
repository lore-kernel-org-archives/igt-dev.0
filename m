Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 965206E0B0
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Nov 2018 09:41:14 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20181127093232.GG17124@platvala-desk.ger.corp.intel.com>
References: <20181126213744.32050-1-chris@chris-wilson.co.uk>
 <20181127093232.GG17124@platvala-desk.ger.corp.intel.com>
Message-ID: <154331166984.11623.5380814700021081411@skylake-alporthouse-com>
Date: Tue, 27 Nov 2018 09:41:09 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] runner: Be patient for processes to die
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBQZXRyaSBMYXR2YWxhICgyMDE4LTExLTI3IDA5OjMyOjMyKQo+IE9uIE1vbiwgTm92
IDI2LCAyMDE4IGF0IDA5OjM3OjQ0UE0gKzAwMDAsIENocmlzIFdpbHNvbiB3cm90ZToKPiA+IFNv
bWUgbWFjaGluZXMgYXJlIHZlcnkgc2xvdyBhbmQgc29tZSBwcm9jZXNzZXMgaG9nIGEgbG90IG9m
IHJlc291cmNlcwo+ID4gYW5kIHNvIHRha2UgbXVjaCBsb25nZXIgdGhhbiBhIG1lcmUgMnMgdG8g
YmUgdGVybWluYXRlZC4gQmUgcGF0aWVudC4KPiA+IAo+ID4gQnVnemlsbGE6IGh0dHBzOi8vYnVn
cy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTEwODA3Mwo+ID4gU2lnbmVkLW9mZi1i
eTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gPiAtLS0KPiA+ICBy
dW5uZXIvZXhlY3V0b3IuYyB8IDQ0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0t
LS0tLS0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDE0IGRlbGV0
aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvcnVubmVyL2V4ZWN1dG9yLmMgYi9ydW5uZXIv
ZXhlY3V0b3IuYwo+ID4gaW5kZXggMjAzOGMzZmRhLi45Mjc2OTYwNDQgMTAwNjQ0Cj4gPiAtLS0g
YS9ydW5uZXIvZXhlY3V0b3IuYwo+ID4gKysrIGIvcnVubmVyL2V4ZWN1dG9yLmMKPiA+IEBAIC0x
MzcsMjcgKzEzNywzNiBAQCBzdGF0aWMgY2hhciAqaGFuZGxlX2xvY2tkZXAodm9pZCkKPiA+ICAg
ICAgIHJldHVybiBOVUxMOwo+ID4gIH0KPiA+ICAKPiA+IC1zdGF0aWMgY2hhciAqaGFuZGxlX3Rh
aW50KHZvaWQpCj4gPiArCj4gPiArc3RhdGljIHVuc2lnbmVkIGxvbmcgdGFpbnRlZCh1bnNpZ25l
ZCBsb25nICp0YWludHMpCj4gCj4gCj4gQW4gZXh0cmEgbmV3bGluZSBzbGlwcGVkIGluIGhlcmUu
Cj4gCj4gCj4gUmV2aWV3ZWQtYnk6IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwu
Y29tPgoKRmluZ2VycyBjcm9zc2VkIHNpbmNlIENJIHNraXBwZWQgc2tsLXNoYXJkcy4uLgotQ2hy
aXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRl
diBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
