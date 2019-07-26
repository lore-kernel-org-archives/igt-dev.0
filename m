Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A8846EE57
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jul 2019 20:49:42 +0000 (UTC)
References: <20190725203354.6757-1-lucas.demarchi@intel.com>
 <20190725203354.6757-2-lucas.demarchi@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <ca157c90-292f-9a13-aeb2-a434b1b51e02@intel.com>
Date: Fri, 26 Jul 2019 13:49:28 -0700
MIME-Version: 1.0
In-Reply-To: <20190725203354.6757-2-lucas.demarchi@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH 2/5] i915/gem_mocs_settings: do not set
 undefined entries to PTE
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

CgpPbiA3LzI1LzE5IDE6MzMgUE0sIEx1Y2FzIERlIE1hcmNoaSB3cm90ZToKPiBJbiB0aGUgSWNl
IExha2UgdGFibGUgd2UgYXJlIHNldHRpbmcgYWxsIHVuZGVmaW5lZCBlbnRyaWVzIHRvIFBURS4K
PiBXaXRoIFRpZ2VyIExha2UgdGhpcyB3b24ndCBiZSB0cnVlIGFueW1vcmUuIEV2ZW4gaWYgZm9y
IHRlc3QgaW4gSUdUIHdlCj4gYWRkIGEgbmV3IHRhYmxlIGZvciBUaWdlciBMYWtlLCBpbiBrZXJu
ZWwgdGhleSBjYW4gYmUgc2hhcmVzIHNpbmNlIHRoZXkKPiBhcmUgc3VwcG9zZWRseSBjb21wYXRp
YmxlIChvbmx5IHVudXNlZCBlbnRyaWVzIHdlcmUgYWRkZWQgb3IgYmVjYW1lCj4gdW51c2VkKS4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVs
LmNvbT4KCkFuZCB3ZSBzaG91bGRuJ3QgYmUgZ3VhcmFudGVlaW5nIHRoYXQgdW51c2VkIGVudHJp
ZXMgYXJlIHNldCB0byAKc29tZXRoaW5nIHNlbnNpYmxlIGFzIHBhcnQgb2YgdGhlIEFCSS4KClJl
dmlld2VkLWJ5OiBEYW5pZWxlIENlcmFvbG8gU3B1cmlvIDxkYW5pZWxlLmNlcmFvbG9zcHVyaW9A
aW50ZWwuY29tPgoKRGFuaWVsZQoKPiAtLS0KPiAgIHRlc3RzL2k5MTUvZ2VtX21vY3Nfc2V0dGlu
Z3MuYyB8IDEgLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvdGVzdHMvaTkxNS9nZW1fbW9jc19zZXR0aW5ncy5jIGIvdGVzdHMvaTkxNS9nZW1fbW9j
c19zZXR0aW5ncy5jCj4gaW5kZXggN2IxNzE4ZjQuLjlmNGUxYjZkIDEwMDY0NAo+IC0tLSBhL3Rl
c3RzL2k5MTUvZ2VtX21vY3Nfc2V0dGluZ3MuYwo+ICsrKyBiL3Rlc3RzL2k5MTUvZ2VtX21vY3Nf
c2V0dGluZ3MuYwo+IEBAIC0xMDEsNyArMTAxLDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtb2Nz
X2VudHJ5IGljZWxha2VfbW9jc190YWJsZVtHRU4xMV9OVU1fTU9DU19FTlRSSUVTXSA9IHsKPiAg
IAlbMjFdID0geyAweDAwMDAwMTM3LCAweDAwMzAsIDB4MX0sCj4gICAJWzIyXSA9IHsgMHgwMDAw
MDNiNywgMHgwMDMwLCAweDF9LAo+ICAgCVsyM10gPSB7IDB4MDAwMDA3YjcsIDB4MDAzMCwgMHgx
fSwKPiAtCVsyNCAuLi4gNjFdID0gSUNFTEFLRV9NT0NTX1BURSwKPiAgIAlbNjJdID0geyAweDAw
MDAwMDM3LCAweDAwMTAsIDB4MX0sCj4gICAJWzYzXSA9IHsgMHgwMDAwMDAzNywgMHgwMDEwLCAw
eDF9LAo+ICAgfTsKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
