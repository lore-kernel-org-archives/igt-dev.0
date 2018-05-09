Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 533EE6EDD1
 for <igt-dev@lists.freedesktop.org>; Wed,  9 May 2018 23:46:58 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Wed, 9 May 2018 23:46:56 +0000
Message-ID: <197bf95827d22d4610823aa51490b3c3afb0f4f1.camel@intel.com>
References: <20180509173746.23405-1-dhinakaran.pandiyan@intel.com>
 <20180509173746.23405-12-dhinakaran.pandiyan@intel.com>
In-Reply-To: <20180509173746.23405-12-dhinakaran.pandiyan@intel.com>
Content-Language: en-US
Content-ID: <E889B549452DFA45B9016DF0A9EE01A6@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 11/14] tests/sink_crc_basic: Debug print
 CRC values
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
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Pandiyan, Dhinakaran" <dhinakaran.pandiyan@intel.com>
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCAyMDE4LTA1LTA5IGF0IDEwOjM3IC0wNzAwLCBEaGluYWthcmFuIFBhbmRpeWFuIHdy
b3RlOg0KPiBUaGUgQ1JDIHZhbHVlcyBhcmUgdXNlZnVsIGFzIGEgcmVmZXJlbmNlIHRvIGNvbXBh
cmUgdGhlbSB3aXRoIHZhbHVlcw0KPiBnZW5lcmF0ZWQgZnJvbSBvdGhlciBmZWF0dXJlIChQU1Ip
IHRlc3RzLg0KPiANCg0KUmV2aWV3ZWQtYnk6IEpvc2UgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5z
b3V6YUBpbnRlbC5jb20+DQoNCj4gU2lnbmVkLW9mZi1ieTogRGhpbmFrYXJhbiBQYW5kaXlhbiA8
ZGhpbmFrYXJhbi5wYW5kaXlhbkBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgdGVzdHMva21zX3Npbmtf
Y3JjX2Jhc2ljLmMgfCAyICsrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMva21zX3NpbmtfY3JjX2Jhc2ljLmMgYi90ZXN0cy9rbXNf
c2lua19jcmNfYmFzaWMuYw0KPiBpbmRleCAxNTk2ODNlMi4uMWMzMWUzMGEgMTAwNjQ0DQo+IC0t
LSBhL3Rlc3RzL2ttc19zaW5rX2NyY19iYXNpYy5jDQo+ICsrKyBiL3Rlc3RzL2ttc19zaW5rX2Ny
Y19iYXNpYy5jDQo+IEBAIC02MywxMSArNjMsMTMgQEAgc3RhdGljIHZvaWQgYXNzZXJ0X2NvbG9y
KGludCBkaXIsIGVudW0gY29sb3INCj4gY29sb3IpDQo+ICAJCWlndF9hc3NlcnRfbHQoMCwgcik7
DQo+ICAJCWlndF9hc3NlcnRfZXEoMCwgZyk7DQo+ICAJCWlndF9hc3NlcnRfZXEoMCwgYik7DQo+
ICsJCWlndF9kZWJ1Zygic2luayBDUkMgZm9yIHJlZCAlLjR4JS40eCUuNHhcbiIsIHIsIGcsDQo+
IGIpOw0KPiAgCQlicmVhazsNCj4gIAljYXNlIEdSRUVOOg0KPiAgCQlpZ3RfYXNzZXJ0X2VxKDAs
IHIpOw0KPiAgCQlpZ3RfYXNzZXJ0X2x0KDAsIGcpOw0KPiAgCQlpZ3RfYXNzZXJ0X2VxKDAsIGIp
Ow0KPiArCQlpZ3RfZGVidWcoInNpbmsgQ1JDIGZvciBncmVlbiAlLjR4JS40eCUuNHhcbiIsIHIs
IGcsDQo+IGIpOw0KPiAgCQlicmVhazsNCj4gIAlkZWZhdWx0Og0KPiAgCQlpZ3RfZmFpbChJR1Rf
RVhJVF9GQUlMVVJFKTsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
