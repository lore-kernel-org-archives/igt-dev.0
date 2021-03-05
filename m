Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A593C6EB54
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Mar 2021 14:56:39 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20210301161403.98278-32-zbigniew.kempczynski@intel.com>
References: <20210301161403.98278-1-zbigniew.kempczynski@intel.com>
 <20210301161403.98278-32-zbigniew.kempczynski@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 05 Mar 2021 14:56:35 +0000
Message-ID: <161495619591.8241.8892957359944874082@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t v21 31/35] tests/gem_mmap_offset: Use
 intel_buf wrapper code instead direct
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

UXVvdGluZyBaYmlnbmlldyBLZW1wY3p5xYRza2kgKDIwMjEtMDMtMDEgMTY6MTM6NTkpCj4gR2Vu
ZXJhbGx5IHdoZW4gcGxheWluZyB3aXRoIGludGVsX2J1ZiB3ZSBzaG91bGQgdXNlIHdyYXBwZXIg
Y29kZQo+IGluc3RlYWQgb2YgYWRkaW5nIGl0IHRvIGludGVsX2JiIGRpcmVjdGx5LiBDb2RlIGNo
ZWNrcyByZXF1aXJlZAo+IGFsaWdubWVudCBvbiBzcGVjaWZpYyBnZW5zIHNvIHByb3RlY3RzIHVz
IGZyb20gcGFzc2luZyB1bmFsaWduZWQKPiBwcm9wZXJseSBhZGRyZXNzZXMuCj4gCj4gU2lnbmVk
LW9mZi1ieTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRl
bC5jb20+Cj4gQ2M6IERvbWluaWsgR3J6ZWdvcnplayA8ZG9taW5pay5ncnplZ29yemVrQGludGVs
LmNvbT4KPiBDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+ClJldmll
d2VkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KLUNocmlzCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFp
bGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
