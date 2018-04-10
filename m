Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC4889DFA
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Apr 2018 16:23:28 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <0f92bbea-b528-5b58-1ada-27ccc305e178@intel.com>
References: <20180410122043.22021-1-chris@chris-wilson.co.uk>
 <0f92bbea-b528-5b58-1ada-27ccc305e178@intel.com>
Message-ID: <152337739736.6405.4492010243419461289@mail.alporthouse.com>
Date: Tue, 10 Apr 2018 17:23:17 +0100
Subject: Re: [igt-dev] [PATCH igt] lib: Dump meminfo and slabinfo if we
 complain about insufficient memory
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
To: Antonio Argenziano <antonio.argenziano@intel.com>, igt-dev@lists.freedesktop.org
Cc: Tomi Sarvela <tomi.p.sarvela@intel.com>, Martin Peres <martin.peres@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBbnRvbmlvIEFyZ2Vuemlhbm8gKDIwMTgtMDQtMTAgMTc6MDA6NTIpCj4gCj4gCj4g
T24gMTAvMDQvMTggMDU6MjAsIENocmlzIFdpbHNvbiB3cm90ZToKPiA+IEFsbCB0b28gZnJlcXVl
bnRseSwgd2UgZmFpbCBvdXIgbWVtb3J5IGNoZWNrcyB0byBhIGxlYWsgaW4gdGhlIGRyaXZlci4K
PiA+IFdoaWxlIHdlIGdpdmUgZXZlcnkgb3Bwb3J0dW5pdHkgZm9yIHRoZSBkcml2ZXIgdG8gcmVs
ZWFzZSB0aGUgbWVtb3J5Cj4gPiBiZWZvcmUgd2UgZmFpbCwgaWYgd2UgZG8gZHVtcCB0aGUgbWVt
aW5mbyBhbmQgc2xhYmluZm8sIGlmIGF2YWlsYWJsZSwgc28KPiA+IHdlIGNhbiBhc3NpZ24gYmxh
bWVeV15XIHJlc29sdmUgdGhlIHByb2JsZW0gcXVpY2tseS4KPiA+IAo+ID4gUmVmZXJlbmNlczog
aHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTA1OTY3Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiA+
IENjOiBNYXJ0aW4gUGVyZXMgPG1hcnRpbi5wZXJlc0BsaW51eC5pbnRlbC5jb20+Cj4gPiBDYzog
VG9taSBTYXJ2ZWxhIDx0b21pLnAuc2FydmVsYUBpbnRlbC5jb20+Cj4gPiAtLS0KPiA+ICAgbGli
L2ludGVsX29zLmMgfCAyOCArKysrKysrKysrKysrKysrKysrKysrKysrKy0tCj4gPiAgIDEgZmls
ZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZm
IC0tZ2l0IGEvbGliL2ludGVsX29zLmMgYi9saWIvaW50ZWxfb3MuYwo+ID4gaW5kZXggYmIyYzE2
YmYuLmYwZjI4NzJiIDEwMDY0NAo+ID4gLS0tIGEvbGliL2ludGVsX29zLmMKPiA+ICsrKyBiL2xp
Yi9pbnRlbF9vcy5jCj4gPiBAQCAtNTEsNiArNTEsNyBAQAo+ID4gICAjaW5jbHVkZSAiZHJtdGVz
dC5oIgo+ID4gICAjaW5jbHVkZSAiaWd0X2F1eC5oIgo+ID4gICAjaW5jbHVkZSAiaWd0X2RlYnVn
ZnMuaCIKPiA+ICsjaW5jbHVkZSAiaWd0X3N5c2ZzLmgiCj4gPiAgIAo+ID4gICAvKioKPiA+ICAg
ICogaW50ZWxfZ2V0X3RvdGFsX3JhbV9tYjoKPiA+IEBAIC0yODAsOSArMjgxLDMyIEBAIGludCBf
X2ludGVsX2NoZWNrX21lbW9yeSh1aW50NjRfdCBjb3VudCwgdWludDY0X3Qgc2l6ZSwgdW5zaWdu
ZWQgbW9kZSwKPiA+ICAgdm9pZCBpbnRlbF9yZXF1aXJlX21lbW9yeSh1aW50NjRfdCBjb3VudCwg
dWludDY0X3Qgc2l6ZSwgdW5zaWduZWQgbW9kZSkKPiA+ICAgewo+ID4gICAgICAgdWludDY0X3Qg
cmVxdWlyZWQsIHRvdGFsOwo+ID4gKyAgICAgYm9vbCBzdWZmaWNpZW50X21lbW9yeTsKPiA+ICsK
PiA+ICsgICAgIHN1ZmZpY2llbnRfbWVtb3J5ID0gX19pbnRlbF9jaGVja19tZW1vcnkoY291bnQs
IHNpemUsIG1vZGUsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICZyZXF1aXJlZCwgJnRvdGFsKTsKPiA+ICsgICAgIGlmICghc3VmZmljaWVudF9tZW1v
cnkpIHsKPiA+ICsgICAgICAgICAgICAgaW50IGRpciA9IG9wZW4oIi9wcm9jIiwgT19SRE9OTFkp
Owo+IAo+IE5vIGVhcmx5IGV4aXQgb24gZGlyIDwgMD8KCkl0IGZhbGxzIHRocm91Z2ggcmV0dXJu
aW5nIGluZm8gPSBOVUxMIGFuZCBhIG5vLW9wIG9uIGNsb3NlKC0xKS4KLUNocmlzCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
