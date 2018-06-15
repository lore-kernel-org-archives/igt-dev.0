Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9731F6EB11
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Jun 2018 09:07:59 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20180502092807.28266-1-chris@chris-wilson.co.uk>
 <152536655771.15663.15614570347092183928@jlahtine-desk.ger.corp.intel.com>
 <152537645311.16610.651740206977321997@mail.alporthouse.com>
In-Reply-To: <152537645311.16610.651740206977321997@mail.alporthouse.com>
Message-ID: <152905367466.18533.14125067136546431421@mail.alporthouse.com>
Date: Fri, 15 Jun 2018 10:07:54 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] igt/sw_sync: Wrap threaded counter
 manipulation with mb
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
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMTgtMDUtMDMgMjA6NDA6NTMpCj4gUXVvdGluZyBKb29u
YXMgTGFodGluZW4gKDIwMTgtMDUtMDMgMTc6NTU6NTcpCj4gPiBRdW90aW5nIENocmlzIFdpbHNv
biAoMjAxOC0wNS0wMiAxMjoyODowNykKPiA+ID4gQEAgLTU4OSwxMSArNTg5LDkgQEAgc3RhdGlj
IHZvaWQgKiB0ZXN0X3N5bmNfbXVsdGlfY29uc3VtZXJfcHJvZHVjZXJfdGhyZWFkKHZvaWQgKmFy
ZykKPiA+ID4gICAgICAgICAgICAgICAgIGlmIChzeW5jX2ZlbmNlX3dhaXQoZmVuY2UsIDEwMDAp
IDwgMCkKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuICh2b2lkICopIDE7Cj4g
PiA+ICAKPiA+ID4gLSAgICAgICAgICAgICAgIGlmICgqKGRhdGEtPmNvdW50ZXIpICE9IG5leHRf
cG9pbnQpCj4gPiA+ICsgICAgICAgICAgICAgICBpZiAoX19zeW5jX2ZldGNoX2FuZF9hZGQoZGF0
YS0+Y291bnRlciwgMSkgIT0gbmV4dF9wb2ludCkKPiA+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgcmV0dXJuICh2b2lkICopIDE7Cj4gPiA+ICAKPiA+ID4gLSAgICAgICAgICAgICAgICgqZGF0
YS0+Y291bnRlcikrKzsKPiA+IAo+ID4gVGhpcyBpcyBhIGJlaGF2aW9yIGNoYW5nZSwgdGhlIGNv
dW50ZXIgZ2V0cyBpbmNyZW1lbnRlZCBhbHdheXMgOigKPiAKPiBCdXQgaXQgZG9lc24ndCBtYXR0
ZXIsIHNpbmNlIHRoZSByZXR1cm4gMSBoZXJlIGlzIGZhaWx1cmUuIEFuZCBhbnkKPiB0aHJlYWQg
cmVwb3J0aW5nIGZhaWx1cmUgaXMgZW5vdWdoLgoKUG9rZS4KLUNocmlzCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0Cmln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
