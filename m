Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20180514080251.11224-1-chris@chris-wilson.co.uk>
 <20180514080251.11224-2-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <2d1261aa-f9cb-8fe9-3d28-67e6beb39b09@linux.intel.com>
Date: Mon, 14 May 2018 11:20:15 +0100
MIME-Version: 1.0
In-Reply-To: <20180514080251.11224-2-chris@chris-wilson.co.uk>
Content-Language: en-GB
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 2/6] lib/audio: Replace
 sqrt(a*a + b*b) with hypot(a, b)
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

Ck9uIDE0LzA1LzIwMTggMDk6MDIsIENocmlzIFdpbHNvbiB3cm90ZToKPiBTaWduZWQtb2ZmLWJ5
OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiAtLS0KPiAgIGxpYi9p
Z3RfYXVkaW8uYyB8IDQgKy0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAz
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9saWIvaWd0X2F1ZGlvLmMgYi9saWIvaWd0
X2F1ZGlvLmMKPiBpbmRleCAyMzIxZDFjNmUuLjIyOWNlNmM2OSAxMDA2NDQKPiAtLS0gYS9saWIv
aWd0X2F1ZGlvLmMKPiArKysgYi9saWIvaWd0X2F1ZGlvLmMKPiBAQCAtMjY2LDkgKzI2Niw3IEBA
IGJvb2wgYXVkaW9fc2lnbmFsX2RldGVjdChzdHJ1Y3QgYXVkaW9fc2lnbmFsICpzaWduYWwsIGlu
dCBjaGFubmVscywKPiAgIAkJbWF4ID0gMDsKPiAgIAo+ICAgCQlmb3IgKGkgPSAwOyBpIDwgZnJh
bWVzIC8gMjsgaSsrKSB7Cj4gLQkJCWFtcGxpdHVkZVtpXSA9IHNxcnQoZGF0YVtpXSAqIGRhdGFb
aV0gKwo+IC0JCQkJCSAgICBkYXRhW2ZyYW1lcyAtIGldICoKPiAtCQkJCQkgICAgZGF0YVtmcmFt
ZXMgLSBpXSk7Cj4gKwkJCWFtcGxpdHVkZVtpXSA9IGh5cG90KGRhdGFbaV0sIGRhdGFbZnJhbWVz
IC0gaV0pOwo+ICAgCQkJaWYgKGFtcGxpdHVkZVtpXSA+IG1heCkKPiAgIAkJCQltYXggPSBhbXBs
aXR1ZGVbaV07Cj4gICAJCX0KPiAKClJldmlld2VkLWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtv
LnVyc3VsaW5AaW50ZWwuY29tPgoKUmVnYXJkcywKClR2cnRrbwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2lndC1kZXYK
