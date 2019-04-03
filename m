Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67EF66E850
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2019 08:46:12 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id h22so14130904edw.7
 for <igt-dev@lists.freedesktop.org>; Wed, 03 Apr 2019 01:46:12 -0700 (PDT)
Date: Wed, 3 Apr 2019 10:46:08 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20190403084608.GW2665@phenom.ffwll.local>
References: <20190403002012.24691-1-jose.souza@intel.com>
 <155427524355.24691.15103983580795112572@skylake-alporthouse-com>
 <20190403084009.GU2665@phenom.ffwll.local>
 <155428092364.24691.7423128471320073691@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <155428092364.24691.7423128471320073691@skylake-alporthouse-com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests: Remove i915_missed_irq
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
Cc: igt-dev@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBBcHIgMDMsIDIwMTkgYXQgMDk6NDI6MDNBTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFF1b3RpbmcgRGFuaWVsIFZldHRlciAoMjAxOS0wNC0wMyAwOTo0MDowOSkKPiA+IE9u
IFdlZCwgQXByIDAzLCAyMDE5IGF0IDA4OjA3OjIzQU0gKzAxMDAsIENocmlzIFdpbHNvbiB3cm90
ZToKPiA+ID4gUXVvdGluZyBKb3PDqSBSb2JlcnRvIGRlIFNvdXphICgyMDE5LTA0LTAzIDAxOjIw
OjEyKQo+ID4gPiA+IGk5MTVfcmluZ19taXNzZWRfaXJxIHdhcyByZW1vdmVkIGZyb20gZGVidWdm
cyBpbiBrZXJuZWwgcGF0Y2gKPiA+ID4gPiA3ODk2NTlmNDMwN2EgKCJkcm0vaTkxNTogRHJvcCBm
YWtlIGJyZWFkY3J1bWIgaXJxIikgYW5kIGl0IHdhcyB0aGUKPiA+ID4gPiBiYXNlIG9mIHdoaWNo
IGk5MTVfbWlzc2VkX2lycSB3YXMgd3JpdHRlbiwgc28gcmVtb3ZpbmcgdGhpcyB0ZXN0IGZvcgo+
ID4gPiA+IGdvb2QuCj4gPiA+IAo+ID4gPiBIYXMgaXQgYmVlbiByZW1vdmVkIGZyb20gYWxsIHRy
ZWVzIHlldD8gSXMgaXQgZXZlbiBnb25lIGZyb20gTGludXM/Cj4gPiAKPiA+IFdlIHdvbid0IGJl
IGFibGUgdG8gcmVtb3ZlIGl0IGZyb20gb2xkZXIgaWd0IHJlbGVhc2VzIGVpdGhlciAuLi4gSSB0
aGluawo+ID4gd2UnbGwgYmUgZmluZS4KPiAKPiBJIHdhcyBtb3JlIGN1cmlvdXMgaWYgaXQgaXMg
c3RpbGwgaW4gdXNlIGZvciBhbnkgb2YgdGhlIENJIHRyZWVzIC0gSQo+IHRoaW5rIHRoZSBvbGRl
c3Qgb2Ygd2hpY2ggd2UgdGVzdCBpcyBsaW51cy4KCkdvb2QgcG9pbnQuIFNlZW1zIHRvIGJlIGdv
bmUgZnJvbSBMaW51cycgdHJlZSB0b28sIHdoaWNoIGlzIHRoZSBsYXN0IG9uZQp3ZSBjYXJlIGFi
b3V0IEkgdGhpbmsuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIs
IEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaWd0LWRldg==
