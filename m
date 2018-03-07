Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FAFD6E05B
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Mar 2018 15:06:40 +0000 (UTC)
References: <20180307121759.29106-1-chris@chris-wilson.co.uk>
 <10aabb30-9332-0f23-8936-4b2b69924942@linux.intel.com>
 <152043363042.17960.3054812213936788355@mail.alporthouse.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <885ebe1f-d6f7-52ee-c678-5535dfe2aa71@linux.intel.com>
Date: Wed, 7 Mar 2018 15:06:37 +0000
MIME-Version: 1.0
In-Reply-To: <152043363042.17960.3054812213936788355@mail.alporthouse.com>
Content-Language: en-GB
Subject: Re: [igt-dev] [PATCH igt] lib: Use C99 initialisers to clear
 context parameters
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

Ck9uIDA3LzAzLzIwMTggMTQ6NDAsIENocmlzIFdpbHNvbiB3cm90ZToKPiBRdW90aW5nIFR2cnRr
byBVcnN1bGluICgyMDE4LTAzLTA3IDE0OjM2OjM0KQo+Pgo+PiBPbiAwNy8wMy8yMDE4IDEyOjE3
LCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4+PiB2YWxncmluZCBjb21wbGFpbnMgd2UgZmVlZCB1bmlu
aXRpYWxpc2VkIHN0YWNrIGludG8gdGhlIENPTlRFWFRfU0VUUEFSQU0KPj4+IGlvY3RsLiBJdCBp
cyB1bnVzZWQgYnkgdGhlIGtlcm5lbCwgYnV0IHZhbGdyaW5kIGRvZXNuJ3Qga25vdyB0aGF0IGFu
ZAo+Pj4gaXQncyBlYXN5IGVub3VnaCB0byBjbGVhciB0aGUgc3RydWN0IHRvIHByZXZlbnQgdGhl
IHdhcm5pbmcuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJp
cy13aWxzb24uY28udWs+Cj4+PiAtLS0KPj4+ICAgIGxpYi9pZ3RfZ3QuYyB8IDI5ICsrKysrKysr
KysrKy0tLS0tLS0tLS0tLS0tLS0tCj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9u
cygrKSwgMTcgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3RfZ3QuYyBi
L2xpYi9pZ3RfZ3QuYwo+Pj4gaW5kZXggNzk5Y2ExYWUuLjE2OGM1YTA3IDEwMDY0NAo+Pj4gLS0t
IGEvbGliL2lndF9ndC5jCj4+PiArKysgYi9saWIvaWd0X2d0LmMKPj4+IEBAIC0xMjYsMTEgKzEy
NiwxMCBAQCB2b2lkIGlndF9yZXF1aXJlX2hhbmdfcmluZyhpbnQgZmQsIGludCByaW5nKQo+Pj4g
ICAgCj4+PiAgICBzdGF0aWMgdW5zaWduZWQgY29udGV4dF9nZXRfYmFuKGludCBmZCwgdW5zaWdu
ZWQgY3R4KQo+Pj4gICAgewo+Pj4gLSAgICAgc3RydWN0IGRybV9pOTE1X2dlbV9jb250ZXh0X3Bh
cmFtIHBhcmFtOwo+Pj4gLQo+Pj4gLSAgICAgcGFyYW0ucGFyYW0gPSBJOTE1X0NPTlRFWFRfUEFS
QU1fQkFOTkFCTEU7Cj4+PiAtICAgICBwYXJhbS52YWx1ZSA9IDA7Cj4+PiAtICAgICBwYXJhbS5z
aXplID0gMDsKPj4+ICsgICAgIHN0cnVjdCBkcm1faTkxNV9nZW1fY29udGV4dF9wYXJhbSBwYXJh
bSA9IHsKPj4+ICsgICAgICAgICAgICAgLmN0eF9pZCA9IGN0eCwKPj4KPj4gV2hlcmUgd2FzIHRo
aXMgYXNzaWdubWVudCBiZWZvcmU/IFdhcyBpdCBhbGwgYnJva2VuIGFzIHdlbGwgYXMgdXBzZXR0
aW5nCj4+IFZhbGdyaW5kPwo+IAo+IEl0IGV4aXN0ZWQgb25seSBpbiB0aGUgY2FsbGVycyBpbWFn
aW5hdGlvbi4gQnJva2VuIGlzIGFuCj4gb3ZlcnN0YXRlbWVudCwgc2luY2Ugbm8gb25lIHZhcmll
ZCBmcm9tIHRoZSBkZWZhdWx0cywgaS5lLiB0aGUgY2FsbGVyCj4gaGFzIHRvIG1peCBpbiB1c2lu
ZyBQQVJBTV9CQU5OQUJMRSB3aXRoIGlndF9oYW5nX2N0eC4KCmdlbV9yZXNldF9zdGF0cyBpcyBk
b2luZyB0aGF0LCBib3RoIHdpdGggZGVmYXVsdCBhbmQgb3duIGNvbnRleHQuIEJ1dCBJIApkb24n
dCBmZWVsIGxpa2UgdW50YW5nbGluZyB0aGlzIHJpZ2h0IG5vdy4gV2hhdGV2ZXIgaXQgaXMgc3Vw
cG9zZWQgdG8gCmJlLCBpZiBpdCBicmVha3MsIGl0IHdhcyBicm9rZW4gYW55d2F5IGFuZCBub3Qg
YSBmYXVsdCBvZiB0aGlzIHBhdGNoLiBzbzoKClJldmlld2VkLWJ5OiBUdnJ0a28gVXJzdWxpbiA8
dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgoKUmVnYXJkcywKClR2cnRrbwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QK
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
