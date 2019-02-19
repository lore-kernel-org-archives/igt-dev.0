Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20190217143556.9482-1-chris@chris-wilson.co.uk>
 <20190217143556.9482-2-chris@chris-wilson.co.uk>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <7b4076e1-0636-5958-5d8c-fc57047d9019@intel.com>
Date: Tue, 19 Feb 2019 08:53:57 -0800
MIME-Version: 1.0
In-Reply-To: <20190217143556.9482-2-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 2/8] i915/gem_eio: Check we only ban the
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

CgpPbiAxNy8wMi8xOSAwNjozNSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IEluIHRyaWdnZXIgdGhl
IGJhbiwgd2Ugb25seSB3YW50IHRvIG9ic2VydmUgdGhlIGxvY2FsIGNvbnRleHQgYmUgYmFubmVk
Cj4gYW5kIG5vdCB0aGUgZnByaXYgYXMgYSB3aG9sZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJp
cyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiBDYzogTWlrYSBLdW9wcGFsYSA8
bWlrYS5rdW9wcGFsYUBpbnRlbC5jb20+Cj4gLS0tCj4gICB0ZXN0cy9pOTE1L2dlbV9laW8uYyB8
IDcgKysrKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYg
LS1naXQgYS90ZXN0cy9pOTE1L2dlbV9laW8uYyBiL3Rlc3RzL2k5MTUvZ2VtX2Vpby5jCj4gaW5k
ZXggM2M1NDgyMGM5Li4zYWZkYmQ2OWUgMTAwNjQ0Cj4gLS0tIGEvdGVzdHMvaTkxNS9nZW1fZWlv
LmMKPiArKysgYi90ZXN0cy9pOTE1L2dlbV9laW8uYwo+IEBAIC0zMjQsOCArMzI0LDE1IEBAIHN0
YXRpYyB2b2lkIF9fdGVzdF9iYW5uZWQoaW50IGZkKQo+ICAgCQlpZ3Rfc3Bpbl90ICpoYW5nOwo+
ICAgCj4gICAJCWlmIChfX2dlbV9leGVjYnVmKGZkLCAmZXhlY2J1ZikgPT0gLUVJTykgewo+ICsJ
CQl1aW50MzJfdCBjdHggPSAwOwo+ICsKPiAgIAkJCWlndF9pbmZvKCJCYW5uZWQgYWZ0ZXIgY2F1
c2luZyAlbHUgaGFuZ3NcbiIsIGNvdW50KTsKPiAgIAkJCWlndF9hc3NlcnQoY291bnQgPiAxKTsK
PiArCj4gKwkJCS8qIE9ubHkgdGhpcyBjb250ZXh0LCBub3QgdGhlIGZpbGUsIHNob3VsZCBiZSBi
YW5uZWQgKi8KPiArCQkJaWd0X2Fzc2VydF9uZXEoX19nZW1fY29udGV4dF9jcmVhdGUoZmQsICZj
dHgpLCAtRUlPKTsKClNob3VsZCB3ZSBjaGVjayBzdWJtaXNzaW9uIHdvcmtzIG9uIHRoZSBuZXcg
Y29udGV4dD8KCkFudG9uaW8KCj4gKwkJCWlndF9hc3NlcnRfbmVxKGN0eCwgMCk7Cj4gKwkJCWdl
bV9jb250ZXh0X2Rlc3Ryb3koZmQsIGN0eCk7Cj4gICAJCQlyZXR1cm47Cj4gICAJCX0KPiAgIAo+
IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2
IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
