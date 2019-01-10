Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 52DEF6F266
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jan 2019 10:27:31 +0000 (UTC)
Message-ID: <ca4ecb8203f89cc2699efcbf95f21ec7c5848e85.camel@bootlin.com>
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date: Thu, 10 Jan 2019 11:27:30 +0100
In-Reply-To: <20190108152001.5367-8-maxime.ripard@bootlin.com>
References: <cover.58d25323616120b55c27ab28cdac25877a37bd78.1546960696.git-series.maxime.ripard@bootlin.com>
 <20190108152001.5367-8-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 08/13] igt: fb: Clear YUV dumb buffers
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
To: Maxime Ripard <maxime.ripard@bootlin.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>, eben@raspberrypi.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>

SGksCgpPbiBUdWUsIDIwMTktMDEtMDggYXQgMTY6MTkgKzAxMDAsIE1heGltZSBSaXBhcmQgd3Jv
dGU6Cj4gWVVWIGR1bWIgYnVmZmVycywganVzdCBsaWtlIGk5MTUgR0VNIGJ1ZmZlcnMgYWxzbyBu
ZWVkIHRvIGJlIGNsZWFyZWQgb25jZQo+IGFsbG9jYXRlZC4gTWFrZSBzdXJlIGl0IGhhcHBlbnMu
CgpBcyBJIG1lbnRpb25uZWQgaW4gdGhlIHBhdGNoIHJlZmFjdG9yaW5nIHRoZSBmdW5jdGlvbiwg
SSBkb24ndCBzZWUgd2h5Cml0J3MgYSBnb29kIHRoaW5nIHRvIGNsZWFyIFlVViBidWZmZXJzLiBD
YW4ndCB3ZSBqdXN0IGtlZXAgdGhhdCBmb3IKdGhlIGk5MTUgcGF0aCAoYXNzdW1pbmcgaXQgaGFk
IGEgcmVhc29uIHRvIGJlIHRoZXJlIGluIHRoZSBmaXJzdApwbGFjZSk/CgpDaGVlcnMsCgpQYXVs
Cgo+IFNpZ25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5j
b20+Cj4gLS0tCj4gIGxpYi9pZ3RfZmIuYyB8IDMgKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9mYi5jIGIvbGliL2lndF9mYi5j
Cj4gaW5kZXggOTZkNTZkMGU2M2JlLi4yNjNhODg5ZGJhYTMgMTAwNjQ0Cj4gLS0tIGEvbGliL2ln
dF9mYi5jCj4gKysrIGIvbGliL2lndF9mYi5jCj4gQEAgLTU2NSw2ICs1NjUsOSBAQCBzdGF0aWMg
aW50IGNyZWF0ZV9ib19mb3JfZmIoc3RydWN0IGlndF9mYiAqZmIpCj4gIAlmYi0+Z2VtX2hhbmRs
ZSA9IGttc3Rlc3RfZHVtYl9jcmVhdGUoZmQsIGZiLT53aWR0aCwgZmItPmhlaWdodCwKPiAgCQkJ
CQkgICAgIGJwcCwgJmZiLT5zdHJpZGVzWzBdLCAmZmItPnNpemUpOwo+ICAKPiArCWlmIChpZ3Rf
Zm9ybWF0X2lzX3l1dihmYi0+ZHJtX2Zvcm1hdCkpCj4gKwkJY2xlYXJfeXV2X2J1ZmZlcihmYik7
Cj4gKwo+ICAJcmV0dXJuIGZiLT5nZW1faGFuZGxlOwo+ICB9Cj4gIAotLSAKUGF1bCBLb2NpYWxr
b3dza2ksIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIGtlcm5lbCBlbmdpbmVlcmluZwpodHRw
czovL2Jvb3RsaW4uY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
