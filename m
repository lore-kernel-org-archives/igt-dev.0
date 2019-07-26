Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28FCA6EE72
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jul 2019 23:23:39 +0000 (UTC)
References: <20190725203354.6757-1-lucas.demarchi@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <f83ecb2d-aabc-cd96-8456-9cd2e6bc7e08@intel.com>
Date: Fri, 26 Jul 2019 16:23:25 -0700
MIME-Version: 1.0
In-Reply-To: <20190725203354.6757-1-lucas.demarchi@intel.com>
Content-Language: en-US
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
To: Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

CgpPbiA3LzI1LzE5IDE6MzMgUE0sIEx1Y2FzIERlIE1hcmNoaSB3cm90ZToKPiBUaGlzIGhlbHBz
IHRvIGlkZW50aWZ5IHdoaWNoIGVudHJ5IGlzIHdyb25nIGluIHRoZSB0YWJsZS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4KPiAt
LS0KPiAgIHRlc3RzL2k5MTUvZ2VtX21vY3Nfc2V0dGluZ3MuYyB8IDYgKysrKy0tCj4gICAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS90ZXN0cy9pOTE1L2dlbV9tb2NzX3NldHRpbmdzLmMgYi90ZXN0cy9pOTE1L2dlbV9tb2Nz
X3NldHRpbmdzLmMKPiBpbmRleCAxYTMxMWI4Yy4uN2IxNzE4ZjQgMTAwNjQ0Cj4gLS0tIGEvdGVz
dHMvaTkxNS9nZW1fbW9jc19zZXR0aW5ncy5jCj4gKysrIGIvdGVzdHMvaTkxNS9nZW1fbW9jc19z
ZXR0aW5ncy5jCj4gQEAgLTMyMiw4ICszMjIsMTAgQEAgc3RhdGljIHZvaWQgY2hlY2tfY29udHJv
bF9yZWdpc3RlcnMoaW50IGZkLAo+ICAgCWZvciAoaW50IGluZGV4ID0gMDsgaW5kZXggPCB0YWJs
ZS5zaXplOyBpbmRleCsrKSB7Cj4gICAJCWlmICghdGFibGUudGFibGVbaW5kZXhdLnVzZWQpCj4g
ICAJCQljb250aW51ZTsKPiAtCQlpZ3RfYXNzZXJ0X2VxX3UzMihyZWFkX3JlZ3NbaW5kZXhdLAo+
IC0JCQkJICB0YWJsZS50YWJsZVtpbmRleF0uY29udHJvbF92YWx1ZSk7Cj4gKwo+ICsJCWlndF9h
c3NlcnRfZigKPiArCQkJcmVhZF9yZWdzW2luZGV4XSA9PSB0YWJsZS50YWJsZVtpbmRleF0uY29u
dHJvbF92YWx1ZSwKPiArCQkJImVuZ2luZT0ldSBpbmRleD0ldSIsIGVuZ2luZSwgaW5kZXgpOwoK
QnV0IGxpa2UgdGhpcyB5b3UncmUgbm90IHByaW50aW5nIHRoZSB2YWx1ZXMgYW55bW9yZSwgd2hp
Y2ggd2FzIHVzZWZ1bC4gCkFsc28sIHlvdSdyZSBtaXNzaW5nIGEgIlxuIi4KCkRhbmllbGUKCj4g
ICAJfQo+ICAgCj4gICAJbXVubWFwKHJlYWRfcmVncywgNDA5Nik7Cj4gCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0Cmln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
