Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F2F56E576
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Nov 2018 17:17:45 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id j6so2533610edp.9
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Nov 2018 09:17:45 -0800 (PST)
Date: Thu, 29 Nov 2018 18:17:41 +0100
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20181129171741.GO21184@phenom.ffwll.local>
References: <20181128225231.29228-1-chris@chris-wilson.co.uk>
 <20181129171648.GN21184@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181129171648.GN21184@phenom.ffwll.local>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib: Defer application of
 igt_fixture results
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjksIDIwMTggYXQgMDY6MTY6NDhQTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBXZWQsIE5vdiAyOCwgMjAxOCBhdCAxMDo1MjozMFBNICswMDAwLCBDaHJpcyBX
aWxzb24gd3JvdGU6Cj4gPiBJZiBhbiBpZ3RfZml4dHVyZSBjYXVzZXMgYW4gaW5kZXBlbmRlbnQg
c3ViZ3JvdXAgdG8gZmFpbC9za2lwIGFuZCB0aGF0Cj4gPiBzdWJncm91cCBpcyBub3QgcGFydCBv
ZiB0aGUgZXhlY3V0aW9uIHNldCAoLS1ydW4tc3VidGVzdCkgYXMgbm8gc3VidGVzdHMKPiA+IHRo
ZW1zZWx2ZXMgZmFpbGVkIG9yIHNraXBwZWQsIGl0IHNob3VsZCBub3QgY291bnQgdG93YXJkcyB0
aGUgb3ZlcmFsbAo+ID4gdGVzdCBleGl0Y29kZS4KPiA+IAo+ID4gQnVnemlsbGE6IGh0dHBzOi8v
YnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTEwODg5MQo+ID4gU2lnbmVkLW9m
Zi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gCj4gSSdtIGhv
bmVzdGx5IGEgYml0IGxvc3Qgb24gd2hhdCdzIGdvaW5nIG9uIGhlcmUuIENvdWxkIHlvdSBwbGVh
c2Ugd3JpdGUgYQo+IG5ldyBsaWJyYXJ5IHRlc3RjYXNlIGZvciB0aGlzIG9uZSBoZXJlLCBhcyBk
ZW1vbnN0cmF0b3I/IEZvciBzdHVmZiBsaWtlCj4gdGhpcyBJIHJlYWxseSB3YW50IHRvIGxvY2sg
YmVoYXZpb3VyIGRvd24gd2l0aCBjb21waWxlLXRpbWUgdGVzdGNhc2VzLgoKRm9yZ290IHRvIGFk
ZDogVGhleSdyZSBpbiBsaWIvdGVzdHMvCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdh
cmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGlu
ZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
