Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3CD96E095
 for <igt-dev@lists.freedesktop.org>; Wed,  9 May 2018 20:45:48 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20180509203629.10409-1-antonio.argenziano@intel.com>
In-Reply-To: <20180509203629.10409-1-antonio.argenziano@intel.com>
Message-ID: <152589874312.8613.1119392407572962611@mail.alporthouse.com>
Date: Wed, 09 May 2018 21:45:43 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_dummyload: Fix possible NULL
 pointer dereference
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
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBbnRvbmlvIEFyZ2Vuemlhbm8gKDIwMTgtMDUtMDkgMjE6MzY6MjkpCj4gTWFrZSBz
dXJlIHRoYXQgb25lIG9mIHRoZSAnbW1hcCcgZnVuY3Rpb25zIHJldHVybnMgYSB2YWxpZCBwb2lu
dGVyIHRvCj4gYXZvaWQgZGVyZWZlcmVuY2luZyBhIE5VTEwgcG9pbnRlciBsYXRlciBvbi4gKElz
c3VlIGZvdW5kIHZpYSBjb3Zlcml0eSkKCk5vdCBtdWNoIG9mIGFuIGlzc3VlLCBpdCBkaWVzIG1v
bWVudHMgbGF0ZXIuIDotcAogCj4gU2lnbmVkLW9mZi1ieTogQW50b25pbyBBcmdlbnppYW5vIDxh
bnRvbmlvLmFyZ2Vuemlhbm9AaW50ZWwuY29tPgo+IC0tLQo+ICBsaWIvaWd0X2R1bW15bG9hZC5j
IHwgMiArKwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdp
dCBhL2xpYi9pZ3RfZHVtbXlsb2FkLmMgYi9saWIvaWd0X2R1bW15bG9hZC5jCj4gaW5kZXggYmE5
MTdiYTUuLmU5NmMwN2NmIDEwMDY0NAo+IC0tLSBhL2xpYi9pZ3RfZHVtbXlsb2FkLmMKPiArKysg
Yi9saWIvaWd0X2R1bW15bG9hZC5jCj4gQEAgLTEyNSw2ICsxMjUsOCBAQCBlbWl0X3JlY3Vyc2l2
ZV9iYXRjaChpZ3Rfc3Bpbl90ICpzcGluLCBpbnQgZmQsIHVpbnQzMl90IGN0eCwgdW5zaWduZWQg
ZW5naW5lLAo+ICAgICAgICAgaWYgKCFiYXRjaCkKPiAgICAgICAgICAgICAgICAgYmF0Y2ggPSBf
X2dlbV9tbWFwX19ndHQoZmQsIG9ialtCQVRDSF0uaGFuZGxlLAo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBCQVRDSF9TSVpFLCBQUk9UX1dSSVRFKTsKCk9yIGdlbV9t
bWFwX19ndHQoKS4gX18gd2FzIGp1c3QgZm9sbG93aW5nIHRoZSBwYXR0ZXJuLCBvdG9oIGxhY2sg
b2YgX18KaW5kaWNhdGVzIGZpbmFsIGp1c3QgYXMgd2VsbC4KLUNocmlzCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0Cmln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
