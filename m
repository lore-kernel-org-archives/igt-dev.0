Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE106E0AD
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Jul 2018 12:14:45 +0000 (UTC)
References: <20180720170321.20700-1-gwan-gyeong.mun@intel.com>
From: Martin Peres <martin.peres@linux.intel.com>
Message-ID: <24b15366-3860-93ec-196e-35e67763133d@linux.intel.com>
Date: Tue, 24 Jul 2018 15:14:41 +0300
MIME-Version: 1.0
In-Reply-To: <20180720170321.20700-1-gwan-gyeong.mun@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH] docs/chamelium: Change chamelium.c to
 kms_chamelium.c
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
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gMjAvMDcvMTggMjA6MDMsIEd3YW4tZ3llb25nIE11biB3cm90ZToKPiBUaGlzIGNvbW1pdCAo
ODgwOTYzOGU4ZTQyNDg4YWFjNzAxMDY2ZDdjZWQxNjQ4NTRjNmM5YykgcmVuYW1lZCBjaGFtZWxp
dW0gdG8KPiBrbXNfY2hhbWVsaXVtLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEd3YW4tZ3llb25nIE11
biA8Z3dhbi1neWVvbmcubXVuQGludGVsLmNvbT4KPiAtLS0KPiAgZG9jcy9jaGFtZWxpdW0udHh0
IHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZG9jcy9jaGFtZWxpdW0udHh0IGIvZG9jcy9jaGFtZWxpdW0udHh0
Cj4gaW5kZXggZWNmZDUyYjQuLmVkMTU0OTkwIDEwMDY0NAo+IC0tLSBhL2RvY3MvY2hhbWVsaXVt
LnR4dAo+ICsrKyBiL2RvY3MvY2hhbWVsaXVtLnR4dAo+IEBAIC0xMjUsNyArMTI1LDcgQEAgQ3Vy
cmVudCBTdXBwb3J0IGluIElHVAo+ICAKPiAgU3VwcG9ydCBmb3IgdGhlIENoYW1lbGl1bSBwbGF0
Zm9ybSBpbiBJR1QgaXMgZm91bmQgaW4gdGhlIGZvbGxvd2luZyBwbGFjZXM6Cj4gICogbGliL2ln
dF9jaGFtZWxpdW0uYzogbGlicmFyeSB3aXRoIENoYW1lbGl1bS1yZWxhdGVkIGhlbHBlcnMKPiAt
KiB0ZXN0cy9jaGFtZWxpdW0uYzogc3ViLXRlc3RzIHVzaW5nIHRoZSBDaGFtZWxpdW0KPiArKiB0
ZXN0cy9rbXNfY2hhbWVsaXVtLmM6IHN1Yi10ZXN0cyB1c2luZyB0aGUgQ2hhbWVsaXVtCj4gIAo+
ICBBcyBvZiBsYXRlIEF1Z3VzdCAyMDE3LCB0aGUgZm9sbG93aW5nIGZlYXR1cmVzIGFyZSB0ZXN0
ZWQgYnkgSUdUOgo+ICAqIFBpeGVsLWJ5LXBpeGVsIGZyYW1lIGludGVncml0eSB0ZXN0cyBmb3Ig
RFAgYW5kIEhETUkKPiAKClJldmlld2VkLWJ5OiBNYXJ0aW4gUGVyZXMgPG1hcnRpbi5wZXJlc0Bs
aW51eC5pbnRlbC5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
