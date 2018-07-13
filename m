Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2013B6F198
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Jul 2018 08:00:36 +0000 (UTC)
Date: Fri, 13 Jul 2018 10:00:33 +0200
From: Katarzyna Dec <katarzyna.dec@intel.com>
Message-ID: <20180713080033.GC24894@kdec5-desk.ger.corp.intel.com>
References: <20180627215354.9216-1-jose.souza@intel.com>
 <20180628071604.GB4601@kdec5-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180628071604.GB4601@kdec5-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] lib: Reuse Gen9 mediafill on Gen11
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
To: =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBKdW4gMjgsIDIwMTggYXQgMDk6MTY6MDRBTSArMDIwMCwgS2F0YXJ6eW5hIERlYyB3
cm90ZToKPiBPbiBXZWQsIEp1biAyNywgMjAxOCBhdCAwMjo1Mzo1MlBNIC0wNzAwLCBKb3PDqSBS
b2JlcnRvIGRlIFNvdXphIHdyb3RlOgo+ID4gRnJvbTogRGFuaWVsZSBDZXJhb2xvIFNwdXJpbyA8
ZGFuaWVsZS5jZXJhb2xvc3B1cmlvQGludGVsLmNvbT4KPiA+IAo+ID4gV2UgY2FuIHJldXNlIGdl
bjkgbWVkaWFmaWxsIGZ1bmN0aW9uLCBiZWNhdXNlIG5vIGNoYW5nZXMKPiA+IGFyZSByZXF1aXJl
ZCB0byBzdXBwb3J0IEdlbjExLgo+ID4gCj4gPiBDYzogTHVjYXMgRGUgTWFyY2hpIDxsdWNhcy5k
ZW1hcmNoaUBpbnRlbC5jb20+Cj4gPiBDYzogRGFuaWVsZSBDZXJhb2xvIFNwdXJpbyA8ZGFuaWVs
ZS5jZXJhb2xvc3B1cmlvQGludGVsLmNvbT4KPiA+IENjOiBLYXRhcnp5bmEgRGVjIDxrYXRhcnp5
bmEuZGVjQGludGVsLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IERhbmllbGUgQ2VyYW9sbyBTcHVy
aW8gPGRhbmllbGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBL
YXRhcnp5bmEgRGVjIDxrYXRhcnp5bmEuZGVjQGludGVsLmNvbT4KPiAKPiBBY2tlZC1ieTogS2F0
YXJ6eW5hIERlYyA8a2F0YXJ6eW5hLmRlY0BpbnRlbC5jb20+Cj4gS2FzaWEgOikKCkRvIHdlIG5l
ZWQgbW9yZSByZXZpZXdlcnMgdG8gdGhpcyBwYXRjaGVzPwpPciBtYXliZSB3ZSBjYW4gcHVzaCB0
aGVtIGFscmVhZHk/Ckthc2lhCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBpZ3QtZGV2IG1haWxpbmcgbGlzdAo+IGlndC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pZ3QtZGV2Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
