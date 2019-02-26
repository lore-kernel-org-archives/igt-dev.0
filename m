Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E9A89F92
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Feb 2019 17:46:20 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190226173044.19664-1-antonio.argenziano@intel.com>
References: <20190226173044.19664-1-antonio.argenziano@intel.com>
Message-ID: <155120316298.17933.16778609539581384137@skylake-alporthouse-com>
Date: Tue, 26 Feb 2019 17:46:08 +0000
Subject: Re: [igt-dev] [PATCH i-g-t v3] lib/i915: Move mmap IOCTLs wrappers
 into separate file
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
To: Antonio Argenziano <antonio.argenziano@intel.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBbnRvbmlvIEFyZ2Vuemlhbm8gKDIwMTktMDItMjYgMTc6MzA6NDQpCj4gTW92ZSBh
bGwgbW1hcCBmbGF2b3VycyBhbmQgc3VwcG9ydCBmdW5jdGlvbiB0byBzZXBhcmF0ZSBmaWxlIGlu
IGk5MTUKPiBmb2xkZXIuIFRoaXMgaGVscHMgd2l0aCBtb3ZpbmcgaTkxNSBzcGVjaWZpYyBmdW5j
dGlvbnMgYXdheSBmcm9tIGNvbW1vbgo+IGxpYnJhcmllcy4KPiAKPiB2MjoKPiAgICAgICAgIC0g
QXV0b3Rvb2xzIHN0aWxsIGV4aXN0cy4gKFBldHJpKQo+ICAgICAgICAgLSBJbmNsdWRlIGdlbV9t
bWFuLmggZGlyZWN0bHkuIChDaHJpcykKPiAKPiB2MzoKPiAgICAgICAgIC0gS2VlcCBpbmNsdWRl
cyBleHBsaWNpdC4gKENocmlzKQo+IAo+IFNpZ25lZC1vZmYtYnk6IEFudG9uaW8gQXJnZW56aWFu
byA8YW50b25pby5hcmdlbnppYW5vQGludGVsLmNvbT4KPiBDYzogQ2hyaXMgV2lsc29uIDxjaHJp
c0BjaHJpcy13aWxzb24uY28udWs+Cj4gQ2M6IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFA
aW50ZWwuY29tPgoKVmVyeSBkaXNhcHBvaW50aW5nLCBJIGZvdW5kIG5vdGhpbmcgdG8gY29tcGxh
aW4gYWJvdXQuClJldmlld2VkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5j
by51az4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
