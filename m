Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 556E96E033
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Apr 2019 11:44:41 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id g6so16728011edc.8
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Apr 2019 04:44:41 -0700 (PDT)
Date: Wed, 17 Apr 2019 13:44:37 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20190417114437.GS13337@phenom.ffwll.local>
References: <20190416232548.13755-1-lyude@redhat.com>
 <20190416232548.13755-6-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190416232548.13755-6-lyude@redhat.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 5/8] lib/igt_core: Just use
 igt_can_fail() in __igt_run_subtest()
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
To: Lyude <lyude@redhat.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBBcHIgMTYsIDIwMTkgYXQgMDc6MjU6NDVQTSAtMDQwMCwgTHl1ZGUgd3JvdGU6Cj4g
RnJvbTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KPiAKPiBUaGF0J3Mgd2hhdCBpdCdz
IHRoZXJlIGZvci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQu
Y29tPgo+IC0tLQo+ICBsaWIvaWd0X2NvcmUuYyB8IDQgKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3Rf
Y29yZS5jIGIvbGliL2lndF9jb3JlLmMKPiBpbmRleCBhNjM3Yjk0ZS4uNTAzNTAzY2UgMTAwNjQ0
Cj4gLS0tIGEvbGliL2lndF9jb3JlLmMKPiArKysgYi9saWIvaWd0X2NvcmUuYwo+IEBAIC05MDMs
OSArOTAzLDcgQEAgYm9vbCBfX2lndF9ydW5fc3VidGVzdChjb25zdCBjaGFyICpzdWJ0ZXN0X25h
bWUpCj4gIHsKPiAgCWludCBpOwo+ICAKPiAtCWlndF9pbnRlcm5hbF9hc3NlcnQoIWluX3N1YnRl
c3QpOwo+IC0JaWd0X2ludGVybmFsX2Fzc2VydCghaW5fZml4dHVyZSk7Cj4gLQlpZ3RfaW50ZXJu
YWxfYXNzZXJ0KHRlc3Rfd2l0aF9zdWJ0ZXN0cyk7Cj4gKwlpZ3RfaW50ZXJuYWxfYXNzZXJ0KCFp
Z3RfY2FuX2ZhaWwoKSk7CgpOaWNlIQoKUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmll
bC52ZXR0ZXJAZmZ3bGwuY2g+Cgo+ICAKPiAgCS8qIGNoZWNrIHRoZSBzdWJ0ZXN0IG5hbWUgb25s
eSBjb250YWlucyBhLXosIEEtWiwgMC05LCAnLScgYW5kICdfJyAqLwo+ICAJZm9yIChpID0gMDsg
c3VidGVzdF9uYW1lW2ldICE9ICdcMCc7IGkrKykKPiAtLSAKPiAyLjIwLjEKPiAKPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGlndC1kZXYgbWFpbGlu
ZyBsaXN0Cj4gaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYKCi0tIApEYW5pZWwgVmV0dGVy
ClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5j
aApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2
IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
