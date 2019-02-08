Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D20C6EDDC
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Feb 2019 13:27:56 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190208132359.GA27881@kdec5-desk.ger.corp.intel.com>
References: <20190208131037.22811-1-katarzyna.dec@intel.com>
 <154963166124.3378.17047892724983888827@skylake-alporthouse-com>
 <20190208132359.GA27881@kdec5-desk.ger.corp.intel.com>
Message-ID: <154963246128.3378.1085966481040708512@skylake-alporthouse-com>
Date: Fri, 08 Feb 2019 13:27:51 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_exec_parallel: Add
 skip_on_simulation to whole binary
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
To: Katarzyna Dec <katarzyna.dec@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBLYXRhcnp5bmEgRGVjICgyMDE5LTAyLTA4IDEzOjIzOjU5KQo+IE9uIEZyaSwgRmVi
IDA4LCAyMDE5IGF0IDAxOjE0OjI2UE0gKzAwMDAsIENocmlzIFdpbHNvbiB3cm90ZToKPiA+IFF1
b3RpbmcgS2F0YXJ6eW5hIERlYyAoMjAxOS0wMi0wOCAxMzoxMDozNykKPiA+ID4gT24gc2ltdWxh
dGlvbiBlbnZpcm9ubWVudCB0aGVzZSB0ZXN0cyB3ZXJlIGZhaWxpbmcuIER1cmluZyBkZWJ1Zwo+
ID4gPiB3ZSBkZWNpZGVkIHRoYXQgd2hvbGUgYmluYXJ5IHNob3VsZCBiZSBza2lwcGVkLCBiZWNh
dXNlIHRoZXJlIGlzCj4gPiA+IG5vIGFkZGl0aW9uYWwgY292ZXJhZ2UgaW4gc2ltdWxhdGlvbi4K
PiA+IAo+ID4gSG93IGRpZCB0aGV5IGZhaWw/IFRoZXJlIGFyZSBzb21lIHBhdGhzIGhlcmUgdGhh
dCBhcmUgcmFyZWx5IHRvdWNoZWQKPiA+IGVsc2V3aGVyZS4KPiA+IC1DaHJpcwo+IEkgbGlrZSB5
b3UgY2hhbGxlbmdlcyBDaHJpcyA6KQo+IAo+IGdlbV9leGVjX3BhcmFsbGVsQCpjb250ZXh0KiB3
ZXJlIGZhaWxpbmcgd2l0aCBlcnJvcjoKPiAKPiAoZ2VtX2V4ZWNfcGFyYWxsZWw6MTI0NSkgaW9j
dGxfd3JhcHBlcnMtQ1JJVElDQUw6IFRlc3QgYXNzZXJ0aW9uIGZhaWx1cmUKPiBmdW5jdGlvbiBn
ZW1fZXhlY2J1ZiwgZmlsZSAuLi9saWIvaW9jdGxfd3JhcHBlcnMuYzo2MDU6Cj4gKGdlbV9leGVj
X3BhcmFsbGVsOjEyNDUpIGlvY3RsX3dyYXBwZXJzLUNSSVRJQ0FMOiBGYWlsZWQgYXNzZXJ0aW9u
Ogo+IF9fZ2VtX2V4ZWNidWYoZmQsIGV4ZWNidWYpID09IDAKPiAoZ2VtX2V4ZWNfcGFyYWxsZWw6
MTI0NSkgaW9jdGxfd3JhcHBlcnMtQ1JJVElDQUw6IGVycm9yOiAtMjggIT0gMAoKU2hvdWxkIG5v
dCBoYXBwZW4uCiAKPiBhbmQgQCpmZHMqIHdpdGg6Cj4gCj4gKGdlbV9leGVjX3BhcmFsbGVsOjEz
MTUpIGlndF9kZWJ1Z2ZzLUNSSVRJQ0FMOiBMYXN0IGVycm5vOiAyNCwgVG9vIG1hbnkgb3Blbgo+
IGZpbGVzCgpUaGF0IGlzIGJvcmluZywgYnV0IG1vcmUgaW5kaWNhdGl2ZSBvZiBzeXN0ZW0gc2V0
dXAgZmFpbHVyZS4gV2Ugc2hvdWxkCmJlIGNvbmZpZ3VyaW5nIHRoZSBzeXN0ZW0gdG8gYWxsb3cg
b3Vyc2VsdmVzLCBhcyByb290LCB0byB1c2UgYXMgbWFueSBmZAphcyBjYW4gZml0IGluIG1lbW9y
eS4KCkknZCByZWNvbW1lbmQgYSBwYXNzIHRocm91Z2ggdGhlIGJhc2ljIHN0cmVzcyB0ZXN0IGF0
IGxlYXN0LiBJdCB3b24ndAp0YWtlIGEgbG90IHRvIGV4ZXJjaXNlIHNvbWUgdW51c3VhbCBjb25k
aXRpb25zLgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
