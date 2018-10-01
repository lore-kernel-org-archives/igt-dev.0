Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 253BB89F2A
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Oct 2018 08:47:30 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id h6-v6so11935642eds.12
 for <igt-dev@lists.freedesktop.org>; Mon, 01 Oct 2018 01:47:30 -0700 (PDT)
Date: Mon, 1 Oct 2018 10:47:25 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20181001084725.GA11082@phenom.ffwll.local>
References: <20180914201310.19527-1-chris@chris-wilson.co.uk>
 <20180914201310.19527-4-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180914201310.19527-4-chris@chris-wilson.co.uk>
Subject: Re: [igt-dev] [PATCH i-g-t 4/5] lib/kms: Skip no-op display updates
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCBTZXAgMTQsIDIwMTggYXQgMDk6MTM6MDlQTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IElmIHRoZSBkaXNwbGF5IGlzIGRpc2FibGVkIChlLmcuIHRoZSBkcml2ZXIgaGFzIGRp
c2FibGVkIHRoZSBLTVMKPiBpbnRlcmZhY2UpIHRoZXJlIGlzIG5vdGhpbmcgdG8gZG8gc28gYXZv
aWQgZmFpbGluZy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlz
LXdpbHNvbi5jby51az4KClNpbGVudGx5IGRvaW5nIG5vdGhpbmcgZmVlbHMgZnVubnksIEkgdGhp
bmsgcHV0dGluZyB0aGUgaWd0X3JlcXVpcmUgaW50bwppZ3RfZGlzcGxheV9pbml0IG1ha2VzIG1v
cmUgc2Vuc2Ugd2l0aCB0aGlzIG9uZSBpbiBtaW5kLiBBbHNvIGF2b2lkcyB0aGUKY2h1cm4gaW4g
cGF0Y2ggNS4KLURhbmllbAoKPiAtLS0KPiAgbGliL2lndF9rbXMuYyB8IDYgKysrKysrCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9r
bXMuYyBiL2xpYi9pZ3Rfa21zLmMKPiBpbmRleCA5NzEwYmNhZTEuLmRlZGM4MTM0NCAxMDA2NDQK
PiAtLS0gYS9saWIvaWd0X2ttcy5jCj4gKysrIGIvbGliL2lndF9rbXMuYwo+IEBAIC0zMjcxLDYg
KzMyNzEsOSBAQCBzdGF0aWMgaW50IGRvX2Rpc3BsYXlfY29tbWl0KGlndF9kaXNwbGF5X3QgKmRp
c3BsYXksCj4gIAllbnVtIHBpcGUgcGlwZTsKPiAgCUxPR19JTkRFTlQoZGlzcGxheSwgImNvbW1p
dCIpOwo+ICAKPiArCWlmICghZGlzcGxheS0+bl9waXBlcyB8fCAhZGlzcGxheS0+bl9vdXRwdXRz
KQo+ICsJCXJldHVybiAwOyAvKiBub3RoaW5nIHRvIGRvICovCj4gKwo+ICAJaWd0X2Rpc3BsYXlf
cmVmcmVzaChkaXNwbGF5KTsKPiAgCj4gIAlpZiAocyA9PSBDT01NSVRfQVRPTUlDKSB7Cj4gQEAg
LTMzMjEsNiArMzMyNCw5IEBAIGludCBpZ3RfZGlzcGxheV90cnlfY29tbWl0X2F0b21pYyhpZ3Rf
ZGlzcGxheV90ICpkaXNwbGF5LCB1aW50MzJfdCBmbGFncywgdm9pZCAqCj4gIHsKPiAgCWludCBy
ZXQ7Cj4gIAo+ICsJaWYgKCFkaXNwbGF5LT5uX3BpcGVzIHx8ICFkaXNwbGF5LT5uX291dHB1dHMp
Cj4gKwkJcmV0dXJuIDA7IC8qIG5vdGhpbmcgdG8gZG8gKi8KPiArCj4gIAlMT0dfSU5ERU5UKGRp
c3BsYXksICJjb21taXQiKTsKPiAgCj4gIAlpZ3RfZGlzcGxheV9yZWZyZXNoKGRpc3BsYXkpOwo+
IC0tIAo+IDIuMTkuMAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gaWd0LWRldiBtYWlsaW5nIGxpc3QKPiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aWd0LWRldgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBv
cmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaWd0LWRldgo=
