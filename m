Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F72A6E3B6
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Mar 2019 15:08:14 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20190308143603.3620-1-nicholas.kazlauskas@amd.com>
 <20190308143603.3620-3-nicholas.kazlauskas@amd.com>
 <155205603488.28502.11798965582789285958@skylake-alporthouse-com>
 <6cc618f5-a4a7-a63f-a126-f80b07d6ecdd@amd.com>
In-Reply-To: <6cc618f5-a4a7-a63f-a126-f80b07d6ecdd@amd.com>
Message-ID: <155205768827.28502.18159689044765654349@skylake-alporthouse-com>
Date: Fri, 08 Mar 2019 15:08:08 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] lib/fb: Clear framebuffer on amdgpu
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
To: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBLYXpsYXVza2FzLCBOaWNob2xhcyAoMjAxOS0wMy0wOCAxNTowMDo0NikKPiBPbiAz
LzgvMTkgOTo0MCBBTSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+ID4gUXVvdGluZyBOaWNob2xhcyBL
YXpsYXVza2FzICgyMDE5LTAzLTA4IDE0OjM2OjAzKQo+ID4+IElHVCBleHBlY3RzIGJ1ZmZlcnMg
cmV0dXJuZWQgZnJvbSBEUk1fSU9DVExfTU9ERV9NQVBfRFVNQiB0byBiZQo+ID4+IGNsZWFyZWQs
IGJ1dCBhbWRncHUgcmV0YWlucyB0aGUgY29udGVudHMgcHJldmlvdXNseSBpbiBtZW1vcnkKPiA+
PiBpbiB0aGUgYnVmZmVyIC0gY2xlYXIgaXQgb24gYW1kZ3B1IGJ5IHdpdGggYSBtZW1zZXQgdG8g
MC4KPiA+IAo+ID4gSG93IGlzIHRoaXMgbm90IGEga2VybmVsIGluZm9ybWF0aW9uIGxlYWs/Cj4g
PiAtQ2hyaXMKPiA+IAo+IAo+IEkgYWN0dWFsbHkgbWVhbnQgdG8gd3JpdGUgRFJNX0lPQ1RMX01P
REVfQ1JFQVRFX0RVTUIsIGJ1dCBpdCBpcyBhbiAKPiBpbmZvcm1hdGlvbiBsZWFrIGZvciB3aGF0
ZXZlciB3YXMgcHJldmlvdXNseSBpbiBWUkFNIGFueXdheS4KPiAKPiBXaXRoIEFNREdQVSB5b3Ug
aGF2ZSB0byBleHBsaWNpdGx5IGFzayBmb3IgdGhlIG1lbW9yeSB0byBiZSBjbGVhcmVkIHdoZW4g
Cj4gY3JlYXRpbmcgdGhlIEJPIHdpdGggQU1ER1BVX0dFTV9DUkVBVEVfVlJBTV9DTEVBUkVELCBi
dXQgdGhhdCBmbGFnIGlzbid0IAo+IG9uZSBvZiB0aGUgZmxhZ3MgdXNlZCB3aGVuIGNyZWF0aW5n
IGJ1ZmZlcnMgZm9yIGFtZGdwdV9tb2RlX2R1bWJfY3JlYXRlLgo+IAo+IE1heWJlIGl0IHNob3Vs
ZCBiZSwgYnV0IEknZCBiZSBjb25zaWRlcmVkIHdpdGggYW55IHBvdGVudGlhbCBwZXJmb3JtYW5j
ZSAKPiBpbXBhY3QgaW4gZG9pbmcgc28gYXQgbGVhc3QuIEkgaGF2ZW4ndCBkb25lIG11Y2ggZHJp
dmVyIGJlbmNobWFya2luZyAKPiBteXNlbGYgdG8ga25vdyBpZiBpdCdzIGEgZ29vZCBpZGVhIG9y
IG5vdC4KCkl0J3MgYSBkdW1iIGJ1ZmZlciB3aG8ncyBvbmx5IHB1cnBvc2UgaXMgdG8gY3JlYXRl
IHNwbGFzaCBmcmFtZWJ1ZmZlciwKYW5kIGlzIGV4cGxpY2l0bHkgbm90IG1lYW50IHRvIGJlIHVz
ZWQgZm9yIHJlbmRlcmluZyAod2hpY2ggb2YgY291cnNlCm1lYW5zIHRoYXQgdXNlcnNwYWNlIGRv
ZXMuLi4pLiBJIHdvdWxkIHN0cm9uZ2x5IHN1Z2dlc3QgaXQgaXMgY2xlYXJlZCBvbgpjcmVhdGlv
biBhbmQgYW55b25lIHdobyBjb21wbGFpbnMgYmUgcmVkaXJlY3RlZCB0byB1c2UgdGhlIHByb3Bl
cgppbnRlcmZhY2UgZm9yIGFtZGdwdS4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaWd0LWRldg==
