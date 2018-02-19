Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180219100408.30246-1-tvrtko.ursulin@linux.intel.com>
References: <20180219100408.30246-1-tvrtko.ursulin@linux.intel.com>
Message-ID: <151903517768.2041.4670562671355178120@mail.alporthouse.com>
Date: Mon, 19 Feb 2018 10:12:57 +0000
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] perf_pmu: Fix some compile
 warnings with old compilers / 32-bit builds
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
To: Tvrtko Ursulin <tursulin@ursulin.net>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOC0wMi0xOSAxMDowNDowOCkKPiBGcm9tOiBUdnJ0
a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+IAo+IENvcnJlY3QgcHJpbnRm
IGZvcm1hdCBmb3IgdWludDY0X3QgYW5kIG9uZSAibWF5IGJlIHVuaW5pdGlhbGl6ZWQiLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+
Cj4gUmVwb3J0ZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgoK
Rml4aW5nIHRob3NlIHR3byB0dXJuZWQgdXAgb25lIG1vcmUhCgpJbiBmaWxlIGluY2x1ZGVkIGZy
b20gLi8uLi9saWIvaWd0Lmg6NDA6MCwKICAgICAgICAgICAgICAgICBmcm9tIHBlcmZfcG11LmM6
NDA6CnBlcmZfcG11LmM6IEluIGZ1bmN0aW9uIOKAmF9fcmVhbF9tYWluMTU0N+KAmToKLi8uLi9s
aWIvaWd0X2d0Lmg6MTExOjI6IHdhcm5pbmc6IOKAmHJlbmRlcl9mZOKAmSBtYXkgYmUgdXNlZCB1
bmluaXRpYWxpemVkIGluIHRoaXMgZnVuY3Rpb24gWy1XbWF5YmUtdW5pbml0aWFsaXplZF0KcGVy
Zl9wbXUuYzoxNzYxOjc6IG5vdGU6IOKAmHJlbmRlcl9mZOKAmSB3YXMgZGVjbGFyZWQgaGVyZQoK
VGhpcyBjb21waWxlciBpcyBlYXNpbHkgY29uZnVzZWQgYnkgbG9uZ2ptcHMKCkBAIC0xNzU4LDcg
KzE3NTgsNyBAQCBpZ3RfbWFpbgogICAgICAgICAqIENoZWNrIHJlbmRlciBub2RlcyBhcmUgY291
bnRlZC4KICAgICAgICAgKi8KICAgICAgICBpZ3Rfc3VidGVzdF9ncm91cCB7Ci0gICAgICAgICAg
ICAgICBpbnQgcmVuZGVyX2ZkOworICAgICAgICAgICAgICAgaW50IHJlbmRlcl9mZCA9IC0xOwog
ClRocm93IHRoYXQgaW4gb24gdG9wIGFuZCBoYXZlIGEgClJldmlld2VkLWJ5OiBDaHJpcyBXaWxz
b24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaWd0LWRldgo=
