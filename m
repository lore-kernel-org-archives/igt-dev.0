Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9493D898AF
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2019 12:39:36 +0000 (UTC)
Date: Wed, 28 Aug 2019 15:39:34 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20190828123934.GB4019@platvala-desk.ger.corp.intel.com>
References: <20190816093426.10644-1-petri.latvala@intel.com>
 <20190816093426.10644-4-petri.latvala@intel.com>
 <20190828123309.sjza5vrgl4qvuvsp@ahiler-desk1.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190828123309.sjza5vrgl4qvuvsp@ahiler-desk1.fi.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 03/10] lib/tests: Test that igt_describe
 works with dynamic subtests
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBBdWcgMjgsIDIwMTkgYXQgMDM6MzM6MDlQTSArMDMwMCwgQXJrYWRpdXN6IEhpbGVy
IHdyb3RlOgo+IE9uIEZyaSwgQXVnIDE2LCAyMDE5IGF0IDEyOjM0OjE5UE0gKzAzMDAsIFBldHJp
IExhdHZhbGEgd3JvdGU6Cj4gPiBTaWduZWQtb2ZmLWJ5OiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5s
YXR2YWxhQGludGVsLmNvbT4KPiA+IC0tLQo+ID4gIGxpYi90ZXN0cy9pZ3RfZGVzY3JpYmUuYyB8
IDEyICsrKysrKysrKysrLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9saWIvdGVzdHMvaWd0X2Rlc2NyaWJl
LmMgYi9saWIvdGVzdHMvaWd0X2Rlc2NyaWJlLmMKPiA+IGluZGV4IDJlYTQ3ZTlkLi43MGVjMDU1
ZSAxMDA2NDQKPiA+IC0tLSBhL2xpYi90ZXN0cy9pZ3RfZGVzY3JpYmUuYwo+ID4gKysrIGIvbGli
L3Rlc3RzL2lndF9kZXNjcmliZS5jCj4gPiBAQCAtODcsNiArODcsMTMgQEAgc3RhdGljIHZvaWQg
ZmFrZV9tYWluKGludCBhcmdjLCBjaGFyICoqYXJndikgewo+ID4gIAlpZ3Rfc3VidGVzdCgiRiIp
Cj4gPiAgCQk7Cj4gPiAgCj4gPiArCWlndF9kZXNjcmliZSgiRHluYW1pYyBjb250YWluZXIiKTsK
PiA+ICsJaWd0X2R5bmFtaWNfc3VidGVzdF9jb250YWluZXIoIkciKSB7Cj4gPiArCQlwcmludGYo
InNob3VsZCBub3QgYmUgZXhlY3V0ZWQhXG4iKTsKPiAKPiA+ICsJCWlndF9keW5hbWljX3N1YnRl
c3QoInNob3VsZC1ub3QtbGlzdCIpCj4gCj4gSGF2ZSB5b3UgdGVzdGVkIHRoaXMgZm9yOgo+IAlp
Z3RfZGVzY3JpYmUoIkR5bmFtaWMgc3VidGVzdCIpOwo+ICAgICAgICAgaWd0X2R5bmFtaWNfc3Vi
dGVzdCgic2hvdWxkLW5vdC1saXN0Iikge30KPiAKPiAKPiBJIHRoaW5rIHRoaXMgaGFzIHBvdGVu
dGlhbCB0byBtZXNzIHVwIGZldyB0aGluZ3MgYW5kIHNob3VsZCBiZQo+IGRpc2FsbG93ZWQgd2l0
aCBhIGxvdWQgZXJyb3IgbWVzc2FnZS4KCgpZb3UgbWVhbiBzb21lb25lIGFjY2lkZW50YWxseSBj
YWxsaW5nIGlndF9kZXNjcmliZSBmb3IgYSBkeW5hbWljCnN1YnRlc3QsIGV4cGVjdGluZyBpdCB0
byBhcHBlYXIgaW4gZG9jcyBzb21ld2hlcmU/IFllYWggdGhhdCBzaG91bGQgYmUKZWFzeSwgY29t
aW5nIHVwIGluIG5leHQgcmV2aXNpb24uCgoKCi0tIApQZXRyaSBMYXR2YWxhCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0
CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
