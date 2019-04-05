Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 395008991C
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2019 15:38:36 +0000 (UTC)
References: <20190405125216.6133-1-maarten.lankhorst@linux.intel.com>
 <0fca59efb26b8d319b1e90619697400ae818fe3e.camel@bootlin.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <c2d9d711-74a8-faaf-2230-eb157ce9a3d0@linux.intel.com>
Date: Fri, 5 Apr 2019 17:38:32 +0200
MIME-Version: 1.0
In-Reply-To: <0fca59efb26b8d319b1e90619697400ae818fe3e.camel@bootlin.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/igt_fb: Use cairo conversion in
 igt_fb_convert_with_stride, v3.
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
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T3AgMDUtMDQtMjAxOSBvbSAxNTo1NCBzY2hyZWVmIFBhdWwgS29jaWFsa293c2tpOgo+IEhpLAo+
Cj4gTGUgdmVuZHJlZGkgMDUgYXZyaWwgMjAxOSDDoCAxNDo1MiArMDIwMCwgTWFhcnRlbiBMYW5r
aG9yc3QgYSDDqWNyaXQgOgo+PiBFdmVyIHNpbmNlIGNvbW1pdCAzZmE2NWY0YjUzMmJkOWE1YiAo
ImZiOiBBZGQgc3VwcG9ydCBmb3IgY29udmVyc2lvbnMKPj4gdGhyb3VnaCBwaXhtYW4iKSB3ZSBj
YW4gZ2VuZXJhdGUgYSB2YWxpZCBjYWlybyBzdXJmYWNlIGZvciBhbnkgcGxhbmUsCj4+IHVzZSB0
aGlzIHRvIGF2b2lkIGhhdmluZyB0byBpbXBsZW1lbnQgb3VyIG93biBjb252ZXJzaW9uIHJvdXRp
bmUuCj4+Cj4+IEluc3RlYWQgb2YgZHVwbGljYXRpbmcgdGhpcyBmdW5jdGlvbmFsaXR5IGluIGln
dF9mYl9jb252ZXJ0X3dpdGhfc3RyaWRlLAo+PiB3ZSBjYW4gc2ltcGx5IGNvbnZlcnQgdGhpcyB0
byBhIGZldyBjYWlybyBjYWxscywgYmVjYXVzZSB3ZSBub3cgc3VwcG9ydAo+PiBjYWlybyBjYWxs
cyB0byBhbnkgb2YgdGhlIHN1cHBvcnRlZCBmcmFtZWJ1ZmZlciBmb3JtYXRzLgo+IEkgZG9uJ3Qg
dGhpbmsgdGhpcyBpcyB0aGUgY2FzZTogY2Fpcm8gKm9ubHkqIHRha2VzIGxpbmVhciBidWZmZXJz
LCBzbwo+IHdlIG5lZWQgdGhlIGV4cGxpY2l0IHRpbGluZyBjb252ZXJzaW9uIHN0ZXAgYWZ0ZXIg
aGF2aW5nIGNvbnZlcnRlZCB0byBhCj4gbmV3IGZvcm1hdCB3aXRoIGZiX2NvbnZlcnQuIEkgZG9u
J3Qgc2VlIGhvdyBpdCBjb3VsZCB3b3JrIG90aGVyd2lzZS4KPgo+IE5vdGUgdGhhdCBpbiBpZ3Qs
IHdlJ3JlIG9ubHkgaW50ZXJlc3RlZCBpbiBjb252ZXJ0aW5nIGZyb20gbGluZWFyIHRvCj4gdGls
ZWQsIG5vdCB0aGUgb3RoZXIgd2F5IHJvdW5kIChmb3Igbm93LCBhdCBsZWFzdCksIHNvIHRoYXQn
cyB0aGUKPiBwaXBlbGluZSB0aGF0IHRoZSBoZWxwZXIgYXNzc3VtZXMuCgpIZXksCgpXZSBoYXZl
IGNvZGUgdG8gaGFuZGxlIHRoaXMgZXhhY3QgY29udmVyc2lvbiBpbiBpLWctdCBhbHJlYWR5LCBi
b3RoIHdheXMsIHNlZSBpZ3RfZ2V0X2NhaXJvX3N1cmZhY2UoKS4gOikKCllvdSBzaG91bGQgYmUg
YWJsZSB0byBleHRlbmQgY3JlYXRlX2NhaXJvX3N1cmZhY2VfX2NvbnZlcnQoKSB0byBoYW5kbGUg
YnJvYWRjb20gdGlsaW5nIGFzIHdlbGwsCgpJIGRpZG4ndCBzZWUgYSBmdW5jdGlvbiB0byBjb252
ZXJ0IGZyb20gdGlsZWQgdG8gdW50aWxlZCwgZWxzZSBJIHdvdWxkIGhhdmUgcGx1Z2dlZCBpdCBp
biBmb3IgeW91LgoKfk1hYXJ0ZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0
LWRldg==
