Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180302111219.wjas3yhqqbafc4ju@platvala-desk.ger.corp.intel.com>
References: <b8382b39-1c55-065e-a212-7512c98159be@intel.com>
 <20180228100555.11734-1-tvrtko.ursulin@linux.intel.com>
 <20180302111219.wjas3yhqqbafc4ju@platvala-desk.ger.corp.intel.com>
Message-ID: <151999034674.32001.17684398035555526277@mail.alporthouse.com>
Date: Fri, 02 Mar 2018 11:32:26 +0000
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/perf_pmu: Handle CPU hotplug
 failures better
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
To: Petri Latvala <petri.latvala@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>
Cc: igt-dev@lists.freedesktop.org, Tomi Sarvela <tomi.p.sarvela@intel.com>, Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBQZXRyaSBMYXR2YWxhICgyMDE4LTAzLTAyIDExOjEyOjE5KQo+IE9uIFdlZCwgRmVi
IDI4LCAyMDE4IGF0IDEwOjA1OjU1QU0gKzAwMDAsIFR2cnRrbyBVcnN1bGluIHdyb3RlOgo+ID4g
Ky8qKgo+ID4gKyAqIGlndF9mYXRhbF9lcnJvcjoKPiA+ICsgKgo+ID4gKyAqIFN0b3AgdGVzdCBl
eGVjdXRpb24gb3Igb3B0aW9uYWxseSwgaWYgdGhlIElHVF9SRUJPT1RfT05fRkFUQUxfRVJST1IK
PiA+ICsgKiBlbnZpcm9ubWVudCB2YXJpYWJsZSBpcyBzZXQsIHJlYm9vdCB0aGUgbWFjaGluZS4K
PiA+ICsgKgo+ID4gKyAqIFNpbmNlIG91dCB0ZXN0IHJ1bm5lciAocGlnbGl0KSBkb2VzIHN1cHBv
cnQgZmF0YWwgdGVzdCBleGl0IGNvZGVzLCB3ZQo+ID4gKyAqIGltcGxlbWVudCB0aGUgZGVmYXVs
dCBiZWhhdmlvdXIgYnkgd2FpdGluZyBlbmRsZXNzbHkuCj4gPiArICovCj4gPiArdm9pZCAgX19h
dHRyaWJ1dGVfXygobm9yZXR1cm4pKSBpZ3RfZmF0YWxfZXJyb3Iodm9pZCkKPiA+ICt7Cj4gPiAr
ICAgICBpZiAoaWd0X2NoZWNrX2Jvb2xlYW5fZW52X3ZhcigiSUdUX1JFQk9PVF9PTl9GQVRBTF9F
UlJPUiIsIGZhbHNlKSkgewo+ID4gKyAgICAgICAgICAgICBpZ3Rfd2FybigiRkFUQUwgRVJST1Ig
LSBSRUJPT1RJTkciKTsKPiA+ICsgICAgICAgICAgICAgaWd0X3N5c3JxX3JlYm9vdCgpOwo+ID4g
KyAgICAgfSBlbHNlIHsKPiA+ICsgICAgICAgICAgICAgaWd0X3dhcm4oIkZBVEFMIEVSUk9SIik7
Cj4gPiArICAgICAgICAgICAgIGZvciAoOzspCj4gPiArICAgICAgICAgICAgICAgICAgICAgc2xl
ZXAoNjApOwoKcy9zbGVlcC9wYXVzZS8KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaWd0LWRldgo=
