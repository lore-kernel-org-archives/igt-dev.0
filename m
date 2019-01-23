Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B50C6E4F2
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jan 2019 12:07:37 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id f23so1506348edb.3
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jan 2019 04:07:36 -0800 (PST)
Date: Wed, 23 Jan 2019 13:07:32 +0100
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20190123120732.GL3271@phenom.ffwll.local>
References: <20190123010950.25867-1-jose.souza@intel.com>
 <20190123113719.GB4038@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190123113719.GB4038@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/2] tests/intel-ci: Add basic PSR2
 tests to fast feedback test list
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
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>, igt-dev@lists.freedesktop.org, Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBKYW4gMjMsIDIwMTkgYXQgMDE6Mzc6MTlQTSArMDIwMCwgUGV0cmkgTGF0dmFsYSB3
cm90ZToKPiBPbiBUdWUsIEphbiAyMiwgMjAxOSBhdCAwNTowOTo0OVBNIC0wODAwLCBKb3PDqSBS
b2JlcnRvIGRlIFNvdXphIHdyb3RlOgo+ID4gTGV0cyBydW4gdGhlIHNhbWUgUFNSMSBiYXNpYyB0
ZXN0cyBmb3IgUFNSMiB0byBjYXVnaHQgUFNSMgo+ID4gcmVncmVzc2lvbnMgZmFzdGVyLgo+ID4g
Cj4gPiBDYzogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPgo+ID4gQ2M6IERo
aW5ha2FyYW4gUGFuZGl5YW4gPGRoaW5ha2FyYW4ucGFuZGl5YW5AaW50ZWwuY29tPgo+ID4gU2ln
bmVkLW9mZi1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+
Cj4gPiAtLS0KPiA+ICB0ZXN0cy9pbnRlbC1jaS9mYXN0LWZlZWRiYWNrLnRlc3RsaXN0IHwgNCAr
KysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0t
Z2l0IGEvdGVzdHMvaW50ZWwtY2kvZmFzdC1mZWVkYmFjay50ZXN0bGlzdCBiL3Rlc3RzL2ludGVs
LWNpL2Zhc3QtZmVlZGJhY2sudGVzdGxpc3QKPiA+IGluZGV4IGRhM2M0YzhlLi5lNDhjYjhhNSAx
MDA2NDQKPiA+IC0tLSBhL3Rlc3RzL2ludGVsLWNpL2Zhc3QtZmVlZGJhY2sudGVzdGxpc3QKPiA+
ICsrKyBiL3Rlc3RzL2ludGVsLWNpL2Zhc3QtZmVlZGJhY2sudGVzdGxpc3QKPiA+IEBAIC0yMjcs
NiArMjI3LDEwIEBAIGlndEBrbXNfcHNyQHByaW1hcnlfcGFnZV9mbGlwCj4gPiAgaWd0QGttc19w
c3JAY3Vyc29yX3BsYW5lX21vdmUKPiA+ICBpZ3RAa21zX3BzckBzcHJpdGVfcGxhbmVfb25vZmYK
PiA+ICBpZ3RAa21zX3BzckBwcmltYXJ5X21tYXBfZ3R0Cj4gPiAraWd0QGttc19wc3JAcHNyMl9w
cmltYXJ5X3BhZ2VfZmxpcAo+ID4gK2lndEBrbXNfcHNyQHBzcjJfY3Vyc29yX3BsYW5lX21vdmUK
PiA+ICtpZ3RAa21zX3BzckBwc3IyX3Nwcml0ZV9wbGFuZV9vbm9mZgo+ID4gK2lndEBrbXNfcHNy
QHBzcjJfcHJpbWFyeV9tbWFwX2d0dAo+IAo+IAo+IFRoZSBCQVQgcmVzdWx0cyBtYWlsIHNhaWQg
c3VjY2VzcyBiZWNhdXNlIHRoZXNlIGFyZSBuZXcgdGVzdHMsIGJ1dCBkbwo+IG5vdGUgdGhhdCB0
aGV5IGZhaWxlZC4gVGhleSBtdXN0IHBhc3MgdG8gZ2V0IG9udG8gdGhlIEJBVCBsaXN0LgoKQWxz
bywgYWRkaW5nIGFsbCBraW5kcyBvZiB0ZXN0cyB0byBCQVQgdG8gdmFsaWRhdGUgZmVhdHVyZXMg
ZG9lc24ndCBzY2FsZS4KV2UgbmVlZCBzb21lIHdheSB0byBydW4gdGhlc2UgdGVzdHMgb24gc3Bl
Y2lmaWMgbWFjaGluZXMgYXMgcGFydCBvZiB0aGUKZm9sbG93LXVwIHNoYXJkIHJ1bnMgLi4uIE90
aGVyd2lzZSB3ZSdyZSBzdHVjayB3aXRoIGEgaHVnZSBwcmVzc3VyZSB0byBhZGQKYWxsIGtpbmRz
IG9mIHN1cGVyLWltcG9ydGFudC1mZWF0dXJlLXJpZ2h0LW5vdyB0aGluZ3MgdG8gQkFULgotRGFu
aWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlv
bgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ln
dC1kZXYK
