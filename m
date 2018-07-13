Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
References: <20180713105945.17445-1-chris@chris-wilson.co.uk>
 <7c5d12f9-be40-6c2e-5416-335eed9b53ee@linux.intel.com>
 <153149420895.24385.18031914352012229197@skylake-alporthouse-com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <8811e57a-5daf-2563-b783-e2336db1988d@linux.intel.com>
Date: Fri, 13 Jul 2018 16:14:35 +0100
MIME-Version: 1.0
In-Reply-To: <153149420895.24385.18031914352012229197@skylake-alporthouse-com>
Content-Language: en-GB
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t v2] igt/gem_userptr: Check
 read-only mappings
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDEzLzA3LzIwMTggMTY6MDMsIENocmlzIFdpbHNvbiB3cm90ZToKPiBRdW90aW5nIFR2cnRr
byBVcnN1bGluICgyMDE4LTA3LTEzIDE1OjUxOjUwKQo+Pgo+PiBPbiAxMy8wNy8yMDE4IDExOjU5
LCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4+PiArICAgICAvKiBOb3cgZW5mb3JjZSByZWFkLW9ubHkg
aGVuY2Vmb3J0aCAqLwo+Pj4gKyAgICAgaWd0X2Fzc2VydChtcHJvdGVjdChzcGFjZSwgdG90YWws
IFBST1RfUkVBRCkgPT0gMCk7Cj4+Cj4+IElmIHJoYW5kbGUgd2FzIHN0aWxsIGFsaXZlLCB3b3Vs
ZCB0aGlzIHRyaWdnZXIgdGhlIG1tdSBub3RpZmllcgo+PiBpbnZhbGlkYXRpb24/IFNvbWV0aGlu
ZyB0byBjaGVjayBtYXliZSwgaWYgdGhlcmUgaXMgc3VjaCBob29rLgo+IAo+IEJ1dCBmcm9tIHJo
YW5kbGUncyBwb2ludCBvZiB2aWV3LCBub3QgbXVjaCBoYXBwZW5zLiBJdCdzIGp1c3QgYSByZWd1
bGFyCj4gaW52YWxpZGF0aW9uIGFuZCByZWNvdmVyeSwgSSB0aGluayBjb3ZlcmVkIGJ5IHRoZSBt
bWFwLWludmFsaWRhdGUgdGVzdHMuCgpZZWFoIGxvb2tzIGxpa2UgdGhhdCB0ZXN0X2ludmFsaWRh
dGVfY2xvc2VfcmFjZSBpbXBsaWVzIG1tdSBub3RpZmllciBpcyAKaW5kZWVkIGludm9rZWQgb24g
cGdwcm90IGNoYW5nZXMuIFNvIGl0J3MgZ29vZC4KCj4+PiArCj4+PiArICAgICAvKiBDaGVjayB0
aGF0IHdlIGRpc2FsbG93IHJlbW92aW5nIHRoZSByZWFkb25seSBwcm90ZWN0aW9uICovCj4+Cj4+
IFdoYXQgZG9lcyBpdCBtZWFuIHRoYXQgd2UgYXJlIGRpc2FsbG93aW5nIGl0PyBJcyBpdCBtb3Jl
IHRoYXQgd2UgYXJlCj4+IG9ibGl2aW91cyB0byBpdCAoZm9ybSB0aGUgdXNlcnB0ciBibyBwb2lu
dCBvZiB2aWV3KT8KPiAKPiBObywgdGhhdCBtcHJvdGVjdChQUk9UX1dSSVRFKSByZXBvcnRzIGFu
IGVycm9yIGlmIHlvdSB0cnkgdG8gY2hhbmdlIHRoZQo+IHByb3RlY3Rpb24gZnJvbSBQUk9UX1JF
QUQsIHNvIHlvdSBhcmUgbm90IGFsbG93ZWQgdG8gY3JlYXRlCj4gbW1hcF9ndHQoUFJPVF9XUklU
RSkgaW50byBhIHJlYWQtb25seSB1c2VycHRyLCBub3IgYXJlIHlvdSBhbGxvd2VkIHRvCj4gZ2V0
IGFyb3VuZCB0aGF0IHJlc3RyaWN0aW9uIGJ5IGNoYW5naW5nIHRoZSBDUFUgUFRFIHByb3RlY3Rp
b24gbGF0ZXIuCgpBaCBzbyBkaXNhbGxvd2VkIGJ5IHRoZSBjb3JlIGtlcm5lbD8gSSBtaXNzZWQg
dGhhdCBpcyBob3cgdGhpbmdzIHdvcmsuCgpSZWdhcmRzLAoKVHZydGtvCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QK
SW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
