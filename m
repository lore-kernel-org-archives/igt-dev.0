Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE046E91C
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Feb 2018 10:05:01 +0000 (UTC)
References: <20180228091403.48521-1-maarten.lankhorst@linux.intel.com>
 <151980973264.21577.5101436321063249390@mail.alporthouse.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <d8651410-f738-38f1-7f10-87a09ae51070@linux.intel.com>
Date: Wed, 28 Feb 2018 11:04:59 +0100
MIME-Version: 1.0
In-Reply-To: <151980973264.21577.5101436321063249390@mail.alporthouse.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_draw: Fix bo leak in gpu draw
 routines
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
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T3AgMjgtMDItMTggb20gMTA6MjIgc2NocmVlZiBDaHJpcyBXaWxzb246Cj4gUXVvdGluZyBNYWFy
dGVuIExhbmtob3JzdCAoMjAxOC0wMi0yOCAwOToxNDowMykKPj4gZ2VtX2hhbmRsZV90b19saWJk
cm1fYm8gY3JlYXRlcyBhIG5ldyBoYW5kbGUgdGhyb3VnaCB0aGUgdXNlIG9mIGZsaW5rLAo+PiB3
aGljaCBtYWtlcyBrbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcgdGhyb3VnaCBhIHNpbmdsZSBydW4g
bm90IGNvbXBsZXRlCj4+IHdoZW4gaXQgc3RhcnRzIGxlYWtpbmcgNTBNQiBvYmplY3RzLiBBZGQg
dGhlIG1pc3NpbmcgYm9fdW5yZWYgdG8ga2lsbAo+PiB0aGUgZHVwbGljYXRlZCBoYW5kbGUgYW5k
IGZpeCB0aGUgbGVha3MhCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxt
YWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4+IENjOiBDaHJpcyBXaWxzb24gPGNo
cmlzQGNocmlzLXdpbHNvbi5jby51az4KPiAzIGdlbV9oYW5kbGVfdG9fbGliZHJtX2JvLCAzIHVu
cmVmcy4KPiBSZXZpZXdlZC1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28u
dWs+Cj4gLUNocmlzCgpUaGFua3MsIHB1c2hlZC4gOikKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaWd0LWRldgo=
