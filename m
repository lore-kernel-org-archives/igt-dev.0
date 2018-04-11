Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20180403163943.8425-1-tvrtko.ursulin@linux.intel.com>
 <20180404095152.5110-1-tvrtko.ursulin@linux.intel.com>
 <152345301974.13225.13439333285979784135@mail.alporthouse.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <ef6fd0c1-7fbb-2877-3010-819968f20ca9@linux.intel.com>
Date: Wed, 11 Apr 2018 14:52:36 +0100
MIME-Version: 1.0
In-Reply-To: <152345301974.13225.13439333285979784135@mail.alporthouse.com>
Content-Language: en-GB
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t v4] tests/perf_pmu: Avoid RT
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

Ck9uIDExLzA0LzIwMTggMTQ6MjMsIENocmlzIFdpbHNvbiB3cm90ZToKPiBRdW90aW5nIFR2cnRr
byBVcnN1bGluICgyMDE4LTA0LTA0IDEwOjUxOjUyKQo+PiBGcm9tOiBUdnJ0a28gVXJzdWxpbiA8
dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+Pgo+PiBSZWFsdGltZSBzY2hlZHVsaW5nIGludGVy
ZmVyZXMgd2l0aCBleGVjbGlzdHMgc3VibWlzc2lvbiAodGFza2xldCkgc28gdHJ5Cj4+IHRvIHNp
bXBsaWZ5IHRoZSBQV00gbG9vcCBpbiBhIGZldyB3YXlzOgo+Pgo+PiAgICogRHJvcCBSVC4KPj4g
ICAqIExvbmdlciBiYXRjaGVzIGZvciBzbWFsbGVyIHN5c3RlbWF0aWMgZXJyb3IuCj4+ICAgKiBN
b3JlIHRydXRoZnVsIHRlc3QgZHVyYXRpb24gY2FsY3VsYXRpb24uCj4+ICAgKiBMZXNzIGNsb2Nr
IHF1ZXJpZXMuCj4+ICAgKiBObyBzZWxmLWFkanVzdCAtIGluc3RlYWQganVzdCByZXBvcnQgdGhl
IGFjaGlldmVkIGN5Y2xlIGFuZCBsZXQgdGhlCj4+ICAgICBwYXJlbnQgY2hlY2sgYWdhaW5zdCBp
dC4KPj4gICAqIFJlcG9ydCBhYnNvbHV0ZSBjeWNsZSBlcnJvci4KPj4KPj4gdjI6Cj4+ICAgKiBC
cmluZyBiYWNrIHNlbGYtYWRqdXN0LiAoQ2hyaXMgV2lsc29uKQo+PiAgICAgKEJ1dCBzbGlnaHRs
eSBmaXhlZCB2ZXJzaW9uIHdpdGggbm8gb3ZlcmZsb3cuKQo+Pgo+PiB2MzoKPj4gICAqIExvZyBh
dmVyYWdlIGFuZCBtZWFuIGNhbGlicmF0aW9uIGZvciBlYWNoIHBhc3MuCj4+Cj4+IHY0Ogo+PiAg
ICogRWxpbWluYXRlIGRldmVsb3BtZW50IGxlZnRvdmVycy4KPj4gICAqIEZpeCB2YXJpYW5jZSBs
b2dnaW5nLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3Vs
aW5AaW50ZWwuY29tPgo+IAo+ICBGcm9tIGEgcHJhZ21hdGljIHBvaW50IG9mIHZpZXcsIHRoZXJl
J3Mgbm8gcG9pbnQgd2FpdGluZyBmb3IgbWUgdG8gYmUKPiBoYXBweSB3aXRoIHRoZSBjb252ZXJn
ZW5jZSBpZiBDSSBpcywgYW5kIHRoZSB2YXJpYW5jZSB3aWxsIGRlZmluaXRlbHkgYmUKPiBpbnRl
cmVzdGluZyAoYWx0aG91Z2ggeW91IGNvdWxkIGhhdmUgdXNlZCBpZ3RfbWVhbiB0byBjb21wdXRl
IHRoZQo+IGl0ZXJhdGl2ZSB2YXJpYW5jZSksIHNvCj4gCj4gUmV2aWV3ZWQtYnk6IENocmlzIFdp
bHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgoKVGhhbmtzLCBJJ3ZlIHB1c2hlZCBpdCBh
bmQgc28gd2UnbGwgc2VlLgoKUmVnYXJkcywKClR2cnRrbwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9pZ3QtZGV2Cg==
