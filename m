Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 076246E0D7
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Jul 2018 23:36:13 +0000 (UTC)
References: <20180710153155.31507-1-antonio.argenziano@intel.com>
 <153123710397.18500.4953074989442949108@skylake-alporthouse-com>
 <b2243515-9bb2-d1ad-9af0-4efcd76a5e04@intel.com>
 <153123837406.18500.8376843987430459341@skylake-alporthouse-com>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <f0122779-de29-aa1e-6b60-74d4c8c29698@intel.com>
Date: Tue, 10 Jul 2018 16:36:13 -0700
MIME-Version: 1.0
In-Reply-To: <153123837406.18500.8376843987430459341@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v2] lib/hang_ctx: Make use of dummyload
 library to create recursive batch
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

CgpPbiAxMC8wNy8xOCAwODo1OSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgQW50b25p
byBBcmdlbnppYW5vICgyMDE4LTA3LTEwIDE2OjQ4OjM4KQo+PiBPbiAxMC8wNy8xOCAwODozOCwg
Q2hyaXMgV2lsc29uIHdyb3RlOgo+Pj4gUXVvdGluZyBBbnRvbmlvIEFyZ2Vuemlhbm8gKDIwMTgt
MDctMTAgMTY6MzE6NTUpCj4+PiBPdmVyYWxsIEkgYW0gc3RpbGwgZHViaW91cyB0aGVyZSBpcyBh
bnkgcmVhc29uIHRvIHNldCB0aGlzIGZsYWcuIFRoZQo+Pj4gcmF0ZWxpbWl0aW5nIHN0ZXAgaGVy
ZSBpc24ndCB0aGUgc3BlZWQgYXQgd2hpY2ggdGhlIGJhdGNoIHNwaW5zLCBidXQgdGhlCj4+PiB0
aW1lIGZvciBoYW5nY2hlY2sgdG8ga2ljayBpbi4gV2hlcmUgYSBmYXN0IHNwaW5uZXIgaXMgaW50
ZXJlc3RpbmcgaXMKPj4+IHRoZSBsYXRlbmN5IGluIHJlc3BvbmRpbmcgdG8gdGVybWluYXRpbmcg
dGhlIHNwaW5uZXIgKHdoaWNoIG5ldmVyCj4+PiBoYXBwZW5zIGZvciBhIGhhbmchKS4KPj4KPj4g
VGhlIGZsYWcgbWFrZXMgc2Vuc2UgdG8gbWUgYmVjYXVzZSBoYW5nY2hlY2sgd2lsbCBhbHdheXMg
c2FtcGxlIHRoZSBzYW1lCj4+IGhlYWQgb24gYSB2ZXJ5IHRpZ2h0IGxvb3AgbGlrZSB0aGUgZmFz
dCBzcGlubmVyLiBUaGUgY3VycmVudAo+PiBpbXBsZW1lbnRhdGlvbiBvZiBoYW5nY2hlY2sgd2ls
bCBhbHNvIGRlY2xhcmUgdGhlIGVuZ2luZSBodW5nIG11Y2gKPj4gcXVpY2tlci4KPiAKPiBUcnVl
LCBidXQgSSBkb24ndCB0aGluayBtdWNoIG1vcmUgdGhhbiAxIG9yIDIgZXh0cmEgdGlja3MuIElu
IHRoZSBncmFuZAo+IHNjaGVtZSBvZiB0aGluZ3MsIHVzaW5nIHRoZSBwb2xsYWJsZSBzcGlubmVy
ICsgbWFudWFsIGhhbmcgaW5qZWN0aW9uIGlzCj4gZmFyIGZhciBmYXIgZmFyIGZhciBmYXIgcXVp
Y2tlciBhbmQgcHJlY2lzZS4KCkFncmVlLiBNYXliZSB0aGlzIHNob3VsZCBiZSBvdXIgcHJlZmVy
cmVkIG1ldGhvZCBmb3IgdHJpZ2dlcmluZyBoYW5ncy4KCj4gCj4+IEluIGdlbmVyYWwgSSB0aGlu
ayB3ZSBzaG91bGQgZXhwb3NlIGRpZmZlcmVudCBoYW5naW5nIGJhdGNoIHRvCj4+IHRoZSBkcml2
ZXIgdG8gbWFrZSBzdXJlIGl0IGNhbiByZWFjdCB0byB0aGUgZGlmZmVyZW50IHNpdHVhdGlvbnMu
Cj4gCj4gSGFyZGVyIHRvIGNhbGwgKHdoZXJlIGRvIHlvdSBkcmF3IHRoZSBsaW5lIGJldHdlZW4g
bWVhbmluZ2Z1bCBhbmQKPiBoYW5naW5nIGJhdGNoKSwgYnV0IHN1Y2ggY29uc3RydWN0aW9uIGlz
IGJldHRlciBkb25lIGluc2lkZSB0aGUgdGVzdAo+IHRoYW4gaW5zaWRlIGEgZ2VuZXJhbCBwdXJw
b3NlIGxpYnJhcnkgKGFzIGl0IGlzIG5vIGxvbmdlciBnZW5lcmFsCj4gcHVycG9zZSkuCgpNYWtl
cyBzZW5zZSwgSSB3YXMgdGhpbmtpbmcgb2YganVzdCBzb21lIGJhc2ljIHRlc3RzIGFueXdheS4K
CkFudG9uaW8KCj4gLUNocmlzCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0
LWRldgo=
