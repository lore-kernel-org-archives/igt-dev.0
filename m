Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <7c5d12f9-be40-6c2e-5416-335eed9b53ee@linux.intel.com>
References: <20180713105945.17445-1-chris@chris-wilson.co.uk>
 <7c5d12f9-be40-6c2e-5416-335eed9b53ee@linux.intel.com>
Message-ID: <153149420895.24385.18031914352012229197@skylake-alporthouse-com>
Date: Fri, 13 Jul 2018 16:03:29 +0100
Subject: Re: [igt-dev] [PATCH i-g-t v2] igt/gem_userptr: Check read-only
 mappings
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOC0wNy0xMyAxNTo1MTo1MCkKPiAKPiBPbiAxMy8w
Ny8yMDE4IDExOjU5LCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gPiArICAgICAvKiBOb3cgZW5mb3Jj
ZSByZWFkLW9ubHkgaGVuY2Vmb3J0aCAqLwo+ID4gKyAgICAgaWd0X2Fzc2VydChtcHJvdGVjdChz
cGFjZSwgdG90YWwsIFBST1RfUkVBRCkgPT0gMCk7Cj4gCj4gSWYgcmhhbmRsZSB3YXMgc3RpbGwg
YWxpdmUsIHdvdWxkIHRoaXMgdHJpZ2dlciB0aGUgbW11IG5vdGlmaWVyIAo+IGludmFsaWRhdGlv
bj8gU29tZXRoaW5nIHRvIGNoZWNrIG1heWJlLCBpZiB0aGVyZSBpcyBzdWNoIGhvb2suCgpCdXQg
ZnJvbSByaGFuZGxlJ3MgcG9pbnQgb2Ygdmlldywgbm90IG11Y2ggaGFwcGVucy4gSXQncyBqdXN0
IGEgcmVndWxhcgppbnZhbGlkYXRpb24gYW5kIHJlY292ZXJ5LCBJIHRoaW5rIGNvdmVyZWQgYnkg
dGhlIG1tYXAtaW52YWxpZGF0ZSB0ZXN0cy4KCj4gPiArCj4gPiArICAgICAvKiBDaGVjayB0aGF0
IHdlIGRpc2FsbG93IHJlbW92aW5nIHRoZSByZWFkb25seSBwcm90ZWN0aW9uICovCj4gCj4gV2hh
dCBkb2VzIGl0IG1lYW4gdGhhdCB3ZSBhcmUgZGlzYWxsb3dpbmcgaXQ/IElzIGl0IG1vcmUgdGhh
dCB3ZSBhcmUgCj4gb2JsaXZpb3VzIHRvIGl0IChmb3JtIHRoZSB1c2VycHRyIGJvIHBvaW50IG9m
IHZpZXcpPwoKTm8sIHRoYXQgbXByb3RlY3QoUFJPVF9XUklURSkgcmVwb3J0cyBhbiBlcnJvciBp
ZiB5b3UgdHJ5IHRvIGNoYW5nZSB0aGUKcHJvdGVjdGlvbiBmcm9tIFBST1RfUkVBRCwgc28geW91
IGFyZSBub3QgYWxsb3dlZCB0byBjcmVhdGUKbW1hcF9ndHQoUFJPVF9XUklURSkgaW50byBhIHJl
YWQtb25seSB1c2VycHRyLCBub3IgYXJlIHlvdSBhbGxvd2VkIHRvCmdldCBhcm91bmQgdGhhdCBy
ZXN0cmljdGlvbiBieSBjaGFuZ2luZyB0aGUgQ1BVIFBURSBwcm90ZWN0aW9uIGxhdGVyLgotQ2hy
aXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRl
diBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
