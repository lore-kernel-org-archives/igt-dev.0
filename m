Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80C2F89F49
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2019 16:26:28 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <cover.1552406927.git.neel.desai@intel.com>
 <155240771051.30003.10146753749050856630@skylake-alporthouse-com>
In-Reply-To: <155240771051.30003.10146753749050856630@skylake-alporthouse-com>
Message-ID: <155240797836.30003.8545594115374095404@skylake-alporthouse-com>
Date: Tue, 12 Mar 2019 16:26:18 +0000
Subject: Re: [igt-dev] [PATCH v2 0/1] Skip 2x-cursor-vs-flip subtests for
 gen > 9
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
To: Neel Desai <neel.desai@intel.com>, igt-dev@lists.freedesktop.org, maarten.lankhorst@linux.intel.com, sudeep.dutt@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMTktMDMtMTIgMTY6MjE6NTUpCj4gUXVvdGluZyBOZWVs
IERlc2FpICgyMDE5LTAzLTEyIDE2OjEyOjQzKQo+ID4gU2tpcCB0aGUgZm9sbG93aW5nIGZvciBn
ZW4gPiA5Cj4gPiAKPiA+IDEuKSB0ZXN0cy9rbXNfY3Vyc29yX2xlZ2FjeUAyeC1jdXJzb3ItdnMt
ZmxpcC1hdG9taWMKPiA+IDIuKSB0ZXN0cy9rbXNfY3Vyc29yX2xlZ2FjeUAyeC1jdXJzb3ItdnMt
ZmxpcC1sZWdhY3kKPiA+IDMuKSB0ZXN0cy9rbXNfY3Vyc29yX2xlZ2FjeUAyeC1sb25nLWN1cnNv
ci12cy1mbGlwLWF0b21pYwo+ID4gNC4pIHRlc3RzL2ttc19jdXJzb3JfbGVnYWN5QDJ4LWxvbmct
Y3Vyc29yLXZzLWZsaXAtbGVnYWN5Cj4gPiAKPiA+IER1ZSB0byBEREIgYWxsb2NhdGlvbiBjaGFu
Z2VzLCB3ZSBoYXZlIHRvIGFkZCBhbGwgdGhlIHBsYW5lcyB0byB0aGUKPiA+IGRybV9hdG9taWNf
c3RhdGUgcG9zdCBnZW4gOS4gV2hlbiB0aGUgd2F0ZXJtYXJrcyBhcmUgY29tcHV0ZWQgYnkgdGhl
Cj4gPiBrZXJuZWwsIHRoZSBjdXJzb3IgcGxhbmUgaXMgYWRkZWQgdG8gdGhlIGRybV9hdG9taWNf
c3RhdGUgd2hpY2gKPiA+IGludHJvZHVjZXMgYSBkZXBlbmRlbmN5IG9uIGh3X2RvbmUgb2JqZWN0
IHdoZW4gdGhlIGtlcm5lbCBwcm9jZXNzZXMKPiA+IERSTV9JT0NUTF9NT0RFX0FUT01JQyBhbmQg
RFJNX0lPQ1RMX01PREVfQ1VSU09SIGluIHBhcmFsbGVsLiBUaGVyZSBpcyBubwo+ID4gcmFjZS1m
cmVlIHdheSB0byBoYW5kbGUgdGhpcyBjb3JuZXIgY2FzZS4gVGhlc2Ugc3VidGVzdHMgbWFkZSBz
ZW5zZSBmb3IKPiA+IG9sZGVyIGdlbmVyYXRpb25zIGJ1dCBub3QgYW55bW9yZS4gSGVuY2UsIHNr
aXBwaW5nIHRoZXNlIHN1Yi10ZXN0cyBwb3N0Cj4gPiBnZW4gOS4KPiAKPiBPciBmYWlsLiBNYXJr
IGl0IGFzIGV4cGVjdGVkOyBjb21lIGJhY2sgd2hlbiBwcm9ibGVtIGlzIHNvbHZlZCBvciBIVyBo
YXMKPiBtb3ZlZCBvbi4KClRvIGJlIGEgbGl0dGxlIG1vcmUgdmVyYm9zZSwgdGhlIHVzZXIgZXhw
ZWN0YXRpb25zIGhhdmVuJ3QgY2hhbmdlZCwgYW5kCnNvIHRoZSBmYWlsdXJlIGlzIGEgdmFsaWQg
aW5kaWNhdGlvbiB0aGF0IHRoZSBVWCBpcyBzdWJwYXIuCi1DaHJpcwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3Qt
ZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
