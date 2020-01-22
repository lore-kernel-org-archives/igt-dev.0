Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
References: <20200122101043.21347-1-tvrtko.ursulin@linux.intel.com>
 <20200122144028.27346-1-tvrtko.ursulin@linux.intel.com>
 <157970441989.7477.13168128747438871488@skylake-alporthouse-com>
 <dcadd92b-5f5b-ac99-d6c4-ed9beb19f6ca@linux.intel.com>
Message-ID: <754810cf-420a-4920-dae3-8bcbf2e267a9@linux.intel.com>
Date: Wed, 22 Jan 2020 15:16:05 +0000
MIME-Version: 1.0
In-Reply-To: <dcadd92b-5f5b-ac99-d6c4-ed9beb19f6ca@linux.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v2] i915/gem_engine_topology: Generate
 engine names based on class
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
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDIyLzAxLzIwMjAgMTQ6NTMsIFR2cnRrbyBVcnN1bGluIHdyb3RlOgo+IAo+IE9uIDIyLzAx
LzIwMjAgMTQ6NDYsIENocmlzIFdpbHNvbiB3cm90ZToKPj4gUXVvdGluZyBUdnJ0a28gVXJzdWxp
biAoMjAyMC0wMS0yMiAxNDo0MDoyOCkKPj4+IMKgIHN0YXRpYyB2b2lkIGluaXRfZW5naW5lKHN0
cnVjdCBpbnRlbF9leGVjdXRpb25fZW5naW5lMiAqZTIsCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW50IGNsYXNzLCBpbnQgaW5zdGFuY2UsIHVp
bnQ2NF90IGZsYWdzKQo+Pj4gwqAgewo+Pj4gLcKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3QgaW50
ZWxfZXhlY3V0aW9uX2VuZ2luZTIgKl9fZTI7Cj4+PiAtwqDCoMKgwqDCoMKgIHN0YXRpYyBjb25z
dCBjaGFyICp1bmtub3duX25hbWUgPSAidW5rbm93biIsCj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICp2aXJ0dWFsX25hbWUgPSAidmlydHVhbCI7
Cj4+PiArwqDCoMKgwqDCoMKgIGludCByZXQ7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgIGUyLT5jbGFz
c8KgwqDCoCA9IGNsYXNzOwo+Pj4gwqDCoMKgwqDCoMKgwqDCoCBlMi0+aW5zdGFuY2UgPSBpbnN0
YW5jZTsKPj4+IC3CoMKgwqDCoMKgwqAgZTItPmZsYWdzwqDCoMKgID0gZmxhZ3M7Cj4+PiDCoMKg
wqDCoMKgwqDCoMKgIC8qIGVuZ2luZSBpcyBhIHZpcnR1YWwgZW5naW5lICovCj4+PiDCoMKgwqDC
oMKgwqDCoMKgIGlmIChjbGFzcyA9PSBJOTE1X0VOR0lORV9DTEFTU19JTlZBTElEICYmCj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW5zdGFuY2UgPT0gSTkxNV9FTkdJTkVfQ0xBU1NfSU5W
QUxJRF9WSVJUVUFMKSB7Cj4+Cj4+IENhbiB0aGlzIGV2ZXIgbWF0Y2g/wqAgaW5zdGFuY2UgaXMg
NjU1MzQgYW5kIElOVkFMSURfVklSVFVBTCBpcyAtMi4KPj4gaW50IGNsYXNzL2luc3RhbmNlIHNo
b3VsZCBiZSB1MTY/Cj4gCj4gWWVhaCwgbm8gaXQgY2FuJ3QgZXZlciBtYXRjaC4gSSdsbCBoYXZl
IGEgbG9vayBob3cgZWFzeSB0byBjaGFuZ2UgaXQgYWxsIAo+IHRvIHN0cnVjdCBpOTE1X2VuZ2lu
ZV9jbGFzc19pbnN0YW5jZS4KClRvbyBtdWNoIGNodXJuLiBJIGRpZCBzaW1wbGUgdWludDE2X3Qg
aGVyZSBhbmQgaW4gc3RydWN0IAppbnRlbF9leGVjdXRpb25fZW5naW5lMiBhcyBhIGZvbGxvdyB1
cCBwYXRjaCB0byB0aGlzIG9uZS4KClJlZ2FyZHMsCgpUdnJ0a28KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
