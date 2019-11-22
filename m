Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A3C06E37F
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2019 15:47:27 +0000 (UTC)
References: <20191122130300.558951-1-lionel.g.landwerlin@intel.com>
 <20191122130300.558951-9-lionel.g.landwerlin@intel.com>
 <157443558918.2524.5525460764717575800@skylake-alporthouse-com>
 <147e3988-61a7-51cd-dcc3-7f9f3582bbc7@intel.com>
 <157443621370.2524.5937708613471128531@skylake-alporthouse-com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <acc65198-6681-c6c9-e5b3-50b5ed436e2a@intel.com>
Date: Fri, 22 Nov 2019 17:47:25 +0200
MIME-Version: 1.0
In-Reply-To: <157443621370.2524.5937708613471128531@skylake-alporthouse-com>
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

T24gMjIvMTEvMjAxOSAxNzoyMywgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgTGlvbmVs
IExhbmR3ZXJsaW4gKDIwMTktMTEtMjIgMTU6MTc6MDIpCj4+IE9uIDIyLzExLzIwMTkgMTc6MTMs
IENocmlzIFdpbHNvbiB3cm90ZToKPj4+IFF1b3RpbmcgTGlvbmVsIExhbmR3ZXJsaW4gKDIwMTkt
MTEtMjIgMTM6MDI6NTgpCj4+Pj4gV2UgY2FuIG5vdyBnaXZlIGEgdHVwbGUgKGhhbmRsZSwgcG9p
bnRfdmFsdWUpIGZvciB0aW1lbGluZSBzZW1hcGhvcmVzLgo+Pj4+Cj4+Pj4gdjI6IEZpeCB1cCBz
eW5jb2JqLXRpbWVsaW5lLXJlcGVhdCB0ZXN0IChMaW9uZWwpCj4+Pj4gICAgICAgVXBkYXRlIGZv
bGxvd2luZyBrZXJuZWwgcmVuYW1lCj4+Pj4KPj4+PiB2MzogQWRkIG1vcmUgb3JkZXJpbmcgdGVz
dHMgZm9yIHN5bmNvYmovYnVmZmVyIGhhbmRsZSBzdGF0ZSAoQ2hyaXMpCj4+PiBPbmUgdGhpbmcg
SSBkaWQgbm90IHNwb3Qgd2FzIHVzaW5nIHRoZSBzeW5jb2JqIHRvIHNjaGVkdWxlIGRpZmZlcmVu
dAo+Pj4gY29udGV4dHMuIElzIHRoYXQgaW50ZXJlc3Rpbmc/Cj4+PiAtQ2hyaXMKPj4gVGhlIGNo
YWluaW5nIHRlc3RzIGFyZSB1c2luZyBkaWZmZXJlbnQgY29udGV4dCAmIGRpZmZlcmVudCBlbmdp
bmVzIGZvcgo+PiBlYWNoIHBvaW50IG9mIHRoZSB0aW1lbGluZS4KPj4KPj4gSXMgdGhhdCB3aGF0
IHlvdSdyZSBsb29raW5nIGZvcj8KPiBQYXRjaCAxMD8gWWVhaCwgdGhhdCBwcm9iYWJseSBkb2Vz
IG1vcmUgdGhhbiB3aGF0IEkgd2FzIHRoaW5raW5nLCB3aGljaAo+IGlzIGp1c3QgdGhhdCBjb250
ZXh0cyBjYW5ub3QgYmUgcmVzY2hlZHVsZWQgcGFzdCB0aGVpciBzeW5jcHRzLgoKCk9uZSByZWFz
b24gSSBraW5kIG9mIHNvbWV3aGF0IGNvbmZpZGVudCBpcyB0aGF0IHlvdSBjYW5ub3QgYnVpbGQg
CmNpcmN1bGFyIGRlcGVuZGVuY2llcy4KCldoZW4gd2UgY3JlYXRlIGEgbmV3IG5vZGUgaW4gdGhl
IHRpbWVsaW5lLCB3ZSBtYWtlIGl0IG91dCBvZiBleGlzdGluZyAKZmVuY2VzIGFuZCB0aGUgZG1h
LWZlbmNlLWNoYWluIHN0cnVjdHVyZSBkb2VzIG5vdCBhbGxvdyBwdXR0aW5nIG5ldyAKbm9kZXMg
YW55d2hlcmUgb3RoZXIgdGhhbiB0aGUgZnJvbnQgb2YgdGhlIHRpbWVsaW5lLgoKCi1MaW9uZWwK
Cgo+Cj4gL21lIGdvZXMgYmFjayB0byB0cnlpbmcgdG8gZmluZCBnYXBzCj4KPiBXaGVyZSdzIGdj
b3Ygd2hlbiB5b3UgbmVlZCBpdD8KPiAtQ2hyaXMKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2lndC1kZXY=
