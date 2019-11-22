Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C16DA6E37F
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2019 16:03:19 +0000 (UTC)
References: <20191122130300.558951-1-lionel.g.landwerlin@intel.com>
 <20191122130300.558951-9-lionel.g.landwerlin@intel.com>
 <157443636615.2524.3175030323013777744@skylake-alporthouse-com>
 <7191fc53-f4a3-48ba-0557-edafd4ff66ee@intel.com>
 <157443789518.2524.2012790618955207394@skylake-alporthouse-com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <00eea48c-1e4f-446c-bc57-763c97c7ffd1@intel.com>
Date: Fri, 22 Nov 2019 18:03:16 +0200
MIME-Version: 1.0
In-Reply-To: <157443789518.2524.2012790618955207394@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v2 08/10] tests/i915/exec_fence: add
 timeline fence tests
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

T24gMjIvMTEvMjAxOSAxNzo1MSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgTGlvbmVs
IExhbmR3ZXJsaW4gKDIwMTktMTEtMjIgMTU6NDM6MTEpCj4+IE9uIDIyLzExLzIwMTkgMTc6MjYs
IENocmlzIFdpbHNvbiB3cm90ZToKPj4+IFF1b3RpbmcgTGlvbmVsIExhbmR3ZXJsaW4gKDIwMTkt
MTEtMjIgMTM6MDI6NTgpCj4+Pj4gV2UgY2FuIG5vdyBnaXZlIGEgdHVwbGUgKGhhbmRsZSwgcG9p
bnRfdmFsdWUpIGZvciB0aW1lbGluZSBzZW1hcGhvcmVzLgo+Pj4+Cj4+Pj4gdjI6IEZpeCB1cCBz
eW5jb2JqLXRpbWVsaW5lLXJlcGVhdCB0ZXN0IChMaW9uZWwpCj4+Pj4gICAgICAgVXBkYXRlIGZv
bGxvd2luZyBrZXJuZWwgcmVuYW1lCj4+Pj4KPj4+PiB2MzogQWRkIG1vcmUgb3JkZXJpbmcgdGVz
dHMgZm9yIHN5bmNvYmovYnVmZmVyIGhhbmRsZSBzdGF0ZSAoQ2hyaXMpCj4+PiBBbm90aGVyIHF1
ZXN0aW9uLCBkbyB3ZSB3b3JyeSBhYm91dCBzd19zeW5jIGltcG9ydGVkIGZlbmNlcyBiZWluZwo+
Pj4gaGFuZGxlcyBkaWZmZXJlbnRseSB0byBuYXRpdmU/Cj4+PiAtQ2hyaXMKPj4gV2hhdCBkbyB5
b3UgbWVhbiBieSBkaWZmZXJlbnRseT8KPiBXZSBoYXZlIGlzX2k5MTVfZmVuY2UoKSB3aXRoIGJy
YW5jaGluZyBwYXRocyBmb3IgaW50ZXJuYWwvZXh0ZXJuYWwsIGFuZAo+IHdpdGhpbiB0aGUgc3lu
Y29iaiB0aW1lbGluZSBtaXhlZCBmZW5jZSBjb250ZXh0cyBjYXVzZSBhIGhhcmQgYmFycmllciwK
PiBzbyBtYXkgcHJlc2VudCBpbnRlcmVzdGluZyBlZmZlY3RzIGF0IHRoZSB1QVBJIGxheWVyPwoK
CldlbGwuLi4gc2FtZSBpc3N1ZXMgd2l0aCBhbiBhcnJheSBvZiBpOTE1IGZlbmNlcyByaWdodD8K
CgpJIGd1ZXNzIGZlbmNlX3NldF9wcmlvcml0eSgpIGNvdWxkIGJlIGFkanVzdGVkIHRvIGRlYWwg
d2l0aCAKZG1hLWZlbmNlLWNoYWluIGxpa2UgaXQgZG9lcyB3aXRoIGRtYS1mZW5jZS1hcnJheS4K
CgotTGlvbmVsCgoKPgo+PiBUaGluZyBpcyBzd19zeW5jIGNhbiBkZWxheSB0aGUgc2lnbmFsaW5n
IGZvcmV2ZXIgc28geW91IGNvdWxkIGJ1aWxkIGEKPj4gY2FzZSBleGhhdXN0aW5nIG1lbW9yeSBp
ZiB5b3UgcmVhbGx5IHdhbnRlZC4KPiBFeGNlcHQgd2UgZG9uJ3QgYWxsb3cgaW5kZWZpbml0ZSB3
YWl0cyBmb3IgZXh0ZXJuYWwgZmVuY2VzIHN1Y2ggYXMKPiBzd19zeW5jIGFuZCB3cmFwIHRoZW0g
aW4gYXV0by1leHBpcmluZyBmZW5jZXMuCj4KPj4gV2hlcmVhcyBteSB1bmRlcnN0YW5kIG9mIG90
aGVyIGRtYS1mZW5jZXMgaXMgdGhhdCB0aGV5IHNob3VsZCBiZSBzaG9ydAo+PiBsaXZlZC4KPiBF
bmRsZXNzLiBIb3cncyB0aGF0IGdvaW5nIHRvIGVuZD8gQmFkbHkuCj4gLUNocmlzCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5n
IGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
