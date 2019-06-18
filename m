Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B881B6E11B
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2019 08:16:54 +0000 (UTC)
References: <20190521132248.21811-1-lionel.g.landwerlin@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <ae56444b-e1a5-c3a5-ff11-d6e94a89a5c8@intel.com>
Date: Tue, 18 Jun 2019 11:16:52 +0300
MIME-Version: 1.0
In-Reply-To: <20190521132248.21811-1-lionel.g.landwerlin@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v2 0/5] tests: Add timeline syncobj tests
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

QW55b25lIHdpbGxpbmcgdG8gdGFrZSBhIGxvb2sgYXQgdGhpcyBzZXJpZXM/CgpUaGFua3MsCgot
TGlvbmVsCgpPbiAyMS8wNS8yMDE5IDE2OjIyLCBMaW9uZWwgTGFuZHdlcmxpbiB3cm90ZToKPiBO
ZXcgaW9jdGxzIGhhdmUgYmVlbiBhZGRlZCB0byBkcm0tc3luY29iaiB0byBpbXBsZW1lbnQgVnVs
a2FuIHRpbWVsaW5lCj4gc2VtYXBob3Jlcy4gVGhpcyBzZXJpZXMgYWRkcyB0ZXN0cyBmb3IgdGhp
cyBuZXcgZmVhdHVyZS4KPgo+IENoZWVycywKPgo+IENodW5taW5nIFpob3UgKDEpOgo+ICAgIGln
dDogYWRkIHRpbWVsaW5lIHRlc3QgY2FzZXMKPgo+IExpb25lbCBMYW5kd2VybGluICg0KToKPiAg
ICBsaWIvc3luY29iajogZml4IGNvbW1lbnQgdHlwbwo+ICAgIGluY2x1ZGU6IGJ1bXAgZHJtIGhl
YWRlcnMKPiAgICBsaWIvc3luY29iajogZHJvcCBsb2NhbCBkZWNsYXJhdGlvbnMKPiAgICB0ZXN0
cy9zeW5jb2JqX3RpbWVsaW5lOiBhZGQgbW9yZSB0aW1lbGluZSB0ZXN0cwo+Cj4gICBpbmNsdWRl
L2RybS11YXBpL2FtZGdwdV9kcm0uaCAgfCAgIDUyICstCj4gICBpbmNsdWRlL2RybS11YXBpL2Ry
bS5oICAgICAgICAgfCAgIDM3ICsKPiAgIGluY2x1ZGUvZHJtLXVhcGkvZHJtX21vZGUuaCAgICB8
ICAgIDQgKy0KPiAgIGluY2x1ZGUvZHJtLXVhcGkvbXNtX2RybS5oICAgICB8ICAgMTQgKwo+ICAg
aW5jbHVkZS9kcm0tdWFwaS9ub3V2ZWF1X2RybS5oIHwgICA1MSArKwo+ICAgbGliL2lndF9zeW5j
b2JqLmMgICAgICAgICAgICAgIHwgIDI1MyArKysrKy0KPiAgIGxpYi9pZ3Rfc3luY29iai5oICAg
ICAgICAgICAgICB8ICAgNDUgKy0KPiAgIHRlc3RzL21lc29uLmJ1aWxkICAgICAgICAgICAgICB8
ICAgIDEgKwo+ICAgdGVzdHMvc3luY29ial9iYXNpYy5jICAgICAgICAgIHwgICAgMiArLQo+ICAg
dGVzdHMvc3luY29ial90aW1lbGluZS5jICAgICAgIHwgMTM1MyArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwo+ICAgdGVzdHMvc3luY29ial93YWl0LmMgICAgICAgICAgIHwgICA1OCAr
LQo+ICAgMTEgZmlsZXMgY2hhbmdlZCwgMTgwMyBpbnNlcnRpb25zKCspLCA2NyBkZWxldGlvbnMo
LSkKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0cy9zeW5jb2JqX3RpbWVsaW5lLmMKPgo+IC0t
Cj4gMi4yMS4wLjM5Mi5nZjhmNjc4NzE1OWUKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pZ3QtZGV2
