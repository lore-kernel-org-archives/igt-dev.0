Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20190508100958.32637-1-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <1af21869-9dbb-4c9e-0e43-665f69eb9b44@linux.intel.com>
Date: Tue, 14 May 2019 10:39:01 +0100
MIME-Version: 1.0
In-Reply-To: <20190508100958.32637-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 01/16] i915/gem_exec_schedule: Semaphore
 priority fixups
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

Ck9uIDA4LzA1LzIwMTkgMTE6MDksIENocmlzIFdpbHNvbiB3cm90ZToKPiBBIHN0cmF5IGdpdCBh
ZGQgZnJvbSBteSB0ZXN0IGJveGVuIC0tIHdlIHdlcmUgYmVpbmcgY2FyZWZ1bCBlbm91Z2ggdG8K
PiBwcmVzZXJ2ZSBwcmlvcml0eSBhbmQgb3JkZXJpbmcgdG8gbWF0Y2ggdGhlIGltcGxpY2l0IHBv
bGljaWVzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2ls
c29uLmNvLnVrPgo+IC0tLQo+ICAgdGVzdHMvaTkxNS9nZW1fZXhlY19zY2hlZHVsZS5jIHwgMiAr
Kwo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS90
ZXN0cy9pOTE1L2dlbV9leGVjX3NjaGVkdWxlLmMgYi90ZXN0cy9pOTE1L2dlbV9leGVjX3NjaGVk
dWxlLmMKPiBpbmRleCAzMzBlOGE1NGUuLjc3YTI2NGE2YSAxMDA2NDQKPiAtLS0gYS90ZXN0cy9p
OTE1L2dlbV9leGVjX3NjaGVkdWxlLmMKPiArKysgYi90ZXN0cy9pOTE1L2dlbV9leGVjX3NjaGVk
dWxlLmMKPiBAQCAtNTA3LDYgKzUwNyw3IEBAIHN0YXRpYyB2b2lkIHNlbWFwaG9yZV9yZXNvbHZl
KGludCBpOTE1KQo+ICAgCQl1aW50MzJfdCBoYW5kbGUsIGNhbmNlbDsKPiAgIAkJdWludDMyX3Qg
KmNzLCAqbWFwOwo+ICAgCQlpZ3Rfc3Bpbl90ICpzcGluOwo+ICsJCWludDY0X3QgcG9rZSA9IDE7
Cj4gICAKPiAgIAkJaWYgKCFnZW1fY2FuX3N0b3JlX2R3b3JkKGk5MTUsIGVuZ2luZSkpCj4gICAJ
CQljb250aW51ZTsKPiBAQCAtNTg3LDYgKzU4OCw3IEBAIHN0YXRpYyB2b2lkIHNlbWFwaG9yZV9y
ZXNvbHZlKGludCBpOTE1KQo+ICAgCQllYi5idWZmZXJfY291bnQgPSAyOwo+ICAgCQllYi5yc3Zk
MSA9IGlubmVyOwo+ICAgCQlnZW1fZXhlY2J1ZihpOTE1LCAmZWIpOwo+ICsJCWdlbV93YWl0KGk5
MTUsIGNhbmNlbCwgJnBva2UpOwo+ICAgCQlnZW1fY2xvc2UoaTkxNSwgY2FuY2VsKTsKPiAgIAo+
ICAgCQlnZW1fc3luYyhpOTE1LCBoYW5kbGUpOyAvKiBUbyBoYW5nIHVubGVzcyBjYW5jZWwgcnVu
cyEgKi8KPiAKClJldmlld2VkLWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50
ZWwuY29tPgoKUmVnYXJkcywKClR2cnRrbwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2lndC1kZXY=
