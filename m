Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20191005105556.12832-1-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <3bc91e40-297b-f9e8-0ad5-4644248b1211@linux.intel.com>
Date: Mon, 7 Oct 2019 17:57:14 +0100
MIME-Version: 1.0
In-Reply-To: <20191005105556.12832-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] i915/gem_eio: Retighten timeouts
 for forced reset
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
Cc: igt-dev@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDA1LzEwLzIwMTkgMTE6NTUsIENocmlzIFdpbHNvbiB3cm90ZToKPiBUaGUgZm9yY2VkLXJl
c2V0IGl0c2VsZiBzaG91bGQgYmUgaW1tZWRpYXRlOyBpdCdzIGp1c3QgdGhlIHdhaXQgYWZ0ZXIK
PiB0aGUgaGVhbHRoIGNoZWNrIHdoZXJlIHdlIGFwcGVhciB0byBoYXZlIGlzc3VlcyEKPiAKPiBT
aWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiBD
YzogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KPiAtLS0KPiAgIHRl
c3RzL2k5MTUvZ2VtX2Vpby5jIHwgNSArKysrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS90ZXN0cy9pOTE1L2dlbV9l
aW8uYyBiL3Rlc3RzL2k5MTUvZ2VtX2Vpby5jCj4gaW5kZXggMDA3YjlmYjcwLi43YzhmZjEwZGYg
MTAwNjQ0Cj4gLS0tIGEvdGVzdHMvaTkxNS9nZW1fZWlvLmMKPiArKysgYi90ZXN0cy9pOTE1L2dl
bV9laW8uYwo+IEBAIC03NiwxMiArNzYsMTUgQEAgc3RhdGljIHZvaWQgdHJpZ2dlcl9yZXNldChp
bnQgZmQpCj4gICAJaWd0X2ttc2coS01TR19ERUJVRyAiRm9yY2luZyBHUFUgcmVzZXRcbiIpOwo+
ICAgCWlndF9mb3JjZV9ncHVfcmVzZXQoZmQpOwo+ICAgCj4gKwkvKiBUaGUgZm9yY2VkIHJlc2V0
IHNob3VsZCBiZSBpbW1lZGlhdGUgKi8KPiArCWlndF9hc3NlcnRfbHRlKGlndF9zZWNvbmRzX2Vs
YXBzZWQoJnRzKSwgMik7Cj4gKwo+ICAgCS8qIEFuZCBqdXN0IGNoZWNrIHRoZSBncHUgaXMgaW5k
ZWVkIHJ1bm5pbmcgYWdhaW4gKi8KPiAgIAlpZ3Rfa21zZyhLTVNHX0RFQlVHICJDaGVja2luZyB0
aGF0IHRoZSBHUFUgcmVjb3ZlcmVkXG4iKTsKPiAgIAlnZW1fdGVzdF9lbmdpbmUoZmQsIEFMTF9F
TkdJTkVTKTsKPiAgIAlpZ3RfZHJvcF9jYWNoZXNfc2V0KGZkLCBEUk9QX0FDVElWRSk7Cj4gICAK
PiAtCS8qIFdlIGV4cGVjdCBmb3JjZWQgcmVzZXQgYW5kIGhlYWx0aCBjaGVjayB0byBiZSBxdWlj
ay4gKi8KPiArCS8qIFdlIGV4cGVjdCBoZWFsdGggY2hlY2sgdG8gYmUgcXVpY2suICovCj4gICAJ
aWd0X2Fzc2VydF9sdGUoaWd0X3NlY29uZHNfZWxhcHNlZCgmdHMpLCAxMCk7Cj4gICB9Cj4gICAK
PiAKClJldmlld2VkLWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29t
PgoKUmVnYXJkcywKClR2cnRrbwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1k
ZXY=
