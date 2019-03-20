Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
In-Reply-To: <20190319192320.10526-1-chris@chris-wilson.co.uk>
References: <20190319192320.10526-1-chris@chris-wilson.co.uk>
Date: Wed, 20 Mar 2019 16:54:51 +0200
Message-ID: <875zsd1tqc.fsf@gaia.fi.intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t]
 i915/gem_mocs_settings/mocs-isolation: Filter out missing rings
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
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Q2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+IHdyaXRlczoKCj4gRG9uJ3Qg
dHJ5IHRvIGV2YWx1YXRlIHdoZXRoZXIgcmVhZHMgZXhlY3V0ZWQgb24gYW4gYWJzZW50IHJpbmcg
ZG8KPiBhbnl0aGluZy4KPgo+IFNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hy
aXMtd2lsc29uLmNvLnVrPgoKUmV2aWV3ZWQtYnk6IE1pa2EgS3VvcHBhbGEgPG1pa2Eua3VvcHBh
bGFAbGludXguaW50ZWwuY29tPgoKPiAtLS0KPiAgdGVzdHMvaTkxNS9nZW1fbW9jc19zZXR0aW5n
cy5jIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9nZW1fbW9jc19zZXR0aW5ncy5jIGIv
dGVzdHMvaTkxNS9nZW1fbW9jc19zZXR0aW5ncy5jCj4gaW5kZXggMjFmN2M2ZTEyLi4xYTMxMWI4
YzAgMTAwNjQ0Cj4gLS0tIGEvdGVzdHMvaTkxNS9nZW1fbW9jc19zZXR0aW5ncy5jCj4gKysrIGIv
dGVzdHMvaTkxNS9nZW1fbW9jc19zZXR0aW5ncy5jCj4gQEAgLTU2NCw4ICs1NjQsOCBAQCBpZ3Rf
bWFpbgo+ICAJCQl9Cj4gIAkJfQo+ICAKPiAtCQlpZ3Rfc3VidGVzdF9mKCJtb2NzLWlzb2xhdGlv
bi0lcyIsCj4gLQkJCSAgICAgIGUtPm5hbWUpIHsKPiArCQlpZ3Rfc3VidGVzdF9mKCJtb2NzLWlz
b2xhdGlvbi0lcyIsIGUtPm5hbWUpIHsKPiArCQkJZ2VtX3JlcXVpcmVfcmluZyhmZCwgZS0+ZXhl
Y19pZCB8IGUtPmZsYWdzKTsKPiAgCQkJZ2VtX3JlcXVpcmVfY29udGV4dHMoZmQpOwo+ICAKPiAg
CQkJaXNvbGF0aW9uX3Rlc3QoZmQsIGUtPmV4ZWNfaWQgfCBlLT5mbGFncyk7Cj4gLS0gCj4gMi4y
MC4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IGlndC1kZXYgbWFpbGluZyBsaXN0Cj4gaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1h
aWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4
