Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F3E789E5F
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2019 09:02:29 +0000 (UTC)
References: <20190320092254.31807-1-mika.kahola@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <4e2cd400-e6a4-d761-1b7c-3417d3ea0672@gmail.com>
Date: Thu, 21 Mar 2019 11:02:25 +0200
MIME-Version: 1.0
In-Reply-To: <20190320092254.31807-1-mika.kahola@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_scaling: Ensure minimum
 height and width for planar uyv formats
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
To: Mika Kahola <mika.kahola@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

TG9va3MgZ29vZCwKClJldmlld2VkLWJ5OiBKdWhhLVBla2thIEhlaWtraWxhIDxqdWhhcGVra2Eu
aGVpa2tpbGFAZ21haWwuY29tPgoKT24gMjAuMy4yMDE5IDExLjIyLCBNaWthIEthaG9sYSB3cm90
ZToKPiBMZXQncyBlbnN1cmUgdGhhdCB3ZSB0ZXN0IHdpdGggbWluaW11bSB3aWR0aCBhbmQgaGVp
Z2h0IG9mIDE2IGZvciBhbGwgcGxhbmFyIHV5diBmb3JtYXRzLgo+IAo+IFJlZmVyZW5jZXM6IGh0
dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTExMDA5OAo+IFNpZ25l
ZC1vZmYtYnk6IE1pa2EgS2Fob2xhIDxtaWthLmthaG9sYUBpbnRlbC5jb20+Cj4gLS0tCj4gICB0
ZXN0cy9rbXNfcGxhbmVfc2NhbGluZy5jIHwgMTUgKysrKysrKysrKysrKystCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQg
YS90ZXN0cy9rbXNfcGxhbmVfc2NhbGluZy5jIGIvdGVzdHMva21zX3BsYW5lX3NjYWxpbmcuYwo+
IGluZGV4IGQ0MDhhMjAzLi4wMWY1ZjdjOSAxMDA2NDQKPiAtLS0gYS90ZXN0cy9rbXNfcGxhbmVf
c2NhbGluZy5jCj4gKysrIGIvdGVzdHMva21zX3BsYW5lX3NjYWxpbmcuYwo+IEBAIC02MCw2ICs2
MCwxOSBAQCBzdGF0aWMgaW50IGdldF9udW1fc2NhbGVycyhkYXRhX3QqIGQsIGVudW0gcGlwZSBw
aXBlKQo+ICAgCQlyZXR1cm4gMTsKPiAgIH0KPiAgIAo+ICtzdGF0aWMgYm9vbCBpc19wbGFuYXJf
eXV2X2Zvcm1hdCh1aW50MzJfdCBwaXhlbGZvcm1hdCkKPiArewo+ICsJc3dpdGNoIChwaXhlbGZv
cm1hdCkgewo+ICsJY2FzZSBEUk1fRk9STUFUX05WMTI6Cj4gKwljYXNlIERSTV9GT1JNQVRfUDAx
MDoKPiArCWNhc2UgRFJNX0ZPUk1BVF9QMDEyOgo+ICsJY2FzZSBEUk1fRk9STUFUX1AwMTY6Cj4g
KwkJcmV0dXJuIHRydWU7Cj4gKwlkZWZhdWx0Ogo+ICsJCXJldHVybiBmYWxzZTsKPiArCX0KPiAr
fQo+ICsKPiAgIHN0YXRpYyB2b2lkIGNsZWFudXBfZmJzKGRhdGFfdCAqZGF0YSkKPiAgIHsKPiAg
IAlpbnQgaTsKPiBAQCAtMTM2LDcgKzE0OSw3IEBAIHN0YXRpYyB2b2lkIGNoZWNrX3NjYWxpbmdf
cGlwZV9wbGFuZV9yb3QoZGF0YV90ICpkLCBpZ3RfcGxhbmVfdCAqcGxhbmUsCj4gICAKPiAgIAkv
KiBjcmVhdGUgYnVmZmVyIGluIHRoZSByYW5nZSBvZiAgbWluIGFuZCBtYXggc291cmNlIHNpZGUg
bGltaXQuKi8KPiAgIAl3aWR0aCA9IGhlaWdodCA9IDg7Cj4gLQlpZiAocGl4ZWxfZm9ybWF0ID09
IERSTV9GT1JNQVRfTlYxMikKPiArCWlmIChpc19wbGFuYXJfeXV2X2Zvcm1hdChwaXhlbF9mb3Jt
YXQpKQo+ICAgCQl3aWR0aCA9IGhlaWdodCA9IDE2Owo+ICAgCWlndF9jcmVhdGVfY29sb3JfZmIo
ZGlzcGxheS0+ZHJtX2ZkLCB3aWR0aCwgaGVpZ2h0LAo+ICAgCQkgICAgICAgcGl4ZWxfZm9ybWF0
LCB0aWxpbmcsIDAuMCwgMS4wLCAwLjAsICZkLT5mYlswXSk7Cj4gCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3Qt
ZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
