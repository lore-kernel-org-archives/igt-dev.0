Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42BD86E0D3
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2020 13:33:06 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200831133049.37017-41-zbigniew.kempczynski@intel.com>
References: <20200831133049.37017-1-zbigniew.kempczynski@intel.com>
 <20200831133049.37017-41-zbigniew.kempczynski@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 10 Sep 2020 14:33:02 +0100
Message-ID: <159974478237.17261.8381658425839007078@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t v33 40/40] lib/intel_bufops: address
 review comments (clarify buffer ownership rules)
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
To: zbigniew.kempczynski@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBaYmlnbmlldyBLZW1wY3p5xYRza2kgKDIwMjAtMDgtMzEgMTQ6MzA6NDkpCj4gVG8g
YXZvaWQgaW50ZWxfYnVmIGhhbmRsZSBsZWFrYWdlIHdlIG5lZWQgdG8gY2xhcmlmeSBvZiBidWZm
ZXIgb3duZXJzaGlwCj4gcnVsZXMuIFNvIHdlIGN1cnJlbnRseSBoYXZlOgo+IAo+IDEuIGludGVs
X2J1Zl9pbml0KCksIGludGVsX2J1Zl9jcmVhdGUoKSB3aGljaCBjcmVhdGUgaGFuZGxlIGFuZCB0
YWtlCj4gICAgb3duZXJzaGlwIG9mIHN1Y2ggaGFuZGxlLgo+IDIuIGludGVsX2J1Zl9pbml0X3Vz
aW5nX2hhbmRsZSgpLCBpbnRlbF9idWZfY3JlYXRlX3VzaW5nX2hhbmRsZSgpIHdoaWNoCj4gICAg
dGFrZSBibyBoYW5kbGUgZnJvbSB0aGUgY2FsbGVyIGFuZCBkb2Vzbid0IHRha2Ugb3duZXJzaGlw
Lgo+IAo+IGludGVsX2J1Zl9jbG9zZSgpL2ludGVsX2J1Zl9kZXN0cm95KCkgd2lsbCBob25vdXIg
b3duZXJzaGlwIGFuZCBza2lwCj4gY2xvc2luZyBoYW5kbGUgaWYgYnVmZmVyIGlzIG5vdCBvd25l
ZC4KPiAKPiBUbyB0YWtlL3JlbGVhc2UgYnVmZmVyIG93bmVyc2hpcCBpbnRlbF9idWZfc2V0X293
bmVyc2hpcCgpIGNhbiBiZSB1c2VkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFpiaWduaWV3IEtlbXBj
ennFhHNraSA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPgo+IENjOiBEb21pbmlrIEdy
emVnb3J6ZWsgPGRvbWluaWsuZ3J6ZWdvcnpla0BpbnRlbC5jb20+Cj4gQ2M6IENocmlzIFdpbHNv
biA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgoKT2ssIHRoZSBjaGFuZ2VzIGxvb2sgZmluZSwg
SSBkaWRuJ3QgZmluZCBhbnl0aGluZyBlbHNlIHRvIGNvbXBsYWluIGFib3V0CmFuZCB0aGUgb25s
eSB0ZXN0IHRoYXQgZmFpbGVkIGluIGxvY2FsIHRlc3Rpbmcgd2FzIGdlbV9jb25jdXJyZW50X2Js
aXQsCnNvIGhhdmUgYQpSZXZpZXdlZC1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxz
b24uY28udWs+CmZvciB0aGUgc2VyaWVzICh3aXRoIHRoZSBleGNlcHRpb24gb2YgdGhlIGNoYW5n
ZXMgdG8KZ2VtX2NvbmN1cnJlbnRfYWxsLmMpCgpEbyB5b3Ugd2FudCB0byBzcXVhc2ggdGhlIGZp
eHVwcyBhbmQgZHJvcCB0aGUgdW5yZWFkeSBwYXRjaCBmb3IgbWVyZ2luZz8KLUNocmlzCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGlu
ZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
