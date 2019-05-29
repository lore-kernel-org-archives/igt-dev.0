Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190529095805.31851-1-chris@chris-wilson.co.uk>
References: <20190529095805.31851-1-chris@chris-wilson.co.uk>
Message-ID: <155912402331.13891.1045661762085098623@skylake-alporthouse-com>
Date: Wed, 29 May 2019 11:00:23 +0100
Subject: Re: [Intel-gfx] [PATCH i-g-t] i915/gem_workarounds: Verify regs
 directly
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMTktMDUtMjkgMTA6NTg6MDUpCj4gSXQgc2VlbXMgbGlr
ZSB0aGUgSFcgdmFsaWRhdG9yIGlzIGdldHRpbmcgYmV0dGVyIGF0IHByZXZlbnRpbmcgb3VyCj4g
c25vb3Bpbmcgb2Ygc3lzdGVtIHJlZ2lzdGVycyBmcm9tIG5vbi1wcml2aWxlZ2VkIGJhdGNoZXMh
IElmIHdlIGNhbid0Cj4gdXNlIFNSTSwgbGV0J3MgcHJvYmUgdGhlIHJlZ2lzdGVyIGRpcmVjdGx5
IHRocm91Z2ggbW1pbywgbWFraW5nIHN1cmUgd2UKPiBoYXZlIHRoZSBjb250ZXh0IHNwaW5uaW5n
IG9uIHRoZSBHUFUgZmlyc3QuCj4gCj4gdjI6IEhvbGQgZm9yY2V3YWtlIGp1c3QgaW4gY2FzZSB0
aGUgc3Bpbm5pbmcgYmF0Y2ggaXNuJ3QgZW5vdWdoIHRvCj4ganVzdGlmeSBvdXIgcmVnaXN0ZXIg
YWNjZXNzLgo+IAo+IEJ1Z3ppbGxhOiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3df
YnVnLmNnaT9pZD0xMTA1NDQKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNo
cmlzLXdpbHNvbi5jby51az4KPiBDYzogTWF0dGhldyBBdWxkIDxtYXR0aGV3LndpbGxpYW0uYXVs
ZEBnbWFpbC5jb20+CgpDYXJyaWVkIG92ZXIgZnJvbSB2MSwKUmV2aWV3ZWQtYnk6IE1hdHRoZXcg
QXVsZCA8bWF0dGhldy53aWxsaWFtLmF1bGRAZ21haWwuY29tPgotQ2hyaXMKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlz
dApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4
