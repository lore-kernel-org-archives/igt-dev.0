Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD136E061
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Nov 2019 05:50:40 +0000 (UTC)
Date: Thu, 14 Nov 2019 21:50:39 -0800
From: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
Message-ID: <20191115055039.kejofheehfamcptd@vrkonda-desk.ra.intel.com>
References: <20191115053326.1854697-1-vanshidhar.r.konda@intel.com>
 <20191115053326.1854697-2-vanshidhar.r.konda@intel.com>
 <87zhgxpuf3.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87zhgxpuf3.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH 1/2] lib/ioctl_wrappers: Query if device
 supports set/get legacy tiling
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
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org, brian.welty@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBOb3YgMTQsIDIwMTkgYXQgMDk6NDI6MjRQTSAtMDgwMCwgRGl4aXQsIEFzaHV0b3No
IHdyb3RlOgo+T24gVGh1LCAxNCBOb3YgMjAxOSAyMTozMzoyNSAtMDgwMCwgVmFuc2hpZGhhciBL
b25kYSB3cm90ZToKPj4KPj4gQWRkIGEgbWV0aG9kIHRvIHF1ZXJ5IGlmIHRoZSBkZXZpY2Ugc3Vw
cG9ydHMgc2V0dGluZyBhbmQKPj4gZ2V0dGluZyBsZWdhY3kgdGlsaW5nIGZvcm1hdHMgZm9yIGJ1
ZmZlciBvYmplY3RzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBWYW5zaGlkaGFyIEtvbmRhIDx2YW5z
aGlkaGFyLnIua29uZGFAaW50ZWwuY29tPgo+PiAtLS0KPj4gIGxpYi9pb2N0bF93cmFwcGVycy5j
IHwgMTYgKysrKysrKysrKysrKysrKwo+PiAgbGliL2lvY3RsX3dyYXBwZXJzLmggfCAgMSArCj4+
ICAyIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2xp
Yi9pb2N0bF93cmFwcGVycy5jIGIvbGliL2lvY3RsX3dyYXBwZXJzLmMKPj4gaW5kZXggNjI4Zjhi
ODMuLjgzN2VmMmNmIDEwMDY0NAo+PiAtLS0gYS9saWIvaW9jdGxfd3JhcHBlcnMuYwo+PiArKysg
Yi9saWIvaW9jdGxfd3JhcHBlcnMuYwo+PiBAQCAtMTMzLDYgKzEzMywyMiBAQCBfX2dlbV9nZXRf
dGlsaW5nKGludCBmZCwgc3RydWN0IGRybV9pOTE1X2dlbV9nZXRfdGlsaW5nICphcmcpCj4+CXJl
dHVybiBlcnI7Cj4+ICB9Cj4+Cj4+ICsvKioKPj4gKyAqIGdlbV9oYXNfbGVnYWN5X2h3X3RpbGlu
ZzoKPj4gKyAqIEBmZDogb3BlbiBpOTE1IGRybSBmaWxlIGRlc2NyaXB0b3IKPj4gKyAqCj4+ICsg
KiBGZWF0dXJlIGNoZWNrIHRvIHF1ZXJ5IGlmIHRoZSBkZXZpY2Ugc3VwcG9ydHMgc2V0dGluZy9n
ZXR0aW5nCj4+ICsgKiBsZWdhY3kgdGlsaW5nIGZvcm1hdHMgZm9yIGJ1ZmZlciBvYmplY3RzCj4+
ICsgKgo+PiArICogUmV0dXJuczogVHJ1ZSBpZiB0aWxpbmcgaXMgc3VwcG9ydGVkCj4+ICsgKi8K
Pj4gK2Jvb2wKPj4gK2dlbV9oYXNfbGVnYWN5X2h3X3RpbGluZyhpbnQgZmQpCj4+ICt7Cj4+ICsJ
c3RydWN0IGRybV9pOTE1X2dlbV9nZXRfdGlsaW5nIGFyZyA9IHt9Owo+PiArCXJldHVybiAoX19n
ZW1fZ2V0X3RpbGluZyhmZCwgJmFyZykgIT0gLUVPUE5PVFNVUFApOwo+Cj5Qcm9iYWJseSBqdXN0
Cj4KPglyZXR1cm4gIV9fZ2VtX2dldF90aWxpbmcoZmQsICZhcmcpOwoKTm8uIE9ubHkgdGhpcyBz
cGVjaWZpYyBlcnJvciBtZWFucyBpdCBpcyBub3Qgc3VwcG9ydGVkIGJ5IHRoZSBoYXJkd2FyZS4K
T3RoZXIgZXJyb3JzIGNvdWxkIG1lYW4gdGhhdCBJIG1hZGUgYSBtaXN0YWtlIHdpdGggdGhlIGFy
Z3VtZW50cyAtIEkndmUKbm90IHNldCB0aGVtIHRvIHZhbGlkIHZhbHVlcy4KClZhbnNoaQoKPgo+
VGhhdCBpcywgbm8gbmVlZCB0byBjaGVjayBmb3Igc3BlY2lmaWMgZXJyb3IgY29kZT8KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5n
IGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
