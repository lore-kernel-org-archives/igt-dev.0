Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id D1D806F0A9
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jan 2019 14:14:19 +0000 (UTC)
Message-ID: <4aa74b7ffbb3498c01a6574d63e1c84fac6ab240.camel@bootlin.com>
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date: Wed, 16 Jan 2019 15:14:18 +0100
In-Reply-To: <20190116112050.27647-14-petri.latvala@intel.com>
References: <20190116112050.27647-1-petri.latvala@intel.com>
 <20190116112050.27647-14-petri.latvala@intel.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 13/21] lib/igt_alsa: Remove dead
 assignment
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
To: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

SGksCgpPbiBXZWQsIDIwMTktMDEtMTYgYXQgMTM6MjAgKzAyMDAsIFBldHJpIExhdHZhbGEgd3Jv
dGU6Cj4gVGhlIGV4ZWN1dGlvbiBjYW4gb25seSByZWFjaCB0aGUgZW5kIChnb3RvIGNvbXBsZXRl
KSBvciB0aGUgbmV3Cj4gdW5jb25kaXRpb25hbCBhc3NpZ25tZW50IGEgZmV3IGxpbmVzIGJlbG93
IGJlZm9yZSB0aGUgdmFsdWUgaXMgcmVhZAo+IGFnYWluLiBFaXRoZXIgaXQncyByZWFsbHkgYSBk
ZWFkIGFzc2lnbm1lbnQsIG9yIHRoZXJlJ3MgYSBidWcgd2l0aCB0aGUKPiBleGVjdXRpb24gZmxv
dy4gTGVhbmluZyBvbiB0aGUgZm9ybWVyLgoKSXQgaXMgaW5kZWVkIGEgZGVhZCBhc3NpZ25tZW50
IGFuZCB5b3VyIHVuZGVyc3RhbmRpbmcgaXMgY29ycmVjdCEKClRoYW5rcyBmb3IgdGhlIGZpeHVw
LgoKUmV2aWV3ZWQtYnk6IFBhdWwgS29jaWFsa293c2tpIDxwYXVsLmtvY2lhbGtvd3NraUBib290
bGluLmNvbT4KCkNoZWVycywKClBhdWwKCj4gU2lnbmVkLW9mZi1ieTogUGV0cmkgTGF0dmFsYSA8
cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+Cj4gQ2M6IFBhdWwgS29jaWFsa293c2tpIDxwYXVsLmtv
Y2lhbGtvd3NraUBib290bGluLmNvbT4KPiAtLS0KPiAgbGliL2lndF9hbHNhLmMgfCAyIC0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9saWIvaWd0
X2Fsc2EuYyBiL2xpYi9pZ3RfYWxzYS5jCj4gaW5kZXggM2FkMDUyMWEuLmJiNjY4MmNjIDEwMDY0
NAo+IC0tLSBhL2xpYi9pZ3RfYWxzYS5jCj4gKysrIGIvbGliL2lndF9hbHNhLmMKPiBAQCAtNTIz
LDggKzUyMyw2IEBAIGludCBhbHNhX3J1bihzdHJ1Y3QgYWxzYSAqYWxzYSwgaW50IGR1cmF0aW9u
X21zKQo+ICAJCQlyZWFjaGVkID0gZmFsc2U7Cj4gIAo+ICAJCQlpZiAoIW91dHB1dF9yZWFkeSkg
ewo+IC0JCQkJb3V0cHV0X3JlYWR5ID0gdHJ1ZTsKPiAtCj4gIAkJCQlmb3IgKGkgPSAwOyBpIDwg
YWxzYS0+b3V0cHV0X2hhbmRsZXNfY291bnQ7IGkrKykKPiAgCQkJCQlvdXRwdXRfY291bnRzW2ld
ID0gMDsKPiAgCi0tIApQYXVsIEtvY2lhbGtvd3NraSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBh
bmQga2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0Cmln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
