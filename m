Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2F0D6E34C
 for <igt-dev@lists.freedesktop.org>; Sat,  9 Feb 2019 00:38:55 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20190209001146.14527-1-stuart.summers@intel.com>
 <154967167872.3378.7385053112541145477@skylake-alporthouse-com>
 <ac81230ae9739f4bf9439cdb7fa6797fa5da4625.camel@intel.com>
In-Reply-To: <ac81230ae9739f4bf9439cdb7fa6797fa5da4625.camel@intel.com>
Message-ID: <154967272535.3378.1009632833071667296@skylake-alporthouse-com>
Date: Sat, 09 Feb 2019 00:38:50 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] i915/query: Enable QUERY_TOPOLOGY_INFO
 for all gens
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
To: "Summers, Stuart" <stuart.summers@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBTdW1tZXJzLCBTdHVhcnQgKDIwMTktMDItMDkgMDA6MzI6MDYpCj4gT24gU2F0LCAy
MDE5LTAyLTA5IGF0IDAwOjIxICswMDAwLCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gPiBRdW90aW5n
IFN0dWFydCBTdW1tZXJzICgyMDE5LTAyLTA5IDAwOjExOjQ2KQo+ID4gPiBDdXJyZW50bHkgdGhl
IFFVRVJZX1RPUE9MT0dZX0lORk8gSU9DVEwgaXMgb25seSBiZWluZyB0ZXN0ZWQgb24KPiA+ID4g
aGFzd2VsbCwKPiA+ID4gYnJvYWR3ZWxsLCBza3lsYWtlLCBrYWJ5bGFrZSwgYW5kIGNvZmZlZWxh
a2UuCj4gPiAKPiA+IE5vLCBpdCdzIHRlc3RlZCBldmVyeXdoZXJlIGl0J3Mgc3VwcG9ydGVkIGFj
cm9zcyB0aGUgb3RoZXIgdGVzdHMuCj4gPiBPbmx5Cj4gPiB0aGlzIHBhcnRpY3VsYXIgdGVzdCBp
cyBza2lwcGVkIGlmIHRoZXJlIGlzIG5vIGhhcmRjb2RlZCB0cnV0aCB2YWx1ZQo+ID4gYXMgCj4g
PiBvbmx5IGEgc21hbGwgbnVtYmVyIG9mIGtub3duIHBjaS1pZHMgYXJlIHN1cHBsaWVkLgo+ID4g
Cj4gPiBTa2lwIGlzIHRoZSBtb3JlIGFjY3VyYXRlIHJlc3VsdCAoc2luY2UgdGhlIHRlc3QgaXMg
bm90IGRvaW5nCj4gPiBhbnl0aGluZyBpdAo+ID4gc2V0cyBvdXQgdG8gZG8sIGFuZCB0ZXN0cyBz
aG91bGQgYmUgcmVhc29uYWJseSBzdWNjaW5jdCksIGJ1dCB5b3UKPiA+IGNvdWxkCj4gPiBtb3Zl
IHRoZSBza2lwIGRvd24gaW50byB0aGUgc3dpdGNoKCkgc28gdGhhdCB3ZSBkb24ndCByZXBlYXQK
PiA+IG91cnNlbHZlcy4KPiAKPiBNeSByZWFzb25pbmcgZm9yIHJlbW92aW5nIHRoaXMgd2FzIHRv
IGV4ZXJjaXNlIHRoZSBhc3NlcnRzIHdlIGFyZQo+IGNhbGxpbmcgd2l0aGluIGk5MTVfcXVlcnlf
aXRlbXMoKSBmb3IgdGhvc2UgcGxhdGZvcm1zIHdoaWNoIGRvIG5vdAo+IGltcGxlbWVudCBkZXZf
aW5mby0+Z3QuIFNvIHdlIGFyZSBjaGVja2luZyBzb21ldGhpbmcgaGVyZSwgZXZlbiBpZiBpdAo+
IGRvZXNuJ3Qgc3BlY2lmaWNhbGx5IGFuYWx5emUgdGhlIHNsaWNlcy9zdWJzbGljZXMgZm9yIGVh
Y2ggcGxhdGZvcm0uCgpCdXQgdGhleSBhcmUgYWxyZWFkeSBjb3ZlcmVkLiBUaGlzIHRlc3QgaXMg
dmVyeSBzcGVjaWZpY2FsbHkgYWJvdXQKY29tcGFyaW5nIHRoZSByZXBvcnRlZCB0b3BvbG9neSBm
b3IgYSBzbWFsbCBzZXQgb2Yga25vd24gdG9wb2xvZ2llcyBhbmQKdmVyaWZ5aW5nIHRoZXkgbWF0
Y2guCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
