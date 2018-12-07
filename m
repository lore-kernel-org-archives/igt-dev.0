Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72EDF6E7D0
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Dec 2018 16:10:43 +0000 (UTC)
Date: Fri, 7 Dec 2018 08:11:53 -0800
From: James Ausmus <james.ausmus@intel.com>
Message-ID: <20181207161153.GA7698@jausmus-gentoo-dev6.jf.intel.com>
References: <20181128130334.6024-1-stanislav.lisovskiy@intel.com>
 <53a32a93-9d12-ca3a-c08f-740c77f37ae2@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <53a32a93-9d12-ca3a-c08f-740c77f37ae2@linux.intel.com>
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
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, igt-dev@lists.freedesktop.org, ville.syrjala@intel.com, martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjgsIDIwMTggYXQgMDI6NTY6MDNQTSArMDEwMCwgTWFhcnRlbiBMYW5raG9y
c3Qgd3JvdGU6Cj4gT3AgMjgtMTEtMTggb20gMTQ6MDMgc2NocmVlZiBTdGFuaXNsYXYgTGlzb3Zz
a2l5Ogo+ID4gT3RoZXJ3aXNlIHdlIGFyZSBnZXR0aW5nIEVJTlZBTCBhcyBkcm0gcmVxdWlyZXMg
aXQKPiA+IGF0IHNvbWUgcG9pbnQuCj4gPiBCdWd6aWxsYTogaHR0cHM6Ly9idWdzLmZyZWVkZXNr
dG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTA4NjQyCj4gPiBTaWduZWQtb2ZmLWJ5OiBTdGFuaXNs
YXYgTGlzb3Zza2l5IDxzdGFuaXNsYXYubGlzb3Zza2l5QGludGVsLmNvbT4KPiA+IC0tLQo+ID4g
IHRlc3RzL2ttc19wcm9wZXJ0aWVzLmMgfCAyICstCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19w
cm9wZXJ0aWVzLmMgYi90ZXN0cy9rbXNfcHJvcGVydGllcy5jCj4gPiBpbmRleCA4MmQyOGU5Yi4u
ZWI5Y2JkZGEgMTAwNjQ0Cj4gPiAtLS0gYS90ZXN0cy9rbXNfcHJvcGVydGllcy5jCj4gPiArKysg
Yi90ZXN0cy9rbXNfcHJvcGVydGllcy5jCj4gPiBAQCAtMTAwLDcgKzEwMCw3IEBAIHN0YXRpYyB2
b2lkIG1heF9icGNfcHJvcF90ZXN0KGludCBmZCwgdWludDMyX3QgaWQsIHVpbnQzMl90IHR5cGUs
IGRybU1vZGVQcm9wZXJ0Cj4gPiAgCQkJcmV0ID0gZHJtTW9kZUF0b21pY0FkZFByb3BlcnR5KHJl
cSwgaWQsIHByb3BfaWQsIGkpOwo+ID4gIAkJCWlndF9hc3NlcnQocmV0ID49IDApOwo+ID4gIAo+
ID4gLQkJCXJldCA9IGRybU1vZGVBdG9taWNDb21taXQoZmQsIHJlcSwgRFJNX01PREVfQVRPTUlD
X1RFU1RfT05MWSwgTlVMTCk7Cj4gPiArCQkJcmV0ID0gZHJtTW9kZUF0b21pY0NvbW1pdChmZCwg
cmVxLCBEUk1fTU9ERV9BVE9NSUNfVEVTVF9PTkxZIHwgRFJNX01PREVfQVRPTUlDX0FMTE9XX01P
REVTRVQsIE5VTEwpOwo+ID4gIAkJCWlndF9hc3NlcnRfZXEocmV0LCAwKTsKPiA+ICAJCX0KPiA+
ICAJfQo+IAo+IFJldmlld2VkLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9y
c3RAbGludXguaW50ZWwuY29tPgo+IAo+IExldHMgd2FpdCBmb3IgQ0kgcmVzdWx0cyBiZWZvcmUg
Y29tbWl0dGluZyBpdC4gOikKCkNhbiB0aGlzIGdldCBtZXJnZWQgbm93LCBvciBpcyBpdCBzdGls
bCB3YWl0aW5nIGZvciBzb21ldGhpbmcKYWRkaXRpb25hbD8KClRoYW5rcyEKCi1KYW1lcwoKPiAK
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGlndC1k
ZXYgbWFpbGluZyBsaXN0Cj4gaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxp
c3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
