Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C298F6E048
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2019 10:05:05 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190321095339.31273-1-katarzyna.dec@intel.com>
References: <20190321095339.31273-1-katarzyna.dec@intel.com>
Message-ID: <155316269871.22764.14428058110885285265@skylake-alporthouse-com>
Date: Thu, 21 Mar 2019 10:04:58 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Make igt_device_get_pci_addr
 non-static.
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
To: Katarzyna Dec <katarzyna.dec@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBLYXRhcnp5bmEgRGVjICgyMDE5LTAzLTIxIDA5OjUzOjM5KQo+IExldCdzIG1ha2Ug
aWd0X3BjaV9hZGRyIHN0cnVjdCBhbmQgaWd0X2RldmljZV9nZXRfcGNpX2FkZHIKPiBub24tc3Rh
dGljIHRvIGJlIGFibGUgdG8gdXNlIHRoZW0gaW4gdGVzdHMuCgpDYW4gZG8uIFBsZWFzZSBzZW5k
IGludGVyZmFjZSBjaGFuZ2VzIHdpdGggdGhlIGNvbnN1bWVyIHNvIHdlIGNhbiBzZWUKdGhlIGJp
Z2dlciBwaWN0dXJlLgogCj4gU2lnbmVkLW9mZi1ieTogS2F0YXJ6eW5hIERlYyA8a2F0YXJ6eW5h
LmRlY0BpbnRlbC5jb20+Cj4gQ2M6IE1pY2hhbCBXaW5pYXJza2kgPG1pY2hhbC53aW5pYXJza2lA
aW50ZWwuY29tPgo+IENjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4K
PiAtLS0KPiAgbGliL2lndF9kZXZpY2UuYyB8IDkgKy0tLS0tLS0tCj4gIGxpYi9pZ3RfZGV2aWNl
LmggfCA4ICsrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA4IGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9saWIvaWd0X2RldmljZS5jIGIvbGliL2lndF9k
ZXZpY2UuYwo+IGluZGV4IGEyZjliYjNhLi5mZWM4NDYwOSAxMDA2NDQKPiAtLS0gYS9saWIvaWd0
X2RldmljZS5jCj4gKysrIGIvbGliL2lndF9kZXZpY2UuYwo+IEBAIC0xMzAsMTQgKzEzMCw3IEBA
IHN0YXRpYyBib29sIGlndF9kZXZpY2VfaXNfcGNpKGludCBmZCkKPiAgICAgICAgIHJldHVybiBz
dHJjbXAoc3Vic3lzdGVtLCAiL3BjaSIpID09IDA7Cj4gIH0KPiAgCj4gLXN0cnVjdCBpZ3RfcGNp
X2FkZHIgewo+IC0gICAgICAgdW5zaWduZWQgaW50IGRvbWFpbjsKPiAtICAgICAgIHVuc2lnbmVk
IGludCBidXM7Cj4gLSAgICAgICB1bnNpZ25lZCBpbnQgZGV2aWNlOwo+IC0gICAgICAgdW5zaWdu
ZWQgaW50IGZ1bmN0aW9uOwo+IC19OwoKSWYgd2UgYXJlIGdvaW5nIHRvIGV4cG9ydCBpdCwgc2hv
dWxkIHdlIG1ha2UgdGhpcyA0eCB1aW50MTZfdD8KLUNocmlzCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaWd0LWRldg==
