Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F536E3D7
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Oct 2018 16:49:57 +0000 (UTC)
References: <20181005233437.31286-1-manasi.d.navare@intel.com>
 <a97c7473-ecb6-ffb7-cddc-a5004f980e8c@intel.com>
 <20181016184704.GA8224@intel.com>
 <3b41c1f5-f149-43a9-d177-d9a751b226e0@intel.com>
 <20181017074824.GO17124@platvala-desk.ger.corp.intel.com>
 <20181017160102.GA8968@intel.com>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <f9d9be68-7c65-a3f0-d8c4-bdeb41c6a21a@intel.com>
Date: Wed, 17 Oct 2018 09:49:56 -0700
MIME-Version: 1.0
In-Reply-To: <20181017160102.GA8968@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] test/kms_dp_dsc: Basic KMS test to
 validate VESA DSC on DP/eDP
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
To: Manasi Navare <manasi.d.navare@intel.com>, igt-dev@lists.freedesktop.org, Anusha Srivatsa <anusha.srivatsa@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

CgpPbiAxNy8xMC8xOCAwOTowMSwgTWFuYXNpIE5hdmFyZSB3cm90ZToKPiBPbiBXZWQsIE9jdCAx
NywgMjAxOCBhdCAxMDo0ODoyNEFNICswMzAwLCBQZXRyaSBMYXR2YWxhIHdyb3RlOgo+PiBPbiBU
dWUsIE9jdCAxNiwgMjAxOCBhdCAwMjoxNDo1OVBNIC0wNzAwLCBBbnRvbmlvIEFyZ2Vuemlhbm8g
d3JvdGU6Cj4+Pj4+PiArCQlpZ3RfYXNzZXJ0X2VxKHJldCwgMCk7Cj4+Pj4+PiArCX0KPj4+Pj4+
ICsKPj4+Pj4+ICsJY2xvc2UoZHJtX2ZkKTsKPj4+Pj4+ICsKPj4+Pj4+ICsJaWd0X2Fzc2VydF9l
cShyZXQsIDApOwo+Pj4+Pgo+Pj4+PiAncmV0JyBpcyBhbHJlYWR5IGNoZWNrZWQgaW4gdGhlIHN1
YnRlc3QgYWxzbywgdGhpcyB3b3VsZCBmYWlsIGlmIHlvdSBkb24ndAo+Pj4+PiBydW4gdGhlIHN1
YnRlc3QuCj4+Pj4KPj4+PiBJZiBJIGRvbnQgcnVuIHRoZSBzdWJ0ZXN0LCBpdCB3aWxsIHVzZSB0
aGUgaW5pdGlhbGl6ZWQgdmFsdWUgb2YgcmV0IHdoaWNoIGlzIDAuCj4+Pj4gSXQgd2lsbCBvbmx5
IGZhaWwgaWYgdXBkYXRlX2Rpc3BsYXkgcmV0dXJucyBhIG5lZ2F0aXZlIHZhbHVlLgo+Pj4KPj4+
IFNvcnJ5LCB5b3UgYXJlIHJpZ2h0IEkgbWlzcmVhZCB0aGF0LiBCdXQsIGl0IHdpbGwgbm90IGJl
IHRoaXMgYXNzZXJ0IHRvIGZpcmUKPj4+IGlmIHJldCAhPSAwIGJ1dCB0aGUgb25lIGluIHRoZSBz
dWJ0ZXN0LiBNeSBwb2ludCB3YXMgdGhhdCB0aGlzIHN0YXRlbWVudAo+Pj4gc2VlbXMgYSBiaXQg
cmVkdW5kYW50IGFuZCBjb3VsZCBiZSBlbGltaW5hdGVkLgo+Pgo+PiBJdCdzIG5vdCBvbmx5IHJl
ZHVuZGFudCwgaXQncyBpbnZhbGlkIHRvIGNhbGwgaWd0X2Fzc2VydCB3aGVuIG5vdAo+PiBpbnNp
ZGUgYW4gaWd0X2ZpeHR1cmUgb3IgYSBzdWJ0ZXN0LiBTZWUgbGliL2lndF9jb3JlLmM6MTE4MCwK
Pj4gaWd0X2Nhbl9mYWlsKCkuCj4+Cj4gCj4gVGhhbmtzIEFudG9uaW8gYW5kIFBldHJpIGZvciBw
b2ludGluZyB0aGlzIG91dC4KPiBJIHdpbGwgcmVtb3ZlIHRoZSBpZ3RfYXNzZXJ0IGZyb20gdGhl
cmUuIFRoZSBpZ3RfZml4dHVyZSgpIHNob3VsZCBhbHJlYWR5IHRha2UgY2FyZQo+IG9mIGhhdmlu
ZyB0aGF0IGFmdGVyIHRoZSB0ZXN0IHJpZ2h0PyBTbyBJIGRvbnQgbmVlZCB0byBjYWxsIGl0IGV4
cGxpY2l0bHkgaW4gaWd0X2ZpeHR1cmUoKQoKWW91IHdhbnQgdG8gY2FsbCBhc3NlcnRzIG1haW5s
eSBpbnNpZGUgdGhlIHRlc3QgaXRzZWxmLCBjbG9zZShkcm1fZmQpIApzaG91bGQgcHJvYmFibHkg
Z28gaW4gYSBmaXh0dXJlIGF0IHRoZSBlbmQgdG8gYXZvaWQgY2FsbGluZyBpdCB3aGVuIApsaXN0
aW5nIHN1YnRlc3RzIG9ubHkuCgpBbnRvbmlvCgo+IAo+IE1hbmFzaQo+Pgo+Pgo+PiAtLSAKPj4g
UGV0cmkgTGF0dmFsYQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
