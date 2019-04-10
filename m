Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20190410114322.3379-1-tvrtko.ursulin@linux.intel.com>
 <155489693247.3516.17172100544939191386@skylake-alporthouse-com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <9adb5eb4-0e32-611d-55e4-3d72aacf426d@linux.intel.com>
Date: Wed, 10 Apr 2019 13:11:40 +0100
MIME-Version: 1.0
In-Reply-To: <155489693247.3516.17172100544939191386@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [Intel-gfx] [RFT i-g-t]
 tests/prime_vgem/basic-fence-flip: Probe display resolution
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
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDEwLzA0LzIwMTkgMTI6NDgsIENocmlzIFdpbHNvbiB3cm90ZToKPiBRdW90aW5nIFR2cnRr
byBVcnN1bGluICgyMDE5LTA0LTEwIDEyOjQzOjIyKQo+PiBAQCAtNzU0LDggKzc2OCw4IEBAIHN0
YXRpYyB2b2lkIHRlc3RfZmxpcChpbnQgaTkxNSwgaW50IHZnZW0sIHVuc2lnbmVkIGhhbmcpCj4+
ICAgICAgICAgICAgICAgICAgdWludDMyX3Qgb2Zmc2V0c1s0XSA9IHt9Owo+PiAgICAgICAgICAg
ICAgICAgIGludCBmZDsKPj4gICAKPj4gLSAgICAgICAgICAgICAgIGJvW2ldLndpZHRoID0gMTAy
NDsKPj4gLSAgICAgICAgICAgICAgIGJvW2ldLmhlaWdodCA9IDc2ODsKPj4gKyAgICAgICAgICAg
ICAgIGJvW2ldLndpZHRoID0gbW9kZS0+aGRpc3BsYXk7Cj4+ICsgICAgICAgICAgICAgICBib1tp
XS5oZWlnaHQgPSBtb2RlLT52ZGlzcGxheTsKPj4gICAgICAgICAgICAgICAgICBib1tpXS5icHAg
PSAzMjsKPj4gICAgICAgICAgICAgICAgICB2Z2VtX2NyZWF0ZSh2Z2VtLCAmYm9baV0pOwo+IAo+
IFRoYXQgbWF5IG5vdCByZXN1bHQgaW4gYSBidWZmZXIgdGhhdCB3ZSBhcmUgYWJsZSB0byBmbGlw
IHRvLiA6fAo+IHdpZHRoID0gQUxJR04oaGRpc3BsYXksIDE2KTsgdmRpc3BsYXkgc2hvdWxkIGJl
IG9rLgoKT2guLiB3ZWxsIEkgZG9uJ3Qga25vdy4gTWFhcnRlbiBoZWxwZnVsbHkgZGVzY3JpYmVk
IGluIHRoZSBCWiB0aGF0IHRoZSAKc2tpcCBpcyBkdWUgQk8gYmVpbmcgdG9vIHNtYWxsIGZvciB0
aGUgRkIuIEFsaWduaW5nIHdpZHRoIHdvdWxkIHRoZW4gCm1ha2UgaXQgdG9vIGxhcmdlLiBJcyB0
aGF0IE9LPyBXaG8gYXNzaWduZWQgdGhpcyBkaXNwbGF5IHJlbGF0ZWQgSUdUIGJ1ZyAKdG8gbWUg
YW55d2F5PyA6KSkKCj4gSSB3b3VsZCBxdWVyeSB3aGF0IGhhcHBlbmVkIHRvIHRoZSBzY2FsZXJz
IHRob3VnaCA6KQoKQXJlIHRoZXkgc3VwcG9zZWQgdG8gYXV0b21hZ2ljYWx5IGFwcGx5IGFueSBm
YiB0byBhbnkgb3V0cHV0PyBPciBhbiAKZXhwbGljaXQgc3RlcCBpcyByZXF1aXJlZD8gUmVnYXJk
bGVzcyAtIGl0IG1heSBiZSBiZXR0ZXIgdG8gaW52b2x2ZSBsZXNzIApvZiB0aGUgZHJpdmVyIGFu
ZCBoYXJkd2FyZSBzdGFjayBpbiBhIHNpbXBsZSB0ZXN0LgoKUmVnYXJkcywKClR2cnRrbwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxp
bmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
