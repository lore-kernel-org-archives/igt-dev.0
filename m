Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D2886E4CA
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Mar 2018 15:48:03 +0000 (UTC)
Received: from localhost (unverified [78.156.65.138])
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 10996992-1500050
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Mar 2018 15:48:01 +0000
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20180312154350.7210-1-chris@chris-wilson.co.uk>
In-Reply-To: <20180312154350.7210-1-chris@chris-wilson.co.uk>
Message-ID: <152086967916.571.12726605055012251751@mail.alporthouse.com>
Date: Mon, 12 Mar 2018 15:47:59 +0000
Subject: Re: [igt-dev] [PATCH igt] lib/audio: Replace sqrt(a*a + b*b) with
 hypot(a, b)
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMTgtMDMtMTIgMTU6NDM6NTApCj4gU2lnbmVkLW9mZi1i
eTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gLS0tCj4gIGxpYi9p
Z3RfYXVkaW8uYyB8IDQgKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3RfYXVkaW8uYyBiL2xpYi9pZ3Rf
YXVkaW8uYwo+IGluZGV4IDIzMjFkMWM2Li4yMjljZTZjNiAxMDA2NDQKPiAtLS0gYS9saWIvaWd0
X2F1ZGlvLmMKPiArKysgYi9saWIvaWd0X2F1ZGlvLmMKPiBAQCAtMjY2LDkgKzI2Niw3IEBAIGJv
b2wgYXVkaW9fc2lnbmFsX2RldGVjdChzdHJ1Y3QgYXVkaW9fc2lnbmFsICpzaWduYWwsIGludCBj
aGFubmVscywKPiAgICAgICAgICAgICAgICAgbWF4ID0gMDsKPiAgCj4gICAgICAgICAgICAgICAg
IGZvciAoaSA9IDA7IGkgPCBmcmFtZXMgLyAyOyBpKyspIHsKPiAtICAgICAgICAgICAgICAgICAg
ICAgICBhbXBsaXR1ZGVbaV0gPSBzcXJ0KGRhdGFbaV0gKiBkYXRhW2ldICsKPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRhdGFbZnJhbWVzIC0gaV0gKgo+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGF0YVtmcmFtZXMgLSBp
XSk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgYW1wbGl0dWRlW2ldID0gaHlwb3QoZGF0YVtp
XSwgZGF0YVtmcmFtZXMgLSBpXSk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgaWYgKGFtcGxp
dHVkZVtpXSA+IG1heCkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1heCA9IGFt
cGxpdHVkZVtpXTsKCkFsdGhvdWdoIHRoZSBzcXJ0IGlzIG92ZXJraWxsIGFzIHRoZSBjb2RlIHdv
dWxkIGJlIGp1c3QgYXMgaGFwcHkgdXNpbmcKYW1wbGl0dWRlIHNxdWFyZWQuIE9rLCB0aGUgY29k
ZSBpcyBxdWl0ZSB3ZWlyZCwgSSdtIG5vdCBnb2luZyB0byByZWFkCmFueSBtb3JlLi4uCi1DaHJp
cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2
IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
