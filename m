Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A32626E043
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Mar 2018 20:28:53 +0000 (UTC)
References: <20180321210828.16701-1-antonio.argenziano@intel.com>
 <71bc4687-27ef-8a83-3642-640c71d9da96@intel.com>
 <152173749691.23562.8714209713115048242@mail.alporthouse.com>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <35bb5642-57f1-1474-6a61-6c3348ca8c38@intel.com>
Date: Thu, 22 Mar 2018 13:28:52 -0700
MIME-Version: 1.0
In-Reply-To: <152173749691.23562.8714209713115048242@mail.alporthouse.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v3] igt/gem_measure_ring_size_inflight:
 Measure smallest inflight ring size
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
List-ID: <igt-dev@lists.freedesktop.org>

CgpPbiAyMi8wMy8xOCAwOTo1MSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgQW50b25p
byBBcmdlbnppYW5vICgyMDE4LTAzLTIyIDE2OjQwOjQ0KQo+Pgo+Pgo+PiBPbiAyMS8wMy8xOCAx
NDowOCwgQW50b25pbyBBcmdlbnppYW5vIHdyb3RlOgo+Pj4gU29tZSB0ZXN0cyBtZWFzdXJlIHRo
ZSByZW5kZXIncyByaW5nIHNpemUgYnV0IGFyZSBhY3R1YWxseSBtZWFudCB0bwo+Pj4gbWVhc3Vy
ZSB0aGUgc21hbGxlc3QgYWNyb3NzIGFsbCBlbmdpbmVzLiBUaGlzIHBhdGNoIGFkZHMgbWVhc3Vy
aW5nIHRoZQo+Pj4gc21hbGxlc3Qgc2l6ZSBpbiBnZW1fbWVhc3VyZV9yaW5nX3NpemVfaW5mbGln
aHQoKSBnaXZlbiB0aGUgYXBwcm9wcmlhdGUKPj4+IHBhcmFtZXRlci4KPj4+Cj4+PiB2MjoKPj4+
ICAgICAgICAtIE9ubHkgZXhwb3NlIGhpZ2ggbGV2ZWwgQVBJLiAoQ2hyaXMpCj4+Pgo+Pj4gdjM6
Cj4+PiAgICAgICAgLSBVc2UgQUxMX0VOR0lORVMgbWFjcm8uCj4+Pgo+Pj4gU3VnZ2VzdGVkLWJ5
OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPj4+IFNpZ25lZC1vZmYt
Ynk6IEFudG9uaW8gQXJnZW56aWFubyA8YW50b25pby5hcmdlbnppYW5vQGludGVsLmNvbT4KPj4+
IENjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPj4+IFJldmlld2Vk
LWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4gIzIKPj4KPj4gQG1h
aW50YWluZXJzOiBJcyBpdCBPSyB0byBtZXJnZSB0aGlzIHBhdGNoPyBJJ3ZlIGdvdCBhIFJCIG9u
IHYyIGJ1dCB2Mwo+PiBpcyBjb3NtZXRpYyBjaGFuZ2VzIHBsdXMgcmViYXNlLgo+IAo+IFRha2Ug
bXkgci1iLCBwbGVhc2UuCgpUYWtlbiA6KS4KClB1c2hlZCwgdGhhbmtzIGZvciB0aGUgcmV2aWV3
LgpBbnRvbmlvCgo+IAo+IEZvciBhIHMvLTEvQUxMX0VOR0lORVMvIEkgdHJ1c3QgeW91IGFuZCB0
aGUgY29tcGlsZXIgdG8gZG8gYSBiZXR0ZXIgam9iCj4gdGhlbiBtZS4KPiAtQ2hyaXMKPiAKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWls
aW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
