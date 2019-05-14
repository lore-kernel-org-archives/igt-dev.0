Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A37892D2
 for <igt-dev@lists.freedesktop.org>; Tue, 14 May 2019 12:29:43 +0000 (UTC)
Date: Tue, 14 May 2019 15:29:40 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20190514122940.GX24299@intel.com>
References: <20190513141125.7902-1-simon.ser@intel.com>
 <20190513162547.GQ24299@intel.com>
 <ecff393779042cb7c91eb5eaee797d5870c3126e.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ecff393779042cb7c91eb5eaee797d5870c3126e.camel@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_audio: normalize samples when
 extracting channel
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
To: "Ser, Simon" <simon.ser@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMDY6MzI6NThBTSArMDAwMCwgU2VyLCBTaW1vbiB3cm90
ZToKPiBPbiBNb24sIDIwMTktMDUtMTMgYXQgMTk6MjUgKzAzMDAsIFZpbGxlIFN5cmrDpGzDpCB3
cm90ZToKPiA+ID4gLQkJZHN0W2ldID0gKGRvdWJsZSkgc3JjW2kgKiBuX2NoYW5uZWxzICsgY2hh
bm5lbF07Cj4gPiA+ICsJCWRzdFtpXSA9IChkb3VibGUpIHNyY1tpICogbl9jaGFubmVscyArIGNo
YW5uZWxdIC8gSU5UMzJfTUFYOwo+ID4gCj4gPiBEbyB3ZSBjYXJlIHRoYXQgdGhlIG1vc3QgbmVn
YXRpdmUgdmFsdWUgY291bGQgcmVzdWx0Cj4gPiBpbiBhIG5vcm1hbGl6ZWQgdmFsdWUgPCAtMS4w
Pwo+IAo+IEFoLCBnb29kIHBvaW50Lgo+IAo+IEknZCBiZSB0ZW1wdGVkIG5vdCB0byBjYXJlLiBU
aGVzZSB2YWx1ZXMgYXJlIGp1c3QgdXNlZCB0byBjb21wYXJlIHRoZQo+IGFtcGxpdHVkZSBvZiB0
aGUgc2lnbmFsIHdlIHNlbmQgdG8gdGhlIGFtcGxpdHVkZSBvZiB0aGUgc2lnbmFsIHdlCj4gcmVj
ZWl2ZS4KPiAKPiBIb3dldmVyIEkgYWdyZWUgdGhpcyBjb3VsZCBiZSB1bmV4cGVjdGVkLCBlc3Bl
Y2lhbGx5IGlmIHNvbWVvbmUgdXNlcwo+IHRoZXNlIHZhbHVlcyBmb3IgYW5vdGhlciBnb2FsLiBJ
ZiB3ZSB3YW50ZWQgdG8gZml4IGl0LCB3b3VsZAo+IC0oZG91YmxlKUlOVDMyX01JTiBiZSBlbm91
Z2g/IChkb3VibGUgY2FuIHJlcHJlc2VudCBleGFjdCBpbnRlZ2VycyB1cAo+IHRvIDJeNTMgLSAx
KQoKV2hhdGV2ZXIgd29ya3MgZm9yIHlvdS4KCkVpdGhlciB3YXkKUmV2aWV3ZWQtYnk6IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+CgotLSAKVmlsbGUgU3ly
asOkbMOkCkludGVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
