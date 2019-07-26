Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B94716EE72
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jul 2019 23:35:27 +0000 (UTC)
Date: Fri, 26 Jul 2019 16:35:23 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20190726233523.c3fr6zfwceawbau4@ldmartin-desk1>
References: <20190725203354.6757-1-lucas.demarchi@intel.com>
 <f83ecb2d-aabc-cd96-8456-9cd2e6bc7e08@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f83ecb2d-aabc-cd96-8456-9cd2e6bc7e08@intel.com>
Subject: Re: [igt-dev] [PATCH 1/5] i915/gem_mocs_settings: log the engine
 and MOCS index
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
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMDQ6MjM6MjVQTSAtMDcwMCwgRGFuaWVsZSBDZXJhb2xv
IFNwdXJpbyB3cm90ZToKPgo+Cj5PbiA3LzI1LzE5IDE6MzMgUE0sIEx1Y2FzIERlIE1hcmNoaSB3
cm90ZToKPj5UaGlzIGhlbHBzIHRvIGlkZW50aWZ5IHdoaWNoIGVudHJ5IGlzIHdyb25nIGluIHRo
ZSB0YWJsZS4KPj4KPj5TaWduZWQtb2ZmLWJ5OiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFy
Y2hpQGludGVsLmNvbT4KPj4tLS0KPj4gIHRlc3RzL2k5MTUvZ2VtX21vY3Nfc2V0dGluZ3MuYyB8
IDYgKysrKy0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQo+Pgo+PmRpZmYgLS1naXQgYS90ZXN0cy9pOTE1L2dlbV9tb2NzX3NldHRpbmdzLmMgYi90
ZXN0cy9pOTE1L2dlbV9tb2NzX3NldHRpbmdzLmMKPj5pbmRleCAxYTMxMWI4Yy4uN2IxNzE4ZjQg
MTAwNjQ0Cj4+LS0tIGEvdGVzdHMvaTkxNS9nZW1fbW9jc19zZXR0aW5ncy5jCj4+KysrIGIvdGVz
dHMvaTkxNS9nZW1fbW9jc19zZXR0aW5ncy5jCj4+QEAgLTMyMiw4ICszMjIsMTAgQEAgc3RhdGlj
IHZvaWQgY2hlY2tfY29udHJvbF9yZWdpc3RlcnMoaW50IGZkLAo+PiAgCWZvciAoaW50IGluZGV4
ID0gMDsgaW5kZXggPCB0YWJsZS5zaXplOyBpbmRleCsrKSB7Cj4+ICAJCWlmICghdGFibGUudGFi
bGVbaW5kZXhdLnVzZWQpCj4+ICAJCQljb250aW51ZTsKPj4tCQlpZ3RfYXNzZXJ0X2VxX3UzMihy
ZWFkX3JlZ3NbaW5kZXhdLAo+Pi0JCQkJICB0YWJsZS50YWJsZVtpbmRleF0uY29udHJvbF92YWx1
ZSk7Cj4+Kwo+PisJCWlndF9hc3NlcnRfZigKPj4rCQkJcmVhZF9yZWdzW2luZGV4XSA9PSB0YWJs
ZS50YWJsZVtpbmRleF0uY29udHJvbF92YWx1ZSwKPj4rCQkJImVuZ2luZT0ldSBpbmRleD0ldSIs
IGVuZ2luZSwgaW5kZXgpOwo+Cj5CdXQgbGlrZSB0aGlzIHlvdSdyZSBub3QgcHJpbnRpbmcgdGhl
IHZhbHVlcyBhbnltb3JlLCB3aGljaCB3YXMgCj51c2VmdWwuIEFsc28sIHlvdSdyZSBtaXNzaW5n
IGEgIlxuIi4KClllcCwgSSdtIGdvaW5nIHRvIGZpeCB0aGlzIGluIG5leHQgaXRlcmF0aW9uLgoK
THVjYXMgRGUgTWFyY2hpCgo+Cj5EYW5pZWxlCj4KPj4gIAl9Cj4+ICAJbXVubWFwKHJlYWRfcmVn
cywgNDA5Nik7Cj4+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
