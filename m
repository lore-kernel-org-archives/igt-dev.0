Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20190228141828.2567-1-tvrtko.ursulin@linux.intel.com>
 <20190228141828.2567-5-tvrtko.ursulin@linux.intel.com>
 <155136438087.5847.12673828758236657477@skylake-alporthouse-com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <744b4fc8-7064-8d6b-34e7-99a008732e9e@linux.intel.com>
Date: Thu, 28 Feb 2019 14:48:55 +0000
MIME-Version: 1.0
In-Reply-To: <155136438087.5847.12673828758236657477@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 5/5] tests/i915/pm_rc6_residency: Fix
 linking
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
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDI4LzAyLzIwMTkgMTQ6MzMsIENocmlzIFdpbHNvbiB3cm90ZToKPiBRdW90aW5nIFR2cnRr
byBVcnN1bGluICgyMDE5LTAyLTI4IDE0OjE4OjI4KQo+PiBGcm9tOiBUdnJ0a28gVXJzdWxpbiA8
dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+Pgo+PiBQcm9iYWJseSBhIGxlZnRvdmVyIGZyb20g
dGVzdCByZW5hbWVzOgo+Pgo+PiAgICB0ZXN0cy9NYWtlZmlsZS5hbToxMzQ6IHdhcm5pbmc6IHZh
cmlhYmxlICdwbV9yYzZfcmVzaWRlbmN5X0xEQUREJyBpcyBkZWZpbmVkIGJ1dCBubyBwcm9ncmFt
IG9yCj4+ICAgIHRlc3RzL01ha2VmaWxlLmFtOjEzNDogbGlicmFyeSBoYXMgJ3BtX3JjNl9yZXNp
ZGVuY3knIGFzIGNhbm9uaWNhbCBuYW1lIChwb3NzaWJsZSB0eXBvKQo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+PiAtLS0KPj4g
ICB0ZXN0cy9NYWtlZmlsZS5hbSB8IDIgKy0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3Rlc3RzL01ha2VmaWxlLmFt
IGIvdGVzdHMvTWFrZWZpbGUuYW0KPj4gaW5kZXggYzVkZDIxMGM3MTYzLi44MGJjNWY5MmExM2Ig
MTAwNjQ0Cj4+IC0tLSBhL3Rlc3RzL01ha2VmaWxlLmFtCj4+ICsrKyBiL3Rlc3RzL01ha2VmaWxl
LmFtCj4+IEBAIC0xMzEsNyArMTMxLDcgQEAgcGVyZl9wbXVfTERBREQgPSAkKExEQUREKSAkKHRv
cF9idWlsZGRpcikvbGliL2xpYmlndF9wZXJmLmxhCj4+ICAgZ2VtX2Vpb19MREFERCA9ICQoTERB
REQpIC1scnQKPj4gICBnZW1fd2FpdF9MREFERCA9ICQoTERBREQpIC1scnQKPj4gICBrbXNfZmxp
cF9MREFERCA9ICQoTERBREQpIC1scnQgLWxwdGhyZWFkCj4+IC1wbV9yYzZfcmVzaWRlbmN5X0xE
QUREID0gJChMREFERCkgLWxydAo+PiAraTkxNV9wbV9yYzZfcmVzaWRlbmN5X0xEQUREID0gJChM
REFERCkgLWxydAo+IAo+IEhhdmUgd2Ugbm90IHNudWNrIC1scnQgaW50byB0aGUgY29yZSBsaWJy
YXJ5IHlldCwgcHJldHR5IHN1cmUgbGliaWd0LmxhCj4gbm93IGluY2x1ZGVzIGNsb2NrX2dldHRp
bWUoKSBhbmQgc28gbXVzdCBiZSBwdWxsaW5nIGl0IGluIGFscmVhZHk/Cj4gCj4gaS5lLiBjYW4g
d2UganVzdCBkcm9wIHRoZSBhYm92ZSBsaW5lPwoKTG9va3MgbGlrZSBpdC4gQW5kIG1hbnkgbW9y
ZSBpbiB0aGlzIGNhc2UuCgpSZWdhcmRzLAoKVHZydGtvCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2lndC1kZXY=
