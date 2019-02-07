Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F6A6EC6C
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Feb 2019 12:04:30 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id x28so6479414vsh.12
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Feb 2019 04:04:30 -0800 (PST)
MIME-Version: 1.0
References: <20190206131828.17018-1-emil.l.velikov@gmail.com>
 <20190207085944.GQ4038@platvala-desk.ger.corp.intel.com>
In-Reply-To: <20190207085944.GQ4038@platvala-desk.ger.corp.intel.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 7 Feb 2019 12:00:14 +0000
Message-ID: <CACvgo52ZRTg63A+Ki3Hs0VcX--7iumG78d687t4y7HHaD35APQ@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/core_unauth_vs_render: new test
 for the relaxed DRM_AUTH handling
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
To: Emil Velikov <emil.l.velikov@gmail.com>, IGT development <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

SGkgUGV0cmksCgpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4KCk9uIFRodSwgNyBGZWIgMjAxOSBh
dCAwODo1OSwgUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+IHdyb3RlOgoK
PiA+ICsgICAgIGlndF9pbmZvKCJPcGVubmluZyBjYXJkIG5vZGUgZnJvbSBhIG5vbi1wcml2LiB1
c2VyLlxuIik7Cj4gPiArICAgICBpZ3RfaW5mbygiT24gZmFpbHVyZSwgZG91YmxlLWNoZWNrIHRo
ZSBub2RlIHBlcm1pc3Npb25zXG4iKTsKPiA+ICsgICAgIC8qIEZJWE1FOiByZWxhdGUgdG8gdGhl
IG1hc3RlciBnaXZlbiBhbmQgZml4IGFsbCBvZiBJR1QgKi8KPiA+ICsgICAgIHNsYXZlID0gZHJt
X29wZW5fZHJpdmVyKERSSVZFUl9BTlkpOwo+ID4gKwoKCj4gPiArICAgICBib29sIGltcCA9IGhh
c19wcmltZV9pbXBvcnQoc2xhdmUpOwo+ID4gKyAgICAgYm9vbCByZW5kID0gaGFzX3JlbmRlcl9u
b2RlKHNsYXZlKTsKPiA+ICsgICAgIGlndF9pbmZvKCJpbXBvcnQgJWQgcmVuZCAlZFxuIiwgaW1w
LCByZW5kKTsKVGhpcyBkZWJ1ZyB3aWxsIGJlIGRyb3BwZWQgd2l0aCBuZXh0IHZlcnNpb24uCgo+
ID4gKyAgICAgaWYgKGhhc19wcmltZV9pbXBvcnQoc2xhdmUpICYmIGhhc19yZW5kZXJfbm9kZShz
bGF2ZSkpCj4gPiArICAgICAgICAgICAgIGlndF9hc3NlcnQoZXJybm8gIT0gRUFDQ0VTKTsKPiA+
ICsKPiA+ICsgICAgIGVsc2UKPiA+ICsgICAgICAgICAgICAgaWd0X2Fzc2VydChlcnJubyA9PSBF
QUNDRVMpOwpBbmQgdGhpcyBzaG91bGQgYmU6CgppZiAoaGFzX3ByaW1lX2ltcG9ydChzbGF2ZSkK
ICAgaWd0X3NraXAoLi4uKQoKaWYgKGhhc19yZW5kZXJfbm9kZShzbGF2ZSkpCiAgICBpZ3RfYXNz
ZXJ0KGVycm5vICE9IEVBQ0NFUyk7CmVsc2UKICAgIGlndF9hc3NlcnQoZXJybm8gPT0gRUFDQ0VT
KTsKClRoZSBvbmx5IHByb2JsZW0gaXMgdGhhdCBpZ3Rfc2tpcCgpIGRvZXMgbm90IHdvcmsgd2l0
aCBpZ3RfZm9yay4gQW55CnN1Z2dlc3Rpb25zPwoKRndpdywgdGhpcyBwcm9ibGVtIGluc3BpcmVk
IHRoZSBpZ3RfaW5mbygpIGFyb3VuZCBkcm1fb3Blbl9tYXN0ZXIoKSwKc2luY2UgdGhlIGxhdHRl
ciBlbmRzIHVwIGNhbGxpbmcgaWd0X3NraXAoKS4KClNvbWV3aGF0IG9ydGhvZ29uYWwsIGl0IHNl
ZW1zIG1vcmUgaW50dWl0aXZlIGFuZCBjbGVhbmVyIHRvIGhhdmUgdGhlCmhpZ2gtbGV2ZWwgZGVj
aXNpb24gb2YgaWd0X3NraXAvcGFzcy9hc3NlcnQgaW4gdGhlIHRlc3QgaXRzZWxmLgpBbHRob3Vn
aCB0aGF0J3MgYSB0b3BpYyBmb3IgYW5vdGhlciB0aW1lLgoKPiA+ICtpZ3RfbWFpbgo+ID4gK3sK
PiA+ICsgICAgIGludCBtYXN0ZXI7Cj4gPiArCj4gPiArICAgICBpZ3RfZml4dHVyZQo+ID4gKyAg
ICAgICAgICAgICBtYXN0ZXIgPSBkcm1fb3Blbl9kcml2ZXIoRFJJVkVSX0FOWSk7Cj4gPiArCj4g
PiArICAgICBpZ3RfYXNzZXJ0KGNoZWNrX2F1dGgobWFzdGVyKSA9PSB0cnVlKTsKPgo+Cj4gWW91
IGNhbid0IHVzZSBpZ3RfYXNzZXJ0IG91dHNpZGUgb2YgaWd0X2ZpeHR1cmUvaWd0X3N1YnRlc3Qq
Lgo+ClRoYW5rcyB3aWxsIGZpeC4gR3Vlc3MgdGhhdCBleHBsYWlucyB3aHkgdGhlIENJIGZhaWxl
ZCBoZXJlLgpJIHdvbmRlciB3aHkgdGhpcyBpZ3RfYXNzZXJ0KCkgd29ya3MganVzdCBqdXN0IGZp
bmUgb24gbXkgbG9jYWwgbWFjaGluZS4KClRoYW5rcwpFbWlsCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaWd0LWRldgo=
