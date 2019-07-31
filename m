Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8798489D5F
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jul 2019 16:53:17 +0000 (UTC)
References: <20190729212826.20852-1-lucas.demarchi@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <e1ccfecb-7646-d9b5-3203-ef0110c2ef96@intel.com>
Date: Wed, 31 Jul 2019 09:53:06 -0700
MIME-Version: 1.0
In-Reply-To: <20190729212826.20852-1-lucas.demarchi@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH v2] i915/gem_mocs_settings: log the engine and
 MOCS index
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

CgpPbiA3LzI5LzE5IDI6MjggUE0sIEx1Y2FzIERlIE1hcmNoaSB3cm90ZToKPiBUaGlzIGhlbHBz
IHRvIGlkZW50aWZ5IHdoaWNoIGVudHJ5IGlzIHdyb25nIGluIHRoZSB0YWJsZS4KPiAKPiB2Mjog
QWRkIGJhY2sgdGhlIHZhbHVlcyBhbmQgbWlzc2luZyBcbiAoZnJvbSBEYW5pZWxlKQo+IAo+IFNp
Z25lZC1vZmYtYnk6IEx1Y2FzIERlIE1hcmNoaSA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPgoK
UmV2aWV3ZWQtYnk6IERhbmllbGUgQ2VyYW9sbyBTcHVyaW8gPGRhbmllbGUuY2VyYW9sb3NwdXJp
b0BpbnRlbC5jb20+CgpEYW5pZWxlCgo+IC0tLQo+ICAgdGVzdHMvaTkxNS9nZW1fbW9jc19zZXR0
aW5ncy5jIHwgMTAgKysrKysrKystLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9nZW1fbW9jc19z
ZXR0aW5ncy5jIGIvdGVzdHMvaTkxNS9nZW1fbW9jc19zZXR0aW5ncy5jCj4gaW5kZXggMjIwY2Rk
ZGMuLjNhZDk0MTQ5IDEwMDY0NAo+IC0tLSBhL3Rlc3RzL2k5MTUvZ2VtX21vY3Nfc2V0dGluZ3Mu
Ywo+ICsrKyBiL3Rlc3RzL2k5MTUvZ2VtX21vY3Nfc2V0dGluZ3MuYwo+IEBAIC0zNjYsMTAgKzM2
NiwxNiBAQCBzdGF0aWMgdm9pZCBjaGVja19jb250cm9sX3JlZ2lzdGVycyhpbnQgZmQsCj4gICAK
PiAgIAlnZW1fc2V0X2RvbWFpbihmZCwgZHN0X2hhbmRsZSwgSTkxNV9HRU1fRE9NQUlOX0NQVSwg
MCk7Cj4gICAJZm9yIChpbnQgaW5kZXggPSAwOyBpbmRleCA8IHRhYmxlLnNpemU7IGluZGV4Kysp
IHsKPiArCQl1aW50MzJfdCB2YWwsIHJlYWRfdmFsOwo+ICsKPiAgIAkJaWYgKCF0YWJsZS50YWJs
ZVtpbmRleF0udXNlZCkKPiAgIAkJCWNvbnRpbnVlOwo+IC0JCWlndF9hc3NlcnRfZXFfdTMyKHJl
YWRfcmVnc1tpbmRleF0sCj4gLQkJCQkgIHRhYmxlLnRhYmxlW2luZGV4XS5jb250cm9sX3ZhbHVl
KTsKPiArCj4gKwkJcmVhZF92YWwgPSByZWFkX3JlZ3NbaW5kZXhdOwo+ICsJCXZhbCA9IHRhYmxl
LnRhYmxlW2luZGV4XS5jb250cm9sX3ZhbHVlOwo+ICsJCWlndF9hc3NlcnRfZihyZWFkX3ZhbCA9
PSB2YWwsCj4gKwkJCSAgICAgImVuZ2luZT0ldSBpbmRleD0ldSByZWFkX3ZhbHVlPTB4JTA4eCB2
YWx1ZT0weCUwOHhcbiIsCj4gKwkJCSAgICAgZW5naW5lLCBpbmRleCwgcmVhZF92YWwsIHZhbCk7
Cj4gICAJfQo+ICAgCj4gICAJbXVubWFwKHJlYWRfcmVncywgNDA5Nik7Cj4gCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0
CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
