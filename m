Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20190508100958.32637-1-chris@chris-wilson.co.uk>
 <20190508100958.32637-11-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <9f96b224-ca13-10a1-b147-5e907106af4b@linux.intel.com>
Date: Tue, 14 May 2019 13:48:26 +0100
MIME-Version: 1.0
In-Reply-To: <20190508100958.32637-11-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 11/16] i915/gem_exec_whisper:
 debugfs/next_seqno is defunct
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

Ck9uIDA4LzA1LzIwMTkgMTE6MDksIENocmlzIFdpbHNvbiB3cm90ZToKPiBXZSByZW1vdmVkIG5l
eHRfc2Vxbm8gaW4gNS4xLCBzbyB0aW1lIHRvIHdhdmUgZ29vZGJ5ZS4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiAtLS0KPiAgIHRl
c3RzL2k5MTUvZ2VtX2V4ZWNfd2hpc3Blci5jIHwgMTIgLS0tLS0tLS0tLS0tCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMTIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUvZ2Vt
X2V4ZWNfd2hpc3Blci5jIGIvdGVzdHMvaTkxNS9nZW1fZXhlY193aGlzcGVyLmMKPiBpbmRleCBk
NWFmYzgxMTkuLjYxYjhkNmRhYyAxMDA2NDQKPiAtLS0gYS90ZXN0cy9pOTE1L2dlbV9leGVjX3do
aXNwZXIuYwo+ICsrKyBiL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfd2hpc3Blci5jCj4gQEAgLTQ0LDE1
ICs0NCw2IEBACj4gICAKPiAgICNkZWZpbmUgVkVSSUZZIDAKPiAgIAo+IC1zdGF0aWMgdm9pZCB3
cml0ZV9zZXFubyhpbnQgZGlyLCB1bnNpZ25lZCBvZmZzZXQpCj4gLXsKPiAtCXVpbnQzMl90IHNl
cW5vID0gVUlOVDMyX01BWCAtIG9mZnNldDsKPiAtCj4gLQlpZ3Rfc3lzZnNfcHJpbnRmKGRpciwg
Imk5MTVfbmV4dF9zZXFubyIsICIweCV4Iiwgc2Vxbm8pOwo+IC0KPiAtCWlndF9kZWJ1ZygibmV4
dCBzZXFubyBzZXQgdG86IDB4JXhcbiIsIHNlcW5vKTsKPiAtfQo+IC0KPiAgIHN0YXRpYyB2b2lk
IGNoZWNrX2JvKGludCBmZCwgdWludDMyX3QgaGFuZGxlLCBpbnQgcGFzcykKPiAgIHsKPiAgIAl1
aW50MzJfdCAqbWFwOwo+IEBAIC0zNTUsOSArMzQ2LDYgQEAgc3RhdGljIHZvaWQgd2hpc3Blcihp
bnQgZmQsIHVuc2lnbmVkIGVuZ2luZSwgdW5zaWduZWQgZmxhZ3MpCj4gICAJCQlpZ3RfdW50aWxf
dGltZW91dCgxNTApIHsKPiAgIAkJCQl1aW50NjRfdCBvZmZzZXQ7Cj4gICAKPiAtCQkJCWlmIChu
Y2hpbGQgPT0gMSkKPiAtCQkJCQl3cml0ZV9zZXFubyhkZWJ1Z2ZzLCBwYXNzKTsKPiAtCj4gICAJ
CQkJaWYgKGZsYWdzICYgSEFORykKPiAgIAkJCQkJc3VibWl0X2hhbmcoJmhhbmcsIGVuZ2luZXMs
IG5lbmdpbmUsIGZsYWdzKTsKPiAgIAo+IAoKUmV2aWV3ZWQtYnk6IFR2cnRrbyBVcnN1bGluIDx0
dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+CgpSZWdhcmRzLAoKVHZydGtvCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0Cmln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
