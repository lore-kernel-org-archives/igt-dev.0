Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A666E0C1
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Nov 2018 13:56:05 +0000 (UTC)
References: <20181128130334.6024-1-stanislav.lisovskiy@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <53a32a93-9d12-ca3a-c08f-740c77f37ae2@linux.intel.com>
Date: Wed, 28 Nov 2018 14:56:03 +0100
MIME-Version: 1.0
In-Reply-To: <20181128130334.6024-1-stanislav.lisovskiy@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] Allow a full modeset in kms_properties
 atomic case
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
Cc: ville.syrjala@intel.com, martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

T3AgMjgtMTEtMTggb20gMTQ6MDMgc2NocmVlZiBTdGFuaXNsYXYgTGlzb3Zza2l5Ogo+IE90aGVy
d2lzZSB3ZSBhcmUgZ2V0dGluZyBFSU5WQUwgYXMgZHJtIHJlcXVpcmVzIGl0Cj4gYXQgc29tZSBw
b2ludC4KPiBCdWd6aWxsYTogaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5j
Z2k/aWQ9MTA4NjQyCj4gU2lnbmVkLW9mZi1ieTogU3RhbmlzbGF2IExpc292c2tpeSA8c3Rhbmlz
bGF2Lmxpc292c2tpeUBpbnRlbC5jb20+Cj4gLS0tCj4gIHRlc3RzL2ttc19wcm9wZXJ0aWVzLmMg
fCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
Cj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19wcm9wZXJ0aWVzLmMgYi90ZXN0cy9rbXNfcHJvcGVy
dGllcy5jCj4gaW5kZXggODJkMjhlOWIuLmViOWNiZGRhIDEwMDY0NAo+IC0tLSBhL3Rlc3RzL2tt
c19wcm9wZXJ0aWVzLmMKPiArKysgYi90ZXN0cy9rbXNfcHJvcGVydGllcy5jCj4gQEAgLTEwMCw3
ICsxMDAsNyBAQCBzdGF0aWMgdm9pZCBtYXhfYnBjX3Byb3BfdGVzdChpbnQgZmQsIHVpbnQzMl90
IGlkLCB1aW50MzJfdCB0eXBlLCBkcm1Nb2RlUHJvcGVydAo+ICAJCQlyZXQgPSBkcm1Nb2RlQXRv
bWljQWRkUHJvcGVydHkocmVxLCBpZCwgcHJvcF9pZCwgaSk7Cj4gIAkJCWlndF9hc3NlcnQocmV0
ID49IDApOwo+ICAKPiAtCQkJcmV0ID0gZHJtTW9kZUF0b21pY0NvbW1pdChmZCwgcmVxLCBEUk1f
TU9ERV9BVE9NSUNfVEVTVF9PTkxZLCBOVUxMKTsKPiArCQkJcmV0ID0gZHJtTW9kZUF0b21pY0Nv
bW1pdChmZCwgcmVxLCBEUk1fTU9ERV9BVE9NSUNfVEVTVF9PTkxZIHwgRFJNX01PREVfQVRPTUlD
X0FMTE9XX01PREVTRVQsIE5VTEwpOwo+ICAJCQlpZ3RfYXNzZXJ0X2VxKHJldCwgMCk7Cj4gIAkJ
fQo+ICAJfQoKUmV2aWV3ZWQtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3Jz
dEBsaW51eC5pbnRlbC5jb20+CgpMZXRzIHdhaXQgZm9yIENJIHJlc3VsdHMgYmVmb3JlIGNvbW1p
dHRpbmcgaXQuIDopCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
