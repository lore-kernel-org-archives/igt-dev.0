Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6FB689228
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2019 20:13:17 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190426135540.5878-1-simon.ser@intel.com>
References: <20190426135540.5878-1-simon.ser@intel.com>
Message-ID: <155630958754.22472.3626227614327044914@skylake-alporthouse-com>
Date: Fri, 26 Apr 2019 21:13:07 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_audio: fix filemode not
 specified in open(O_CREAT)
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
To: Simon Ser <simon.ser@intel.com>, igt-dev@lists.freedesktop.org
Cc: petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBTaW1vbiBTZXIgKDIwMTktMDQtMjYgMTQ6NTU6NDApCj4gb3BlbigzKSB0YWtlcyB2
YV9hcmdzIGFmdGVyIHRoZSBmbGFncyBhbmQgT19DUkVBVCB3aWxsIHJlYWQgdGhlIGZpcnN0IG9u
ZS4gSWYKPiB3ZSBkb24ndCBwcm92aWRlIG9uZSwgdGhpcyBpcyB1bmRlZmluZWQgYmVoYXZpb3Vy
Lgo+IAo+IChTb21lb25lIHJlcG9ydGVkIGl0IGJyb2tlIHRoZSBidWlsZCBmb3IgdGhlbSkKPiAK
PiBTaWduZWQtb2ZmLWJ5OiBTaW1vbiBTZXIgPHNpbW9uLnNlckBpbnRlbC5jb20+Cj4gRml4ZXM6
IDMxMWJhZmYxNTFmOTBjMWRiNmY1N2VlOTUxNTIxNmI0ZjlkYTVkYjcKPiAtLS0KPiAgbGliL2ln
dF9hdWRpby5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9hdWRpby5jIGIvbGliL2lndF9hdWRp
by5jCj4gaW5kZXggNWIwODYwZTYuLmZkOGNmMDdjIDEwMDY0NAo+IC0tLSBhL2xpYi9pZ3RfYXVk
aW8uYwo+ICsrKyBiL2xpYi9pZ3RfYXVkaW8uYwo+IEBAIC00NDcsNyArNDQ3LDcgQEAgaW50IGF1
ZGlvX2NyZWF0ZV93YXZfZmlsZV9zMzJfbGUoY29uc3QgY2hhciAqcXVhbGlmaWVyLCB1aW50MzJf
dCBzYW1wbGVfcmF0ZSwKPiAgICAgICAgICAgICAgICAgKnBhdGggPSBzdHJkdXAoX3BhdGgpOwo+
ICAKPiAgICAgICAgIGlndF9kZWJ1ZygiRHVtcGluZyAlcyBhdWRpbyB0byAlc1xuIiwgcXVhbGlm
aWVyLCBfcGF0aCk7Cj4gLSAgICAgICBmZCA9IG9wZW4oX3BhdGgsIE9fV1JPTkxZIHwgT19DUkVB
VCB8IE9fVFJVTkMpOwo+ICsgICAgICAgZmQgPSBvcGVuKF9wYXRoLCBPX1dST05MWSB8IE9fQ1JF
QVQgfCBPX1RSVU5DLCAwNjQ0KTsKCk9rLApSZXZpZXdlZC1ieTogQ2hyaXMgV2lsc29uIDxjaHJp
c0BjaHJpcy13aWxzb24uY28udWs+Ci1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2lndC1kZXY=
