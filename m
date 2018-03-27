Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <0b23910a-8546-2930-4cde-a3223ec9b354@linux.intel.com>
References: <20180327083711.21549-1-chris@chris-wilson.co.uk>
 <0b23910a-8546-2930-4cde-a3223ec9b354@linux.intel.com>
Message-ID: <152214095896.10679.13621878033898572663@mail.alporthouse.com>
Date: Tue, 27 Mar 2018 09:55:58 +0100
Subject: Re: [igt-dev] [Intel-gfx] [PATCH igt] igt/perf_pmu: Most-busy
 requires at least one busy engine
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOC0wMy0yNyAwOTo1NDozNSkKPiAKPiBPbiAyNy8w
My8yMDE4IDA5OjM3LCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gPiBUaGUgdGVzdCBpcyB3aGV0aGVy
IHdpdGggYWxsIGJ1dCBvbmUgZW5naW5lIGJ1c3kgd2UgcmVjb3JkIHRoZSBjb3JyZWN0Cj4gPiBs
b2FkIG9uIGVhY2ggZW5naW5lLiBJZiB3ZSBvbmx5IGhhdmUgb25lIGVuZ2luZSwgdGhpcyB0ZXN0
IGRlZ2VuZXJhdGVzCj4gPiBpbnRvIGFsbC1pZGxlL2FsbC1idXN5LCBzbyB3ZSBjYW4gc2tpcCB0
byBhdm9pZCBjcmFzaGluZyBvbiB0aGUKPiA+IGFzc3VtcHRpb24gdGhhdCB3ZSBoYXZlIGEgYnVz
eSBzcGlubmVyLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNo
cmlzLXdpbHNvbi5jby51az4KPiA+IENjOiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5A
aW50ZWwuY29tPgo+ID4gLS0tCj4gPiAgIHRlc3RzL3BlcmZfcG11LmMgfCAxICsKPiA+ICAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS90ZXN0cy9w
ZXJmX3BtdS5jIGIvdGVzdHMvcGVyZl9wbXUuYwo+ID4gaW5kZXggZjI3YjdlYzcuLmI1OWFmODE4
IDEwMDY0NAo+ID4gLS0tIGEvdGVzdHMvcGVyZl9wbXUuYwo+ID4gKysrIGIvdGVzdHMvcGVyZl9w
bXUuYwo+ID4gQEAgLTUxMyw2ICs1MTMsNyBAQCBtb3N0X2J1c3lfY2hlY2tfYWxsKGludCBnZW1f
ZmQsIGNvbnN0IHN0cnVjdCBpbnRlbF9leGVjdXRpb25fZW5naW5lMiAqZSwKPiA+ICAgICAgICAg
ICAgICAgdmFsW2krK10gPSBJOTE1X1BNVV9FTkdJTkVfQlVTWShlXy0+Y2xhc3MsIGVfLT5pbnN0
YW5jZSk7Cj4gPiAgICAgICB9Cj4gPiAgICAgICBpZ3RfYXNzZXJ0KGkgPT0gbnVtX2VuZ2luZXMp
Owo+ID4gKyAgICAgaWd0X3JlcXVpcmUoc3Bpbik7IC8qIGF0IGxlYXN0IG9uZSBidXN5IGVuZ2lu
ZSAqLwo+IAo+IE9yIGlndF9yZXF1aXJlKG51bV9lbmdpbmVzID4gMSkgaGlnaGVyIHVwLiBCdXQg
c2FtZSBlZmZlY3Q6CgpJJ20gaGFwcHkgZm9yIGJvdGgsIGlmIHlvdSB3YW50IGEgcHJlZW1wdGl2
ZSByLWIgOikKIAo+IFJldmlld2VkLWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5A
aW50ZWwuY29tPgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
Cg==
