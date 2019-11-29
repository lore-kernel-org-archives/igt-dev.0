Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ECEF6E8D7
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Nov 2019 10:46:20 +0000 (UTC)
Date: Fri, 29 Nov 2019 11:46:17 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20191129104617.GA8090@zkempczy-mobl2>
References: <20191129093653.7392-1-zbigniew.kempczynski@intel.com>
 <157502242840.14329.16041173636102175191@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <157502242840.14329.16041173636102175191@skylake-alporthouse-com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/gem_render_copy: Add software
 tiling / detiling support
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjksIDIwMTkgYXQgMTA6MTM6NDhBTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFF1b3RpbmcgWmJpZ25pZXcgS2VtcGN6ecWEc2tpICgyMDE5LTExLTI5IDA5OjM2OjUz
KQo+ID4gT2xkZXIgR0VOcyBoYXZlIG1tYXBhYmxlIEdHVFQgd2hpY2ggZG9lcyBidWZmZXIgdGls
aW5nIC8gZGV0YWxpbmcKPiA+IGF1dG9tYXRpY2FsbHkuIE5ld2VyIEdFTnMgaGF2ZSBsb29zZXMg
dGhpcyBwb3NzaWJpbGl0eSBzbyBzb2Z0d2FyZQo+ID4gdGlsaW5nIC8gZGV0aWxpbmcgaXMgcmVx
dWlyZWQuCj4gCj4gQSBidW5jaCBvZiB0cml2aWFsIGNoZWNrcyB0byBlbnN1cmUgaWRlbXBvdGVu
Y2UgKGkuZSBsaW5lYXIgLT4gWCAtPgo+IGxpbmVhcikgd2l0aCA0SyBhbmQgMk0gYW5kIGEgYnVu
Y2ggb2YgdGlsaW5nIHN0cmlkZXMgd291bGQgYmUgdXNlZnVsLgo+IAo+IE5vdGUgdGhhdCB0aGVz
ZSBmdW5jdGlvbnMgb25seSBjb3JyZXNwb25kIHRvIEhXIGRldGlsaW5nIHdoZW4gc3dpenpsaW5n
Cj4gaXMgb2ZmIC0tIHlvdSBjYW4gYXNrIHRoZSBrZXJuZWwgdmlhIEdFVF9USUxJTkdfSU9DVEwu
Cj4gLUNocmlzCgpJIHRob3VnaHQgYWJvdXQgYWJvdmUgY2hlY2suIEJ1dCB0aGlzIHdvdWxkIHRp
ZSBteSBoYW5kcyBpZiBJIHdvdWxkIGxpa2UKdG8gdXNlIG1peCBzb2Z0d2FyZSB0aWxpbmcgLyBo
dyBkZXRpbGluZy4gVGh1cyBJIGRlY2lkZWQgdG8gc2V0IGZ1bmN0aW9uCnBvaW50ZXJzIG1hbnVh
bGx5IGFjY29yZGluZyB0byBnZW5lcmF0aW9uLiAKCklmIEkgZ29vZCB1bmRlcnN0YW5kIHlvdToK
WW91IHN1Z2dlc3QgdG8gY3JlYXRlIHNpbmdsZSBzdHJ1Y3R1cmUgKGluc3RlYWQgb2YgYXJyYXlz
KSwgZGV0ZWN0IGh3CnRpbGluZy9kZXRpbGluZyBjYXBhYmlsaXRpZXMgZm9yIGVhY2ggc3VwcG9y
dGVkIHRpbGUgKFggLyBZKQphbmQgZmlsbCBhcHByb3ByaWF0ZSBmdW5jdGlvbnM/CgpCdXQgSSBz
dGlsbCBuZWVkIHNvbWUgdGFibGUgY29udGFpbmluZyBpbmZvcm1hdGlvbiBhYm91dCBhbGwgdGls
ZSBmb3JtYXRzCkhXIHN1cHBvcnRzIChmb3IgZXhhbXBsZSBZZiBvbiBHZW45KyBldmVuIGlmIHdl
IGNhbid0IHB1dCBpdCB2aWEgCmd0dCwgYmVjYXVzZSBpdCB3b24ndCB0aWxlIGl0IGluIHRoZSBm
bHkpLiBJbiB0aGlzIHNpdHVhdGlvbiBJIGRvbid0IAprbm93IGlzIGl0IHBvc3NpYmxlIHRvIGFz
ayB0aGUgSFcgYWJvdXQgaXMgaXQgc3VwcG9ydHMgWWYgZm9ybWF0KS4KClpiaWduaWV3Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGlu
ZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
