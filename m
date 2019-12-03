Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE856E480
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Dec 2019 11:39:27 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20191203104457.20176-1-petri.latvala@intel.com>
References: <20191203104457.20176-1-petri.latvala@intel.com>
Message-ID: <157537316057.7230.377097231544921928@skylake-alporthouse-com>
Date: Tue, 03 Dec 2019 11:39:20 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] runner: Actually ping watchdogs
 every interval
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
To: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBQZXRyaSBMYXR2YWxhICgyMDE5LTEyLTAzIDEwOjQ0OjU2KQo+IFRoZSBzcGxpdCB0
byB0aW1lb3V0IGludGVydmFscyB3YXMgbWFkZSB0byBhY2NvbW9kYXRlIGZvciB3YXRjaGRvZ3MK
PiB0aGF0IGNhbm5vdCB1c2UgYSB0aW1lb3V0IGFzIGhpZ2ggYXMgd2Ugd2FudGVkLiBBY3R1YWxs
eSB1c2luZyB0aGF0Cj4gZmVhdHVyZSByZXF1aXJlcyB1cyB0byBwaW5nIHRoZSB3YXRjaGRvZyBl
dmVyeSBpbnRlcnZhbCBldmVuIHRob3VnaCB3ZQo+IGhhbmRsZSBhY3R1YWwgdGltZW91dGluZyBh
ZnRlciBhbGwgaW50ZXJ2YWxzIGFyZSB1c2VkIHVwLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBldHJp
IExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgo+IENjOiBBcmthZGl1c3ogSGlsZXIg
PGFya2FkaXVzei5oaWxlckBpbnRlbC5jb20+CgpEb2Vzbid0IGxvb2sgaGFybWZ1bC4gVGhlIGlt
cGxpY2F0aW9uIGlzIHRoYXQgd2UgcGluZyB0aGUgd2F0Y2hkb2cgZm9yCnNvbWUgY2FzZXMgd2hl
cmUgd2UgZGlkIG5vdCBwcmV2aW91c2x5LCBidXQgZm9yIGFzIGxvbmcgYXMgdGhlIHJ1bm5lcgpy
ZW1haW5zIGluIGNvbnRyb2xzLCB0aGF0IHNob3VsZCBub3QgYmUgYW4gaXNzdWUuCgpSZXZpZXdl
ZC1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Ci1DaHJpcwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxp
bmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
