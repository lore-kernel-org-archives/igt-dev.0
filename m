Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA646E3C1
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Apr 2018 10:35:05 +0000 (UTC)
Date: Tue, 10 Apr 2018 12:35:03 +0200
From: Katarzyna Dec <katarzyna.dec@intel.com>
Message-ID: <20180410103503.GC23949@kdec5-desk.ger.corp.intel.com>
References: <20180409154229.678-1-lukasz.kalamarz@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180409154229.678-1-lukasz.kalamarz@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/gen6_render: Refactoring lib
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCBBcHIgMDksIDIwMTggYXQgMDU6NDI6MjlQTSArMDIwMCwgTHVrYXN6IEthbGFtYXJ6
IHdyb3RlOgo+IFRoaXMgcGF0Y2ggaXMgc3RhcnRpbmcgYSBzZXJpZXMgb2YgcmVmYWN0b3Jpbmcg
Y2hhbmdlcyBmb3IgKnJlbmRlcioKPiBsaWJzLiBBIGxvdCBvZiBjb2RlIGluIHRob3NlIGxpYnJh
cmllcyBpcyBjb3B5L3Bhc3RlZCBhbmQgcmVuYW1lZCBmb3IKPiBkaWZmZXJlbnQgZ2VuLgo+IAo+
IENoYW5nZXMgbWFkZSBpbiB0aGlzIHBhdGNoOgo+IC0gcmVtb3ZhbCBvZiBkdXBsaWNhdGVkIHJl
Z2lzdGVycyBkZWZpbml0aW9ucwo+IC0gbW92ZSBmaWVsZCBkZWZpbml0aW9ucyBhYm92ZSBpdCBy
ZWdpc3RlciBkZWZpbml0aW9uCj4gLSBtb3ZlIGRlZmluaXRpb25zIG9mIHJlZ2lzdGVyIGludG8g
YXNjZW5kaW5nIG9yZGVyCj4gLSB1bmlmeSBzcGFjZXMgYmV0d2VlbiByZWdpc3RlciBuYW1lIGFu
ZCBpdCdzIGFkZHJlc3MvdmFsdWUKPiAKPiBTaWduZWQtb2ZmLWJ5OiBMdWthc3ogS2FsYW1hcnog
PGx1a2Fzei5rYWxhbWFyekBpbnRlbC5jb20+Cj4gQ2M6IEthdGFyenluYSBEZWMgPGthdGFyenlu
YS5kZWNAaW50ZWwuY29tPgo+IENjOiBEYW5pZWxlIENlcmFvbG8gU3B1cmlvIDxkYW5pZWxlLmNl
cmFvbG9zcHVyaW9AaW50ZWwuY29tPgoKPiArI2RlZmluZSBHRU42X1JFR0lTVEVSX1RZUEVfVUIJ
CQk0Cj4gKyNkZWZpbmUgR0VONl9SRUdJU1RFUl9UWVBFX0IJCQk1Cj4gKyNkZWZpbmUgR0VONl9S
RUdJU1RFUl9UWVBFX1ZGCQkJNQkvKiBwYWNrZWQgZmxvYXQgdmVjdG9yLCBpbW1lZGlhdGVzIG9u
bHk/ICovCj4gKyNkZWZpbmUgR0VONl9SRUdJU1RFUl9UWVBFX0hGCQkJNgo+ICsjZGVmaW5lIEdF
TjZfUkVHSVNURVJfVFlQRV9WCQkJNgkvKiBwYWNrZWQgaW50IHZlY3RvciwgaW1tZWRpYXRlcyBv
bmx5LCB1d29yZCBkZXN0IG9ubHkgKi8KPiArI2RlZmluZSBHRU42X1JFR0lTVEVSX1RZUEVfRgkJ
CTcKPgpHZW5lcmFsbHkgbG9va3MgZ29vZC4gVGhlcmUgYXJlIGZldyBzdHlsZSBpc3N1ZXM6IHRv
byBsb25nIGxpbmVzIChsaWtlIHRoZSBvbmUgYWJvdmUpLAptaXhlZCB0YWJzIGFuZCBzcGFjZXMs
IGV0Yy4gVXNlIGNoZWNrcGF0Y2ggZm9yIHNlZSB3aGF0IG5lZWRzIHRvIGJlIGNoYW5nZWQuCkkg
dGhpbmsgdGhhdCB0aGlzIGNoYW5nZXMgY2FuIGJlIGludHJvZHVjZWQgaW4gYW5vdGhlciBwYXRj
aCwgc28gaXQgd2lsbCBiZSBlYXNpZXIKdG8gcmV2aWV3LgoKS2FzaWEKPiAtLSAKPiAyLjkuNQo+
IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2
IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
