Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA3F89838
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2019 08:39:59 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20190410113205.3486-1-stanislav.lisovskiy@intel.com>
 <20190410113205.3486-4-stanislav.lisovskiy@intel.com>
 <a1ad3421-2d3e-2a35-45a9-4a23ff8aad57@linux.intel.com>
Message-ID: <7f9aba74-4346-de97-53f7-9b0e2452bd70@linux.intel.com>
Date: Thu, 11 Apr 2019 10:39:55 +0200
MIME-Version: 1.0
In-Reply-To: <a1ad3421-2d3e-2a35-45a9-4a23ff8aad57@linux.intel.com>
Content-Language: en-US
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
To: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, igt-dev@lists.freedesktop.org
Cc: ville.syrjala@intel.com, martin.peres@intel.com, juha-pekka.heikkila@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

T3AgMTAtMDQtMjAxOSBvbSAxNzowNiBzY2hyZWVmIE1hYXJ0ZW4gTGFua2hvcnN0Ogo+IE9wIDEw
LTA0LTIwMTkgb20gMTM6MzIgc2NocmVlZiBTdGFuaXNsYXYgTGlzb3Zza2l5Ogo+PiBXaXRoIHNv
bWUgdXBjb21pbmcgY2hhbmdlcyBpOTE1IG1pZ2h0IG5vdCBhbGxvdwo+PiBhbGwgc3ByaXRlIHBs
YW5lcyBlbmFibGVkLCBkZXBlbmRpbmcgb24gYXZhaWxhYmxlCj4+IGJhbmR3aWR0aCBsaW1pdGF0
aW9uLiBUaHVzIHRoZSB0ZXN0IG5lZWQgdG8gZGVjcmVtZW50Cj4+IGFtb3VudCBvZiBwbGFuZXMg
YW5kIHRyeSBhZ2FpbiwgaW5zdGVhZCBvZiBwYW5pY2tpbmcuCj4+Cj4+IHYyOiBSZW1vdmVkIGV4
Y2Vzc2l2ZSBuZXN0ZWQgY29uZGl0aW9ucywgbWFraW5nIGNvZGUgYSBiaXQKPj4gICAgIG1vcmUg
cmVhZGFibGUoaG9wZWZ1bGx5KS4KPj4KPj4gdjM6IFN0b3BwZWQgdXNpbmcgZ2xvYmFsIG5fcGxh
bmVzIHZhcmlhYmxlIGFzIGl0IG1pZ2h0IGNhdXNlCj4+ICAgICByZXNvdXJjZXMgYmVpbmcgdW5y
ZWxlYXNlZC4KPj4gICAgIFVzaW5nIG5vdyBwYXJtc1tpXS5tYXNrIGFzIGEgd2F5IHRvIGRldGVy
bWluZSBpZiBwbGFuZQo+PiAgICAgaGFzIHRvIGJlIGluY2x1ZGVkIGludG8gY29tbWl0Lgo+Pgo+
PiB2NDogUmVtb3ZlZCB1bm5lZWRlZCBuX292ZXJsYXlzIGluaXRpYWxpemF0aW9uLgo+Pgo+PiB2
NTogUmFuZG9taXplIHdoaWNoIG9mIHNwcml0ZSBwbGFuZXMgdG8gcmVtb3ZlIGlmIGhpdHRpbmcK
Pj4gICAgIHJlc291cmNlIGxpbWl0cy4KPj4KPj4gdjY6IFJlcGxhY2UgaWd0X3dhcm4gd2l0aCBp
Z3RfaW5mbywgdG8gbWFrZSBJR1QgdGVzdHMgaGFwcGllci4KPj4KPj4gdjc6IFJlbW92ZWQgdW5u
ZWVkZWQgcmV0cnkgbG9naWMsIG1hZGUgcGxhbmUgcmFuZG9tIHJlbW92YWwgc2ltcGxpZXIuCj4+
ICAgICBHcmVhdCB0aGFua3MgdG8gTWFhcnRlbiBMYW5raG9yc3QgZm9yIHN1Z2dlc3Rpb25zLgo+
Pgo+PiB2ODogRmFpbCBpZiB3ZSBoYXZlIGxlc3MgdGhhbiAzIHBsYW5lcwo+Pgo+PiB2OTogUmVt
b3ZlIHVubmVlZGVkIGRpZmZzCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFN0YW5pc2xhdiBMaXNvdnNr
aXkgPHN0YW5pc2xhdi5saXNvdnNraXlAaW50ZWwuY29tPgo+PiAtLS0KPj4gIHRlc3RzL2ttc19h
dG9taWNfdHJhbnNpdGlvbi5jIHwgNzggKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0t
LS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCA0NyBpbnNlcnRpb25zKCspLCAzMSBkZWxldGlvbnMoLSkK
PiBBc3N1bWluZyBDSSBpcyBoYXBweToKPgo+IFJldmlld2VkLWJ5OiBNYWFydGVuIExhbmtob3Jz
dCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+ClRoYW5rcywgcHVzaGVkLiA6
KQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1k
ZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
