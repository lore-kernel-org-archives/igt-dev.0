Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190520144739.13111-3-tvrtko.ursulin@linux.intel.com>
References: <20190520144739.13111-1-tvrtko.ursulin@linux.intel.com>
 <20190520144739.13111-3-tvrtko.ursulin@linux.intel.com>
Message-ID: <155842546526.23981.5722257697980402246@skylake-alporthouse-com>
Date: Tue, 21 May 2019 08:57:45 +0100
Subject: Re: [igt-dev] [PATCH i-g-t 02/27] trace.pl: Ignore signaling on non
 i915 fences
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

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOS0wNS0yMCAxNTo0NzoxNCkKPiBGcm9tOiBUdnJ0
a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+IAo+IGdlbV93c2ltIHVzZXMg
dGhlIHN3X2ZlbmNlIHRpbWVsaW5lIGFuZCBjb25mdXNlcyB0aGUgc2NyaXB0Lgo+IAo+IHYyOgo+
ICAqIENoZWNrIHRoZSBjb3JyZWN0IHRpbWVsaW5lIGFzIHdlbGwuIChDaHJpcykKPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+IC0t
LQo+ICBzY3JpcHRzL3RyYWNlLnBsIHwgMyArKysKPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9zY3JpcHRzL3RyYWNlLnBsIGIvc2NyaXB0cy90cmFj
ZS5wbAo+IGluZGV4IDhjODk2Y2ZkZTZiMC4uYWMxNDFhNTE0MDU1IDEwMDc1NQo+IC0tLSBhL3Nj
cmlwdHMvdHJhY2UucGwKPiArKysgYi9zY3JpcHRzL3RyYWNlLnBsCj4gQEAgLTQ0Myw2ICs0NDMs
OSBAQCB3aGlsZSAoPD4pIHsKPiAgICAgICAgIH0gZWxzaWYgKCR0cF9uYW1lIGVxICdkbWFfZmVu
Y2U6ZG1hX2ZlbmNlX3NpZ25hbGVkOicpIHsKPiAgICAgICAgICAgICAgICAgbXkgJG5rZXk7Cj4g
IAo+ICsgICAgICAgICAgICAgICBuZXh0IHVubGVzcyAkdHB7J2RyaXZlcid9IGVxICdpOTE1JyBh
bmQKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgJHRweyd0aW1lbGluZSd9IGVxICdzaWdu
YWxlZCc7CgpIb3BlZnVsbHkgdGhhdCByZW1haW5zIHVuaXF1ZS4uLgpSZXZpZXdlZC1ieTogQ2hy
aXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CgpJIGRvIHJlY2FsbCB3YW50aW5n
IHRvIHJlbW92ZSB0aGUgc3RyaW5ncyBmcm9tIGFsbCB0aGUgdHJhY2Vwb2ludHMgOi1wCi1DaHJp
cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2
IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
