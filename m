Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20180326105758.5211-1-tvrtko.ursulin@linux.intel.com>
 <152206306117.4115.14045420465858687009@mail.alporthouse.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <d596b0d7-14c5-8daf-8a9b-75895575e9a3@linux.intel.com>
Date: Mon, 26 Mar 2018 13:40:19 +0100
MIME-Version: 1.0
In-Reply-To: <152206306117.4115.14045420465858687009@mail.alporthouse.com>
Content-Language: en-GB
Subject: Re: [igt-dev] [Intel-gfx] [CI i-g-t] tests/perf_pmu: Avoid RT
 thread for accuracy test
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
To: Chris Wilson <chris@chris-wilson.co.uk>, Tvrtko Ursulin <tursulin@ursulin.net>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDI2LzAzLzIwMTggMTI6MTcsIENocmlzIFdpbHNvbiB3cm90ZToKPiBRdW90aW5nIFR2cnRr
byBVcnN1bGluICgyMDE4LTAzLTI2IDExOjU3OjU4KQo+PiAgICogTm8gc2VsZi1hZGp1c3QgLSBp
bnN0ZWFkIGp1c3QgcmVwb3J0IHRoZSBhY2hpZXZlZCBjeWNsZSBhbmQgbGV0IHRoZQo+PiAgICAg
cGFyZW50IGNoZWNrIGFnYWluc3QgaXQuCj4gCj4gU25pZmYsIEkgd2FzIHJhdGhlciBwcm91ZCBv
ZiBvdXIgYWNoaWV2ZW1lbnQuIEkgaGFkIGl0IGluIG1pbmQgYXMgYQo+IHRlbXBsYXRlIGZvciBm
dXR1cmUgYXV0b2NhbGlicmF0aW9uIHJvdXRpbmVzLiBJcyBpdCByZWFsbHkgdXNlbGVzcwo+IG92
ZXJlbmdpbmVlcmluZywgb3Igd29yc2UgYnJva2VuPwoKSXQgd29ya3MgZmluZSBJIHRoaW5rLCBi
dXQgdGhlIHByb2JsZW0gaXMgSSBjYW5ub3QgbG9jYXRlIGEgc291cmNlIG9mIApzeXN0ZW1hdGlj
IGVycm9yIHdoaWNoIHNlZW1zIHByb3BvcnRpb25hbCB0byBudW1iZXIgb2YgbG9vcCBpdGVyYXRp
b25zLiAKOiggQWZ0ZXIgYmF0dGxpbmcgd2l0aCB0cnlpbmcgdG8gaW1wcm92ZSBpdCBmb3IgYSBj
b3VwbGUgZGF5cyBJIGRlY2lkZWQgCnRvIHRyeSB0byBzZWUgaG93IHRoZSBzaW1wbGVyIGFwcHJv
YWNoIHdpbGwgZmFyZSBvbiB0aGUgc2hhcmRzLgoKVGhlcmUncyB0aGUgdGFza2xldCBkZWxheSwg
d2hpY2ggbWFkZSBtZSB0aGluayB0aGluZ3MgY291bGQgYmUgYmV0dGVyIAp3aXRob3V0IFJULiBB
bmQgdGhlbiBwb2xsaW5nIG9uIHRoZSBzcGlubmVyIG1ha2VzIGl0IHdvcnNlIGluIGFsbCBjYXNl
cyAKZm9yIG1lLCBob3dldmVyIEkgZmlkZGxlIHdpdGggaXQuIFNvIGFnYWluLCBJIHdhbnRlZCB0
byB0cnkgdGhlIApzaW1wbGlmaWNhdGlvbi4uCgpUaGUgdmVyc2lvbiBmcm9tIHRoaXMgcGF0Y2gg
c2VlbXMgc3VwZXIgc3RhYmxlIG9uIG15IHN5c3RlbSwgYnV0IHRoZSA1MCUgCmNhc2Ugc3RpbGwg
aGFzIGFuIGFwcGFyZW50ICsuNS02JSBzeXN0ZW1hdGljIGVycm9yLiBNYXliZSBvbiB0aGUgc2hh
cmRzIAppdCB3aWxsIG5vdCBiZSBhcyBzdGFibGUuLgoKUmVnYXJkcywKClR2cnRrbwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcg
bGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
