Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790045.outbound.protection.outlook.com [40.107.79.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A7C6E40E
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jun 2019 12:51:56 +0000 (UTC)
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
Date: Wed, 26 Jun 2019 12:51:54 +0000
Message-ID: <f85b1e89-bd46-30da-67ab-f8214053874d@amd.com>
References: <20190625194218.18106-1-dingchen.zhang@amd.com>
 <20190625194218.18106-2-dingchen.zhang@amd.com>
In-Reply-To: <20190625194218.18106-2-dingchen.zhang@amd.com>
Content-Language: en-US
Content-ID: <B2692198A09D3549B6C13BD52E059A7E@namprd12.prod.outlook.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/3] lib/igt_debugfs: add DPRX pipe
 crc source for AMDGPU
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
To: "Zhang, Dingchen (David)" <Dingchen.Zhang@amd.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gNi8yNS8xOSAzOjQyIFBNLCBEaW5nY2hlbiBaaGFuZyB3cm90ZToNCj4gTmVlZCBEUFJYIENS
QyBzb3VyY2UgdG8gdmFsaWRhdGUgQU1ER1BVIDhicGMgYnlwYXNzIG1vZGUuDQo+IA0KPiBBZGRl
ZCBBTURHUFUgRFBSWCBwaXBlIGNyYyBzb3VyY2UgaW4gaWd0X2RlYnVnZnMuaA0KPiANCj4gdjI6
IGRyb3BwZWQgdGhlIENSVEMgYW5kIEFVVE8gY3JjIHNvdXJjZXMgZm9yIEFNREdQVSAoTmljaG9s
YXMpDQo+IA0KPiBDYzogSGFycnkgV2VudGxhbmQgPEhhcnJ5LldlbnRsYW5kQGFtZC5jb20+DQo+
IENjOiBOaWNrIEthemxhdXNrYXMgPE5pY2hvbGFzLkthemxhdXNrYXNAYW1kLmNvbT4NCj4gU2ln
bmVkLW9mZi1ieTogRGluZ2NoZW4gWmhhbmcgPGRpbmdjaGVuLnpoYW5nQGFtZC5jb20+DQoNClJl
dmlld2VkLWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5rYXpsYXVza2FzQGFtZC5j
b20+DQoNCj4gLS0tDQo+ICAgbGliL2lndF9kZWJ1Z2ZzLmggfCAxICsNCj4gICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKykNCj4gDQo+IGRpZmYgLS1naXQgYS9saWIvaWd0X2RlYnVnZnMu
aCBiL2xpYi9pZ3RfZGVidWdmcy5oDQo+IGluZGV4IDUyNTIwYjNjLi4zNmI2MzgxNyAxMDA2NDQN
Cj4gLS0tIGEvbGliL2lndF9kZWJ1Z2ZzLmgNCj4gKysrIGIvbGliL2lndF9kZWJ1Z2ZzLmgNCj4g
QEAgLTgzLDYgKzgzLDcgQEAgdHlwZWRlZiBzdHJ1Y3Qgew0KPiAgIH0gaWd0X2NyY190Ow0KPiAg
IA0KPiAgICNkZWZpbmUgSU5URUxfUElQRV9DUkNfU09VUkNFX0FVVE8gImF1dG8iDQo+ICsjZGVm
aW5lIEFNREdQVV9QSVBFX0NSQ19TT1VSQ0VfRFBSWCAiZHByeCINCj4gICANCj4gICB2b2lkIGln
dF9hc3NlcnRfY3JjX2VxdWFsKGNvbnN0IGlndF9jcmNfdCAqYSwgY29uc3QgaWd0X2NyY190ICpi
KTsNCj4gICBib29sIGlndF9jaGVja19jcmNfZXF1YWwoY29uc3QgaWd0X2NyY190ICphLCBjb25z
dCBpZ3RfY3JjX3QgKmIpOw0KPiANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
Z3QtZGV2
