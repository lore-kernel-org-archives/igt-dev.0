Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20180522110044.26439-1-chris@chris-wilson.co.uk>
 <20180522110044.26439-2-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <8be11a80-59e3-fb4f-920c-14ca53f7ffb6@linux.intel.com>
Date: Tue, 22 May 2018 12:38:26 +0100
MIME-Version: 1.0
In-Reply-To: <20180522110044.26439-2-chris@chris-wilson.co.uk>
Content-Language: en-GB
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 2/3]
 benchmarks/gem_syslatency: Allow limiting to just 1 CPU hog
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

Ck9uIDIyLzA1LzIwMTggMTI6MDAsIENocmlzIFdpbHNvbiB3cm90ZToKPiBOb3JtYWxseSB3ZSB1
c2UgYSBob2cgcGVyIENQVSB0byBlbnN1cmUgdGhhdCB0aGUgc3lzdGVtIGlzIGZ1bGx5Cj4gbG9h
ZGVkIHRvIHNlZSBob3cgbXVjaCBsYXRlbmN5IHdlIGNhdXNlLiBGb3Igc2ltcGxlIHNhbml0eWNo
ZWNraW5nLCBhbGxvdwo+IG91cnNlbHZlcyB0byBsaW1pdCBpdCB0byBqdXN0IG9uZSBDUFUgaG9n
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNv
LnVrPgo+IC0tLQo+ICAgYmVuY2htYXJrcy9nZW1fc3lzbGF0ZW5jeS5jIHwgNSArKysrLQo+ICAg
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYg
LS1naXQgYS9iZW5jaG1hcmtzL2dlbV9zeXNsYXRlbmN5LmMgYi9iZW5jaG1hcmtzL2dlbV9zeXNs
YXRlbmN5LmMKPiBpbmRleCA5MTYwZTIxOTkuLmQxMDU2NzczYSAxMDA2NDQKPiAtLS0gYS9iZW5j
aG1hcmtzL2dlbV9zeXNsYXRlbmN5LmMKPiArKysgYi9iZW5jaG1hcmtzL2dlbV9zeXNsYXRlbmN5
LmMKPiBAQCAtMzExLDggKzMxMSwxMSBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3Yp
Cj4gICAJYm9vbCBpbnRlcnJ1cHRzID0gZmFsc2U7Cj4gICAJaW50IG4sIGM7Cj4gICAKPiAtCXdo
aWxlICgoYyA9IGdldG9wdChhcmdjLCBhcmd2LCAidDpmOmJtbmkiKSkgIT0gLTEpIHsKPiArCXdo
aWxlICgoYyA9IGdldG9wdChhcmdjLCBhcmd2LCAidDpmOmJtbmkxIikpICE9IC0xKSB7Cj4gICAJ
CXN3aXRjaCAoYykgewo+ICsJCWNhc2UgJzEnOgo+ICsJCQluY3B1cyA9IDE7Cj4gKwkJCWJyZWFr
Owo+ICAgCQljYXNlICduJzogLyogZHJ5IHJ1biwgbWVhc3VyZSBiYXNlbGluZSBzeXN0ZW0gbGF0
ZW5jeSAqLwo+ICAgCQkJZW5hYmxlX2dlbV9zeXNidXN5ID0gMDsKPiAgIAkJCWJyZWFrOwo+IAoK
UmV2aWV3ZWQtYnk6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+CgpS
ZWdhcmRzLAoKVHZydGtvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
