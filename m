Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C306E228
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2020 07:51:53 +0000 (UTC)
From: Jani Nikula <jani.nikula@linux.intel.com>
In-Reply-To: <20200306125002.21316-1-ville.syrjala@linux.intel.com>
References: <20200306125002.21316-1-ville.syrjala@linux.intel.com>
Date: Mon, 09 Mar 2020 09:52:03 +0200
Message-ID: <87wo7um0d8.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/4] tools/intel_reg: Simplify negative
 ports
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
To: Ville Syrjala <ville.syrjala@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCAwNiBNYXIgMjAyMCwgVmlsbGUgU3lyamFsYSA8dmlsbGUuc3lyamFsYUBsaW51eC5p
bnRlbC5jb20+IHdyb3RlOgo+IEZyb206IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBs
aW51eC5pbnRlbC5jb20+Cj4KPiBMZXQncyBhdm9pZCBoYXZpbmcgdG8gdHlwZSBpbiB0aGUgZXhw
bGljaXQgbmVnYXRpdmUgdmFsdWUgZm9yCj4gYWxsIHRoZSBwb3J0IGVudW1zLgo+Cj4gU2lnbmVk
LW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4K
PiAtLS0KPiAgdG9vbHMvaW50ZWxfcmVnX3NwZWMuaCB8IDcgKysrKy0tLQo+ICAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3Rv
b2xzL2ludGVsX3JlZ19zcGVjLmggYi90b29scy9pbnRlbF9yZWdfc3BlYy5oCj4gaW5kZXggYzk0
YzYxYmFiM2Y4Li5hNmUwNTE0Mzg3ZGYgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvaW50ZWxfcmVnX3Nw
ZWMuaAo+ICsrKyBiL3Rvb2xzL2ludGVsX3JlZ19zcGVjLmgKPiBAQCAtMjUsMTAgKzI1LDExIEBA
Cj4gICNkZWZpbmUgX19JTlRFTF9SRUdfU1BFQ19IX18KPiAgCgpNaWdodCBjb3B5LXBhc3RlIHRo
aXMgY29tbWVudAoKLyogTmVnYXRpdmUgcG9ydCBudW1iZXJzIGFyZSBub3QgcmVhbCBzaWRlYmFu
ZCBwb3J0cy4gKi8KCmZyb20gaW50ZWxfcmVnLmMgc29tZXdoZXJlIGhlcmUuCgpSZXZpZXdlZC1i
eTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4KCj4gIGVudW0gcG9ydF9hZGRy
IHsKPiArCVBPUlRfTU1JTyA9IC0xMjcsCj4gKwlQT1JUX1BPUlRJT19WR0EsCS8qIHNlZSB2Z2Eg
cmVnIHJlYWQvd3JpdGUgKi8KPiArCVBPUlRfTU1JT19WR0EsCQkvKiBzZWUgdmdhIHJlZyByZWFk
L3dyaXRlICovCj4gKwo+ICAJUE9SVF9OT05FID0gMCwKPiAtCVBPUlRfTU1JTyA9IC0xLAo+IC0J
UE9SVF9QT1JUSU9fVkdBID0gLTIsCS8qIHNlZSB2Z2EgcmVnIHJlYWQvd3JpdGUgKi8KPiAtCVBP
UlRfTU1JT19WR0EgPSAtMywJLyogc2VlIHZnYSByZWcgcmVhZC93cml0ZSAqLwo+ICAKPiAgCS8q
IHZsdiAqLwo+ICAJUE9SVF9CVU5JVCA9IDB4MDMsCgotLSAKSmFuaSBOaWt1bGEsIEludGVsIE9w
ZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2lndC1kZXYK
