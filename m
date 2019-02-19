Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20190217143556.9482-2-chris@chris-wilson.co.uk>
 <20190219171124.23724-1-chris@chris-wilson.co.uk>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <4aff10c5-49ad-4fb3-5867-236977b47dce@intel.com>
Date: Tue, 19 Feb 2019 09:27:22 -0800
MIME-Version: 1.0
In-Reply-To: <20190219171124.23724-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_eio: Check we only ban the
 context
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
Cc: igt-dev@lists.freedesktop.org, Mika Kuoppala <mika.kuoppala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

CgpPbiAxOS8wMi8xOSAwOToxMSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IEluIHRyaWdnZXIgdGhl
IGJhbiwgd2Ugb25seSB3YW50IHRvIG9ic2VydmUgdGhlIGxvY2FsIGNvbnRleHQgYmUgYmFubmVk
Cj4gYW5kIG5vdCB0aGUgZnByaXYgYXMgYSB3aG9sZS4KPiAKPiB2MjogQW5kIHNlbmQgYW4gZXhl
Y2J1ZiBkb3duIHRoZSBuZXcgY29udGV4dC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxz
b24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiBDYzogTWlrYSBLdW9wcGFsYSA8bWlrYS5r
dW9wcGFsYUBpbnRlbC5jb20+Cj4gQ2M6IEFudG9uaW8gQXJnZW56aWFubyA8YW50b25pby5hcmdl
bnppYW5vQGludGVsLmNvbT4KClJldmlld2VkLWJ5OiBBbnRvbmlvIEFyZ2Vuemlhbm8gPGFudG9u
aW8uYXJnZW56aWFub0BpbnRlbC5jb20+Cgo+IC0tLQo+ICAgdGVzdHMvaTkxNS9nZW1fZWlvLmMg
fCAxMiArKysrKysrKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCj4g
Cj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUvZ2VtX2Vpby5jIGIvdGVzdHMvaTkxNS9nZW1fZWlv
LmMKPiBpbmRleCBhYzg1YTJlZmYuLmIwYmUxMjhlZiAxMDA2NDQKPiAtLS0gYS90ZXN0cy9pOTE1
L2dlbV9laW8uYwo+ICsrKyBiL3Rlc3RzL2k5MTUvZ2VtX2Vpby5jCj4gQEAgLTMxMyw4ICszMTMs
MjAgQEAgc3RhdGljIHZvaWQgX190ZXN0X2Jhbm5lZChpbnQgZmQpCj4gICAJCWlndF9zcGluX3Qg
Kmhhbmc7Cj4gICAKPiAgIAkJaWYgKF9fZ2VtX2V4ZWNidWYoZmQsICZleGVjYnVmKSA9PSAtRUlP
KSB7Cj4gKwkJCXVpbnQzMl90IGN0eCA9IDA7Cj4gKwo+ICAgCQkJaWd0X2luZm8oIkJhbm5lZCBh
ZnRlciBjYXVzaW5nICVsdSBoYW5nc1xuIiwgY291bnQpOwo+ICAgCQkJaWd0X2Fzc2VydChjb3Vu
dCA+IDEpOwo+ICsKPiArCQkJLyogT25seSB0aGlzIGNvbnRleHQsIG5vdCB0aGUgZmlsZSwgc2hv
dWxkIGJlIGJhbm5lZCAqLwo+ICsJCQlpZ3RfYXNzZXJ0X25lcShfX2dlbV9jb250ZXh0X2NyZWF0
ZShmZCwgJmN0eCksIC1FSU8pOwo+ICsJCQlpZ3RfYXNzZXJ0X25lcShjdHgsIDApOwo+ICsKPiAr
CQkJLyogQW5kIGNoZWNrIGl0IGFjdHVhbGx5IHdvcmtzISAqLwo+ICsJCQlleGVjYnVmLnJzdmQx
ID0gY3R4Owo+ICsJCQlnZW1fZXhlY2J1ZihmZCwgJmV4ZWNidWYpOwo+ICsKPiArCQkJZ2VtX2Nv
bnRleHRfZGVzdHJveShmZCwgY3R4KTsKPiAgIAkJCXJldHVybjsKPiAgIAkJfQo+ICAgCj4gCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFp
bGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
