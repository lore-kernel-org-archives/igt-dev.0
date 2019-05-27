Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 580848972D
 for <igt-dev@lists.freedesktop.org>; Mon, 27 May 2019 10:01:30 +0000 (UTC)
References: <20190522102931.12664-1-simon.ser@intel.com>
From: Martin Peres <martin.peres@linux.intel.com>
Message-ID: <bef7434a-9e8a-38d8-3407-f13219f8bef6@linux.intel.com>
Date: Mon, 27 May 2019 13:01:26 +0300
MIME-Version: 1.0
In-Reply-To: <20190522102931.12664-1-simon.ser@intel.com>
Content-Language: en-PH
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_audio: fix amplitude for S24_LE
 and S32_LE
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
List-ID: <igt-dev@lists.freedesktop.org>

T24gMjIvMDUvMjAxOSAxMzoyOSwgU2ltb24gU2VyIHdyb3RlOgo+IFdlIG5lZWQgdG8gdXNlIHNp
Z25lZCBpbnRlZ2VycyAoaGVuY2UgIlMiIGluIHRoZSBmb3JtYXQgbmFtZSkuCj4gCj4gVGhlIHJl
YXNvbiB0aGlzIGhhcyBnb25lIHVubm90aWNlZCBpcyB0aGF0IHdlIHdlcmUgZ2VuZXJhdGluZyBz
aWduYWxzIHdpdGggaGFsZgo+IG9mIHRoZSBhbXBsaXR1ZGUgdGhleSB3ZXJlIHN1cHBvc2VkIHRv
IGhhdmUuIEFzIGEgcmVzdWx0LCB1c2luZyBVSU5UMzJfTUFYCj4gKHdoaWNoIGlzIGFsbW9zdCBJ
TlQzMl9NQVggKiAyKSByZXN1bHRlZCBpbiB0aGUgY29ycmVjdCBhbXBsaXR1ZGUuIEluIG90aGVy
Cj4gd29yZHMsIHRoZXNlIHR3byBidWdzIHdlcmUgY2FuY2VsbGluZyBlYWNoIG90aGVyJ3MgZWZm
ZWN0cy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTaW1vbiBTZXIgPHNpbW9uLnNlckBpbnRlbC5jb20+
Cj4gRml4ZXM6IDQyNTc2ZDcxMDI1NSAoImxpYi9pZ3RfYXVkaW86IGFkZCBzdXBwb3J0IGZvciBT
MjRfTEUgYW5kIFMzMl9MRSBzaWduYWwgZ2VuZXJhdGlvbiIpCgpSZXZpZXdlZC1ieTogTWFydGlu
IFBlcmVzIDxtYXJ0aW4ucGVyZXNAbGludXguaW50ZWwuY29tPgo+IC0tLQo+ICBsaWIvaWd0X2F1
ZGlvLmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9hdWRpby5jIGIvbGliL2lndF9hdWRp
by5jCj4gaW5kZXggOTkzN2ZkMDJmNzUwLi4wNzkzNWU2NjBjNWEgMTAwNjQ0Cj4gLS0tIGEvbGli
L2lndF9hdWRpby5jCj4gKysrIGIvbGliL2lndF9hdWRpby5jCj4gQEAgLTMyOCw3ICszMjgsNyBA
QCB2b2lkIGF1ZGlvX3NpZ25hbF9maWxsX3MyNF9sZShzdHJ1Y3QgYXVkaW9fc2lnbmFsICpzaWdu
YWwsIGludDMyX3QgKmJ1ZmZlciwKPiAgCWF1ZGlvX3NpZ25hbF9maWxsKHNpZ25hbCwgdG1wLCBz
YW1wbGVzKTsKPiAKPiAgCWZvciAoaSA9IDA7IGkgPCBzaWduYWwtPmNoYW5uZWxzICogc2FtcGxl
czsgKytpKQo+IC0JCWJ1ZmZlcltpXSA9IDB4RkZGRkZGICogdG1wW2ldOwo+ICsJCWJ1ZmZlcltp
XSA9IDB4N0ZGRkZGICogdG1wW2ldOwo+IAo+ICAJZnJlZSh0bXApOwo+ICB9Cj4gQEAgLTM0Myw3
ICszNDMsNyBAQCB2b2lkIGF1ZGlvX3NpZ25hbF9maWxsX3MzMl9sZShzdHJ1Y3QgYXVkaW9fc2ln
bmFsICpzaWduYWwsIGludDMyX3QgKmJ1ZmZlciwKPiAgCWF1ZGlvX3NpZ25hbF9maWxsKHNpZ25h
bCwgdG1wLCBzYW1wbGVzKTsKPiAKPiAgCWZvciAoaSA9IDA7IGkgPCBzaWduYWwtPmNoYW5uZWxz
ICogc2FtcGxlczsgKytpKQo+IC0JCWJ1ZmZlcltpXSA9IFVJTlQzMl9NQVggKiB0bXBbaV07Cj4g
KwkJYnVmZmVyW2ldID0gSU5UMzJfTUFYICogdG1wW2ldOwo+IAo+ICAJZnJlZSh0bXApOwo+ICB9
Cj4gLS0KPiAyLjIxLjAKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
