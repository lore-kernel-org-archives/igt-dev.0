Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FCB5897EE
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2019 09:07:11 +0000 (UTC)
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
Date: Thu, 11 Apr 2019 09:07:08 +0000
Message-ID: <A98B49F3E938DC4A837FD9A548D117E6B47CA0ED@irsmsx105.ger.corp.intel.com>
References: <20190410113205.3486-1-stanislav.lisovskiy@intel.com>
 <20190410113205.3486-4-stanislav.lisovskiy@intel.com>
 <a1ad3421-2d3e-2a35-45a9-4a23ff8aad57@linux.intel.com>,
 <7f9aba74-4346-de97-53f7-9b0e2452bd70@linux.intel.com>
In-Reply-To: <7f9aba74-4346-de97-53f7-9b0e2452bd70@linux.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v9 3/3] igt/tests/kms_atomic_transition:
 Tolerate if can't have all planes
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
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Syrjala, Ville" <ville.syrjala@intel.com>, "Peres,
 Martin" <martin.peres@intel.com>, "Heikkila,
 Juha-pekka" <juha-pekka.heikkila@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

R3JlYXQsIHRoYW5rcyBmb3IgbmljZSBjb2Rpbmcgc3VnZ2VzdGlvbnMuCgpCZXN0IFJlZ2FyZHMs
CgpMaXNvdnNraXkgU3RhbmlzbGF2CgpPcmdhbml6YXRpb246IEludGVsIEZpbmxhbmQgT3kgLSBC
SUMgMDM1NzYwNi00IC0gV2VzdGVuZGlua2F0dSA3LCAwMjE2MCBFc3BvbwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcm9tOiBNYWFydGVuIExhbmtob3JzdCBbbWFh
cnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tXQpTZW50OiBUaHVyc2RheSwgQXByaWwgMTEs
IDIwMTkgMTE6MzkgQU0KVG86IExpc292c2tpeSwgU3RhbmlzbGF2OyBpZ3QtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpDYzogU3lyamFsYSwgVmlsbGU7IFBlcmVzLCBNYXJ0aW47IEhlaWtraWxh
LCBKdWhhLXBla2thClN1YmplY3Q6IFJlOiBbUEFUQ0ggaS1nLXQgdjkgMy8zXSBpZ3QvdGVzdHMv
a21zX2F0b21pY190cmFuc2l0aW9uOiBUb2xlcmF0ZSBpZiBjYW4ndCBoYXZlIGFsbCBwbGFuZXMK
Ck9wIDEwLTA0LTIwMTkgb20gMTc6MDYgc2NocmVlZiBNYWFydGVuIExhbmtob3JzdDoKPiBPcCAx
MC0wNC0yMDE5IG9tIDEzOjMyIHNjaHJlZWYgU3RhbmlzbGF2IExpc292c2tpeToKPj4gV2l0aCBz
b21lIHVwY29taW5nIGNoYW5nZXMgaTkxNSBtaWdodCBub3QgYWxsb3cKPj4gYWxsIHNwcml0ZSBw
bGFuZXMgZW5hYmxlZCwgZGVwZW5kaW5nIG9uIGF2YWlsYWJsZQo+PiBiYW5kd2lkdGggbGltaXRh
dGlvbi4gVGh1cyB0aGUgdGVzdCBuZWVkIHRvIGRlY3JlbWVudAo+PiBhbW91bnQgb2YgcGxhbmVz
IGFuZCB0cnkgYWdhaW4sIGluc3RlYWQgb2YgcGFuaWNraW5nLgo+Pgo+PiB2MjogUmVtb3ZlZCBl
eGNlc3NpdmUgbmVzdGVkIGNvbmRpdGlvbnMsIG1ha2luZyBjb2RlIGEgYml0Cj4+ICAgICBtb3Jl
IHJlYWRhYmxlKGhvcGVmdWxseSkuCj4+Cj4+IHYzOiBTdG9wcGVkIHVzaW5nIGdsb2JhbCBuX3Bs
YW5lcyB2YXJpYWJsZSBhcyBpdCBtaWdodCBjYXVzZQo+PiAgICAgcmVzb3VyY2VzIGJlaW5nIHVu
cmVsZWFzZWQuCj4+ICAgICBVc2luZyBub3cgcGFybXNbaV0ubWFzayBhcyBhIHdheSB0byBkZXRl
cm1pbmUgaWYgcGxhbmUKPj4gICAgIGhhcyB0byBiZSBpbmNsdWRlZCBpbnRvIGNvbW1pdC4KPj4K
Pj4gdjQ6IFJlbW92ZWQgdW5uZWVkZWQgbl9vdmVybGF5cyBpbml0aWFsaXphdGlvbi4KPj4KPj4g
djU6IFJhbmRvbWl6ZSB3aGljaCBvZiBzcHJpdGUgcGxhbmVzIHRvIHJlbW92ZSBpZiBoaXR0aW5n
Cj4+ICAgICByZXNvdXJjZSBsaW1pdHMuCj4+Cj4+IHY2OiBSZXBsYWNlIGlndF93YXJuIHdpdGgg
aWd0X2luZm8sIHRvIG1ha2UgSUdUIHRlc3RzIGhhcHBpZXIuCj4+Cj4+IHY3OiBSZW1vdmVkIHVu
bmVlZGVkIHJldHJ5IGxvZ2ljLCBtYWRlIHBsYW5lIHJhbmRvbSByZW1vdmFsIHNpbXBsaWVyLgo+
PiAgICAgR3JlYXQgdGhhbmtzIHRvIE1hYXJ0ZW4gTGFua2hvcnN0IGZvciBzdWdnZXN0aW9ucy4K
Pj4KPj4gdjg6IEZhaWwgaWYgd2UgaGF2ZSBsZXNzIHRoYW4gMyBwbGFuZXMKPj4KPj4gdjk6IFJl
bW92ZSB1bm5lZWRlZCBkaWZmcwo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBTdGFuaXNsYXYgTGlzb3Zz
a2l5IDxzdGFuaXNsYXYubGlzb3Zza2l5QGludGVsLmNvbT4KPj4gLS0tCj4+ICB0ZXN0cy9rbXNf
YXRvbWljX3RyYW5zaXRpb24uYyB8IDc4ICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0t
LS0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKSwgMzEgZGVsZXRpb25zKC0p
Cj4gQXNzdW1pbmcgQ0kgaXMgaGFwcHk6Cj4KPiBSZXZpZXdlZC1ieTogTWFhcnRlbiBMYW5raG9y
c3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KPgpUaGFua3MsIHB1c2hlZC4g
OikKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3Qt
ZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
