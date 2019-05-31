Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF394892DC
 for <igt-dev@lists.freedesktop.org>; Fri, 31 May 2019 10:23:17 +0000 (UTC)
Date: Fri, 31 May 2019 12:23:15 +0200
From: Katarzyna Dec <katarzyna.dec@intel.com>
Message-ID: <20190531102315.GI28073@kdec5-desk.ger.corp.intel.com>
References: <20190529135332.3099-1-tomasz.lis@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190529135332.3099-1-tomasz.lis@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/prime_busy: Increase timeout to
 mind pre-silicon.
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
To: Tomasz Lis <tomasz.lis@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBNYXkgMjksIDIwMTkgYXQgMDM6NTM6MzJQTSArMDIwMCwgVG9tYXN6IExpcyB3cm90
ZToKPiBGcm9tOiAiTGlzLCBUb21hc3oiIDx0b21hc3oubGlzQGludGVsLmNvbT4KPiAKPiBPbiBz
aWxpY29uLCBzaW1wbGUgc3VibWlzc2lvbiBpcyBmaW5pc2hlZCBtdWNoIGZhc3RlciB0aGFuIGlu
IGEgc2Vjb25kLgo+IEJ1dCBmb3IgcHJlLXNpbGljb24sIGl0IGlzIG5vdCBhbHdheXMgdGhlIGNh
c2UuIFNpeCBzZWNvbmRzIHNob3VsZCBiZQo+IGVub3VnaCB0aG91Z2guCj4gCj4gU2lnbmVkLW9m
Zi1ieTogVG9tYXN6IExpcyA8dG9tYXN6Lmxpc0BpbnRlbC5jb20+Cj4gQ2M6IE1yenlnbG9kIERh
bmllbCBUIDxkYW5pZWwudC5tcnp5Z2xvZEBpbnRlbC5jb20+Cj4gQ2M6IE1pY2hhbCBXaW5pYXJz
a2kgPG1pY2hhbC53aW5pYXJza2lAaW50ZWwuY29tPgo+IENjOiBLYXRhcnp5bmEgRGVjIDxrYXRh
cnp5bmEuZGVjQGludGVsLmNvbT4KPiBDYzogRGFuaWVsZSBDZXJhb2xvIFNwdXJpbyA8ZGFuaWVs
ZS5jZXJhb2xvc3B1cmlvQGludGVsLmNvbT4KPiAtLS0KPiAgdGVzdHMvcHJpbWVfYnVzeS5jIHwg
MiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvdGVzdHMvcHJpbWVfYnVzeS5jIGIvdGVzdHMvcHJpbWVfYnVzeS5jCj4g
aW5kZXggYTgyYWNiZGIuLjhlMGYzY2E2IDEwMDY0NAo+IC0tLSBhL3Rlc3RzL3ByaW1lX2J1c3ku
Ywo+ICsrKyBiL3Rlc3RzL3ByaW1lX2J1c3kuYwo+IEBAIC0xNDcsNyArMTQ3LDcgQEAgc3RhdGlj
IHZvaWQgYnVzeShpbnQgZmQsIHVuc2lnbmVkIHJpbmcsIHVuc2lnbmVkIGZsYWdzKQo+ICAJaWYg
KChmbGFncyAmIEhBTkcpID09IDApIHsKPiAgCQkqYmJlID0gTUlfQkFUQ0hfQlVGRkVSX0VORDsK
PiAgCQlfX3N5bmNfc3luY2hyb25pemUoKTsKPiAtCQl0aW1lb3V0ID0gMTsKPiArCQl0aW1lb3V0
ID0gNjsKSGVyZSB5b3UgYXJlIGNoYW5naW5nIHRpbWVvdXQgZm9yIGFsbCBjb25maWd1cmF0aW9u
cyB0aGF0IGNhbiBiZSB1c2VkIC0Kc2ltdWxhdGlvbiBvciBIVyBhbmQgZm9yIG90aGVyIEhXIGdl
bmVyYXRpb25zLiBJIHN1Z2dlc3Qgd2UgdXNlIHNvbWV0aGluZyBsaWtlOgogaWYgKGlndF9ydW5f
aW5fc2ltdWxhdGlvbigpKSB7Cgl0aW1lb3V0ID0gNjsKIH0gZWxzZSB7Cgl0aW1lb3V0ID0gMTsK
IH0KClRoaXMgd2lsIGFsbG93IHRvIHByZXNlcnZlIHNjZW5hcmlvIGZvciBub24tc2ltdWxhdGlv
biBlbnZpcm9ubWVudC4KCkthc2lhCj4gIAl9Cj4gIAo+ICAJLyogQ2FsbGluZyBidXN5IGluIGEg
bG9vcCBzaG91bGQgYmUgZW5vdWdoIHRvIGZsdXNoIHRoZSByZW5kZXJpbmcgKi8KPiAtLSAKPiAy
LjE0LjEKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
aWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
