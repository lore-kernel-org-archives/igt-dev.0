Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE886E020
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Sep 2018 01:05:06 +0000 (UTC)
Message-ID: <a0246a2f9513540780e478be4e40ed3667a8e1fb.camel@intel.com>
From: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Date: Tue, 04 Sep 2018 18:04:54 -0700
In-Reply-To: <20180901041806.2627-2-rodrigo.vivi@intel.com>
References: <20180901041806.2627-1-rodrigo.vivi@intel.com>
 <20180901041806.2627-2-rodrigo.vivi@intel.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/6] tools/dpcd_reg: Improve outputs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: dhinakaran.pandiyan@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, igt-dev@lists.freedesktop.org, Tarun Vyas <tarun.vyas@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCAyMDE4LTA4LTMxIGF0IDIxOjE4IC0wNzAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6Cj4g
QmVmb3JlOgo+IAo+ICQgZHBjZF9yZWcgcmVhZCAtLWRldmljZT0wIC0tb2Zmc2V0PTAyMDAgLS1j
b3VudCA4Cj4gUmVhZCA4IGJ5dGUocykgc3RhcnRpbmcgYXQgb2Zmc2V0IDIwMAo+IAo+IDQxCj4g
MAo+IDAKPiAwCj4gODAKPiAwCj4gNjYKPiA2Ngo+IAo+IEFmdGVyOgo+ICQgZHBjZF9yZWcgcmVh
ZCAtLWRldmljZT0wIC0tb2Zmc2V0PTAyMDAgLS1jb3VudCA4Cj4gMDIwMDogNDEgMDAgMDAgMDAg
ODAgMDAgNjYgNjYKPiAKPiBCZXNpZGVzIHRoZSBjbGVhbiB2aWV3IHRoaXMgd2lsbCBhbGxvdyB1
cyB0byBpbnRlZ3JhdGUKPiB0aGUgZHVtcCBhbmQgbXVsdGlwbGUgcmVhZHMuCj4gCj4gQ2M6IFRh
cnVuIFZ5YXMgPHRhcnVuLnZ5YXNAaW50ZWwuY29tPgo+IENjOiBEaGluYWthcmFuIFBhbmRpeWFu
IDxkaGluYWthcmFuLnBhbmRpeWFuQGludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBSb2RyaWdv
IFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+Cj4gLS0tCj4gIHRvb2xzL2RwY2RfcmVnLmMg
fCA1ICsrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2RwY2RfcmVnLmMgYi90b29scy9kcGNkX3JlZy5j
Cj4gaW5kZXggMzlkZGUyYzkuLmQxMzkwMDdjIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL2RwY2RfcmVn
LmMKPiArKysgYi90b29scy9kcGNkX3JlZy5jCj4gQEAgLTc1LDkgKzc1LDEwIEBAIHN0YXRpYyBp
bnQgZHBjZF9yZWFkKGNoYXIgKmRldmljZSwgY29uc3QgdWludDMyX3QKPiBvZmZzZXQsIHNpemVf
dCBjb3VudCkKPiAgCQkJZ290byBvdXQ7Cj4gIAkJfQo+ICAKPiAtCQlpZ3RfaW5mbygiUmVhZCAl
enUgYnl0ZShzKSBzdGFydGluZyBhdCBvZmZzZXQKPiAleFxuXG4iLCBjb3VudCwgb2Zmc2V0KTsK
PiArCQlpZ3RfaW5mbygiJTA0eDoiLCBvZmZzZXQpOwo+ICAJCWZvciAoaSA9IDA7IGkgPCBjb3Vu
dDsgaSsrKQo+IC0JCQlpZ3RfaW5mbygiJXhcbiIsICooKCh1aW50OF90ICopKGJ1ZikpICsgaSkp
Owo+ICsJCQlpZ3RfaW5mbygiICUwMngiLCAqKCgodWludDhfdCAqKShidWYpKSArIAoKSSBhbSBl
eHBlY3RpbmcgaWd0X2luZm8oKSBpbiBQYXRjaCAxLzYgdG8gZ28gd2F5LCBidXQgdGhpcyBsb29r
cwpiZXR0ZXIuIFBsZWFzZSBtYWtlIGl0IG9idmlvdXMgdGhhdCB0aGUgdmFsdWVzIGFyZSBpbiBo
ZXggYnkgcHJlZml4aW5nCiIweCIuIFNhbWUgd2l0aCB0aGUgb2Zmc2V0IHRvby4KCj4gaSkpOwo+
ICsJCWlndF9pbmZvKCJcbiIpOwo+ICAJfQo+ICAJZWxzZSB7Cj4gIAkJaWd0X3dhcm4oIkZhaWxl
ZCB0byBvcGVuICVzIGF1eCBkZXZpY2UgLSBlcnJvcjoKPiAlc1xuIiwgZGV2aWNlLCBzdHJlcnJv
cihlcnJubykpOwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
