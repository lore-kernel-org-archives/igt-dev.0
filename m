Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7276C6E7D5
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2020 19:16:54 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20201027092317.18716-8-dominik.grzegorzek@intel.com>
References: <20201027092317.18716-1-dominik.grzegorzek@intel.com>
 <20201027092317.18716-8-dominik.grzegorzek@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 19 Nov 2020 19:16:50 +0000
Message-ID: <160581341055.3416.14538594793345635767@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t v5 07/14]
 i915/gem_unref_active_buffers.c: Remove libdrm dependency
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
To: Dominik Grzegorzek <dominik.grzegorzek@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBEb21pbmlrIEdyemVnb3J6ZWsgKDIwMjAtMTAtMjcgMDk6MjM6MTApCj4gVXNlIGlu
dGVsX2JiIC8gaW50ZWxfYnVmIHRvIHJlbW92ZSBsaWJkcm0gZGVwZW5kZW5jeS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBEb21pbmlrIEdyemVnb3J6ZWsgPGRvbWluaWsuZ3J6ZWdvcnpla0BpbnRlbC5j
b20+Cj4gUmV2aWV3ZWQtYnk6IFpiaWduaWV3IEtlbXBjennFhHNraSA8emJpZ25pZXcua2VtcGN6
eW5za2lAaW50ZWwuY29tPgo+IENjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5j
by51az4KClB1c2hlZCB0aGUgc2VyaWVzIGV4Y2VwdCBmb3IgdGhlc2UgdHdvIGFjdGl2ZV9idWZm
ZXJzIHBhdGNoZXMuIFRoZXNlCm5lZWQgYSBsaXR0bGUgbW9yZSB3b3JrLCBhbmQgYSBjbG9zZXIg
bG9vay4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
