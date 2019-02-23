Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 574758994A
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Feb 2019 01:09:33 +0000 (UTC)
References: <3c1d471aaff359e7dc2c9c7d34325e78858f0913.1550904761.git.caz.yokoyama@intel.com>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <e4b81a3e-4f08-58a6-fa43-a4b5c6712955@intel.com>
Date: Fri, 22 Feb 2019 17:09:32 -0800
MIME-Version: 1.0
In-Reply-To: <3c1d471aaff359e7dc2c9c7d34325e78858f0913.1550904761.git.caz.yokoyama@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [igt PATCH v1 1/1] i915/gem_ctx_switch: evenly run 4
 child processes
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
To: Caz Yokoyama <caz.yokoyama@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

CgpPbiAyMi8wMi8xOSAyMjo1NCwgQ2F6IFlva295YW1hIHdyb3RlOgo+IGdlbV9jdHhfc3dpdGNo
QGJhc2ljLWFsbC1saWdodCB0ZXN0IGNyZWF0ZXMgNCBjaGlsZCBwcm9jZXNzZXMgZm9yIGVhY2gK
PiBlbmdpbmUgYW5kIHdhaXQuIHJlbmRlciBlbmdpbmUgcnVucyBzbG93ZXIgdGhhbiBvdGhlcnMu
IEJ5IHRoaXMgcGF0Y2gsCj4gNCBjaGlsZCBwcm9jZXNzZXMgcnVuIGZhaXJseSBldmVubHkuIEFz
IGEgcmVzdWx0LCBwYXJlbnQgcHJvY2VzcyBydW5zCj4gZmFzdGVyLiBPbiBteSBOVUMsIGl0cyBl
eGVjdXRpb24gdGltZSBiZWNvbWVzIGFib3V0IGhhbGYuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2F6
IFlva295YW1hIDxjYXoueW9rb3lhbWFAaW50ZWwuY29tPgo+IC0tLQo+ICAgdGVzdHMvaTkxNS9n
ZW1fY3R4X3N3aXRjaC5jIHwgNCArKystCj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUvZ2VtX2N0eF9z
d2l0Y2guYyBiL3Rlc3RzL2k5MTUvZ2VtX2N0eF9zd2l0Y2guYwo+IGluZGV4IDEyMDhjYjhkLi45
ZWQyMmYzNSAxMDA2NDQKPiAtLS0gYS90ZXN0cy9pOTE1L2dlbV9jdHhfc3dpdGNoLmMKPiArKysg
Yi90ZXN0cy9pOTE1L2dlbV9jdHhfc3dpdGNoLmMKPiBAQCAtMjQ3LDcgKzI0Nyw5IEBAIHN0YXRp
YyB2b2lkIGFsbChpbnQgZmQsIHVpbnQzMl90IGhhbmRsZSwgdW5zaWduZWQgZmxhZ3MsIGludCB0
aW1lb3V0KQo+ICAgCj4gICAJCQkJY2xvY2tfZ2V0dGltZShDTE9DS19NT05PVE9OSUMsICZzdGFy
dCk7Cj4gICAJCQkJZG8gewo+IC0JCQkJCWZvciAoaW50IGxvb3AgPSAwOyBsb29wIDwgcWxlbjsg
bG9vcCsrKSB7Cj4gKwkJCQkJaW50IHggPSBzdHJjbXAobmFtZVtjaGlsZF0sICJyZW5kZXIiKSA9
PSAwID8gcWxlbi8yIDogcWxlbjsKPiArCj4gKwkJCQkJZm9yIChpbnQgbG9vcCA9IDA7IGxvb3Ag
PCB4OyBsb29wKyspIHsKCkJld2FyZSB0aGF0IGNvdW50IGJlY29tZXMgaW5jb3JyZWN0LiBJdCBz
aG91bGQgYmU6CmNvdW50ICs9IHg7CgpBbnRvbmlvCgo+ICAgCQkJCQkJZXhlY2J1Zi5yc3ZkMSA9
IGNvbnRleHRzW2xvb3AgJSBuY3R4XTsKPiAgIAkJCQkJCWdlbV9leGVjYnVmKGZkLCAmZXhlY2J1
Zik7Cj4gICAJCQkJCX0KPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
