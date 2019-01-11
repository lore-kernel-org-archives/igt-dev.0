Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20190107112833.19083-1-chris@chris-wilson.co.uk>
 <20190111135400.23246-1-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <d048e063-7438-c3f4-b862-4e2a3e174a6f@linux.intel.com>
Date: Fri, 11 Jan 2019 14:00:55 +0000
MIME-Version: 1.0
In-Reply-To: <20190111135400.23246-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v2] i915/gem_tiled_pread: Skip on
 unknown swizzling
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
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDExLzAxLzIwMTkgMTM6NTQsIENocmlzIFdpbHNvbiB3cm90ZToKPiBJZiB3ZSBkbyBub3Qg
a25vdyB0aGUgdW5kZXJseWluZyBzd2l6emxlIG9uIHRoZSBIVywgd2UgZG8gbm90IGtub3cgdGhl
Cj4gZnVsbCB0aWxpbmcgcGF0dGVybiBhbmQgY2Fubm90IHByZWRpY3QgdGhlIGV4cGVjdGVkIHJl
c3VsdHMuIFRoaXMgaXMKPiBvZnRlbiBiZWNhdXNlIHRoZSBzd2l6emxlIHZhcmllcyBiZXR3ZWVu
IHBhZ2VzIGFuZCBpcyBub3QgYXMgY29uc3RhbnQgYXMKPiB3ZSBuYWl2ZWx5IGV4cGVjdGVkLgo+
IAo+IHYyOiBnZW1fZ2V0X3RpbGluZygpIGRvZXMgdGhlIHBoeXNpY2FsPT1yZXBvcnRlZCBjaGVj
aywgd2UganVzdCBuZWVkIHRvCj4gYWRkIGFuIGFjcXVpcmUKPiAKPiBTaWduZWQtb2ZmLWJ5OiBD
aHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiBDYzogPHR2cnRrby51cnN1
bGluQGxpbnV4LmludGVsLmNvbT4KPiAtLS0KPiAgIHRlc3RzL2k5MTUvZ2VtX3RpbGVkX3ByZWFk
X3B3cml0ZS5jIHwgMiArLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUvZ2VtX3RpbGVkX3ByZWFkX3B3
cml0ZS5jIGIvdGVzdHMvaTkxNS9nZW1fdGlsZWRfcHJlYWRfcHdyaXRlLmMKPiBpbmRleCAzMTNk
YWEzODguLmZjZjA3ODBhZiAxMDA2NDQKPiAtLS0gYS90ZXN0cy9pOTE1L2dlbV90aWxlZF9wcmVh
ZF9wd3JpdGUuYwo+ICsrKyBiL3Rlc3RzL2k5MTUvZ2VtX3RpbGVkX3ByZWFkX3B3cml0ZS5jCj4g
QEAgLTEyMiw3ICsxMjIsNyBAQCBpZ3Rfc2ltcGxlX21haW4KPiAgIAkJY3VycmVudF90aWxpbmdf
bW9kZSA9IEk5MTVfVElMSU5HX1g7Cj4gICAKPiAgIAkJaGFuZGxlID0gY3JlYXRlX2JvX2FuZF9m
aWxsKGZkKTsKPiAtCQlnZW1fZ2V0X3RpbGluZyhmZCwgaGFuZGxlLCAmdGlsaW5nLCAmc3dpenps
ZSk7Cj4gKwkJaWd0X3JlcXVpcmUoZ2VtX2dldF90aWxpbmcoZmQsIGhhbmRsZSwgJnRpbGluZywg
JnN3aXp6bGUpKTsKPiAgIAo+ICAgCQlnZW1fcmVhZChmZCwgaGFuZGxlLCAwLCBsaW5lYXIsIHNp
emVvZihsaW5lYXIpKTsKPiAgIAo+IAoKUmV2aWV3ZWQtYnk6IFR2cnRrbyBVcnN1bGluIDx0dnJ0
a28udXJzdWxpbkBpbnRlbC5jb20+CgpSZWdhcmRzLAoKVHZydGtvCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
