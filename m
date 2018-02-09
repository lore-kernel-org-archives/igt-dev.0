Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701036E920
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2018 18:04:39 +0000 (UTC)
References: <20180209002157.6375-1-antonio.argenziano@intel.com>
 <151816938507.28809.7532935648440423669@mail.alporthouse.com>
 <b253e9b8-5e0d-c687-df09-db618acd6c21@intel.com>
 <3d7df3ff-aff3-262a-2bf9-7e02c4d60b52@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <894b0b7e-2eff-fcd4-0bd8-962dfbcb1082@intel.com>
Date: Fri, 9 Feb 2018 10:04:38 -0800
MIME-Version: 1.0
In-Reply-To: <3d7df3ff-aff3-262a-2bf9-7e02c4d60b52@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] igt: Use lib gem_execbuf where possible
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
To: Antonio Argenziano <antonio.argenziano@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

CgpPbiAwOS8wMi8xOCAwODowMSwgQW50b25pbyBBcmdlbnppYW5vIHdyb3RlOgo+IAo+IAo+IE9u
IDA5LzAyLzE4IDA3OjI1LCBBbnRvbmlvIEFyZ2Vuemlhbm8gd3JvdGU6Cj4+Cj4+Cj4+IE9uIDA5
LzAyLzE4IDAxOjQzLCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4+PiBRdW90aW5nIEFudG9uaW8gQXJn
ZW56aWFubyAoMjAxOC0wMi0wOSAwMDoyMTo1NykKPj4+PiBkaWZmIC0tZ2l0IGEvdGVzdHMvZ2Vt
X2J1c3kuYyBiL3Rlc3RzL2dlbV9idXN5LmMKPj4+PiBpbmRleCBjMzQ5YzI5MS4uNDQ0YzFkZDEg
MTAwNjQ0Cj4+Pj4gLS0tIGEvdGVzdHMvZ2VtX2J1c3kuYwo+Pj4+ICsrKyBiL3Rlc3RzL2dlbV9i
dXN5LmMKPj4+PiBAQCAtMzMyLDExICszMzIsNiBAQCBzdGF0aWMgdm9pZCBhbGFybV9oYW5kbGVy
KGludCBzaWcpCj4+Pj4gwqAgewo+Pj4+IMKgIH0KPj4+PiAtc3RhdGljIGludCBfX2V4ZWNidWYo
aW50IGZkLCBzdHJ1Y3QgZHJtX2k5MTVfZ2VtX2V4ZWNidWZmZXIyICpleGVjYnVmKQo+Pj4+IC17
Cj4+Pj4gLcKgwqDCoMKgwqDCoCByZXR1cm4gaW9jdGwoZmQsIERSTV9JT0NUTF9JOTE1X0dFTV9F
WEVDQlVGRkVSMiwgZXhlY2J1Zik7Cj4+Pj4gLX0KPj4+Cj4+PiBXcm9uZy4gVGhlcmUncyBhbiBp
bXBvcnRhbnQgZGlmZmVyZW5jZSBoZXJlLCBjYW4geW91IHNlZSBpdD8gSXQncyBhbGwgdG8KPj4+
IGRvIHdpdGggc2lnbmFsIGhhbmRsaW5nLi4uCj4+Cj4+IEkgZ3Vlc3Mgd2UgZG8gbm90IHdhbnQg
dG8ga2VlcCB0cnlpbmcgZG9pbmcgdGhlIHNhbWUgaW9jdGwgb25jZSB0aGUgCj4+IHJpbmdidWZm
ZXIgaXMgZnVsbC4uLgo+IAo+IFNheSBvbmUgd2FudGVkIHRvIHB1dCBtZWFzdXJlX3Jpbmdfc2l6
ZSgpIGluIGxpYiwgd2hhdCB3b3VsZCBiZSB0aGUgCj4gcmlnaHQgcGxhY2UgZm9yIGl0Pwo+IAo+
IFRoYW5rcywKPiBBbnRvbmlvCj4gCgpJIGhhZCBzZW50IGEgc2VyaWVzIGZvciB0aGF0IChhbmQg
aWd0X2NvcmspIGEgd2hpbGUgYmFjazoKCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9y
Zy9zZXJpZXMvMzE4NTgvCgpJdCdzIHN0aWxsIG9uIG15IGxpc3Qgb2YgdGhpbmdzIHRvIGNvbWUg
YmFjayB0byBidXQgSSBkb3VidCBJJ2xsIGhhdmUgCnRpbWUgaW4gdGhlIHNob3J0IHRlcm0sIHNv
IGZlZWwgZnJlZSB0byBwaWNrIGl0IHVwIGlmIHlvdSBkb24ndCB3YW50IHRvIAp3YWl0LgoKVGhh
bmtzLApEYW5pZWxlCgo+Pgo+PiBUaGFua3MgZm9yIGZpbmRpbmcgdGhpcywgaXQgd291bGQgaGF2
ZSBiZWVuIGEgbmFzdHkgb25lLgo+Pgo+PiBBbnRvbmlvCj4+Cj4+PiAtQ2hyaXMKPj4+Cj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBpZ3QtZGV2IG1h
aWxpbmcgbGlzdAo+IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0Cmln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
