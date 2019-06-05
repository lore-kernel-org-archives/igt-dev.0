Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7182389336
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jun 2019 12:57:06 +0000 (UTC)
Date: Wed, 5 Jun 2019 15:57:03 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20190605125703.GJ22949@platvala-desk.ger.corp.intel.com>
References: <20190605121607.28014-1-petri.latvala@intel.com>
 <20190605123656.GT21222@phenom.ffwll.local>
 <87zhmwqjuq.fsf@gaia.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87zhmwqjuq.fsf@gaia.fi.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] runner: Also consider
 TAINT_MACHINE_CHECK as abortable taint
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
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBKdW4gMDUsIDIwMTkgYXQgMDM6NDc6NTdQTSArMDMwMCwgTWlrYSBLdW9wcGFsYSB3
cm90ZToKPiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+IHdyaXRlczoKPiAKPiA+IE9u
IFdlZCwgSnVuIDA1LCAyMDE5IGF0IDAzOjE2OjA3UE0gKzAzMDAsIFBldHJpIExhdHZhbGEgd3Jv
dGU6Cj4gPj4gU2lnbmVkLW9mZi1ieTogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRl
bC5jb20+Cj4gPj4gQ2M6IE1pa2EgS3VvcHBhbGEgPG1pa2Eua3VvcHBhbGFAbGludXguaW50ZWwu
Y29tPgo+ID4KPiA+IEkndmUgc2VlbiBsb3RzIG9mIG1hY2hpbmVzIHdoZXJlIHRoZXNlIGhhcHBl
biBhcyBub3JtYWwgc2lkZS1lZmZlY3Qgb2YKPiA+IHRoZXJtYWwgdGhyb3RsbGluZy4gRm9yIHNv
bWUgdmFsdWUgb2YgIm5vcm1hbCIuCj4gPgo+IAo+IFRoZXJtYWxzIGNvdWxkIGJlIG9rIGFuZCBm
aWx0ZXJlZCBpZiB3ZSBjYW4gYmUgc29tZXdoYXQgY2VydGFpbiB0aGF0Cj4gdGhlIHN0YXRlIGRp
ZG4ndCBzdWZmZXIuIENhbiB3ZT8KPiAKPiA+IERvIHdlIHJlYWxseSB3YW50IHRvIHJlYm9vdCBv
biB0aGVzZT8gSXQgY291bGQgYmUgbGlrZSB0aGUgbmV0d29yayB0aGluZyBJCj4gPiByZWNlbnRs
eSBkaXNhYmxlZCwgYW5kIHRoZW4gZXZlcnlvbmUgc3RhcnRlZCBzY3JlYW1pbmcgYmVjYXVzZSBv
dXIKPiA+IG1hY2hpbmVzIHdoZXJlIGNvbnN0YW50bHkgcmVib290aW5nIGR1ZSB0byBuZXR3b3Jr
IGNhcmRzL2RyaXZlcnMKPiA+IHRlbXBvcmFyaWx5IGhhdmluZyBhIGJhZCB0aW1lIChidXQgdXN1
YWxseSByZWNvdmVyaW5nKS4KPiAKPiBSZWJvb3Q/IFRoaXMgd29uJ3QgZ2V0IGZpeGVkIGJ5IHJl
Ym9vdCBhcyB0aGUgaHcgaXMgYnVzdGVkLgo+IAo+IFRoZSBxdWVzdGlvbiBpcyB0aGF0IGlzIGl0
IGZydWl0ZnVsIHRvIHdlZWQgb3V0IHNvZnR3YXJlCj4gZmFpbHVyZXMgd2l0aCBhIGJyb2tlbiBo
YXJkd2FyZS4KCgpZZWFoLCBJIGZvcmdvdCB0byBtZW50aW9uIHRoaXMgYXNwZWN0LgoKV2UgZG9u
J3Qgd2FudCB0byBqdXN0IHJlYm9vdCBvbiB0aGlzOiBXZSB3YW50IHRvCgoxKSBuZXZlciBmaWxl
IGEgY2lidWdsb2cgZmlsdGVyIG9uIFRBSU5UX01BQ0hJTkVfQ0hFQ0suIFdlIHdhbnQgdGhhdCB0
byBhbHdheXMgYmUgY3JpdGljYWwuCjIpIGlmIHdlIGdldCB0aGF0IGFib3J0LCByZXBsYWNlIHRo
ZSBody4KCldoZXRoZXIgdGhhdCdzIHBvc3NpYmxlIGRlcGVuZHMgb24gd2hlbi9pZiB3ZSBnZXQg
dGhhdCBwYXJ0aWN1bGFyIHRhaW50IGhhcHBlbmluZy4uLgoKCi0tIApQZXRyaSBMYXR2YWxhCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFp
bGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
