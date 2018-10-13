Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 274686E00A
 for <igt-dev@lists.freedesktop.org>; Sat, 13 Oct 2018 10:25:42 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20181012212827.30163-2-jose.souza@intel.com>
References: <20181012212827.30163-1-jose.souza@intel.com>
 <20181012212827.30163-2-jose.souza@intel.com>
Message-ID: <153942632780.3258.18172280785668043335@skylake-alporthouse-com>
Date: Sat, 13 Oct 2018 11:25:27 +0100
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests: Skip testdisplay when KMS is
 disabled
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
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBKb3PDqSBSb2JlcnRvIGRlIFNvdXphICgyMDE4LTEwLTEyIDIyOjI4OjI3KQo+IFRo
aXMgdGVzdCBzaG91bGQgYmUgc2tpcGVkIHdoZW4gS01TIGlzIGRpc2FibGVkLgo+IAo+IENjOiBD
aHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiBTaWduZWQtb2ZmLWJ5OiBK
b3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4KPiAtLS0KPiAgdGVz
dHMvdGVzdGRpc3BsYXkuYyB8IDUgKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCA0IGRlbGV0aW9ucygtKQoKVGVzdGRpc3BsYXkgaXMgcmVhbGx5IGFuIG9kZGJhbGwgdGhh
dCBkb2Vzbid0IGJlbG9uZyBhbWlkIHRoZSBpZ3Qgc3VpdGUKb2YgdGVzdHMvCgo+IGRpZmYgLS1n
aXQgYS90ZXN0cy90ZXN0ZGlzcGxheS5jIGIvdGVzdHMvdGVzdGRpc3BsYXkuYwo+IGluZGV4IGIx
M2MzZDcwLi45OTcyZmIzYyAxMDA2NDQKPiAtLS0gYS90ZXN0cy90ZXN0ZGlzcGxheS5jCj4gKysr
IGIvdGVzdHMvdGVzdGRpc3BsYXkuYwo+IEBAIC00NTcsMTAgKzQ1Nyw3IEBAIGludCB1cGRhdGVf
ZGlzcGxheShib29sIHByb2JlKQo+ICAgICAgICAgaW50IGM7Cj4gIAo+ICAgICAgICAgcmVzb3Vy
Y2VzID0gZHJtTW9kZUdldFJlc291cmNlcyhkcm1fZmQpOwo+IC0gICAgICAgaWYgKCFyZXNvdXJj
ZXMpIHsKPiAtICAgICAgICAgICAgICAgaWd0X3dhcm4oImRybU1vZGVHZXRSZXNvdXJjZXMgZmFp
bGVkOiAlc1xuIiwgc3RyZXJyb3IoZXJybm8pKTsKPiAtICAgICAgICAgICAgICAgcmV0dXJuIDA7
Cj4gLSAgICAgICB9Cj4gKyAgICAgICBpZ3RfcmVxdWlyZShyZXNvdXJjZXMpOwoKSG1tLCBsb29r
cyBsaWtlIHRoZXJlJ3MgYSBkcm1TZXRDbGllbnRDYXAoKSB0aGF0IHdvdWxkIGZhaWwgZWFybGll
ci4gSQp0aGluayBpZGVhbGx5IHdlIHdvdWxkIHBhc3MgcmVzb3VyY2VzIGludG8gdGhlIGZ1bmN0
aW9uLgoKRm9yIG5vdywgdGhpcyBpcyBhIHNpbXBsZSBpbXByb3ZlbWVudApSZXZpZXdlZC1ieTog
Q2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CgpGd2l3LApodHRwczovL3Bh
dGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvMjU0OTYyLwpodHRwczovL3BhdGNod29yay5m
cmVlZGVza3RvcC5vcmcvcGF0Y2gvMjU0OTYxLwphcmUgdGhlIHJlbWFpbmluZyBpc3N1ZXMgZm9y
IEJBVCArIG5vIGRpc3BsYXkuCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2lndC1kZXYK
