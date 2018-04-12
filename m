Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A99F66E147
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Apr 2018 11:25:09 +0000 (UTC)
Date: Thu, 12 Apr 2018 13:25:06 +0200
From: Katarzyna Dec <katarzyna.dec@intel.com>
Message-ID: <20180412112506.GF20211@kdec5-desk.ger.corp.intel.com>
References: <20180411023732.32362-1-dhinakaran.pandiyan@intel.com>
 <20180411023732.32362-9-dhinakaran.pandiyan@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180411023732.32362-9-dhinakaran.pandiyan@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 09/20] tests/psr: Check for PSR entry
 more often and only for a second.
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
To: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBBcHIgMTAsIDIwMTggYXQgMDc6Mzc6MjFQTSAtMDcwMCwgRGhpbmFrYXJhbiBQYW5k
aXlhbiB3cm90ZToKPiAxIHNlY29uZCBpbnRlcnZhbCBpcyB0b28gbG9uZywgY2hlY2sgZXZlcnkg
MTAwbXMuCj4gCj4gUFNSIGdldHMgZW5hYmxlZCB3aGVuIHBpcGVzIGFyZSBlbmFibGVkIG9uIEJE
VysuIEl0IHNob3VsZG4ndCB0YWtlCj4gNSBzZWNvbmRzIGV2ZW4gb24gVkxWL0NIViwgd2hlcmUg
d2UgZGVsYXkgYSBiaXQuIExpbWl0IHRoZSBjaGVja3MgdG8gYQo+IDEgc2Vjb25kIHRvdGFsIHdh
aXQsIHNvIHRoYXQgd2Uga25vdyBpZiB0aGUgZGVsYXkgaXMgbG9uZ2VyLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IERoaW5ha2FyYW4gUGFuZGl5YW4gPGRoaW5ha2FyYW4ucGFuZGl5YW5AaW50ZWwuY29t
Pgo+IC0tLQo+ICB0ZXN0cy9rbXNfcHNyX3NpbmtfY3JjLmMgfCA2ICsrKystLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS90ZXN0cy9rbXNfcHNyX3NpbmtfY3JjLmMgYi90ZXN0cy9rbXNfcHNyX3NpbmtfY3JjLmMKPiBp
bmRleCBlMDRlMGY2YS4uZDk0MGVjODkgMTAwNjQ0Cj4gLS0tIGEvdGVzdHMva21zX3Bzcl9zaW5r
X2NyYy5jCj4gKysrIGIvdGVzdHMva21zX3Bzcl9zaW5rX2NyYy5jCj4gQEAgLTIxNCwxMSArMjE0
LDEzIEBAIHN0YXRpYyBib29sIHBzcl9lbmFibGVkKGRhdGFfdCAqZGF0YSkKPiAgCj4gIHN0YXRp
YyBib29sIHdhaXRfcHNyX2VudHJ5KGRhdGFfdCAqZGF0YSkKPiAgewo+IC0JaW50IHRpbWVvdXQg
PSA1Owo+ICsJaW50IHRpbWVvdXQgPSAxMDsKPiArCj4gIAl3aGlsZSAodGltZW91dC0tKSB7Cj4g
IAkJaWYgKHBzcl9lbmFibGVkKGRhdGEpKQo+ICAJCQlyZXR1cm4gdHJ1ZTsKPiAtCQlzbGVlcCgx
KTsKPiArCQl1c2xlZXAoMTAwMDAwKTsKIElzIHRoaXMgY2hhbmdlIGJhc2VkIG9uIGRvY3VtZW50
YXRpb24gb3Igb24gc29tZSBleHBlcmltZW50YWwgdmFsdWVzPyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIAogIEthc2lhCj4gKwkJaWd0X2RlYnVnKCJXYWl0aW5nIGZvciBQU1IgZW50cnkgJWQg
bXNcbiIsICgxMC10aW1lb3V0KSoxMDApOwo+ICAJfQo+ICAJcmV0dXJuIGZhbHNlOwo+ICB9Cj4g
LS0gCj4gMi4xNC4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBpZ3QtZGV2IG1haWxpbmcgbGlzdAo+IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
Z3QtZGV2Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmln
dC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
