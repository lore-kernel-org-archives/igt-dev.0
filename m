Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20180301143217.20884-1-tvrtko.ursulin@linux.intel.com>
 <151991529975.32001.16808937974839612621@mail.alporthouse.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <5d6b583b-9487-cde3-9826-be532f86e348@linux.intel.com>
Date: Thu, 1 Mar 2018 14:47:25 +0000
MIME-Version: 1.0
In-Reply-To: <151991529975.32001.16808937974839612621@mail.alporthouse.com>
Content-Language: en-GB
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] tests/gen7_forcewake_mt:
 Fix test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, Tvrtko Ursulin <tursulin@ursulin.net>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDAxLzAzLzIwMTggMTQ6NDEsIENocmlzIFdpbHNvbiB3cm90ZToKPiBRdW90aW5nIFR2cnRr
byBVcnN1bGluICgyMDE4LTAzLTAxIDE0OjMyOjE3KQo+PiArc3RhdGljIHZvaWQgKm1taW9fYmFz
ZTsKPj4gKwo+PiArc3RhdGljIHZvaWQgY2xlYW51cChpbnQgc2lnKQo+PiArewo+PiArICAgICAg
IHZvbGF0aWxlIHVpbnQzMl90ICpmb3JjZXdha2VfbXQgPQo+PiArICAgICAgICAgICAgICAgKHVp
bnQzMl90ICopKChjaGFyICopbW1pb19iYXNlICsgRk9SQ0VXQUtFX01UKTsKPj4gKyAgICAgICB1
bnNpZ25lZCBpbnQgYml0Owo+PiArCj4+ICsgICAgICAgZm9yIChiaXQgPSAyOyBiaXQgPCAxNjsg
Yml0KyspIHsKPj4gKyAgICAgICAgICAgICAgICpmb3JjZXdha2VfbXQgPSAoMSA8PCBiaXQpIDw8
IDE2Owo+PiArICAgICAgICAgICAgICAgaWYgKCpmb3JjZXdha2VfbXQgJiAoMSA8PCBiaXQpKQo+
PiArICAgICAgICAgICAgICAgICAgICAgICBpZ3Rfd2FybigiRmFpbGVkIHRvIHJlc3RvcmUgYml0
ICV1IVxuIiwgYml0KTsKPj4gKyAgICAgICB9Cj4gCj4gSXMgdGhlIGV4aXQgaGFuZGxlciBjYWxs
ZWQgYWZ0ZXIgdGhyZWFkcyBhcmUgdGVybWluYXRlZC4uLiBJIGRvbid0IHRoaW5rCj4gc28sIG15
IHVuZGVyc3RhbmRpbmcgYXJlIHRoZSB0aHJlYWRzIGFyZSB0ZXJtaW5hdGVkIGJ5IHByb2Nlc3Mg
c2h1dGRvd24KPiBub3QgbGliYy4KClllcywgbXkgYmFkLiBBdCBsZWFzdCB3ZSdsbCBzZWUgaWYg
b3JkZXJseSB0aHJlYWQgZXhpdCBtYWtlcyBhbnkgZGlmZmVyZW5jZS4KClJlZ2FyZHMsCgpUdnJ0
a28KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1k
ZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
