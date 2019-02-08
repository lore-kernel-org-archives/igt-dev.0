Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
In-Reply-To: <154961651495.3378.15354488602941172650@skylake-alporthouse-com>
References: <20190207210308.17441-1-chris@chris-wilson.co.uk>
 <154961639370.12877.3589568070781197998@jlahtine-desk.ger.corp.intel.com>
 <154961651495.3378.15354488602941172650@skylake-alporthouse-com>
Message-ID: <154961964782.19692.1271816759667976289@jlahtine-desk.ger.corp.intel.com>
Date: Fri, 08 Feb 2019 11:54:08 +0200
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_exec_schedule: Rebuild signal
 handler in child
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
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

KyBQZXRyaSBmb3IgdGhlIGZhY3QgdGhhdCBpZ3RfZm9yayBpcyBhY3R1YWxseSBpZ3RfZm9ya29v
bnR1bGEgYW5kCm1lc3NlcyB1cCBzZXQgdXAgc2lnbmFsIGhhbmRsZXJzIHdoZW4gdHJhbnNpdGlv
bmluZyB0byBjaGlsZC4KClF1b3RpbmcgQ2hyaXMgV2lsc29uICgyMDE5LTAyLTA4IDExOjAxOjU1
KQo+IFF1b3RpbmcgSm9vbmFzIExhaHRpbmVuICgyMDE5LTAyLTA4IDA4OjU5OjUzKQo+ID4gUXVv
dGluZyBDaHJpcyBXaWxzb24gKDIwMTktMDItMDcgMjM6MDM6MDgpCj4gPiA+IE1ha2Ugc3VyZSB0
aGF0IHRoZSBTSUdBUkxNIGhhbmRsZXIgaXMgY2FwdHVyZWQgc28gdGhhdCB3ZSBkb24ndAo+ID4g
PiBhY2NpZGVudGFsbHkgc2hvb3Qgb3Vyc2VsdmVzIGluIHRoZSBmb290IGluc3RlYWQgb2YgbWVy
ZWx5IHdha2luZyB1cCB0aGUKPiA+ID4gZXhlY2J1Zi4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYt
Ynk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+ID4gCj4gPiBXYXJt
aW5nIHVwIHRoZSBjb250ZXh0IGFoZWFkIG9mIHRpbWUgaXMgcmVhc29uYWJsZSBmb3Igc3VwZXIg
bG93IFNLVXMuCj4gPiAKPiA+IEJ1dCB0aGUgU0lHQUxSTSBoYW5kbGVyIHNob3VsZCBiZSBpbmhl
cnRlZCwgc28gdGhhdCdzIGEgcmVkIGhlcnJpbmcuCj4gCj4gSXQgd2Fzbid0Lgo+IAo+ICAgICAg
ICAgY2hpbGQgMCBkaWVkIHdpdGggc2lnbmFsIDE0LCBBbGFybSBjbG9jawoKVWdoLCBJJ20ganVz
dCBydW5uaW5nIGEgbWluaWF0dXJlIHZlcnNpb24gbG9jYWxseSBhbmQgaXQgKmRvZXMqIGdldApp
bmhlcml0ZWQgaGVyZS4KCkFkZCBhIGJpZyBmYXQgIi8qIEZJWE1FOiBJR1Qgc2hvdWxkIG5vdCBt
ZXNzIHRoZSBTSUdBTFJNIGhhbmRsZXIgKi8iCmFib3ZlIHRoZSBsaW5lLCBhbmQga2VlcCB0aGUg
Ui1iLCB0aGVuLgoKUmVnYXJkcywgSm9vbmFzCgo+IAo+IC0+IGhpdCBTSUdfREZMCj4gLUNocmlz
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYg
bWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
