Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026DA6E49C
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jan 2020 23:59:08 +0000 (UTC)
From: "Ye, Tony" <tony.ye@intel.com>
References: <20191223221959.12814-1-robert.m.fosha@intel.com>
 <20200110174146.15480-1-robert.m.fosha@intel.com>
 <157868089371.10140.10254349676452972062@skylake-alporthouse-com>
 <5315c347-7ebc-1519-73d6-16eb0d409ec9@intel.com>
 <157868607106.10140.11425210605146276060@skylake-alporthouse-com>
 <7d163c70-d814-4c96-271f-3e6092ca53e8@intel.com>
 <a25f2fda-ffa8-b9f3-540d-4c23346114d8@intel.com>
Message-ID: <5cbc0fc2-3c8a-fb32-8f05-779ead8e14f8@intel.com>
Date: Thu, 16 Jan 2020 15:59:08 -0800
MIME-Version: 1.0
In-Reply-To: <a25f2fda-ffa8-b9f3-540d-4c23346114d8@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v4] tests/i915/gem_huc_copy: Enable a
 HuC copy test
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
To: Chris Wilson <chris@chris-wilson.co.uk>, "Robert M. Fosha" <robert.m.fosha@intel.com>, igt-dev@lists.freedesktop.org
Cc: Sally Qi <feng.qi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

CgpPbiAxLzE2LzIwMjAgMzo1NiBQTSwgWWUsIFRvbnkgd3JvdGU6Cj4gVGhlcmUgYXJlIHR3byBp
c3N1ZXMgd2l0aCB0aGUgSFVDX1NUQVRVUyBxdWVyeSBpb2N0bC4KPiAKPiAxLiBvbiBhIHBsYXRm
b3JtIHdpdGggaHVjIHN1cHBvcnRlZCwgaTkxNS5lbmFibGVfZ3VjPTAsIGdvdCB1bmV4cGVjdGVk
IAo+IHJldHVybiB2YWx1ZToKPiByZXQ9MCwgcGFyYW0udmFsdWU9MCwgZXJybm89RU5PREVWCml0
IGlzIHJldD0tMSwgcGFyYW0udmFsdWU9MCwgZXJybm89RU5PREVWLCBzb3JyeSBmb3IgdGhlIHR5
cG8uCj4gCj4gMi4gdGhlIHJldHVybiB2YWx1ZSBkb2Vzbid0IGRpZmZlcmVudGlhdGUgdGhlc2Ug
dHdvIGNvbmRpdGlvbnM6Cj4gYS4gaTkxNS5lbmFibGVfZ3VjPTAvMSwgaHVjIGlzIGRpc2FibGVk
LCBza2lwIHRoZSBodWNfY29weSB0ZXN0Owo+IGIuIGk5MTUuZW5hYmxlX2d1Yz0yLzMsIGh1YyBs
b2FkL2F1dGhlbnRpY2F0aW9uIGZhaWxlZCwgZmFpbCBodWNfY29weS4KPiBBIHBhdGNoIGxpa2Ug
dGhpcyBpcyByZXF1aXJlZDoKPiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0
Y2gvMzA2NDE5Lz9zZXJpZXM9NjEwMDEmcmV2PTEKPiAKPiBSZWdhcmRzLAo+IFRvbnkKPiBPbiAx
LzEwLzIwMjAgNTowNSBQTSwgWWUsIFRvbnkgd3JvdGU6Cj4+Cj4+Cj4+IE9uIDEvMTAvMjAyMCAx
MTo1NCBBTSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+Pj4gUXVvdGluZyBZZSwgVG9ueSAoMjAyMC0w
MS0xMCAxOTo1MTo1OCkKPj4+Pgo+Pj4+Cj4+Pj4gT24gMS8xMC8yMDIwIDEwOjI4IEFNLCBDaHJp
cyBXaWxzb24gd3JvdGU6Cj4+Pj4+IFF1b3RpbmcgUm9iZXJ0IE0uIEZvc2hhICgyMDIwLTAxLTEw
IDE3OjQxOjQ2KQo+Pj4+Pj4gK3N0YXRpYyBib29sCj4+Pj4+PiArY2hlY2tfaHVjX2VuYWJsZWQo
aW50IGZkKQo+Pj4+Pj4gK3sKPj4+Pj4+ICvCoMKgwqDCoMKgwqAgaW50IGRpcjsKPj4+Pj4+ICvC
oMKgwqDCoMKgwqAgZGlyID0gaWd0X3N5c2ZzX29wZW5fcGFyYW1ldGVycyhmZCk7Cj4+Pj4+PiAr
Cj4+Pj4+PiArwqDCoMKgwqDCoMKgIGlmIChkaXIgPCAwKQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+Pj4+PiArCj4+Pj4+PiArwqDCoMKgwqDCoMKgIGlm
IChpZ3Rfc3lzZnNfZ2V0X3UzMihkaXIsICJlbmFibGVfZ3VjIikgJiAyKQo+Pj4+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDE7Cj4+Pj4+PiArwqDCoMKgwqDCoMKgIGVs
c2UKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAwOwo+Pj4+Pgo+
Pj4+PiBOby4gSWYgeW91IGhhdmUgdGhpcyBpbiB5b3VyIHVzZXJzcGFjZSwgcGxlYXNlIGltbWVk
aWF0ZWx5IHJlbW92ZSBpdCwKPj4+Pj4gYW5kIGJhY2twb3J0IHRoYXQgdG8gYW55IGFuZCBhbGwg
c3RhYmxlIGJyYW5jaGVzIGFuZCByZWxlYXNlcy4KPj4+Pj4gLUNocmlzCj4+Pj4KPj4+PiBUaGUg
Y29kZSBpcyB0byBza2lwIHRoZSB0ZXN0IHdoZW4gSHVDIGlzIGRpc2FibGVkIGJ5IHRoZSBlbmFi
bGVfZ3VjCj4+Pj4gbW9kdWxlIHBhcmFtZXRlci4gSWYgSHVDIGlzIGRpc2FibGVkIGJ5IHRoZSBl
bmFibGVfZ3VjIHBhcmFtLCB0aGVuIHNraXAKPj4+PiB0aGUgdGVzdC4gSWYgdGhlIEh1QyBmYWls
ZWQgdG8gbG9hZCBkdWUgdG8gYSByZWFsIGVycm9yLCB0aGVuIGZhaWwgdGhlCj4+Pj4gdGVzdC4K
Pj4+Pgo+Pj4+IENvdWxkIHlvdSBzdWdnZXN0IGhvdyB0byBoYW5kbGUgSFVDX1NUQVRVUyBmYWls
dXJlIHByb3Blcmx5IHdpdGhvdXQgCj4+Pj4gdGhpcwo+Pj4+IGNvZGU/Cj4+Pgo+Pj4gTG9vayBh
dCB0aGUgZXJyb3IgY29kZSBmcm9tIHF1ZXJ5aW5nIEhVQ19TVEFUVVMuCj4+PiAtQ2hyaXMKPj4K
Pj4gQWdyZWUgdGhhdCB0aGUgY2hlY2sgc2hvdWxkIGJlIGRvbmUgdmlhIHVBUEkgaW5zdGVhZCBv
ZiB0aGUgc3lzZnMuIAo+PiBUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4KPj4gVG9ueQo+Pj4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWls
aW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
