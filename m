Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3D6E6E352
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Aug 2018 13:38:27 +0000 (UTC)
References: <1535372854-3031-1-git-send-email-juhapekka.heikkila@gmail.com>
 <1535372854-3031-2-git-send-email-juhapekka.heikkila@gmail.com>
 <1535375645.20284.2.camel@intel.com> <20180827163354.GL6432@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <a31792b1-b7e9-5c36-e449-1d5e9743e714@gmail.com>
Date: Tue, 28 Aug 2018 16:38:08 +0300
MIME-Version: 1.0
In-Reply-To: <20180827163354.GL6432@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/kms_rotation_crc: Fix
 bad-pixel-format not to be run on gen11 and later
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Mika Kahola <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gMjcuMDguMjAxOCAxOTozMywgUm9kcmlnbyBWaXZpIHdyb3RlOgo+IE9uIE1vbiwgQXVnIDI3
LCAyMDE4IGF0IDA0OjE0OjA1UE0gKzAzMDAsIE1pa2EgS2Fob2xhIHdyb3RlOgo+PiBPbiBNb24s
IDIwMTgtMDgtMjcgYXQgMTU6MjcgKzAzMDAsIEp1aGEtUGVra2EgSGVpa2tpbGEgd3JvdGU6Cj4+
PiBnZW4xMSBlbmFibGVzIDkwLzI3MCByb3RhdGlvbiBmb3IgUkdCNTY1IG1vZGUuIElHVCB3b3Vs
ZCBuZWVkIHN1cHBvcnQKPj4+IGZvcgo+Pj4gQzggbW9kZSB0byBlbmFibGUgcnVubmluZyB0aGlz
IHN1YnRlc3Qgb24gZ2VuMTEgYW5kIGxhdGVyLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEp1aGEt
UGVra2EgSGVpa2tpbGEgPGp1aGFwZWtrYS5oZWlra2lsYUBnbWFpbC5jb20+Cj4+PiAtLS0KPj4+
ICDCoHRlc3RzL2ttc19yb3RhdGlvbl9jcmMuYyB8IDYgKysrKysrCj4+PiAgwqAxIGZpbGUgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19yb3Rh
dGlvbl9jcmMuYyBiL3Rlc3RzL2ttc19yb3RhdGlvbl9jcmMuYwo+Pj4gaW5kZXggYjk5NGNjNS4u
MzVlNjcyMSAxMDA2NDQKPj4+IC0tLSBhL3Rlc3RzL2ttc19yb3RhdGlvbl9jcmMuYwo+Pj4gKysr
IGIvdGVzdHMva21zX3JvdGF0aW9uX2NyYy5jCj4+PiBAQCAtNTU4LDYgKzU1OCwxMiBAQCBpZ3Rf
bWFpbgo+Pj4gICAKPj4+ICDCoAlpZ3Rfc3VidGVzdF9mKCJiYWQtcGl4ZWwtZm9ybWF0Iikgewo+
Pj4gIMKgCQlpZ3RfcmVxdWlyZShnZW4gPj0gOSk7Cj4+PiArCQkvKgo+Pj4gKwkJwqAqIGdlbjEx
IGVuYWJsZXMgUkdCNTY1IHJvdGF0aW9uIGZvciA5MC8yNzAgZGVncmVlcy4KPj4+ICsJCcKgKiBD
OCBtb2RlIG5lZWQgdG8gYmUgZW5hYmxlZCBmb3IgSUdUIGlmIHdhbnQgdG8gcnVuCj4+PiB0aGlz
IHRlc3QKPj4+ICsJCcKgKiBvbiBnZW4xMSBvbndhcmRzLgo+Pj4gKwkJwqAqLwo+Pj4gKwkJaWd0
X3JlcXVpcmUoZ2VuIDwgMTEpOwo+PiBDb3VsZCB3ZSBjb21iaW5lIHRoZXNlIHR3byByZXF1aXJl
bWVudHM/IENvbW1lbnQgbWlnaHQgbmVlZCB0byBiZQo+PiByZXBocmFzZWQgYSBiaXQgdG9vLgoK
SSdsbCBtYWtlIGFub3RoZXIgcGF0Y2guCgo+IAo+IGFsc28sIGlzbid0IGFueSBvdGhlciB3YXkg
dG8gY2hlY2sgdGhlIGNhcGFiaWxpdHkgaW5zdGVhZCBvZiBzcHJlYWRpbmcKPiBnZW4gY2hlY2tz
PwoKVGhpcyBpcyBhdCBiZWdpbm5pbmcgb2YgdGVzdCwgbm90aGluZyBoYXMgYmVlbiBnZW5lcmF0
ZWQgeWV0LiBJIGRvbid0IAprbm93IHdoZXJlIGF0IHRoaXMgc3RhZ2UgSSB3b3VsZCBjaGVjayBm
b3IgY2FwYWJpbGl0aWVzLiBJbiBhbnkgY2FzZSBJJ2QgCnByZWZlciBza2lwIGVhcmx5LgoKT3V0
IG9mIGN1cmlvc2l0eSwgd2h5IHRvIGF2b2lkIGdlbiBjaGVja3M/IEkgdGhpbmsgdGhleSBhcmUg
d2l0aCBJR1QgCmNhc2UgaGFuZC1pbi1oYW5kIG9uIHdoYXQncyB3cml0dGVuIG9uIGtlcm5lbCBz
aWRlPwoKPiAKPj4KPj4+ICDCoAkJZGF0YS5yb3RhdGlvbiA9IElHVF9ST1RBVElPTl85MDsKPj4+
ICDCoAkJZGF0YS5vdmVycmlkZV9mbXQgPSBEUk1fRk9STUFUX1JHQjU2NTsKPj4+ICDCoAkJdGVz
dF9wbGFuZV9yb3RhdGlvbigmZGF0YSwgRFJNX1BMQU5FX1RZUEVfUFJJTUFSWSwKPj4+IHRydWUp
Owo+PiAtLSAKPj4gTWlrYSBLYWhvbGEgLSBJbnRlbCBPVEMKPj4KPj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gaWd0LWRldiBtYWlsaW5nIGxpc3QK
Pj4gaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2lndC1kZXYK
