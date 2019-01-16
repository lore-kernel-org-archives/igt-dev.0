Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6536F049
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jan 2019 12:08:26 +0000 (UTC)
References: <20190116112050.27647-1-petri.latvala@intel.com>
 <20190116112050.27647-9-petri.latvala@intel.com>
 <db4e2c22-fe3b-9512-b963-edd7e99d9ea2@linux.intel.com>
 <20190116120306.GC17124@platvala-desk.ger.corp.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <c3cc81d0-0a54-666a-ab36-c20feaa42f7f@linux.intel.com>
Date: Wed, 16 Jan 2019 12:08:26 +0000
MIME-Version: 1.0
In-Reply-To: <20190116120306.GC17124@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 08/21] benchmarks/wsim: Handle a parse
 error
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
To: igt-dev@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDE2LzAxLzIwMTkgMTI6MDMsIFBldHJpIExhdHZhbGEgd3JvdGU6Cj4gT24gV2VkLCBKYW4g
MTYsIDIwMTkgYXQgMTE6NDU6MzhBTSArMDAwMCwgVHZydGtvIFVyc3VsaW4gd3JvdGU6Cj4+Cj4+
IE9uIDE2LzAxLzIwMTkgMTE6MjAsIFBldHJpIExhdHZhbGEgd3JvdGU6Cj4+PiBTaWduZWQtb2Zm
LWJ5OiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4KPj4+IENjOiBUdnJ0
a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+Pj4gLS0tCj4+PiAgICBiZW5j
aG1hcmtzL2dlbV93c2ltLmMgfCA4ICsrKysrKysrCj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgOCBp
bnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2JlbmNobWFya3MvZ2VtX3dzaW0uYyBi
L2JlbmNobWFya3MvZ2VtX3dzaW0uYwo+Pj4gaW5kZXggZTA3MDk0ODcuLjVhNDc1M2Q5IDEwMDY0
NAo+Pj4gLS0tIGEvYmVuY2htYXJrcy9nZW1fd3NpbS5jCj4+PiArKysgYi9iZW5jaG1hcmtzL2dl
bV93c2ltLmMKPj4+IEBAIC00ODMsNiArNDgzLDE0IEBAIHBhcnNlX3dvcmtsb2FkKHN0cnVjdCB3
X2FyZyAqYXJnLCB1bnNpZ25lZCBpbnQgZmxhZ3MsIHN0cnVjdCB3b3JrbG9hZCAqYXBwX3cpCj4+
PiAgICAJCQkJZ290byBhZGRfc3RlcDsKPj4+ICAgIAkJCX0KPj4+ICsJCQlpZiAoIWZpZWxkKSB7
Cj4+Cj4+IGZpZWxkIGhhcyBhbHJlYWR5IGJlZW4gY2hlY2tlZCB0byBiZSB2YWxpZCBpbiB0aGlz
IGJsb2NrOgo+Pgo+PiAJCWlmICgoZmllbGQgPSBzdHJ0b2tfcihmc3RhcnQsICIuIiwgJmZjdHgp
KSkgewo+IAo+IAo+IGZpZWxkIHdpbGwgYmUgYXNzaWduZWQgYWdhaW4gaW4gdGhlIGFib3ZlIGlm
IGJsb2Nrcy4gQW4gZXhhbXBsZSB0ZXN0Cj4gY2FzZSBmb3IgdGhpcyBpczoKPiAKPiAjIGNhdCBm
b28ud3NpbQo+IGEKPiAKPiAjIGdlbV93c2ltX2JlbmNoIC1uIDEgLXcgZm9vLndzaW0KPiBTZWdt
ZW50YXRpb24gZmF1bHQKCkFoLi4gbXkgYmFkLiBJIG5lZWQgdG8gaW1wcm92ZSB0aGlzIGxvb3Au
LiBCdXQgZml4IGlzIHRoZW4gZGVmaW5pdGVseSB2YWxpZDoKClJldmlld2VkLWJ5OiBUdnJ0a28g
VXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgoKUmVnYXJkcywKClR2cnRrbwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWls
aW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
