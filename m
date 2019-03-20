Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF74789581
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2019 09:29:26 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <f12816c03dbd699376fc974c0d16a14d07fc17c6.camel@intel.com>
 <874l7xgalz.fsf@intel.com>
In-Reply-To: <874l7xgalz.fsf@intel.com>
Message-ID: <155307415377.8718.13698747329472070011@skylake-alporthouse-com>
Date: Wed, 20 Mar 2019 09:29:14 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] tests/testdisplay: fix heap overflow
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
To: "Ser, Simon" <simon.ser@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBKYW5pIE5pa3VsYSAoMjAxOS0wMy0yMCAwOToyNjozMikKPiBPbiBXZWQsIDIwIE1h
ciAyMDE5LCAiU2VyLCBTaW1vbiIgPHNpbW9uLnNlckBpbnRlbC5jb20+IHdyb3RlOgo+ID4gV2Ug
bmVlZCB0byBjb3B5IHRoZSB0ZXJtaW5hdGluZyBOVUxMIGJ5dGUgdG9vLgo+ID4KPiA+IFNpZ25l
ZC1vZmYtYnk6IFNpbW9uIFNlciA8c2ltb24uc2VyQGludGVsLmNvbT4KPiA+IC0tLQo+ID4gIHRl
c3RzL3Rlc3RkaXNwbGF5LmMgfCA4ICsrKystLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvdGVz
dGRpc3BsYXkuYyBiL3Rlc3RzL3Rlc3RkaXNwbGF5LmMKPiA+IGluZGV4IGIzNjU3MjY0Li5mZjIw
ODM4NCAxMDA2NDQKPiA+IC0tLSBhL3Rlc3RzL3Rlc3RkaXNwbGF5LmMKPiA+ICsrKyBiL3Rlc3Rz
L3Rlc3RkaXNwbGF5LmMKPiA+IEBAIC01NjMsMTcgKzU2MywxNyBAQCBzdGF0aWMgZ2Jvb2xlYW4g
aW5wdXRfZXZlbnQoR0lPQ2hhbm5lbCAqc291cmNlLAo+ID4gR0lPQ29uZGl0aW9uIGNvbmRpdGlv
biwKPiA+ICAgICAgIHJldHVybiBUUlVFOwo+ID4gIH0KPiA+ICAKPiA+IC1zdGF0aWMgdm9pZCBl
bnRlcl9leGVjX3BhdGgoIGNoYXIgKiphcmd2ICkKPiA+ICtzdGF0aWMgdm9pZCBlbnRlcl9leGVj
X3BhdGgoY2hhciAqKmFyZ3YpCj4gPiAgewo+ID4gICAgICAgY2hhciAqZXhlY19wYXRoID0gTlVM
TDsKPiA+ICAgICAgIGNoYXIgKnBvcyA9IE5VTEw7Cj4gPiAgICAgICBzaG9ydCBsZW5fcGF0aCA9
IDA7Cj4gPiAgICAgICBpbnQgcmV0Owo+ID4gIAo+ID4gLSAgICAgbGVuX3BhdGggPSBzdHJsZW4o
IGFyZ3ZbMF0gKTsKPiA+IC0gICAgIGV4ZWNfcGF0aCA9IChjaGFyKikgbWFsbG9jKGxlbl9wYXRo
KTsKPiA+ICsgICAgIGxlbl9wYXRoID0gc3RybGVuKGFyZ3ZbMF0pOwo+ID4gKyAgICAgZXhlY19w
YXRoID0gKGNoYXIqKSBtYWxsb2MobGVuX3BhdGggKyAxKTsKPiA+ICAKPiA+IC0gICAgIG1lbWNw
eShleGVjX3BhdGgsIGFyZ3ZbMF0sIGxlbl9wYXRoKTsKPiA+ICsgICAgIG1lbWNweShleGVjX3Bh
dGgsIGFyZ3ZbMF0sIGxlbl9wYXRoICsgMSk7Cj4gCj4gRGl0Y2ggYWxsIG9mIHRoZSBhYm92ZSBh
bmQgcmVwbGFjZSB3aXRoCj4gCj4gICAgICAgICBleGVjX3BhdGggPSBzdHJkdXAoYXJndlswXSk7
Cj4gCj4gPiAgICAgICBwb3MgPSBzdHJyY2hyKGV4ZWNfcGF0aCwgJy8nKTsKPiA+ICAgICAgIGlm
IChwb3MgIT0gTlVMTCkKPiA+ICAgICAgICAgICAgICAgKihwb3MrMSkgPSAnXDAnOwoKQW5kIGV2
ZW4gb25lIHN0ZXAgZnVydGhlciB3aXRoIGRpcm5hbWUoMykuCi1DaHJpcwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdApp
Z3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
