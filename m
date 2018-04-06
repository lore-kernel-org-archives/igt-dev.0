Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20180405184757.15907-1-chris@chris-wilson.co.uk>
 <20180405184757.15907-2-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <6d6990be-2017-92ae-4ba0-43835b127cba@linux.intel.com>
Date: Fri, 6 Apr 2018 09:35:41 +0100
MIME-Version: 1.0
In-Reply-To: <20180405184757.15907-2-chris@chris-wilson.co.uk>
Content-Language: en-GB
Subject: Re: [igt-dev] [Intel-gfx] [PATCH igt 2/2] igt/gem_eio: Drop
 DRM_MASTER so we can reacquire it in the subtests
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

Ck9uIDA1LzA0LzIwMTggMTk6NDcsIENocmlzIFdpbHNvbiB3cm90ZToKPiBBcyB3ZSByZW9wZW4g
dGhlIGZkIGZvciBlYWNoIHN1YnRlc3QsIGFuZCB3ZSBuZWVkIGEgRFJNX01BU1RFUiwgd2UgbmVl
ZAo+IHRvIGRyb3AgbWFzdGVyIG9uIHRoZSBvcmlnaW5hbCBiZWZvcmUgd2UgYXJlIGFsbG93ZWQg
dG8gY2xhaW0gRFJNX01BU1RFUgo+IG9uIHRoZSBzZWNvbmQuCj4gCj4gU2lnbmVkLW9mZi1ieTog
Q2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gQ2M6IFR2cnRrbyBVcnN1
bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+Cj4gLS0tCj4gICB0ZXN0cy9nZW1fZWlvLmMg
fCAyICsrCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdp
dCBhL3Rlc3RzL2dlbV9laW8uYyBiL3Rlc3RzL2dlbV9laW8uYwo+IGluZGV4IDk1OTllNzNkLi42
NmQ4YzE4YSAxMDA2NDQKPiAtLS0gYS90ZXN0cy9nZW1fZWlvLmMKPiArKysgYi90ZXN0cy9nZW1f
ZWlvLmMKPiBAQCAtNDEsNiArNDEsNyBAQAo+ICAgI2luY2x1ZGUgPGRybS5oPgo+ICAgCj4gICAj
aW5jbHVkZSAiaWd0LmgiCj4gKyNpbmNsdWRlICJpZ3RfZGV2aWNlLmgiCj4gICAjaW5jbHVkZSAi
aWd0X3N5c2ZzLmgiCj4gICAjaW5jbHVkZSAic3dfc3luYy5oIgo+ICAgCj4gQEAgLTY3NCw2ICs2
NzUsNyBAQCBpZ3RfbWFpbgo+ICAgCj4gICAJaWd0X2ZpeHR1cmUgewo+ICAgCQlmZCA9IGRybV9v
cGVuX2RyaXZlcihEUklWRVJfSU5URUwpOwo+ICsJCWlndF9kZXZpY2VfZHJvcF9tYXN0ZXIoZmQp
OwoKCklzIGl0IG1hc3RlciBieSBkZWZhdWx0PyBJIGNhbid0IHNwb3QgYSBwbGFjZSB3aGljaCB3
b3VsZCBzZXQgbWFzdGVyIAplaXRoZXIgaW4gaWd0L2xpYi8gb3IgaW4gZHJtLgoKQnV0IGluIGFu
eSBjYXNlLCBzaG91bGQgd2UgaGF2ZSBnZW1fcmVvcGVuX2RyaXZlciBhdHRlbXB0IHRvIGRyb3Ag
bWFzdGVyIApiZWZvcmUgcmUtb3BlbmluZz8gQW5kIGlmIGl0IHdhcyBzdWNjZXNzZnVsLCBkcm9w
IGl0IGFnYWluIGFmdGVyIApyZS1vcGVuaW5nIHRvIGVuZCB1cCBpbiB0aGUgc2FtZSBzdGF0ZT8K
ClJlZ2FyZHMsCgpUdnJ0a28KCj4gICAKPiAgIAkJaWd0X3JlcXVpcmUoaTkxNV9yZXNldF9jb250
cm9sKHRydWUpKTsKPiAgIAkJaWd0X2ZvcmNlX2dwdV9yZXNldChmZCk7Cj4gCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlz
dAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
