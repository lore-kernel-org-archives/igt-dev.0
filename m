Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF2016E070
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Mar 2019 11:17:32 +0000 (UTC)
Date: Wed, 6 Mar 2019 13:17:29 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20190306111729.GJ4038@platvala-desk.ger.corp.intel.com>
References: <20190207133652.5346-1-petri.latvala@intel.com>
 <20190207140212.GH20097@intel.com>
 <20190305125501.GI4038@platvala-desk.ger.corp.intel.com>
 <155179097330.27405.360411089761673148@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <155179097330.27405.360411089761673148@skylake-alporthouse-com>
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBNYXIgMDUsIDIwMTkgYXQgMDE6MDI6NThQTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFF1b3RpbmcgUGV0cmkgTGF0dmFsYSAoMjAxOS0wMy0wNSAxMjo1NTowMSkKPiA+IE9u
IFRodSwgRmViIDA3LCAyMDE5IGF0IDA0OjAyOjEyUE0gKzAyMDAsIFZpbGxlIFN5cmrDpGzDpCB3
cm90ZToKPiA+ID4gT24gVGh1LCBGZWIgMDcsIDIwMTkgYXQgMDM6MzY6NTJQTSArMDIwMCwgUGV0
cmkgTGF0dmFsYSB3cm90ZToKPiA+ID4gPiBEaWZmZXJlbmNlIG9mIHVuc2lnbmVkIGludHMgaXMg
dW5zaWduZWQgaW50LCBhbmQgdGhlcmVmb3JlIGFsd2F5cwo+ID4gPiA+IGxhcmdlciB0aGFuIHpl
cm8uCj4gPiA+ID4gCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogUGV0cmkgTGF0dmFsYSA8cGV0cmku
bGF0dmFsYUBpbnRlbC5jb20+Cj4gPiA+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAZmZ3bGwuY2g+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIHRlc3RzL2ttc19mbGlwLmMgfCAyICst
Cj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
ID4gPiA+IAo+ID4gPiA+IGRpZmYgLS1naXQgYS90ZXN0cy9rbXNfZmxpcC5jIGIvdGVzdHMva21z
X2ZsaXAuYwo+ID4gPiA+IGluZGV4IDc5OGZjNGU4Li45NmY0YTJmNyAxMDA3NTUKPiA+ID4gPiAt
LS0gYS90ZXN0cy9rbXNfZmxpcC5jCj4gPiA+ID4gKysrIGIvdGVzdHMva21zX2ZsaXAuYwo+ID4g
PiA+IEBAIC01MDIsNyArNTAyLDcgQEAgc3RhdGljIHZvaWQgY2hlY2tfc3RhdGUoY29uc3Qgc3Ry
dWN0IHRlc3Rfb3V0cHV0ICpvLCBjb25zdCBzdHJ1Y3QgZXZlbnRfc3RhdGUgKmUKPiA+ID4gPiAg
ICAgaWYgKG8tPmZsYWdzICYgVEVTVF9UU19DT05UKSB7Cj4gPiA+ID4gICAgICAgICAgICAgLyog
SWdub3JlIHNlcV9zdGVwIGhlcmUgc2luY2UgdmJsYW5rIHdhaXRzIHRpbWUgb3V0IGltbWVkaWF0
ZWx5Cj4gPiA+ID4gICAgICAgICAgICAgICogd2hlbiB3ZSBraWxsIHRoZSBjcnRjLiAqLwo+ID4g
PiA+IC0gICAgICAgICAgIGlndF9hc3NlcnRfZihlcy0+Y3VycmVudF9zZXEgLSBlcy0+bGFzdF9z
ZXEgPj0gMCwKPiA+ID4gPiArICAgICAgICAgICBpZ3RfYXNzZXJ0X2YoZXMtPmN1cnJlbnRfc2Vx
ID49IGVzLT5sYXN0X3NlcSwKPiA+ID4gCj4gPiA+IFRoYXQgd29uJ3QgaGFuZGxlIHdyYXBhcm91
bmQuCj4gPiAKPiA+IEFyZSB5b3UgcmVmZXJyaW5nIHRvIHNvbWV0aGluZyBvdGhlciB0aGFuIHRo
ZSBjaGVja2VkIG92ZXJmbG93PyBPciBpbgo+ID4gb3RoZXIgd29yZHMsIGFyZSB5b3Ugb2JqZWN0
aW5nIHRvIHRoaXMgcGF0Y2g/Cj4gCj4gLyogYSBpcyBsYXRlciB0aGFuIGIgKi8KPiBzdGF0aWMg
Ym9vbCBzZXFub19sYXRlcih1MzIgYSwgdTMyIGIpIHsgcmV0dXJuIChzMzIpKGEgLSBiKSA+PSAw
OyB9CgoKSSBzZWUgbm93ISBNeSBtZW50YWwgZ3ltbmFzdGljcyBmYWlsZWQgdG8gcHJvY2VzcyB0
aGUgY29tYmluZWQKb3ZlcmZsb3dzIGFuZCB0aGUgdHlwZSBjb252ZXJzaW9uLCBhbmQgaG93IHRo
YXQgbGVhZHMgdG8gY29ycmVjdApyZXN1bHRzIGJ1dCBzb21lIHF1aWNrIHRlc3RpbmcgbWFkZSBt
ZSBzZWUgdGhlIHRydXRoLgoKQWx0aG91Z2ggaXQgbWlnaHQgYmUgbW9vdCBhbnl3YXkgaWYgd2Ug
ZW5kIHVwIHJlbW92aW5nIHRoaXMgY29kZQphbHRvZ2V0aGVyLgoKCi0tIApQZXRyaSBMYXR2YWxh
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYg
bWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
