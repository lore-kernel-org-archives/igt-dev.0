Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from EX13-EDG-OU-001.vmware.com (ex13-edg-ou-001.vmware.com
 [208.91.0.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A64C26E419
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Feb 2019 16:51:57 +0000 (UTC)
Message-ID: <cfa216356a5ba78d7316f761f2aaee1f41a7aba3.camel@vmware.com>
From: Deepak Singh Rawat <drawat@vmware.com>
Date: Fri, 8 Feb 2019 08:52:23 -0800
In-Reply-To: <20190208131901.1400-2-maxime.ripard@bootlin.com>
References: <20190208131901.1400-1-maxime.ripard@bootlin.com>
 <20190208131901.1400-2-maxime.ripard@bootlin.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v6 01/10] igt: fb: Refactor dumb buffer
 allocation path
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
Cc: Petri Latvala <petri.latvala@intel.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, eben@raspberrypi.org
List-ID: <igt-dev@lists.freedesktop.org>

SGkgTWF4aW1lLAoKVGhhbmtzIGZvciBkb2luZyB0aGlzLgoKUmV2aWV3ZWQtYnk6IERlZXBhayBS
YXdhdCA8ZHJhd2F0QHZtd2FyZS5jb20+CgpPbiBGcmksIDIwMTktMDItMDggYXQgMTQ6MTggKzAx
MDAsIE1heGltZSBSaXBhcmQgd3JvdGU6Cj4gVGhlIGVsc2UgY29uZGl0aW9uIGlzIG5vdCBuZWVk
ZWQsIHNpbmNlIGFsbCB0aGUgb3RoZXIgY29uZGl0aW9ucwo+IHJldHVybgo+IHdoZW4gdGhleSBh
cmUgZG9uZS4KPiAKPiBNb3ZlIHRoZSBLTVMgZHVtYiBidWZmZXIgYWxsb2NhdGlvbiBvdXRzaWRl
IG9mIHRoZSBvdXRlciBlbHNlCj4gY29uZGl0aW9uLAo+IHRoaXMgd2lsbCBhbHNvIGFsbG93IHRv
IGVhc2UgbGF0ZXIgY2hhbmdlcy4KPiAKPiBSZXZpZXdlZC1ieTogUGF1bCBLb2NpYWxrb3dza2kg
PHBhdWwua29jaWFsa293c2tpQGJvb3RsaW4uY29tPgo+IFNpZ25lZC1vZmYtYnk6IE1heGltZSBS
aXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+Cj4gLS0tCj4gIGxpYi9pZ3RfZmIuYyB8
IDE1ICsrKysrKystLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA4
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9saWIvaWd0X2ZiLmMgYi9saWIvaWd0X2Zi
LmMKPiBpbmRleCA1ZDhjMTg3YTlhYzkuLmM2MWU2ODA1ZmY3YSAxMDA2NDQKPiAtLS0gYS9saWIv
aWd0X2ZiLmMKPiArKysgYi9saWIvaWd0X2ZiLmMKPiBAQCAtNTU5LDE1ICs1NTksMTQgQEAgc3Rh
dGljIGludCBjcmVhdGVfYm9fZm9yX2ZiKHN0cnVjdCBpZ3RfZmIgKmZiKQo+ICAJCQlpZ3RfcmVx
dWlyZShkcml2ZXJfaGFzX2dlbV9hcGkpOwo+ICAJCQlyZXR1cm4gLUVJTlZBTDsKPiAgCQl9Cj4g
LQl9IGVsc2Ugewo+IC0JCWZiLT5pc19kdW1iID0gdHJ1ZTsKPiAtCj4gLQkJZmItPmdlbV9oYW5k
bGUgPSBrbXN0ZXN0X2R1bWJfY3JlYXRlKGZkLCBmYi0+d2lkdGgsIGZiLQo+ID5oZWlnaHQsCj4g
LQkJCQkJCSAgICAgZmItPnBsYW5lX2JwcFswXSwKPiAtCQkJCQkJICAgICAmZmItPnN0cmlkZXNb
MF0sCj4gJmZiLT5zaXplKTsKPiAtCj4gLQkJcmV0dXJuIGZiLT5nZW1faGFuZGxlOwo+ICAJfQo+
ICsKPiArCWZiLT5pc19kdW1iID0gdHJ1ZTsKPiArCWZiLT5nZW1faGFuZGxlID0ga21zdGVzdF9k
dW1iX2NyZWF0ZShmZCwgZmItPndpZHRoLCBmYi0+aGVpZ2h0LAo+ICsJCQkJCSAgICAgZmItPnBs
YW5lX2JwcFswXSwKPiArCQkJCQkgICAgICZmYi0+c3RyaWRlc1swXSwgJmZiLQo+ID5zaXplKTsK
PiArCj4gKwlyZXR1cm4gZmItPmdlbV9oYW5kbGU7Cj4gIH0KPiAgCj4gIC8qKgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxp
c3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
