Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190517112526.6738-6-tvrtko.ursulin@linux.intel.com>
References: <20190517112526.6738-1-tvrtko.ursulin@linux.intel.com>
 <20190517112526.6738-6-tvrtko.ursulin@linux.intel.com>
Message-ID: <155812107361.1890.7709017688787897835@skylake-alporthouse-com>
Date: Fri, 17 May 2019 20:24:33 +0100
Subject: Re: [igt-dev] [PATCH i-g-t 05/25] trace.pl: Virtual engine
 preemption support
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOS0wNS0xNyAxMjoyNTowNikKPiBGcm9tOiBUdnJ0
a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+IAo+IFVzZSB0aGUgJ2NvbXBs
ZXRlZD8nIHRyYWNlcG9pbnQgZmllbGQgdG8gZGV0ZWN0IG1vcmUgcm9idXN0bHkgd2hlbiBhCj4g
cmVxdWVzdCBoYXMgYmVlbiBwcmVlbXB0ZWQgYW5kIHJlbW92ZSBpdCBmcm9tIHRoZSBlbmdpbmUg
ZGF0YWJhc2UgaWYgc28uCj4gCj4gT3RoZXJ3aXNlIHRoZSBzY3JpcHQgY2FuIGhpdCBhIHNjZW5h
cmlvIHdoZXJlIHRoZSBzYW1lIGdsb2JhbCBzZXFubyB3aWxsCj4gYmUgbWVudGlvbmVkIG11bHRp
cGxlIHRpbWVzIChvbiBhbiBlbmdpbmUgc2Vxbm8pIHdoaWNoIGFib3J0cyBwcm9jZXNzaW5nLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5j
b20+CgpPay4gSW4gdGhlIGZ1dHVyZSwgd2Ugd2lsbCBlbmQgdXAgd2l0aCByZXF1ZXN0cyBzdGls
bCBpbiB0aGUgZGIsIGJ1dAp0aGlzIGRvZXMgd2hhdCB5b3Ugc2F5IG9uIHRoZSB0aW4uClJldmll
d2VkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KLUNocmlzCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFp
bGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
