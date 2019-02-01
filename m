Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBEE26EE00
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Feb 2019 09:55:06 +0000 (UTC)
References: <20190128115436.14527-1-maarten.lankhorst@linux.intel.com>
 <87zhrlynpo.fsf@intel.com>
 <9cc49663-b6f7-48bb-9ced-dfaaf403d11e@linux.intel.com>
 <87womjyhjs.fsf@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <061997f6-bf31-6217-fc1a-e221b0d4e49c@linux.intel.com>
Date: Fri, 1 Feb 2019 10:55:04 +0100
MIME-Version: 1.0
In-Reply-To: <87womjyhjs.fsf@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] debugfs: Fix writing an extra zero out
 of bounds in igt_crc_to_string_extended()
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
To: Jani Nikula <jani.nikula@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T3AgMDEtMDItMjAxOSBvbSAxMDozOCBzY2hyZWVmIEphbmkgTmlrdWxhOgo+IE9uIFRodSwgMzEg
SmFuIDIwMTksIE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRl
bC5jb20+IHdyb3RlOgo+PiBPcCAyOC0wMS0yMDE5IG9tIDEzOjI0IHNjaHJlZWYgSmFuaSBOaWt1
bGE6Cj4+PiBPbiBNb24sIDI4IEphbiAyMDE5LCBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5s
YW5raG9yc3RAbGludXguaW50ZWwuY29tPiB3cm90ZToKPj4+PiBTaWduZWQtb2ZmLWJ5OiBNYWFy
dGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+Pj4+IC0t
LQo+Pj4+ICBsaWIvaWd0X2RlYnVnZnMuYyB8IDggKysrKy0tLS0KPj4+PiAgMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQg
YS9saWIvaWd0X2RlYnVnZnMuYyBiL2xpYi9pZ3RfZGVidWdmcy5jCj4+Pj4gaW5kZXggMzY1NmM2
NmE1Njc0Li5kMWZjMGZmN2Y3MTAgMTAwNjQ0Cj4+Pj4gLS0tIGEvbGliL2lndF9kZWJ1Z2ZzLmMK
Pj4+PiArKysgYi9saWIvaWd0X2RlYnVnZnMuYwo+Pj4+IEBAIC00NTgsMTcgKzQ1OCwxNyBAQCBj
aGFyICppZ3RfY3JjX3RvX3N0cmluZ19leHRlbmRlZChpZ3RfY3JjX3QgKmNyYywgY2hhciBkZWxp
bWl0ZXIsIGludCBjcmNfc2l6ZSkKPj4+PiAgCWludCBpOwo+Pj4+ICAJaW50IGxlbiA9IDA7Cj4+
Pj4gIAlpbnQgZmllbGRfd2lkdGggPSAyICogY3JjX3NpemU7IC8qIFR3byBjaGFycyBwZXIgYnl0
ZS4gKi8KPj4+PiAtCWNoYXIgKmJ1ZiA9IG1hbGxvYygoZmllbGRfd2lkdGgrMSkgKiBjcmMtPm5f
d29yZHMgKiBzaXplb2YoY2hhcikpOwo+Pj4+ICsJY2hhciAqYnVmID0gbWFsbG9jKChmaWVsZF93
aWR0aCsxKSAqIGNyYy0+bl93b3Jkcyk7Cj4+Pj4gIAo+Pj4+ICAJaWYgKCFidWYpCj4+Pj4gIAkJ
cmV0dXJuIE5VTEw7Cj4+Pj4gIAo+Pj4+IC0JZm9yIChpID0gMDsgaSA8IGNyYy0+bl93b3Jkczsg
aSsrKQo+Pj4+ICsJZm9yIChpID0gMDsgaSA8IGNyYy0+bl93b3JkcyAtIDE7IGkrKykKPj4+PiAg
CQlsZW4gKz0gc3ByaW50ZihidWYgKyBsZW4sICIlMCp4JWMiLCBmaWVsZF93aWR0aCwKPj4+PiAg
CQkJICAgICAgIGNyYy0+Y3JjW2ldLCBkZWxpbWl0ZXIpOwo+Pj4gT3Iga2VlcCB0aGUgbG9vcCBj
b25kaXRpb24gYW5kIG1ha2UgdGhpczoKPj4+Cj4+PiAJCWxlbiArPSBzcHJpbnRmKGJ1ZiArIGxl
biwgIiVzJTAqeCIsIGkgPyAmZGVsaW1pdGVyIDogIiIsCj4+PiAJCQkgICAgICAgZmllbGRfd2lk
dGgsIGNyYy0+Y3JjW2ldKTsKPj4+Cj4+PiBBZGRpdGlvbmFsbHkgY291bGQgbWFrZSB0aGUgZGVs
aW1pdGVyIHBhc3NlZCBoZXJlIGEgY2hhciouCj4+IFRoYXQgaXMgYWxzbyBhIHZhbGlkIHNvbHV0
aW9uLiA6KSBJcyBpdCBvayB0byBnbyB3aXRoIHRoZSBzb2x1dGlvbiBJCj4+IHByb3Bvc2VkIG9y
IGRvIHlvdSBoYXZlIGEgc3Ryb25nIHByZWZlcmVuY2UgZm9yIHRoYXQ/Cj4+Cj4+IEkgZG9uJ3Qg
dGhpbmsgd2UgY2FuIGp1c3QgcGFzcyAmZGVsaW1pdGVyLCB3ZSB3b3VsZCBkZXBlbmQgb24gdGhl
IG5leHQKPj4gYnl0ZSBpbiBtZW1vcnkgYWNjaWRlbnRhbGx5IGJlaW5nIFwwLgo+IEQnb2guIFll
YWgsIHlvdSdkIGhhdmUgdG8gcGFzcyB0aGUgZGVsaW1pdGVyIGFzIGEgc3RyaW5nIHRvIG1ha2Ug
dGhpcwo+IHJlYWxseSB3b3JrLCBvciBhZGQgYSBsb2NhbCBidWYuIE1laC4gU29tZXRoaW5nIGZv
ciB0aGUgZnV0dXJlLgo+Cj4gT24gdGhlIG9yaWdpbmFsIHBhdGNoLAo+Cj4gUmV2aWV3ZWQtYnk6
IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+Cj4KPgo+Cj4KVGhhbmtzLCBwdXNo
ZWQuIDopCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
