Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34F016E34E
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2020 11:35:49 +0000 (UTC)
Date: Fri, 3 Jul 2020 13:35:43 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20200703113543.GA30438@zkempczy-mobl2>
References: <20200703112333.4237-1-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200703112333.4237-1-mika.kuoppala@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Fix interface descriptor fills
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
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCBKdWwgMDMsIDIwMjAgYXQgMDI6MjM6MzNQTSArMDMwMCwgTWlrYSBLdW9wcGFsYSB3
cm90ZToKPiBGb3IgZ2VuOCsgd2UgbmVlZCB0byBpbmNyZW1lbnQgdGhlIHBvaW50ZXIgZm9yIGlu
dGVyZmFjZQo+IGRlc2NyaXB0b3Igc2l6ZSBhbW91bnQuIE90aGVyd2lzZSB0aGUgbmV4dCBpbmRp
cmVjdCBpdGVtCj4gaW50cm9kdWNlZCB3aWxsIG92ZXJ3cml0ZSBvdXIgZGVzY3JpcHRvci4KPiAK
PiBBcHBhcmVudGx5IHRoaXMgaGFzIG5vdCBjYXVzZWQgbXVjaCBoYXZvYyBhcyBpbnRlcmZhY2UK
PiBkZXNjcyBoYXMgYmVlbiB0aGUgbGFzdCBpdGVtLgoKRWgsIG1pc3NlZCB0aGF0IDovIFRoYW5r
cyBmb3IgZml4LgoKUmV2aWV3ZWQtYnk6IFpiaWduaWV3IEtlbXBjennFhHNraSA8emJpZ25pZXcu
a2VtcGN6eW5za2lAaW50ZWwuY29tPgoKPiAKPiBDYzogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6
Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+Cj4gQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNA
Y2hyaXMtd2lsc29uLmNvLnVrPgo+IFNpZ25lZC1vZmYtYnk6IE1pa2EgS3VvcHBhbGEgPG1pa2Eu
a3VvcHBhbGFAbGludXguaW50ZWwuY29tPgo+IC0tLQo+ICBsaWIvZ3B1X2NtZHMuYyB8IDQgKysr
Kwo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2xp
Yi9ncHVfY21kcy5jIGIvbGliL2dwdV9jbWRzLmMKPiBpbmRleCA0MTcyNTNhNy4uODExNTZkMjUg
MTAwNjQ0Cj4gLS0tIGEvbGliL2dwdV9jbWRzLmMKPiArKysgYi9saWIvZ3B1X2NtZHMuYwo+IEBA
IC0zNjMsNiArMzYzLDggQEAgZ2VuOF9maWxsX2ludGVyZmFjZV9kZXNjcmlwdG9yKHN0cnVjdCBp
bnRlbF9iYiAqaWJiLAo+ICAKPiAgCWlkZC0+ZGVzYzYubnVtX3RocmVhZHNfaW5fdGcgPSAxOwo+
ICAKPiArCWludGVsX2JiX3B0cl9hZGQoaWJiLCBzaXplb2YoKmlkZCkpOwo+ICsKPiAgCXJldHVy
biBvZmZzZXQ7Cj4gIH0KPiAgCj4gQEAgLTM5OSw2ICs0MDEsOCBAQCBnZW4xMV9maWxsX2ludGVy
ZmFjZV9kZXNjcmlwdG9yKHN0cnVjdCBpbnRlbF9iYiAqaWJiLAo+ICAKPiAgCWlkZC0+ZGVzYzYu
bnVtX3RocmVhZHNfaW5fdGcgPSAxOwo+ICAKPiArCWludGVsX2JiX3B0cl9hZGQoaWJiLCBzaXpl
b2YoKmlkZCkpOwo+ICsKPiAgCXJldHVybiBvZmZzZXQ7Cj4gIH0KPiAgCj4gLS0gCj4gMi4xNy4x
Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0
LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
