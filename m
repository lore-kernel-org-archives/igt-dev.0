Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14B516E2AB
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Feb 2019 00:23:28 +0000 (UTC)
Date: Thu, 14 Feb 2019 00:23:26 +0000
Message-ID: <7870d6f2e21403b2feaa2c0d64ffba0def4d1829.camel@intel.com>
References: <20190208005305.6599-1-jose.souza@intel.com>
 <20190208005305.6599-2-jose.souza@intel.com>
In-Reply-To: <20190208005305.6599-2-jose.souza@intel.com>
Content-Language: en-US
Content-ID: <F5FC974D02D4294EA62481D0DA773853@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v6 2/4] tests/intel-ci: Add basic PSR2
 tests to fast feedback test list
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
From: "Pandiyan, Dhinakaran via igt-dev" <igt-dev@lists.freedesktop.org>
Reply-To: "Pandiyan, Dhinakaran" <dhinakaran.pandiyan@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Souza,
 Jose" <jose.souza@intel.com>
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCAyMDE5LTAyLTA3IGF0IDE2OjUzIC0wODAwLCBKb3PDqSBSb2JlcnRvIGRlIFNvdXph
IHdyb3RlOg0KPiBMZXRzIHJ1biB0aGUgc2FtZSBQU1IxIGJhc2ljIHRlc3RzIGZvciBQU1IyIHRv
IGNhdWdodCBQU1IyDQo+IHJlZ3Jlc3Npb25zIGZhc3Rlci4NCj4gDQo+IENjOiBSb2RyaWdvIFZp
dmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+DQo+IENjOiBEaGluYWthcmFuIFBhbmRpeWFuIDxk
aGluYWthcmFuLnBhbmRpeWFuQGludGVsLmNvbT4NCg0KQXNzdW1pbmcgdGhlIHRlc3RzIHBhc3Ms
DQpBY2tlZC1ieTogRGhpbmFrYXJhbiBQYW5kaXlhbiA8ZGhpbmFrYXJhbi5wYW5kaXlhbkBpbnRl
bC5jb20+DQoNClBsZWFzZSBnZXQgYW4gYWNrIGZyb20gQ0kgZm9sa3MgdG9vLg0KDQotREsNCg0K
PiBTaWduZWQtb2ZmLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVs
LmNvbT4NCj4gLS0tDQo+ICB0ZXN0cy9pbnRlbC1jaS9mYXN0LWZlZWRiYWNrLnRlc3RsaXN0IHwg
NCArKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvdGVzdHMvaW50ZWwtY2kvZmFzdC1mZWVkYmFjay50ZXN0bGlzdCBiL3Rlc3RzL2ludGVs
LQ0KPiBjaS9mYXN0LWZlZWRiYWNrLnRlc3RsaXN0DQo+IGluZGV4IGE5NWQyZTk1Li4zOGY0ODEx
ZSAxMDA2NDQNCj4gLS0tIGEvdGVzdHMvaW50ZWwtY2kvZmFzdC1mZWVkYmFjay50ZXN0bGlzdA0K
PiArKysgYi90ZXN0cy9pbnRlbC1jaS9mYXN0LWZlZWRiYWNrLnRlc3RsaXN0DQo+IEBAIC0yMjUs
NiArMjI1LDEwIEBAIGlndEBrbXNfcHNyQHByaW1hcnlfcGFnZV9mbGlwDQo+ICBpZ3RAa21zX3Bz
ckBjdXJzb3JfcGxhbmVfbW92ZQ0KPiAgaWd0QGttc19wc3JAc3ByaXRlX3BsYW5lX29ub2ZmDQo+
ICBpZ3RAa21zX3BzckBwcmltYXJ5X21tYXBfZ3R0DQo+ICtpZ3RAa21zX3BzckBwc3IyX3ByaW1h
cnlfcGFnZV9mbGlwDQo+ICtpZ3RAa21zX3BzckBwc3IyX2N1cnNvcl9wbGFuZV9tb3ZlDQo+ICtp
Z3RAa21zX3BzckBwc3IyX3Nwcml0ZV9wbGFuZV9vbm9mZg0KPiAraWd0QGttc19wc3JAcHNyMl9w
cmltYXJ5X21tYXBfZ3R0DQo+ICBpZ3RAa21zX3NldG1vZGVAYmFzaWMtY2xvbmUtc2luZ2xlLWNy
dGMNCj4gIGlndEBwbV9iYWNrbGlnaHRAYmFzaWMtYnJpZ2h0bmVzcw0KPiAgaWd0QHBtX3JwbUBi
YXNpYy1wY2ktZDMtc3RhdGUNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRl
dg==
