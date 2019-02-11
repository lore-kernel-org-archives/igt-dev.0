Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB0686E572
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Feb 2019 18:08:39 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190211180208.29406-5-daniel.vetter@ffwll.ch>
References: <20190211180208.29406-1-daniel.vetter@ffwll.ch>
 <20190211180208.29406-5-daniel.vetter@ffwll.ch>
Message-ID: <154990851347.15715.5227874488167475134@skylake-alporthouse-com>
Date: Mon, 11 Feb 2019 18:08:33 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 5/9] tests/i915_missed_irq: Don't leave
 the hang detector hanging
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
To: Daniel Vetter <daniel.vetter@ffwll.ch>, IGT development <igt-dev@lists.freedesktop.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBEYW5pZWwgVmV0dGVyICgyMDE5LTAyLTExIDE4OjAyOjA0KQo+IFNwb3R0ZWQgYnkg
bXkgbmV3ICJhcmUgdGhlcmUgYW55IGNoaWxkIHByb2Nlc3NlcyBsZWZ0PyIgY2hlY2sgaW4KPiBp
Z3RfZXhpdCAtIHdlIG5lZWQgdG8gcHV0IGFsbCB0aGUgaWd0X3JlcXVpcmUgYmVmb3JlIHdlIHN0
YXJ0IGFueSByZWFsCj4gdGVzdCBsb2dpYy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiAtLS0KPiAgdGVzdHMvaTkxNS9taXNzZWRf
aXJxLmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9taXNzZWRfaXJxLmMgYi90ZXN0
cy9pOTE1L21pc3NlZF9pcnEuYwo+IGluZGV4IGNhZGUzZjM3MTQwMS4uMzAyZGEwZThkMDcxIDEw
MDY0NAo+IC0tLSBhL3Rlc3RzL2k5MTUvbWlzc2VkX2lycS5jCj4gKysrIGIvdGVzdHMvaTkxNS9t
aXNzZWRfaXJxLmMKPiBAQCAtMTA4LDEzICsxMDgsMTMgQEAgaWd0X3NpbXBsZV9tYWluCj4gICAg
ICAgICBpZ3RfcmVxdWlyZV9nZW0oZGV2aWNlKTsKPiAgICAgICAgIGlndF9za2lwX29uKGdlbV9o
YXNfZ3VjX3N1Ym1pc3Npb24oZGV2aWNlKSk7IC8qIGlycSBmb3JjZWQgZm9yIGd1YyAqLwo+ICAg
ICAgICAgZ2VtX3JlcXVpcmVfbW1hcF93YyhkZXZpY2UpOwo+IC0gICAgICAgaWd0X2ZvcmtfaGFu
Z19kZXRlY3RvcihkZXZpY2UpOwo+IC0KPiAgICAgICAgIGRlYnVnZnMgPSBpZ3RfZGVidWdmc19k
aXIoZGV2aWNlKTsKPiAgCj4gICAgICAgICBleHBlY3RfcmluZ3MgPSBlbmdpbmVfbWFzayhkZWJ1
Z2ZzKTsKPiAgICAgICAgIGlndF9yZXF1aXJlKGV4cGVjdF9yaW5ncyk7Cj4gIAo+ICsgICAgICAg
aWd0X2ZvcmtfaGFuZ19kZXRlY3RvcihkZXZpY2UpOwoKV2UgZG9uJ3QgcmVhbGx5IG5lZWQgaGFu
ZyBkZXRlY3RvciBoZXJlIGVpdGhlciwgSSB0aGluayBJIG1pZ2h0IGhhdmUKYmVlbiBhIGJpdCB0
byBxdWljayB0byBjb3B5IGl0IGhlcmUuIFRlc3QgaXMgZGVmdW5jdCwgYnV0ClJldmlld2VkLWJ5
OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KbmV2ZXJ0aGVsZXNzLgot
Q2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0
LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
