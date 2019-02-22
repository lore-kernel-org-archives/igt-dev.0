Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD2D89733
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Feb 2019 17:19:16 +0000 (UTC)
References: <20190221192745.31178-2-antonio.argenziano@intel.com>
 <20190221223859.14667-1-antonio.argenziano@intel.com>
 <155079223659.4937.12315376343973234618@skylake-alporthouse-com>
 <84b6be59-5705-5a7b-8f98-0c42cc52d846@intel.com>
 <155085453789.4937.11051023274884383159@skylake-alporthouse-com>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <1e07fb2f-a266-66be-3d2d-833abaa19b88@intel.com>
Date: Fri, 22 Feb 2019 09:19:15 -0800
MIME-Version: 1.0
In-Reply-To: <155085453789.4937.11051023274884383159@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/prime_self_import: Swap gtt
 mapping for cpu
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

CgpPbiAyMi8wMi8xOSAwODo1NSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgQW50b25p
byBBcmdlbnppYW5vICgyMDE5LTAyLTIyIDE2OjUwOjA3KQo+Pgo+Pgo+PiBPbiAyMS8wMi8xOSAx
NTozNywgQ2hyaXMgV2lsc29uIHdyb3RlOgo+Pj4gUXVvdGluZyBBbnRvbmlvIEFyZ2Vuemlhbm8g
KDIwMTktMDItMjEgMjI6Mzg6NTkpCj4+Pj4gVGhlIHRlc3QgdXNlcyBndHQgbWFwcGluZyB0byBj
aGVjayB0d28gQk9zIGhhdmUgdGhlIHNhbWUgY29udGVudCwgc2luY2UKPj4+PiBpdCBzZWVtcyB0
aGVyZSBpcyBubyBjb250ZW50aW9uIG9uIHRoZSBCT3MgdXNlIGNwdSBtYXBwaW5nIHRvIG1ha2Ug
aXQKPj4+PiBjb21wYXRpYmxlIHdpdGggcGxhdGZvcm1zIHRoYXQgZG8gbm90IGhhdmUgYSBtYXBw
YWJsZSBhcGVydHVyZS4KPj4+Pgo+Pj4+IHYyOgo+Pj4+ICAgICAgICAgICAtIE5lZWQgdG8gaGF2
ZSBhbiBleHBsaWNpdCBzZXRfZG9tYWluLiAoQ2hyaXMpCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5
OiBBbnRvbmlvIEFyZ2Vuemlhbm8gPGFudG9uaW8uYXJnZW56aWFub0BpbnRlbC5jb20+Cj4+Pgo+
Pj4gSSBkb24ndCB0aGluayBoYXMgYW55IHNlbWFudGljIGltcGFjdCwgc28gbm8gbmVlZCB0byB2
ZXJpZnkgZXZlcnkgd3JpdGUKPj4+IHRvIG9uZSBvZiB0aGUgY2xvbmVkIGZkIGlzIHZpc2libGUg
aW4gdGhlIG90aGVyLCBqdXN0IG9uY2UgaXMgZW5vdWdoLgo+Pgo+PiBLZWVwIG9ubHkgb25lIHNl
dF9kb21haW4gdGhlbj8KPiAKPiBObywgSSB3YXMgdGFsa2luZyBhYm91dCB3aGV0aGVyIHdlIG5l
ZWRlZCB0byBkbyB0aGlzIGZvciBhbGwgdGhlCj4gZGlmZmVyZW50IG1tYXAgcGF0aHMsIGFuZCBk
ZWNpZGVkIHRoYXQgd2UgYXJlbid0IGRvaW5nIGFueSBjb2hlcmVuY3kKPiBjaGVja3MganVzdCB2
ZXJpZnlpbmcgdGhhdCB3ZSBoYWQgb25lIG9iamVjdHMuCj4gCj4gV2hldGhlciB0byB1c2Ugb25l
IG9yIHR3byBzZXQtZG9tYWluIGhlcmUgaXMgYW4gaW50ZXJlc3RpbmcgcXVlc3Rpb24KPiByZWxh
dGluZyB0byBob3cgbXVjaCB3ZSB3YW50IHRvIGFzc3VtZSB3ZSBvbmx5IGhhdmUgYSBzaW5nbGUg
Ym8gaGVyZQo+ICh3aGljaCBpcyB0aGUgb2JqZWN0IG9mIHRoZSBleGVyY2lzZSBvZmMpLiBJIHRo
aW5rIEkgZmF2b3VyIGtlZXBpbmcgaXQKPiBhcyB0d28gZGlzdGluY3QgaGFuZGxlcyB3aXRoIHRo
ZSB0ZXN0IGJlaW5nIG9ubHkgdGhhdCB0aGUgbWVtb3J5Cj4gY29udGVudHMgYXJlIHRoZSBzYW1l
LiBPdGhlcndpc2Ugd2UgbWlnaHQgYXMgd2VsbCBqdXN0IHVzZSBvbmUgaGFuZGxlIDspCj4gICAK
Pj4gQW55IG9iamVjdGlvbnMgdG8gc3BsaXR0aW5nIHRoaXMgZnJvbSB0aGUgc2VyaWVzIGFuZCBt
ZXJnZT8KPiAKPiBUaGlzIGNhbiBiZSBhcHBsaWVkIHJpZ2h0IGF3YXkuCgpQdXNoZWQsIHRoYW5r
cyBmb3IgdGhlIHJldmlldy4KCkFudG9uaW8KCj4gLUNocmlzCj4gCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaWd0LWRldg==
