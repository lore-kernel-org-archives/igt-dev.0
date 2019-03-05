Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B158857E
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Mar 2019 13:03:03 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190305125501.GI4038@platvala-desk.ger.corp.intel.com>
References: <20190207133652.5346-1-petri.latvala@intel.com>
 <20190207140212.GH20097@intel.com>
 <20190305125501.GI4038@platvala-desk.ger.corp.intel.com>
Message-ID: <155179097330.27405.360411089761673148@skylake-alporthouse-com>
Date: Tue, 05 Mar 2019 13:02:58 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_flip: Fix comparison of
 unsigned integers
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
To: Petri Latvala <petri.latvala@intel.com>, =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBQZXRyaSBMYXR2YWxhICgyMDE5LTAzLTA1IDEyOjU1OjAxKQo+IE9uIFRodSwgRmVi
IDA3LCAyMDE5IGF0IDA0OjAyOjEyUE0gKzAyMDAsIFZpbGxlIFN5cmrDpGzDpCB3cm90ZToKPiA+
IE9uIFRodSwgRmViIDA3LCAyMDE5IGF0IDAzOjM2OjUyUE0gKzAyMDAsIFBldHJpIExhdHZhbGEg
d3JvdGU6Cj4gPiA+IERpZmZlcmVuY2Ugb2YgdW5zaWduZWQgaW50cyBpcyB1bnNpZ25lZCBpbnQs
IGFuZCB0aGVyZWZvcmUgYWx3YXlzCj4gPiA+IGxhcmdlciB0aGFuIHplcm8uCj4gPiA+IAo+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4K
PiA+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gPiA+IC0t
LQo+ID4gPiAgdGVzdHMva21zX2ZsaXAuYyB8IDIgKy0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL3Rl
c3RzL2ttc19mbGlwLmMgYi90ZXN0cy9rbXNfZmxpcC5jCj4gPiA+IGluZGV4IDc5OGZjNGU4Li45
NmY0YTJmNyAxMDA3NTUKPiA+ID4gLS0tIGEvdGVzdHMva21zX2ZsaXAuYwo+ID4gPiArKysgYi90
ZXN0cy9rbXNfZmxpcC5jCj4gPiA+IEBAIC01MDIsNyArNTAyLDcgQEAgc3RhdGljIHZvaWQgY2hl
Y2tfc3RhdGUoY29uc3Qgc3RydWN0IHRlc3Rfb3V0cHV0ICpvLCBjb25zdCBzdHJ1Y3QgZXZlbnRf
c3RhdGUgKmUKPiA+ID4gICAgIGlmIChvLT5mbGFncyAmIFRFU1RfVFNfQ09OVCkgewo+ID4gPiAg
ICAgICAgICAgICAvKiBJZ25vcmUgc2VxX3N0ZXAgaGVyZSBzaW5jZSB2Ymxhbmsgd2FpdHMgdGlt
ZSBvdXQgaW1tZWRpYXRlbHkKPiA+ID4gICAgICAgICAgICAgICogd2hlbiB3ZSBraWxsIHRoZSBj
cnRjLiAqLwo+ID4gPiAtICAgICAgICAgICBpZ3RfYXNzZXJ0X2YoZXMtPmN1cnJlbnRfc2VxIC0g
ZXMtPmxhc3Rfc2VxID49IDAsCj4gPiA+ICsgICAgICAgICAgIGlndF9hc3NlcnRfZihlcy0+Y3Vy
cmVudF9zZXEgPj0gZXMtPmxhc3Rfc2VxLAo+ID4gCj4gPiBUaGF0IHdvbid0IGhhbmRsZSB3cmFw
YXJvdW5kLgo+IAo+IEFyZSB5b3UgcmVmZXJyaW5nIHRvIHNvbWV0aGluZyBvdGhlciB0aGFuIHRo
ZSBjaGVja2VkIG92ZXJmbG93PyBPciBpbgo+IG90aGVyIHdvcmRzLCBhcmUgeW91IG9iamVjdGlu
ZyB0byB0aGlzIHBhdGNoPwoKLyogYSBpcyBsYXRlciB0aGFuIGIgKi8Kc3RhdGljIGJvb2wgc2Vx
bm9fbGF0ZXIodTMyIGEsIHUzMiBiKSB7IHJldHVybiAoczMyKShhIC0gYikgPj0gMDsgfQotQ2hy
aXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRl
diBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
