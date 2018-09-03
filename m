Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E476E1C9
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Sep 2018 09:51:28 +0000 (UTC)
Date: Mon, 3 Sep 2018 12:51:26 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20180903095126.y2atoptysrxwhxbh@platvala-desk.ger.corp.intel.com>
References: <20180903094629.27262-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180903094629.27262-1-chris@chris-wilson.co.uk>
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Fix strcmp() direction for bsearch.
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCBTZXAgMDMsIDIwMTggYXQgMTA6NDY6MjlBTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IEkgZmx1a2VkIG91dCBhcyB2Z2VtIHdhcyB0aGUgaW5pdGlhbCBtaWQgdmFsdWUsIGhp
ZGRpbmcgdGhlIHdvcnN0IG9mIHRoZQo+IGVycm9ycyBhcyBpOTE1IG1hdGNoZWQgd2l0aCBEUklW
RVJfQU5ZLgo+IAo+IEZpeGVzOiAyMDA4N2JmMjI2OTggKCJsaWI6IFVzZSBhIGJzZWFyY2ggdG8g
ZmluZCB0aGUgbW9kdWxlIG5hbWUiKQo+IFJlcG9ydGVkLWJ5OiBQZXRyaSBMYXR2YWxhIDxwZXRy
aS5sYXR2YWxhQGludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlz
QGNocmlzLXdpbHNvbi5jby51az4KPiBDYzogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBp
bnRlbC5jb20+CgoKUmV2aWV3ZWQtYnk6IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50
ZWwuY29tPgoKCk9uZSBtb3JlIGx1cmtpbmcgYnVnIGlzIHRoYXQgaWYgdGhlcmUncyBhIGRybSBk
ZXZpY2UgdGhhdCdzIG5vdApyZWNvZ25pemVkLCBpdHMgZmQgaXMgc2lsZW50bHkganVzdCByZXR1
cm5lZCBldmVuIGlmIHRoZSB0ZXN0CnJlcXVlc3RlZCBEUklWRVJfU09NRVRISU5HX1NQRUNJRklD
LgoKCgo+IC0tLQo+ICBsaWIvZHJtdGVzdC5jIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2xpYi9kcm10
ZXN0LmMgYi9saWIvZHJtdGVzdC5jCj4gaW5kZXggYmZiMzhmMWU5Li5hZGZmMWE4MWYgMTAwNjQ0
Cj4gLS0tIGEvbGliL2RybXRlc3QuYwo+ICsrKyBiL2xpYi9kcm10ZXN0LmMKPiBAQCAtMjI2LDkg
KzIyNiw5IEBAIHN0YXRpYyBpbnQgb3Blbl9kZXZpY2UoY29uc3QgY2hhciAqbmFtZSwgdW5zaWdu
ZWQgaW50IGNoaXBzZXQpCj4gIAkJaW50IG1pZCA9IHN0YXJ0ICsgKGVuZCAtIHN0YXJ0KSAvIDI7
Cj4gIAkJaW50IHJldCA9IHN0cmNtcChtb2R1bGVzW21pZF0ubW9kdWxlLCBkZXZfbmFtZSk7Cj4g
IAkJaWYgKHJldCA8IDApIHsKPiAtCQkJZW5kID0gbWlkOwo+IC0JCX0gZWxzZSBpZiAocmV0ID4g
MCkgewo+ICAJCQlzdGFydCA9IG1pZCArIDE7Cj4gKwkJfSBlbHNlIGlmIChyZXQgPiAwKSB7Cj4g
KwkJCWVuZCA9IG1pZDsKPiAgCQl9IGVsc2Ugewo+ICAJCQljaGlwID0gbW9kdWxlc1ttaWRdLmJp
dDsKPiAgCQkJYnJlYWs7Cj4gLS0gCj4gMi4xOS4wLnJjMQo+IApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2lndC1kZXYK
