Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20180328182948.27494-1-tvrtko.ursulin@linux.intel.com>
 <20180329103334.766-1-tvrtko.ursulin@linux.intel.com>
 <63199548-08b6-446f-4185-082a87287ed3@intel.com>
 <4d20363f-508d-2fda-e397-1eb074e5f75c@linux.intel.com>
 <9e30a0d6-8c7b-9771-197d-933ccf0d86be@intel.com>
 <2186ab0f-38d1-c589-2fd1-286b746dcd3b@linux.intel.com>
 <a6bd5129-cfa5-8a71-4867-e0c2826f720f@intel.com>
 <3e2f63d1-51ba-60df-1e1d-2350cca2963b@linux.intel.com>
 <56a662f2-d192-f107-1ab6-1864b589241a@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <f333d043-6f7e-ba04-c797-cc54df08ffd6@linux.intel.com>
Date: Wed, 4 Apr 2018 16:24:37 +0100
MIME-Version: 1.0
In-Reply-To: <56a662f2-d192-f107-1ab6-1864b589241a@intel.com>
Content-Language: en-GB
Subject: Re: [igt-dev] [PATCH i-g-t v2] intel-gpu-top: Rewrite the tool to
 be safe to use
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
To: Eero Tamminen <eero.t.tamminen@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDA0LzA0LzIwMTggMTU6MjMsIEVlcm8gVGFtbWluZW4gd3JvdGU6Cj4gSGksCj4gCj4gT24g
MDQuMDQuMjAxOCAxNTo0MiwgVHZydGtvIFVyc3VsaW4gd3JvdGU6Cj4+IE9uIDA0LzA0LzIwMTgg
MTM6MTUsIEVlcm8gVGFtbWluZW4gd3JvdGU6Cj4+PiBJJ3ZlIG5vdyB0ZXN0ZWQgdjUgd2l0aCBv
bGQgVWJ1bnR1IGtlcm5lbCBvbiBLQkwsIGFuZCB3aXRoIGxhdGVzdAo+Pj4gZHJtLXRpcCBrZXJu
ZWwgb24gU05CLCBIU1csIEJZVCwgQlNXIGFuZCBCRFcgR1QgJiBHVDMuCj4+Pgo+Pj4KPj4+IEdl
bmVyaWMgdGVzdCByZXN1bHRzCj4+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLQo+Pj4KPj4+ICogVG9v
bCB3b3JrcyBvbiBhbGwgb2YgdGhlbQo+Pj4KPj4+ICogVGhlIG5ldyBlcnJvciBtZXNzYWdlcyBh
bmQgaGVhZGluZ3MgbG9vayBnb29kCj4+Pgo+Pj4gKiBJZGxlIElNQyByZWFkIGFtb3VudHMgY29y
cmVzcG9uZCB0byBleHBlY3RlZCB2YWx1ZXMgb24gU05CICYgSFNXLgo+Pj4gwqDCoCBUaGUgbXVj
aCBzbWFsbGVyIHZhbHVlcyBvbiBCRFcgJiBTS0wgYXJlIGR1ZSB0byBGQkMgKGhvdyB3ZWxsCj4+
PiDCoMKgIGl0IGNvbXByZXNzZXMsIG5hdHVyYWxseSBkZXBlbmRzIG9uIHNjcmVlbiBjb250ZW50
KS4KPiAKPiBVbmxpa2UgSSBhc3N1bWVkIGVhcmxpZXIsIGl0J3Mgbm90IGFjdHVhbGx5IHVuY29y
ZSBiYW5kd2lkdGguCj4gSXQncyBSQU0gYmFuZHdpZHRoLCBJIGd1ZXNzIHRoZSBJTUMgYWJicmV2
aWF0aW9uIGlzIGZvciBzb21ldGhpbmcKPiBsaWtlIEludGVsL0ludGVncmF0ZWQgTWVtb3J5IENv
bnRyb2xsZXIuCj4gCj4gTm90ZSB0aGF0IGl0IGluY2x1ZGVzIGFsc28gYW55IG1lbW9yeSBiYW5k
d2lkdGggdXNlZCBieSBDUFUsIGFuZCBpZgo+IHRoZSBkYXRhIGZpdHMgaW50byBMTEMsIGl0IGRv
ZXNuJ3Qgc2hvdyBpdC4KPiAKPiBIb3dldmVyLCBrbm93aW5nIHdoZXRoZXIgQ1BVIHVzZXMgbWVt
b3J5IGJhbmR3aWR0aCBpcyBhY3R1YWxseSB1c2VmdWwKPiB0aGluZyBiZWNhdXNlIFJBTSBiYW5k
d2lkdGggaXMgYSBzaGFyZWQgcmVzb3VyY2Ugd2l0aCBHUFUuwqAgT25lIGNhbgo+IGNoZWNrIG90
aGVyIHRhc2tzIGJhbmR3aWR0aCB1c2FnZSBiZWZvcmUgbGF1bmNoaW5nIHRoZSBHUFUgdGFzay4K
PiAKPiAKPj4gSG0gT0ssIHlvdSBtYW5hZ2VkIHRvIGV4cGxhaW4gaXQuIEJlY2F1c2UgaW4gdGhl
IG1lYW50aW1lIEkgaGF2ZSAKPj4gb2JzZXJ2ZWQgb25lIG9kZGl0eSB3aXRoIHdyaXRlIGJhbmR3
aWR0aCBvbiBteSBoZWFkbGVzcyBTa3VsbENhbnlvbiAKPj4gTlVDLiBJdCBpZGxlcyBhcm91bmQg
MjhNaUIvcywKPiAKPiBPbiBpZGxlIG1hY2hpbmUsIHdyaXRlIGJhbmR3aWR0aCB1c2FnZSBzaG91
bGQgYmUgemVyby4KPiAKPiBXaGF0IGlzIGNhdXNpbmcgdGhlIHdyaXRlcz8KCkl0IHdhcyBwcm9i
YWJseSBjYXVzZWQgYnkgc29tZSBvZiB0aGUga2VybmVsIGRlYnVnIG9wdGlvbnMgSSBoYWQgc2V0
LiBPciAKbWF5YmUgZGlzYWJsZWQgZHludGlja3MuIFdpdGggZmV3ZXIgZGVidWcgb3B0aW9ucyBh
bmQgZHludGlja3MgSSBjYW5ub3QgCnJlcHJvZHVjZSB0aGF0IGFueSBtb3JlLgoKUmVnYXJkcywK
ClR2cnRrbwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
