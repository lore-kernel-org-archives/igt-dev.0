Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20190217143556.9482-1-chris@chris-wilson.co.uk>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <5bfe27d1-ec82-5ece-9a53-722f7b0c6c0f@intel.com>
Date: Tue, 19 Feb 2019 08:53:48 -0800
MIME-Version: 1.0
In-Reply-To: <20190217143556.9482-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 1/8] i915/gem_eio: Check
 that context create fails when wedged
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

CgpPbiAxNy8wMi8xOSAwNjozNSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IExvY2sgZG93biB0aGUg
bmV3IHVBQkkgdGhhdCBEUk1fSU9DVExfSTkxNV9HRU1fQ09OVEVYVF9DUkVBVEUgcmV0dXJucwo+
IC1FSU8gd2hlbiB3ZWRnZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJp
c0BjaHJpcy13aWxzb24uY28udWs+Cj4gQ2M6IE1pa2EgS3VvcHBhbGEgPG1pa2Eua3VvcHBhbGFA
aW50ZWwuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnRvbmlvIEFyZ2Vuemlhbm8gPGFudG9u
aW8uYXJnZW56aWFub0BpbnRlbC5jb20+Cgo+IC0tLQo+ICAgdGVzdHMvaTkxNS9nZW1fZWlvLmMg
fCAxNCArKysrKysrKysrKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykK
PiAKPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9nZW1fZWlvLmMgYi90ZXN0cy9pOTE1L2dlbV9l
aW8uYwo+IGluZGV4IGFjODVhMmVmZi4uM2M1NDgyMGM5IDEwMDY0NAo+IC0tLSBhL3Rlc3RzL2k5
MTUvZ2VtX2Vpby5jCj4gKysrIGIvdGVzdHMvaTkxNS9nZW1fZWlvLmMKPiBAQCAtMTE4LDYgKzEx
OCwxNyBAQCBzdGF0aWMgdm9pZCB0ZXN0X3Rocm90dGxlKGludCBmZCkKPiAgIAl0cmlnZ2VyX3Jl
c2V0KGZkKTsKPiAgIH0KPiAgIAo+ICtzdGF0aWMgdm9pZCB0ZXN0X2NvbnRleHRfY3JlYXRlKGlu
dCBmZCkKPiArewo+ICsJdWludDMyX3QgY3R4Owo+ICsKPiArCXdlZGdlX2dwdShmZCk7Cj4gKwo+
ICsJaWd0X2Fzc2VydF9lcShfX2dlbV9jb250ZXh0X2NyZWF0ZShmZCwgJmN0eCksIC1FSU8pOwo+
ICsKPiArCXRyaWdnZXJfcmVzZXQoZmQpOwo+ICt9Cj4gKwo+ICAgc3RhdGljIHZvaWQgdGVzdF9l
eGVjYnVmKGludCBmZCkKPiAgIHsKPiAgIAlzdHJ1Y3QgZHJtX2k5MTVfZ2VtX2V4ZWNidWZmZXIy
IGV4ZWNidWY7Cj4gQEAgLTgwNyw2ICs4MTgsOSBAQCBpZ3RfbWFpbgo+ICAgCWlndF9zdWJ0ZXN0
KCJ0aHJvdHRsZSIpCj4gICAJCXRlc3RfdGhyb3R0bGUoZmQpOwo+ICAgCj4gKwlpZ3Rfc3VidGVz
dCgiY29udGV4dC1jcmVhdGUiKQo+ICsJCXRlc3RfY29udGV4dF9jcmVhdGUoZmQpOwo+ICsKPiAg
IAlpZ3Rfc3VidGVzdCgiZXhlY2J1ZiIpCj4gICAJCXRlc3RfZXhlY2J1ZihmZCk7Cj4gICAKPiAK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
