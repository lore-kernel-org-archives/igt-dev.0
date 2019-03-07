Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B4E6E2A8
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Mar 2019 12:10:43 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <155196056610.27405.4667014904169326192@skylake-alporthouse-com>
References: <20190307112427.29146-1-petri.latvala@intel.com>
 <20190307112427.29146-2-petri.latvala@intel.com>
 <155196056610.27405.4667014904169326192@skylake-alporthouse-com>
Message-ID: <155196063705.27405.527242233600966377@skylake-alporthouse-com>
Date: Thu, 07 Mar 2019 12:10:37 +0000
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

UXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMTktMDMtMDcgMTI6MDk6MjYpCj4gUXVvdGluZyBQZXRy
aSBMYXR2YWxhICgyMDE5LTAzLTA3IDExOjI0OjI0KQo+ID4gRnJlZSB0ZXN0X2xpbmUgaW4gYWxs
IHBhdGhzIG91dCBvZiB0aGUgZnVuY3Rpb24uCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFBldHJp
IExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgo+ID4gLS0tCj4gPiAgbGliL2lndF9h
dXguYyB8IDQgKystLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9saWIvaWd0X2F1eC5jIGIvbGliL2lndF9h
dXguYwo+ID4gaW5kZXggZTVkNDFlMzIuLmY0OTM5YmI1IDEwMDY0NAo+ID4gLS0tIGEvbGliL2ln
dF9hdXguYwo+ID4gKysrIGIvbGliL2lndF9hdXguYwo+ID4gQEAgLTcxOCw2ICs3MTgsOCBAQCBz
dGF0aWMgZW51bSBpZ3Rfc3VzcGVuZF90ZXN0IGdldF9zdXNwZW5kX3Rlc3QoaW50IHBvd2VyX2Rp
cikKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gICAgICAgICAgICAgICAg
IH0KPiA+ICAKPiA+ICsgICAgICAgZnJlZSh0ZXN0X2xpbmUpOwo+ID4gKwo+ID4gICAgICAgICBp
ZiAoIXRlc3RfbmFtZSkKPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gU1VTUEVORF9URVNUX05P
TkU7Cj4gPiAgCj4gPiBAQCAtNzI3LDggKzcyOSw2IEBAIHN0YXRpYyBlbnVtIGlndF9zdXNwZW5k
X3Rlc3QgZ2V0X3N1c3BlbmRfdGVzdChpbnQgcG93ZXJfZGlyKQo+ID4gIAo+ID4gICAgICAgICBp
Z3RfYXNzZXJ0KHRlc3QgPCBTVVNQRU5EX1RFU1RfTlVNKTsKPiA+ICAKPiA+IC0gICAgICAgZnJl
ZSh0ZXN0X2xpbmUpOwo+ID4gLQo+IAo+IFJldmlld2VkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlz
QGNocmlzLXdpbHNvbi5jby51az4KClNjcmF0Y2ggdGhhdCwgdGVzdF9uYW1lIHBvaW50cyBpbnRv
IHRlc3RfbGluZSBhbmQgaXMgdXNlZCBpbiB0aGUgc2Vjb25kCmxvb3AuCi1DaHJpcwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcg
bGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
