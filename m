Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180720121222.31090-1-tvrtko.ursulin@linux.intel.com>
References: <153208022343.25018.4045411798193903976@skylake-alporthouse-com>
 <20180720121222.31090-1-tvrtko.ursulin@linux.intel.com>
Message-ID: <153208929980.26154.8380274056096023335@skylake-alporthouse-com>
Date: Fri, 20 Jul 2018 13:21:39 +0100
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t v3] tests/perf_pmu: Restore
 runtime PM at subtest exit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Tvrtko Ursulin <tursulin@ursulin.net>, igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOC0wNy0yMCAxMzoxMjoyMikKPiBGcm9tOiBUdnJ0
a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+IAo+IFJlc3RvcmUgcnVudGlt
ZSBQTSBzdGF0ZSAodmlhIGEgbmV3bHkgYWRkZWQgbGlicmFyeSBmdW5jdGlvbikgd2hlbiB0aGUK
PiB0ZXN0IHdoaWNoIHNldHMgaXQgdXAgZXhpdC4gVGhpcyB3YXMgd2UgYXZvaWQgcnVubmluZyBh
bGwgc3Vic2VxdWVudCBzdWItCj4gdGVzdHMgaW4gdGhlIGFnZ3Jlc3NpdmUgcnVudGltZSBQTSBt
b2RlLgo+IAo+IHYyOgo+ICAqIFNraXAgZG91YmxlIHJlc3RvcmUuIChDaHJpcyBXaWxzb24pCj4g
ICogQ2xvc2UgcHJldmlvdXNseSBsZWFrZWQgZmQuCj4gCj4gdjM6Cj4gICogUmVmYWN0b3IgYXRl
eGl0IGhhbmRsZXJzIHRvIGJlIHNpZ25hbCBzYWZlLiAoQ2hyaXMgV2lsc29uKQo+ICAqIFJlc3Rv
cmUgYXVkaW8gcnVudGltZSBQTSBzdGF0dXMuCj4gICogQWRkIGEgZGlmZmVyZW50IFBDSSBwYXRo
IHRvIGF1ZGlvIGRldmljZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZy
dGtvLnVyc3VsaW5AaW50ZWwuY29tPgpSZXZpZXdlZC1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0Bj
aHJpcy13aWxzb24uY28udWs+CgooSnVzdCBzaGlwIGl0IGFscmVhZHkhIEJ1dCBJIGRvIHdvbmRl
ciBpZiB0aGVyZSdzIGEgYmV0dGVyIHdheSB0byBmaW5kCnRoZSBjb250cm9sIGRldmljZSAoc2Vh
cmNoIGJ5IFBDSSB2ZW5kb3IsIGNsYXNzPykgYW5kIGlmIHdlIHNob3VsZG4ndAptYWtlIHRoZSBj
b250cm9sL3ZhbHVlIGJlIHVuaWZvcm0gaW4gdGhlaXIgaGFuZGxpbmcsIHRoZW4ganVzdCBpdGVy
YXRlCm92ZXIgdGhlIGFyZWEgb2YgKHBhdGgsIHZhbHVlKSBmb3IgcmVzdG9yaW5nLikKLUNocmlz
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdm
eCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
