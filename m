Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <1D440B9B88E22A4ABEF89F9F1F81BC29E94A5E2E@FMSMSX106.amr.corp.intel.com>
References: <20191113125240.3781-1-chris@chris-wilson.co.uk>
 <20191113125240.3781-5-chris@chris-wilson.co.uk>
 <1D440B9B88E22A4ABEF89F9F1F81BC29E94A5E2E@FMSMSX106.amr.corp.intel.com>
Message-ID: <157437988036.2524.15103838845430811433@skylake-alporthouse-com>
Date: Thu, 21 Nov 2019 23:44:40 +0000
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 5/9] i915/gem_ctx_isolation:
 Check engine relative registers
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
To: "Tang, CQ" <cq.tang@intel.com>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBUYW5nLCBDUSAoMjAxOS0xMS0yMSAyMTowNzoxMykKPiAKPiAKPiA+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9tOiBJbnRlbC1nZnggPGludGVsLWdmeC1ib3VuY2Vz
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mCj4gPiBDaHJpcyBXaWxzb24KPiA+
IFNlbnQ6IFdlZG5lc2RheSwgTm92ZW1iZXIgMTMsIDIwMTkgNDo1MyBBTQo+ID4gVG86IGludGVs
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IENjOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+ID4gU3ViamVjdDogW0ludGVsLWdmeF0gW1BBVENIIGktZy10IDUvOV0gaTkxNS9n
ZW1fY3R4X2lzb2xhdGlvbjogQ2hlY2sgZW5naW5lCj4gPiBAQCAtMjQ4LDYgKzIzOCw3IEBAIHN0
YXRpYyB2b2lkIHRtcGxfcmVncyhpbnQgZmQsICB7Cj4gPiAgICAgICBjb25zdCB1bnNpZ25lZCBp
bnQgZ2VuX2JpdCA9IDEgPDwKPiA+IGludGVsX2dlbihpbnRlbF9nZXRfZHJtX2RldmlkKGZkKSk7
Cj4gPiAgICAgICBjb25zdCB1bnNpZ25lZCBpbnQgZW5naW5lX2JpdCA9IEVOR0lORShlLT5jbGFz
cywgZS0+aW5zdGFuY2UpOwo+ID4gKyAgICAgY29uc3QgdWludDMyX3QgbW1pb19iYXNlID0gZ2Vt
X2VuZ2luZV9tbWlvX2Jhc2UoZmQsIGUtPm5hbWUpOwo+IAo+IENocmlzLCBJIHRyaWVkIHRvIHRl
c3QgdGhpcyBwYXRjaCwgYnV0ICJnZW1fZW5naW5lX21taW9fYmFzZSgpIiBhYm92ZSBpcyBub3Qg
ZGVmaW5lZC4KPiBDYW4geW91IGNoZWNrPwoKRGlkIHlvdSBwZXJjaGFuY2UgbG9vayBhdCBwYXRj
aCA0PwotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
