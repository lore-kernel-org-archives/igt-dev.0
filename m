Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC5376E23D
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Apr 2018 11:40:53 +0000 (UTC)
Date: Fri, 20 Apr 2018 13:40:51 +0200
From: Katarzyna Dec <katarzyna.dec@intel.com>
Message-ID: <20180420114051.GA31639@kdec5-desk.ger.corp.intel.com>
References: <20180420111528.14430-1-lukasz.kalamarz@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180420111528.14430-1-lukasz.kalamarz@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 1/4] lib/rendercopy_gen7:
 Reorganizing batch allocations
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
To: Lukasz Kalamarz <lukasz.kalamarz@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCBBcHIgMjAsIDIwMTggYXQgMDE6MTU6MjVQTSArMDIwMCwgTHVrYXN6IEthbGFtYXJ6
IHdyb3RlOgo+IFRoaXMgbGliIHdhcyB3cml0dGVuIGluIGEgZGlmZmVyZW50IG1hbm5lciB0aGFu
IGFsbCBvdGhlciBsaWJzLAo+IHdoaWNoIHdhcyBjYXVzaW5nIHNvbWUgaXNzdWVzIGR1cmluZyBy
ZWZhY3RvcmluZy4gUHJldmlvdXMKPiBpbXBsZW1lbnRhdGlvbiB3YXMgdXNpbmcgdHdvIHBvaW50
ZXJzIChwdHIgYW5kIHN0YXRlKSB0bwo+IGFjY2VzcyB0d28gcGFydHMgb2YgYmF0Y2hidWZmZXIg
aW4gdGhlIHNhbWUgdGltZS4gQ3VycmVudAo+IGltcGxlbWVudGF0aW9uIGlzIHJldXNpbmcgcHRy
IHdpdGggYSBkb3duc2lkZSBvZiBuZWVkaW5nCj4gdG8gZW5zdXJlIHRoZSBzdGF0ZS9jb21tYW5k
IG9yZGVyaW5nIGlzIHByb3Blci4KPiAKPiB2MzogTW9kaWZpZWQgY29tbWl0IG1lc3NhZ2UgYW5k
IGFkZGVkIGJhdGNoIGJvdW5kYXJ5IGNoZWNrCj4gCj4gU2lnbmVkLW9mZi1ieTogTHVrYXN6IEth
bGFtYXJ6IDxsdWthc3oua2FsYW1hcnpAaW50ZWwuY29tPgo+IENjOiBLYXRhcnp5bmEgRGVjIDxr
YXRhcnp5bmEuZGVjQGludGVsLmNvbT4KPiBDYzogUmFkb3NsYXcgU3p3aWNodGVuYmVyZyA8cmFk
b3NsYXcuc3p3aWNodGVuYmVyZ0BpbnRlbC5jb20+Cj4gQ2M6IERhbmllbGUgQ2VyYW9sbyBTcHVy
aW8gPGRhbmllbGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+CgpOaWNlIHdvcmsgOikKUmV2aWV3
ZWQtYnk6IEthdGFyenluYSBEZWMgPGthdGFyenluYS5kZWNAaW50ZWwuY29tPgpLYXNpYQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxp
bmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
