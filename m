Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
Date: Tue, 2 Oct 2018 14:53:38 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20181002115338.GD17124@platvala-desk.ger.corp.intel.com>
References: <20181002112601.9981-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181002112601.9981-1-chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [PATCH i-g-t] igt/kms_busy: Flush request queue
 when re-enabling hangcheck
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBPY3QgMDIsIDIwMTggYXQgMTI6MjY6MDFQTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IEVuYWJsaW5nIGhhbmdjaGVjayBvbmx5IHRha2VzIGVmZmVjdCBhdCB0aGUgc3RhcnQg
b2YgYSBuZXcgcmVxdWVzdAo+IHF1ZXVlLiBCZWZvcmUgd2UgcmUtZW5hYmxlIGhhbmdjaGVjayBh
ZnRlciBvdXIgcG9raW5nIGFyb3VuZCwgd2UKPiB0aGVyZWZvcmUgbmVlZCB0byB3YWl0IHVudGls
IHRoZSBncHUgaXMgaWRsZSBvdGhlcndpc2UgdGhlIG5leHQgdGVzdAo+IHdpbGwgc3RhcnQgd2l0
aG91dCBoYW5nY2hlY2sgYW5kIHN1YnNlcXVlbnRseSBoYW5nIGZvcmV2ZXIuCj4gCj4gU2lnbmVk
LW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gQ2M6IFBl
dHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgoKClRlc3RlZC1ieTogUGV0cmkg
TGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+ClJldmlld2VkLWJ5OiBQZXRyaSBMYXR2
YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4KCgo+IC0tLQo+ICB0ZXN0cy9rbXNfYnVzeS5j
IHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQg
YS90ZXN0cy9rbXNfYnVzeS5jIGIvdGVzdHMva21zX2J1c3kuYwo+IGluZGV4IGQ4MjFlYzcxMS4u
ZWQzY2FhZTRjIDEwMDY0NAo+IC0tLSBhL3Rlc3RzL2ttc19idXN5LmMKPiArKysgYi90ZXN0cy9r
bXNfYnVzeS5jCj4gQEAgLTEzOCw2ICsxMzgsNyBAQCBzdGF0aWMgdm9pZCBmbGlwX3RvX2ZiKGln
dF9kaXNwbGF5X3QgKmRweSwgaW50IHBpcGUsCj4gIAlpZ3RfYXNzZXJ0KHBvbGwoJnBmZCwgMSwg
MCkgPT0gMCk7Cj4gIAo+ICAJaWYgKG1vZGVzZXQpIHsKPiArCQlnZW1fcXVpZXNjZW50X2dwdShk
cHktPmRybV9mZCk7Cj4gIAkJaWd0X3NldF9tb2R1bGVfcGFyYW1faW50KCJlbmFibGVfaGFuZ2No
ZWNrIiwgMSk7Cj4gIAo+ICAJCS8qIENsZWFyIG9sZCBtb2RlIGJsb2IuICovCj4gLS0gCj4gMi4x
OS4wCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCklu
dGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
