Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20FB86E39C
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Apr 2018 13:20:05 +0000 (UTC)
Date: Wed, 4 Apr 2018 15:20:03 +0200
From: Katarzyna Dec <katarzyna.dec@intel.com>
Message-ID: <20180404132003.GA5759@kdec5-desk.ger.corp.intel.com>
References: <20180327133648.30510-1-katarzyna.dec@intel.com>
 <1522246672.3030.8.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1522246672.3030.8.camel@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] lib: Move common gpgpu/media
 functions to gpu_fill library
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
To: "Szwichtenberg, Radoslaw" <radoslaw.szwichtenberg@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBNYXIgMjgsIDIwMTggYXQgMDM6MTc6NTVQTSArMDEwMCwgU3p3aWNodGVuYmVyZywg
UmFkb3NsYXcgd3JvdGU6Cj4gT24gVHVlLCAyMDE4LTAzLTI3IGF0IDE1OjM2ICswMjAwLCBLYXRh
cnp5bmEgRGVjIHdyb3RlOgo+ID4gR3BncHVfZmlsbCBhbmQgbWVkaWFfZmlsbCBsaWJyYXJpZXMg
YXJlIHZlcnkgc2ltaWxhciBhbmQgbWFueQo+ID4gZnVuY3Rpb25zIGNhbiBiZSBzaGFyZWQuIEkg
aGF2ZSBjcmVhdGVkIGxpYnJhcnkgZ3B1X2ZpbGwgd2l0aAo+ID4gYWxsIGZ1bmN0aW9ucyBuZWVk
ZWQgZm9yIGltcGxlbWVudGluZyBncGdwdV9maWxsIGFuZCBtZWRpYV9maWxsCj4gPiB0ZXN0cyBm
b3IgYWxsIEdlbnMuIER1cGxpY2F0ZXMsIGUuZy4gd2hlcmUgb25seSBuYW1lIHdhcyBjaGFuZ2Vk
LAo+ID4gd2VyZSByZW1vdmVkLiBUaGUgZWFybGllc3QgY29tbW9uIGZ1bmN0aW9uIHJlbWFpbmVk
Lgo+ID4gCj4gCj4gPiAtc3RhdGljIHZvaWQKPiA+IC1nZW44X2VtaXRfc3RhdGVfYmFzZV9hZGRy
ZXNzKHN0cnVjdCBpbnRlbF9iYXRjaGJ1ZmZlciAqYmF0Y2gpCj4gPiAtewo+ID4gLQlPVVRfQkFU
Q0goR0VOOF9TVEFURV9CQVNFX0FERFJFU1MgfCAoMTYgLSAyKSk7Cj4gPiAtCj4gPiAtCS8qIGdl
bmVyYWwgKi8KPiA+IC0JT1VUX0JBVENIKDAgfCAoMHg3OCA8PCA0KSB8ICgwIDw8IDEpIHzCoMKg
QkFTRV9BRERSRVNTX01PRElGWSk7Cj4gPiAtCU9VVF9CQVRDSCgwKTsKPiA+IC0KPiBXaHkgZGlk
IHlvdSBjaG9vc2UgCj4gPiArCU9VVF9CQVRDSCgwIHwgQkFTRV9BRERSRVNTX01PRElGWSk7Cj4g
Cj4gYW5kIG5vdCB0aGUgb25lIGFib3ZlPyBEb2VzIGl0IG1ha2UgYW55IGRpZmZlcmVuY2Ugd2hp
Y2ggaXMgdXNlZD8KPiAKPiBSYWRlawo+CkR1cmluZyByZWZhY3RvcmluZyBjb2RlIEkgaGF2ZSBm
b3VuZCBkb2N1bWVudGF0aW9uIGluYWNjdXJhY3kuClRoZXJlIHdlcmUgMiB2ZXJ5IHNpbWlsYXIg
ZnVuY3Rpb25zIGZvciBtZWRpYSBhbmQgZ3BncHUsIHdoZXJlIHRoZSBvbmUKZm9yIGdwZ3B1IHdh
cyBjb25maWd1cmVkIGxpa2UgaXQgd291bGQgYmUgdXNpbmcgaW5kaXJlY3Qgc3RhdGUgKHdoaWxl
CndlIGFyZSB1c2luZyBDVVJCRSkuIEkgaGF2ZSBjaGVja2VkIGlmIG1lZGlhIGZpbGwgdmVyc2lv
bgooT1VUX0JBVENIKDAgfCBCQVNFX0FERFJFU1NfTU9ESUZZKSkgd29ya3MgZmluZSBvbiBncGdw
dSBnZW44IGFuZApJIGhhdmUgZGVjaWRlZCB0byB1bmlmeSB0aGVtLgpJIGZvcmdvdCB0byBtZW50
aW9uIHRoYXQgaW4gY29tbWl0IG1zZywgYnV0IEkgd2lsbCBpbiB0aGUgbmV4dCB2ZXJzaW9uLgoK
S2FzaWEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0
LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
