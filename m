Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
In-Reply-To: <20180220084520.27965-8-chris@chris-wilson.co.uk>
References: <20180220084520.27965-1-chris@chris-wilson.co.uk>
 <20180220084520.27965-8-chris@chris-wilson.co.uk>
Message-ID: <151912426405.8969.10590870511403740242@jlahtine-desk.ger.corp.intel.com>
Date: Tue, 20 Feb 2018 12:57:44 +0200
Subject: Re: [igt-dev] [PATCH igt 08/16] igt/gem_exec_schedule: Replace
 constant 16 with its magic macro
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
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMTgtMDItMjAgMTA6NDU6MTIpCj4gQEAgLTM5OCw3ICsz
OTksNyBAQCBzdGF0aWMgdm9pZCBwcmVlbXB0KGludCBmZCwgdW5zaWduZWQgcmluZywgdW5zaWdu
ZWQgZmxhZ3MpCj4gICAgICAgICAgICAgICAgIGlndF9hc3NlcnQoZ2VtX2JvX2J1c3koZmQsIHNw
aW5bMF0tPmhhbmRsZSkpOwo+ICAgICAgICAgfQo+ICAKPiAtICAgICAgIGZvciAoaW50IG4gPSAw
OyBuIDwgMTY7IG4rKykKPiArICAgICAgIGZvciAoaW50IG4gPSAwOyBuIDwgTUFYX0VMU1BfUUxF
TjsgbisrKQo+ICAgICAgICAgICAgICAgICBpZ3Rfc3Bpbl9iYXRjaF9mcmVlKGZkLCBzcGluW25d
KTsKCkFSUkFZX1NJWkUoKSBzZWVtcyBtb3JlIGFwcHJvcHJpYXRlIGluIHRoZSBmb3IgbG9vcHMu
IFNlZW1zIGxpa2UgeW91J3ZlCm9wdGVkIG5vdCB0byB1c2UgaXQgc28gbXVjaCwgd2h5IHNvPwoK
PiBAQCAtNDUwLDYgKzQ1Myw3IEBAIHN0YXRpYyB2b2lkIHByZWVtcHRfb3RoZXIoaW50IGZkLCB1
bnNpZ25lZCByaW5nKQo+ICAgICAgICAgICAgICAgICAgICAgcmVzdWx0LCAobiArIDEpKnNpemVv
Zih1aW50MzJfdCksIG4gKyAxLAo+ICAgICAgICAgICAgICAgICAgICAgMCwgSTkxNV9HRU1fRE9N
QUlOX1JFTkRFUik7Cj4gIAo+ICsgICAgICAgaWd0X2RlYnVnZnNfZHVtcChmZCwgImk5MTVfZW5n
aW5lX2luZm8iKTsKCkxvc3QgYW5kIGFmcmFpZCBodW5rIGhlcmU/IFlvdSBjYW4gaGF2ZSBteSBS
LWIgZm9yIGl0IGluIHNlcGFyYXRlIHBhdGNoLgoKUmVnYXJkcywgSm9vbmFzCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0
CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
