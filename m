Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B9576E137
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2019 23:12:10 +0000 (UTC)
References: <20190318204701.30654-1-sujaritha.sundaresan@intel.com>
 <155294368968.4168.14995499269644582799@skylake-alporthouse-com>
From: Sujaritha <sujaritha.sundaresan@intel.com>
Message-ID: <5a8a84ae-212a-c107-b8a4-cdc57c3b77ac@intel.com>
Date: Thu, 21 Mar 2019 15:53:49 -0700
MIME-Version: 1.0
In-Reply-To: <155294368968.4168.14995499269644582799@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] runner: Including E2BIG error to
 whitelist
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDMvMTgvMTkgMjoxNCBQTSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgU3VqYXJp
dGhhIFN1bmRhcmVzYW4gKDIwMTktMDMtMTggMjA6NDc6MDEpCj4+IEFkZGluZyBFMkJJRyg3KSB0
byB0aGUgd2hpdGVsaXN0IHRvIHByZXZlbnQgaXQgZnJvbSBmbGFnZ2luZwo+PiB1cCBpbiBDSSBh
bmQgcG9sbHV0aW5nIHRoZSBkbWVzZyB3aXRoIHdhcm5pbmdzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBTdWphcml0aGEgU3VuZGFyZXNhbiA8c3VqYXJpdGhhLnN1bmRhcmVzYW5AaW50ZWwuY29tPgo+
PiBDYzogQXJrYWRpdXN6IEhpbGVyIDxhcmthZGl1c3ouaGlsZXJAaW50ZWwuY29tPgo+PiBDYzog
UGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+Cj4+IC0tLQo+PiAgIHJ1bm5l
ci9yZXN1bHRnZW4uYyB8IDQgKysrKwo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KykKPj4KPj4gZGlmZiAtLWdpdCBhL3J1bm5lci9yZXN1bHRnZW4uYyBiL3J1bm5lci9yZXN1bHRn
ZW4uYwo+PiBpbmRleCAzMmI1OWQ1OS4uOWJmMWM0MDYgMTAwNjQ0Cj4+IC0tLSBhL3J1bm5lci9y
ZXN1bHRnZW4uYwo+PiArKysgYi9ydW5uZXIvcmVzdWx0Z2VuLmMKPj4gQEAgLTQ5MCw2ICs0OTAs
MTAgQEAgc3RhdGljIGNvbnN0IGNoYXIgaWd0X2RtZXNnX3doaXRlbGlzdFtdID0KPj4gICAgICAg
ICAgICogbWVzc2FnZS4KPj4gICAgICAgICAgICovCj4+ICAgICAgICAgICJpOTE1OiBwcm9iZSBv
ZiBbMC05Oi5dKyBmYWlsZWQgd2l0aCBlcnJvciAtMjUiIF8KPj4gKyAgICAgICAvKiBGYXVsdCBp
bmplY3Rpb24gc3VidGVzdCB0ZXJtaW5hdGVzIHdpdGggRTJCSUcgYWZ0ZXIgdGhlCj4+ICsgICAg
ICAgICogdGVzdCBlbmRzLCB3aGljaCBwcm9kdWNlcyB0aGlzIG1lc3NhZ2UuCj4+ICsgICAgICAg
ICovCj4+ICsgICAgICAgImk5MTU6IHByb2JlIG9mIFswLTk6Ll0rIGZhaWxlZCB3aXRoIGVycm9y
IC03IiBfCj4gRm9yIGZhdWx0IGluamVjdGlvbiBpdCBpcyBsZWdhbCBmb3IgaXQgdG8gcmV0dXJu
IGFueSBlcnJvciBjb2RlLCBidXQKPiBvbmx5IGZhdWx0IGluamVjdGlvbi4gVGhpcyBuZWVkcyB0
byBiZSBhIHBlci10ZXN0IHdoaXRlbGlzdCwgcHJlZmVyYWJseQo+IHN1cHBsaWVkIGJ5IHRoZSB0
ZXN0IGl0c2VsZi4gQ291bGQgd2UgaGF2ZSBhIGNvbnRyb2wgbGluayBiYWNrIHRvIHRoZQo+IHJ1
bm5lciBpZiB3ZSBkb24ndCB3YW50IGlndCB0byBydW4gaXRzZWxmPwo+IC1DaHJpcwoKSXQgbWFr
ZXMgc2Vuc2UgdG8gaGF2ZSB0aGUgd2hpdGVsaXN0IGJlIHNwZWNpZmljIHRvIHRlc3RzLgoKLVN1
amFyaXRoYQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
aWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
