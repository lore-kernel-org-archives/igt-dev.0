Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 021F76E07F
 for <igt-dev@lists.freedesktop.org>; Mon, 14 May 2018 15:50:12 +0000 (UTC)
References: <20180320134741.1442-1-lionel.g.landwerlin@intel.com>
 <e6742fcd-0991-d82a-ff79-10a9df2399c0@intel.com>
 <152631249623.18532.11999646930988436290@mail.alporthouse.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <a6b9fed3-92fa-e329-593c-ffdf86e0ffbb@intel.com>
Date: Mon, 14 May 2018 16:50:10 +0100
MIME-Version: 1.0
In-Reply-To: <152631249623.18532.11999646930988436290@mail.alporthouse.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib: intel: report GT size from the
 database if available
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

T24gMTQvMDUvMTggMTY6NDEsIENocmlzIFdpbHNvbiB3cm90ZToKPiBRdW90aW5nIExpb25lbCBM
YW5kd2VybGluICgyMDE4LTA1LTE0IDE0OjE1OjAxKQo+PiBQaW5nPwo+Pgo+PiBPbiAyMC8wMy8x
OCAxMzo0NywgTGlvbmVsIExhbmR3ZXJsaW4gd3JvdGU6Cj4+PiBUaGUgc2NoZW1lIGlmIGdldHRp
bmcgdGhlIEdUIHNpemUgZnJvbSB0aGUgUENJLWlkIGRvZXNuJ3Qgd29yayBhbnltb3JlCj4+PiBv
biBDb2ZmZWVsYWtlLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IExpb25lbCBMYW5kd2VybGluIDxs
aW9uZWwuZy5sYW5kd2VybGluQGludGVsLmNvbT4KPj4+IEJ1Z3ppbGxhOiBodHRwczovL2J1Z3Mu
ZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMDU0NTEsIGh0dHBzOi8vYnVncy5mcmVl
ZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTEwMTc0MAo+Pj4gLS0tCj4+PiAgICBsaWIvaW50
ZWxfZGV2aWNlX2luZm8uYyB8IDkgKysrKysrKysrCj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgOSBp
bnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2xpYi9pbnRlbF9kZXZpY2VfaW5mby5j
IGIvbGliL2ludGVsX2RldmljZV9pbmZvLmMKPj4+IGluZGV4IDFjNzEwNzMzLi5jMTA0YzljNCAx
MDA2NDQKPj4+IC0tLSBhL2xpYi9pbnRlbF9kZXZpY2VfaW5mby5jCj4+PiArKysgYi9saWIvaW50
ZWxfZGV2aWNlX2luZm8uYwo+Pj4gQEAgLTQxMCw4ICs0MTAsMTcgQEAgdW5zaWduZWQgaW50ZWxf
Z2VuKHVpbnQxNl90IGRldmlkKQo+Pj4gICAgICovCj4+PiAgICB1bnNpZ25lZCBpbnRlbF9ndCh1
aW50MTZfdCBkZXZpZCkKPj4+ICAgIHsKPj4+ICsgICAgIGNvbnN0IHN0cnVjdCBpbnRlbF9kZXZp
Y2VfaW5mbyAqZGV2aW5mbyA9IGludGVsX2dldF9kZXZpY2VfaW5mbyhkZXZpZCk7Cj4+PiAgICAg
ICAgdW5zaWduZWQgbWFzayA9IGludGVsX2dlbihkZXZpZCk7Cj4+PiAgICAKPj4+ICsgICAgIC8q
IElmIGluIHRoZSBkYXRhYmFzZSwganVzdCB1c2UgdGhhdCBpbmZvcm1hdGlvbi4gKi8KPj4+ICsg
ICAgIGlmIChkZXZpbmZvLT5ndCAhPSAwKQo+Pj4gKyAgICAgICAgICAgICByZXR1cm4gZGV2aW5m
by0+Z3QgLSAxOwo+Pj4gKwo+Pj4gKyAgICAgLyoKPj4+ICsgICAgICAqIFRoaXMgc2NoZW1lIGRv
ZXNuJ3Qgd29yayBvbiBDb2ZmZWVsYWtlLCB3ZSBzaG91bGQgcHJvYmFibHkKPj4+ICsgICAgICAq
IG5vdCByZWx5IG9uIHRoaXMgYW55bW9yZS4KPj4+ICsgICAgICAqLwo+IEkgZG9uJ3QgZ2V0IHRo
aXMgY29tbWVudCBpbiBsaWdodCBvZiB0aGUgYWJvdmUuIElmIHlvdSBhcmUgYWRkaW5nIGEKPiBw
cmVmZXJyZWQgbWVjaGFuaXNtLCB3aHkgY29tcGxhaW4gYWJvdXQgdGhlIHN0dWZmIHlvdSBoYXZl
bid0IGNvbnZlcnQ/Cj4gLUNocmlzCj4KSSBvbmx5IGFkZGVkIGd0IGluZm9ybWF0aW9uIG9uIGhz
dysuIFNvIGEgbnVtYmVyIG9mIGRldmljZXMgd29uJ3QgaGF2ZSAKdGhlIGluZm9ybWF0aW9uLgpJ
IGRvIG5lZWQgdG8gYWRkIGl0IGZvciBDTkwrIHRvbywgdGhlbiB0aGlzIGNvbW1lbnQgY291bGQg
YmUgdHVybiBpbnRvIAphbiBhc3NlcnQoZ2VuIDwgOCAmJiAhaGFzd2VsbCkKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0
CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
