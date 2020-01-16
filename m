Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B216E499
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jan 2020 23:56:13 +0000 (UTC)
From: "Ye, Tony" <tony.ye@intel.com>
References: <20191223221959.12814-1-robert.m.fosha@intel.com>
 <20200110174146.15480-1-robert.m.fosha@intel.com>
 <157868089371.10140.10254349676452972062@skylake-alporthouse-com>
 <5315c347-7ebc-1519-73d6-16eb0d409ec9@intel.com>
 <157868607106.10140.11425210605146276060@skylake-alporthouse-com>
 <7d163c70-d814-4c96-271f-3e6092ca53e8@intel.com>
Message-ID: <a25f2fda-ffa8-b9f3-540d-4c23346114d8@intel.com>
Date: Thu, 16 Jan 2020 15:56:10 -0800
MIME-Version: 1.0
In-Reply-To: <7d163c70-d814-4c96-271f-3e6092ca53e8@intel.com>
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

VGhlcmUgYXJlIHR3byBpc3N1ZXMgd2l0aCB0aGUgSFVDX1NUQVRVUyBxdWVyeSBpb2N0bC4KCjEu
IG9uIGEgcGxhdGZvcm0gd2l0aCBodWMgc3VwcG9ydGVkLCBpOTE1LmVuYWJsZV9ndWM9MCwgZ290
IHVuZXhwZWN0ZWQgCnJldHVybiB2YWx1ZToKcmV0PTAsIHBhcmFtLnZhbHVlPTAsIGVycm5vPUVO
T0RFVgoKMi4gdGhlIHJldHVybiB2YWx1ZSBkb2Vzbid0IGRpZmZlcmVudGlhdGUgdGhlc2UgdHdv
IGNvbmRpdGlvbnM6CmEuIGk5MTUuZW5hYmxlX2d1Yz0wLzEsIGh1YyBpcyBkaXNhYmxlZCwgc2tp
cCB0aGUgaHVjX2NvcHkgdGVzdDsKYi4gaTkxNS5lbmFibGVfZ3VjPTIvMywgaHVjIGxvYWQvYXV0
aGVudGljYXRpb24gZmFpbGVkLCBmYWlsIGh1Y19jb3B5LgpBIHBhdGNoIGxpa2UgdGhpcyBpcyBy
ZXF1aXJlZDoKaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzMwNjQxOS8/
c2VyaWVzPTYxMDAxJnJldj0xCgpSZWdhcmRzLApUb255Ck9uIDEvMTAvMjAyMCA1OjA1IFBNLCBZ
ZSwgVG9ueSB3cm90ZToKPiAKPiAKPiBPbiAxLzEwLzIwMjAgMTE6NTQgQU0sIENocmlzIFdpbHNv
biB3cm90ZToKPj4gUXVvdGluZyBZZSwgVG9ueSAoMjAyMC0wMS0xMCAxOTo1MTo1OCkKPj4+Cj4+
Pgo+Pj4gT24gMS8xMC8yMDIwIDEwOjI4IEFNLCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4+Pj4gUXVv
dGluZyBSb2JlcnQgTS4gRm9zaGEgKDIwMjAtMDEtMTAgMTc6NDE6NDYpCj4+Pj4+ICtzdGF0aWMg
Ym9vbAo+Pj4+PiArY2hlY2tfaHVjX2VuYWJsZWQoaW50IGZkKQo+Pj4+PiArewo+Pj4+PiArwqDC
oMKgwqDCoMKgIGludCBkaXI7Cj4+Pj4+ICvCoMKgwqDCoMKgwqAgZGlyID0gaWd0X3N5c2ZzX29w
ZW5fcGFyYW1ldGVycyhmZCk7Cj4+Pj4+ICsKPj4+Pj4gK8KgwqDCoMKgwqDCoCBpZiAoZGlyIDwg
MCkKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+Pj4+ICsK
Pj4+Pj4gK8KgwqDCoMKgwqDCoCBpZiAoaWd0X3N5c2ZzX2dldF91MzIoZGlyLCAiZW5hYmxlX2d1
YyIpICYgMikKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDE7Cj4+
Pj4+ICvCoMKgwqDCoMKgwqAgZWxzZQo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCByZXR1cm4gMDsKPj4+Pgo+Pj4+IE5vLiBJZiB5b3UgaGF2ZSB0aGlzIGluIHlvdXIgdXNlcnNw
YWNlLCBwbGVhc2UgaW1tZWRpYXRlbHkgcmVtb3ZlIGl0LAo+Pj4+IGFuZCBiYWNrcG9ydCB0aGF0
IHRvIGFueSBhbmQgYWxsIHN0YWJsZSBicmFuY2hlcyBhbmQgcmVsZWFzZXMuCj4+Pj4gLUNocmlz
Cj4+Pgo+Pj4gVGhlIGNvZGUgaXMgdG8gc2tpcCB0aGUgdGVzdCB3aGVuIEh1QyBpcyBkaXNhYmxl
ZCBieSB0aGUgZW5hYmxlX2d1Ywo+Pj4gbW9kdWxlIHBhcmFtZXRlci4gSWYgSHVDIGlzIGRpc2Fi
bGVkIGJ5IHRoZSBlbmFibGVfZ3VjIHBhcmFtLCB0aGVuIHNraXAKPj4+IHRoZSB0ZXN0LiBJZiB0
aGUgSHVDIGZhaWxlZCB0byBsb2FkIGR1ZSB0byBhIHJlYWwgZXJyb3IsIHRoZW4gZmFpbCB0aGUK
Pj4+IHRlc3QuCj4+Pgo+Pj4gQ291bGQgeW91IHN1Z2dlc3QgaG93IHRvIGhhbmRsZSBIVUNfU1RB
VFVTIGZhaWx1cmUgcHJvcGVybHkgd2l0aG91dCB0aGlzCj4+PiBjb2RlPwo+Pgo+PiBMb29rIGF0
IHRoZSBlcnJvciBjb2RlIGZyb20gcXVlcnlpbmcgSFVDX1NUQVRVUy4KPj4gLUNocmlzCj4gCj4g
QWdyZWUgdGhhdCB0aGUgY2hlY2sgc2hvdWxkIGJlIGRvbmUgdmlhIHVBUEkgaW5zdGVhZCBvZiB0
aGUgc3lzZnMuIAo+IFRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLgo+IFRvbnkKPj4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxp
c3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
