Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A4226F0D6
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Jun 2018 20:39:18 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20180606201642.24618-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20180606201642.24618-1-ville.syrjala@linux.intel.com>
Message-ID: <152831755293.9058.4316724533213711795@mail.alporthouse.com>
Date: Wed, 06 Jun 2018 21:39:12 +0100
Subject: Re: [igt-dev] [PATCH i-g-t 1/4] lib/igt_matrix: Unroll and inline
 igt_matrix_transform()
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
To: Ville Syrjala <ville.syrjala@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBWaWxsZSBTeXJqYWxhICgyMDE4LTA2LTA2IDIxOjE2OjM5KQo+IEZyb206IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gCj4gVXNpbmcgdGhl
IGN1cnJlbnQgaWd0X21hdHJpeCBmb3IgTlYxMiBjb252ZXJzaW9uIGVuZHMgdXAgYmVpbmcKPiBh
Ym91dCA0eCBhcyBzbG93IGFzIHRoZSBjdXJyZW50IG5vbi1pZ3RfbWF0cml4IGJhc2VkIGNvZGUu
IFVucm9sbGluZwo+IGFuZCBpbmxpbmluZyBpZ3RfbWF0cml4X3RyYW5zZm9ybSgpIGltcHJvdmVz
IHRoYXQgZmFjdG9yIHRvIH4xLjV4Lgo+IAo+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRl
bi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrD
pGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+ClJldmlld2VkLWJ5OiBDaHJpcyBX
aWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KLUNocmlzCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
