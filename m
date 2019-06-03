Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20190529132421.27905-1-chris@chris-wilson.co.uk>
 <dcc8f38f-2c9b-cb95-3061-0384e95fb7a2@linux.intel.com>
 <20190603103253.GZ22949@platvala-desk.ger.corp.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <2165d563-140f-1fb8-5234-c0099892fe96@linux.intel.com>
Date: Mon, 3 Jun 2019 11:39:25 +0100
MIME-Version: 1.0
In-Reply-To: <20190603103253.GZ22949@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Fix
 intel_get_current_physical_engine() iterator
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
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDAzLzA2LzIwMTkgMTE6MzIsIFBldHJpIExhdHZhbGEgd3JvdGU6Cj4gT24gTW9uLCBKdW4g
MDMsIDIwMTkgYXQgMTE6MTk6NDhBTSArMDEwMCwgVHZydGtvIFVyc3VsaW4gd3JvdGU6Cj4+Cj4+
IE9uIDI5LzA1LzIwMTkgMTQ6MjQsIENocmlzIFdpbHNvbiB3cm90ZToKPj4+IElmIHdlIHJ1biBv
dXQgb2YgZW5naW5lcywgaW50ZWxfZ2V0X2N1cnJlbnRfcGh5c2ljYWxfZW5naW5lKCkgZGVncmFk
ZXMKPj4+IGludG8gYW4gaW5maW5pdGUgbG9vcCBhcyBhbHRob3VnaCBpdCBhZHZhbmNlZCB0aGUg
aXRlcmF0b3IsIGl0IGRpZCBub3QKPj4+IHVwZGF0ZSBpdHMgbG9jYWwgZW5naW5lIHBvaW50ZXIu
Cj4+Cj4+IFdlIGhhZCBvbmUgaW5maW5pdGUgbG9vcCBpbiB0aGVyZSBhbHJlYWR5Li4gQUZBSVIg
aXQgd2FzIG9uIG9uZSBlbmdpbmUKPj4gcGxhdGZvcm1zLiBEb2VzIHRoZSBuZXcgaW5jYXJuYXRp
b24gaGFwcGVuIGFjdHVhbGx5IHZpYSB0aGUKPj4gX19mb3JfZWFjaF9waHlzaWNhbF9lbmdpbmUg
aXRlcmF0b3Igb3IgcGVyaGFwcyBvbmx5IHdoZW4gY2FsbGluZwo+PiBpbnRlbF9nZXRfY3VycmVu
dF9waHlzaWNhbF9lbmdpbmUgYWZ0ZXIgbG9vcCBlbmQ/IFdoeSBpdCB3YXNuJ3Qgc2VlbiBpbgo+
PiB0ZXN0aW5nPwo+IAo+IAo+IFRoZSBuZXcgaW5jYXJuYXRpb24gaGFwcGVucyB3aXRoIGEgd2Vk
Z2VkIEdQVS4gVGhhdCdzIGEgY2FzZSB0aGF0J3MKPiBoYXJkIHRvIGNvbWUgYnkgaW4gdGVzdGlu
Zy4KCjEuCkNvbG91ciBtZSBjb25mdXNlZC4gOikgSG93IGRvZXMgYSB3ZWRnZWQgR1BVIGFmZmVj
dCB0aGlzIGxvb3A/CgoyLgpBcmUgd2UgbWlzc2luZyBhIHRlc3Q/IFdlZGdlLWRvLXN0dWZmLXVu
d2VkZ2Ugc2hvdWxkIGJlIGVhc3kgdG8gd3JpdGUuCgpSZWdhcmRzLAoKVHZydGtvCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGlu
ZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
