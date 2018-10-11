Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Deepak Singh Rawat <drawat@vmware.com>
Date: Thu, 11 Oct 2018 15:38:11 +0000
Message-ID: <BYAPR05MB418182BBA7EF8892A5CB6D67BAE10@BYAPR05MB4181.namprd05.prod.outlook.com>
References: <20181011002104.1845-1-drawat@vmware.com>
 <20181011002104.1845-4-drawat@vmware.com> <20181011145104.GJ9144@intel.com>
In-Reply-To: <20181011145104.GJ9144@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 4/6] lib: Don't call
 igt_require_fb_modifiers() when no modifier
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
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: Thomas Hellstrom <thellstrom@vmware.com>, "petri.latvala@intel.com" <petri.latvala@intel.com>, Sinclair Yeh <syeh@vmware.com>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, linux-graphics-maintainer <linux-graphics-maintainer@vmware.com>
List-ID: <igt-dev@lists.freedesktop.org>

Cj4gT24gV2VkLCBPY3QgMTAsIDIwMTggYXQgMDU6MjE6MDJQTSAtMDcwMCwgRGVlcGFrIFJhd2F0
IHdyb3RlOgo+ID4gdm13Z2Z4IGRvZXNuJ3Qgc3VwcG9ydCBmYiBtb2RpZmllciBzbyBza2lwIGln
dF9yZXF1aXJlX2ZiX21vZGlmaWVycygpCj4gPiB3aGVuIG1vZGlmaWVyIGFyZSBub3QgcGFzc2Vk
Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IERlZXBhayBSYXdhdCA8ZHJhd2F0QHZtd2FyZS5jb20+
Cj4gPiAtLS0KPiA+ICBsaWIvaW9jdGxfd3JhcHBlcnMuYyB8IDUgKysrKy0KPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdp
dCBhL2xpYi9pb2N0bF93cmFwcGVycy5jIGIvbGliL2lvY3RsX3dyYXBwZXJzLmMKPiA+IGluZGV4
IDA5MjljNDNmLi4zYTExY2I2ZSAxMDA2NDQKPiA+IC0tLSBhL2xpYi9pb2N0bF93cmFwcGVycy5j
Cj4gPiArKysgYi9saWIvaW9jdGxfd3JhcHBlcnMuYwo+ID4gQEAgLTE2NzgsNyArMTY3OCwxMCBA
QCBpbnQgX19rbXNfYWRkZmIoaW50IGZkLCB1aW50MzJfdCBoYW5kbGUsCj4gPiAgCXN0cnVjdCBk
cm1fbW9kZV9mYl9jbWQyIGY7Cj4gPiAgCWludCByZXQsIGk7Cj4gPgo+ID4gLQlpZ3RfcmVxdWly
ZV9mYl9tb2RpZmllcnMoZmQpOwo+ID4gKwlpZiAobW9kaWZpZXIpCj4gPiArCQlpZ3RfcmVxdWly
ZV9mYl9tb2RpZmllcnMoZmQpOwo+ID4gKwllbHNlCj4gPiArCQlmbGFncyAmPSB+RFJNX01PREVf
RkJfTU9ESUZJRVJTOwo+IAo+IFRoaXMgd291bGQgdGhlb3JldGljYWxseSBjaGFuZ2UgdGhlIGJl
aHZpb3VyIGZvciBpOTE1IGF0IGxlYXN0LiBXaXRob3V0Cj4gdGhlIG1vZGlmaWVycyBmbGFnIHRo
ZSBrZXJuZWwgd2lsbCBwaWNrIHRoZSBtb2RpZmllciBmb3IgdXMgYmFzZWQgb24KPiB0aGUgYm8g
dGlsaW5nLCB3aGljaCBpbiB0aGVvcnkgbWlnaHQgbm90IGJlIHdoYXQgd2Ugd2FudGVkLiBCdXQg
YXQgbGVhc3QKPiBpZ3RfZmIgc2hvdWxkIGJlIGZpbmUgd2l0aCB0aGF0Lgo+IAo+IE1heWJlIGl0
IHdvdWxkIGJlIGJldHRlciB0byBqdXN0IG5vdCBwYXNzIHRoZSBmbGFncyBmcm9tIHRoZSBjYWxs
ZXIgYXQKPiBhbGwsIGFuZCBpbnN0ZWFkIGhhdmUgX19rbXNfYWRkZmIoKSBjaGVjayBpZiB0aGUg
ZHJpdmVyIGhhcyBtb2RpZmllcnMKPiBvciBub3QgYW5kIHNldCB0aGUgZmxhZyBiYXNlZCBvbiB0
aGF0Pwo+IAoKVGhhbmtzIFZpbGxlIGZvciB0aGUgcmV2aWV3LiBJIHRob3VnaHQgb2YgY2hlY2tp
bmcgZm9yIG1vZGlmaWVycyBzdXBwb3J0CmluIF9fa21zX2FkZGZiKCkgYnV0IEkgZGlzY2FyZGVk
IHRoZSBpZGVhIGFzIGl0IGxvb2tlZCBhbiBvdmVya2lsbCB0byBtZSwKY2hlY2tpbmcgZWFjaCB0
aW1lIF9fa21zX2FkZGZiKCkgaXMgY2FsbGVkLiBNYXkgYmUgc3RhdGljIHZhcmlhYmxlIHdpbGwK
YmUgYSBnb29kIGlkZWE/IEFuZCB5ZXMgcmVzZXR0aW5nIHRoZSBmbGFnIGZyb20gY2FsbGVyIGxv
b2tzIGEgYmV0dGVyIHdheS4KClRoYW5rcywKRGVlcGFrCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaWd0LWRldgo=
