Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20190225115507.29281-1-tvrtko.ursulin@linux.intel.com>
 <f7e55e11-a556-e6a9-70b4-083fdc91b97d@linux.intel.com>
From: "Ye, Tony" <tony.ye@intel.com>
Message-ID: <a5ee5328-5535-e40a-a742-194a2b65235e@intel.com>
Date: Sun, 24 Mar 2019 21:02:15 +0800
MIME-Version: 1.0
In-Reply-To: <f7e55e11-a556-e6a9-70b4-083fdc91b97d@linux.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] lib/intel_batchbuffer: Media VME kernel
 is valid only for Gen11
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

VGhlIGtlcm5lbCB3YXMgZGVzaWduIGZvciBHZW4xMSBhbmQgdGhlIGF1dGhvciBkaWRuJ3QgZ3Vh
cmFudGVlIGl0IGNvdWxkIAp3b3JrIG9uIEFQTC4gQW5kIHRoZSBiaW5hcnkgd2FzIGJ1aWx0IHdp
dGggaWdhNjQgd2l0aCAiLXA9MTEiIG9wdGlvbi4gSWYgCnlvdSB0cnkgdG8gYnVpbGQgaXQgd2l0
aCAiLXA9OSIgeW91IHdpbGwgZ2V0ICJlcnJvcjogTm9QcmVlbXB0IG5vdCAKc3VwcG9ydGVkIG9u
IGdpdmVuIHBsYXRmb3JtIi4KQXMgdGhlIHB1cnBvc2Ugb2YgdGhpcyB0ZXN0IHdhcyB0byB0ZXN0
IHRoZSBhc3ltbWV0cmljIHN1YnNsaWNlIG9mIApHZW4xMSwgSSB3b3VsZCBzdWdnZXN0IHRvIHJl
bW92ZSB0aGUgc3VwcG9ydCBvZiBHZW45IGFuZCBHZW4xMC4gVGhlIApwYXRjaCBsb29rcyBnb29k
IHRvIG1lLgoKUmVnYXJkcywKClRvbnkKCk9uIDIvMjUvMjAxOSA3OjU3IFBNLCBUdnJ0a28gVXJz
dWxpbiB3cm90ZToKPgo+IE9uIDI1LzAyLzIwMTkgMTE6NTUsIFR2cnRrbyBVcnN1bGluIHdyb3Rl
Ogo+PiBGcm9tOiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+Pgo+
PiBEbyBub3QgdXNlIGl0IG9uIG9sZGVyIGdlbnMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFR2cnRr
byBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+Cj4KPiBCdWd6aWxsYTogaHR0cHM6
Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTA5NjEyCj4KPiBSZWdhcmRz
LAo+Cj4gVHZydGtvCj4KPj4gQ2M6IFRvbnkgWWUgPHRvbnkueWVAaW50ZWwuY29tPgo+PiAtLS0K
Pj4gwqAgbGliL2ludGVsX2JhdGNoYnVmZmVyLmMgfCAyICstCj4+IMKgIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvbGliL2lu
dGVsX2JhdGNoYnVmZmVyLmMgYi9saWIvaW50ZWxfYmF0Y2hidWZmZXIuYwo+PiBpbmRleCBiMjE2
OWExYWExNDUuLjZlNmJjZGViYThhNiAxMDA2NDQKPj4gLS0tIGEvbGliL2ludGVsX2JhdGNoYnVm
ZmVyLmMKPj4gKysrIGIvbGliL2ludGVsX2JhdGNoYnVmZmVyLmMKPj4gQEAgLTg3Nyw3ICs4Nzcs
NyBAQCBpZ3Rfdm1lX2Z1bmNfdCBpZ3RfZ2V0X21lZGlhX3ZtZV9mdW5jKGludCBkZXZpZCkKPj4g
wqAgewo+PiDCoMKgwqDCoMKgIGlndF92bWVfZnVuY190IGZpbGwgPSBOVUxMOwo+PiDCoCAtwqDC
oMKgIGlmIChJU19HRU45KGRldmlkKSB8fCBJU19HRU4xMChkZXZpZCkgfHwgSVNfR0VOMTEoZGV2
aWQpKQo+PiArwqDCoMKgIGlmIChJU19HRU4xMShkZXZpZCkpCj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCBmaWxsID0gZ2VuMTFfbWVkaWFfdm1lX2Z1bmM7Cj4+IMKgIMKgwqDCoMKgwqAgcmV0dXJuIGZp
bGw7Cj4+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmln
dC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
