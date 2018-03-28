Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180328182948.27494-1-tvrtko.ursulin@linux.intel.com>
References: <20180328182948.27494-1-tvrtko.ursulin@linux.intel.com>
Message-ID: <152226213156.10679.7357117016655677880@mail.alporthouse.com>
Date: Wed, 28 Mar 2018 19:35:31 +0100
Subject: Re: [igt-dev] [RFC i-g-t] intel-gpu-top: Rewrite the tool to be
 safe to use
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
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOC0wMy0yOCAxOToyOTo0OCkKPiBGcm9tOiBUdnJ0
a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+IAo+IGludGVsLWdwdS10b3Ag
aXMgYSBkYW5nZXJvdXMgdG9vbCB3aGljaCBjYW4gaGFuZyBtYWNoaW5lcyBkdWUgdW5zYWZlIG1t
aW8KPiByZWdpc3RlciBhY2Nlc3MuIFRoaXMgcGF0Y2ggcmV3cml0ZXMgaXQgdG8gdXNlIG9ubHkg
UE1VLgo+IAo+IE9ubHkgb3ZlcmFsbCBjb21tYW5kIHN0cmVhbWVyIGJ1c3luZXNzIGFuZCBHUFUg
Z2xvYmFsIGRhdGEgc3VjaCBhcyBwb3dlcgo+IGFuZCBmcmVxdWVuY2llcyBhcmUgaW5jbHVkZWQg
aW4gdGhpcyBuZXcgdmVyc2lvbi4KPiAKPiBGb3IgYWNjZXNzIHRvIG1vcmUgR1BVIGZ1bmN0aW9u
YWwgdW5pdCBsZXZlbCBkYXRhLCBhbiBPQSBtZXRyaWMgYmFzZWQgdG9vbAo+IGxpa2UgZ3B1LXRv
cCBzaG91bGQgYmUgdXNlZCBpbnN0ZWFkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFR2cnRrbyBVcnN1
bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+Cj4gQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNA
Y2hyaXMtd2lsc29uLmNvLnVrPgo+IENjOiBMaW9uZWwgTGFuZHdlcmxpbiA8bGlvbmVsLmcubGFu
ZHdlcmxpbkBpbnRlbC5jb20+Cj4gQ2M6IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50
ZWwuY29tPgoKTG9va2VkIGdvb2QgdG8gbWUuCgpTb21lb25lIG1pZ2h0IGNvbXBsYWluIGFib3V0
IHRoZSBsb3NzIG9mICJzdGF0cyIgbW9kZSwgYnV0IHdlIGNhbiBwb2ludAp0aGVtIHRvd2FyZHMg
InBlcmYgcmVjb3JkIiBub3cuCgpIYWxmLXJldmlld2VkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlz
QGNocmlzLXdpbHNvbi5jby51az4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaWd0LWRldgo=
