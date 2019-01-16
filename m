Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <87r2ddx7bk.fsf@gaia.fi.intel.com>
References: <20190116093509.30195-1-chris@chris-wilson.co.uk>
 <87r2ddx7bk.fsf@gaia.fi.intel.com>
Message-ID: <154763269626.30063.2897361111833119934@skylake-alporthouse-com>
Date: Wed, 16 Jan 2019 09:58:16 +0000
Subject: Re: [Intel-gfx] [PATCH i-g-t 1/3] i915/gem_userptr_blits: Only
 mlock the memfd once, not the arena
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, matthew.auld@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBNaWthIEt1b3BwYWxhICgyMDE5LTAxLTE2IDA5OjQ3OjI3KQo+IENocmlzIFdpbHNv
biA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPiB3cml0ZXM6Cj4gCj4gPiBXZSBtdWx0aXBseSB0
aGUgbWVtZmQgNjRrIHRvIGNyZWF0ZSBhIDJHIGFyZW5hIHdoaWNoIHdlIHRoZW4gYXR0ZW1wdCB0
bwo+ID4gd3JpdGUgaW50byBhZnRlciBtYXJraW5nIHJlYWQtb25seS4gSG93dmVyLCB3aGVuIGl0
IGNvbWVzIHRvIHVubG9jayB0aGUKPiAKPiBzL0hvd3Zlci9Ib3dldmVyCj4gCj4gPiBhcmVuYSBh
ZnRlciB0aGUgdGVzdCwgcGVyZm9ybWFuY2UgdGFua3MgYXMgdGhlIGtlcm5lbCB0cmllcyB0byBy
ZXNvbHZlCj4gPiB0aGUgNjRrIHJlcGVhdGVkIG1hcHBpbmdzIG9udG8gdGhlIHNhbWUgc2V0IG9m
IHBhZ2VzLiAoTXVzdCBub3QgYmUgYQo+ID4gdmVyeSBjb21tb24gb3BlcmF0aW9uISkgV2UgY2Fu
IGdldCBhd2F5IHdpdGgganVzdCBtbG9ja2luZyB0aGUgYmFja2luZwo+ID4gc3RvcmUgdG8gcHJl
dmVudCBpdHMgZXZpY3Rpb24sIHdoaWNoIHNob3VsZCBwcmV2ZW50IHRoZSBhcmVuYSBtYXBwaW5n
Cj4gPiBmcm9tIGJlaW5nIGZyZWVkIGFzIHdlbGwuCj4gCj4gaG1tIHNob3VsZC4gSG93IGFyZSB0
aGV5IGJvdW5kPwoKQWxsIEknbSB3b3JyaWVkIGFib3V0IGFyZSB0aGUgYWxsb2NzIGZvciB0aGUg
cHVkL3BtZCBldGMsIHdoaWNoIGFpdWkgYXJlCm5vdCBmcmVlZCB1bnRpbCB0aGUgcHRlIGFyZSBy
ZW1vdmVkIGFuZCB0aGUgcHRlIHNob3VsZG4ndCBiZSByZWFwZWQKYmVjYXVzZSB0aGUgc3RydWN0
IHBhZ2UgYXJlIGxvY2tlZC4gSG93ZXZlciwgSSBoYXZlbid0IGFjdHVhbGx5IHZlcmlmaWVkCnRo
YXQgbWxvY2tpbmcgdGhlIHVuZGVybHlpbmcgcGFnZXMgaXMgZW5vdWdoIHRvIGJlIHN1cmUgdGhh
dCB0aGUgcGFnZQp0YWJsZXMgb2YgdGhlIHZhcmlvdXMgbWFwcGluZ3MgYXJlIHNhZmUgZnJvbSBl
dmljdGlvbi4gT24gdGhlIG90aGVyCmhhbmQsIG11bmxvY2tfdm1hX3JhbmdlIGRvZXNuJ3Qgc2Nh
bGUgdG8gdGhlIGFidXNlIHdlIHB1dCBpdCB0bywgYW5kCnRoYXQgaXMgY2F1c2luZyBpc3N1ZXMg
Zm9yIENJIQotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwt
Z2Z4Cg==
