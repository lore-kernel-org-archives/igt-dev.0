Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190627122552.10255-1-tvrtko.ursulin@linux.intel.com>
References: <20190627122552.10255-1-tvrtko.ursulin@linux.intel.com>
Message-ID: <156164013297.9225.10934065837156612436@skylake-alporthouse-com>
Date: Thu, 27 Jun 2019 13:55:33 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] lib/i915: Use engine discovery in
 gem_test_engines
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

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOS0wNi0yNyAxMzoyNTo1MikKPiBGcm9tOiBUdnJ0
a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+IAo+IElmIHJlcXVlc3QgaXMg
dG8gdmVyaWZ5IGFsbCBlbmdpbmVzIHdvcmssIHVzZSB0aGUgbmV3IGVuZ2luZSBkaXNjb3Zlcnkg
QVBJCj4gc28gd2UgY2FuIGFjdHVhbGx5IHRlc3QgYWxsLgo+IAo+IFRoZXJlIGlzIGEgc3BvcmFk
aWMgYW5kIG15c3RlcmlvdXMsIHBvc3NpYmx5IG1lbW9yeSBjb3JydXB0aW9uIGlzc3VlCj4gc3Vy
cm9uZGluZyB0aGlzIGFyZWEgc28gbGV0cyBzZWUgaWYgdGhpcyBjaGFuZ2VzIHRoZSBwYXR0ZXJu
LgoKV2hpbGUgSSBkbyBub3QgdGhpbmsgdGhlIHB1cmVseSBvbi1zdGFjayBwYXJhbWV0ZXJzIGhl
cmUgYXJlIHN1YmplY3QgdG8KbWVtb3J5IGNvcnJ1cHRpb24sIG5vciBzaG91bGQgdGhlIHZhbGlk
YXRpb24gcGF0aCBmb3IgdGhlIGV4ZWNidWYKcGFyYW1ldGVycyBiZSBhZmZlY3RlZCBieSBzdXNw
ZW5kLCBpZiB0aGlzIG1ha2VzIHRoZSBwcm9ibGVtIGdvIGF3YXksIEkKY2FuIGJlIGJsaXNzZnVs
bHkgaWdub3JhbnQgYXMgdG8gd2hhdCB3YXMgdGhlIGFjdHVhbCBjYXVzZS4KCj4gSXQgaXMgZWFz
eSB0byBkbyBpbiB0aGlzIGZ1bmN0aW9uIGR1ZSBpdCByZS1vcGVuaW5nIHRoZSBkcml2ZXIgYW5k
Cj4gdGhyb3dpbmcgaXQgYXdheS4gU28gdGhlcmUgYXJlIG5vIGNvbmNlcm5zIHRoYXQgdGhlIG1v
ZGlmaWVkIGRlZmF1bHQKPiBjb250ZXh0IGNhbiBhZmZlY3QgYW55IG90aGVyIHRlc3QuCj4gCj4g
U2lnbmVkLW9mZi1ieTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4K
PiBSZWZlcmVuY2VzOiBodHRwczovL2J1Z3ppbGxhLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5j
Z2k/aWQ9MTEwNjY3ClJldmlld2VkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNv
bi5jby51az4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
