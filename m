Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C86996E092
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Oct 2018 10:27:19 +0000 (UTC)
Date: Wed, 3 Oct 2018 13:27:16 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20181003102716.GG17124@platvala-desk.ger.corp.intel.com>
References: <20180927131142.32134-1-petri.latvala@intel.com>
 <20181003090635.cx2y3u4rjgeijpel@ahiler-desk1.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181003090635.cx2y3u4rjgeijpel@ahiler-desk1.fi.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] runner: Add time_elapsed field to
 results
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
Cc: igt-dev@lists.freedesktop.org, Tomi Sarvela <tomi.p.sarvela@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBPY3QgMDMsIDIwMTggYXQgMTI6MDY6MzVQTSArMDMwMCwgQXJrYWRpdXN6IEhpbGVy
IHdyb3RlOgo+IE9uIFRodSwgU2VwIDI3LCAyMDE4IGF0IDA0OjExOjQyUE0gKzAzMDAsIFBldHJp
IExhdHZhbGEgd3JvdGU6Cj4gPiBXaGVuIHN0YXJ0aW5nIGEgdGVzdCBydW4sIGRyb3AgYSB0aW1l
c3RhbXAgZmlsZS4gRG8gdGhlIHNhbWUgd2hlbgo+ID4gZW5kaW5nIGEgcnVuLiBTbGFwIHRob3Nl
IHRpbWVzdGFtcHMgZGlyZWN0bHkgaW50byB0aGUgdGltZV9lbGFwc2VkCj4gPiBmaWVsZCBpbiBy
ZXN1bHRzLmpzb24uCj4gPiAKPiA+IFVzaW5nIHRpbWVzdGFtcHMgaW5zdGVhZCBvZiBtZWFzdXJp
bmcgYWN0dWFsIGVsYXBzZWQgdGltZSBnb2VzIGFnYWluc3QKPiA+IHRoZSBuYW1pbmcgb2YgdGhl
IGZpZWxkLCBidXQgdGhlIG5hbWUgaXMgY2hvc2VuIGJ5IHBpZ2xpdC4gRXZlbiB0aG91Z2gKPiA+
IHBpZ2xpdCBpdHNlbGYgdXNlcyB0aW1lc3RhbXBzLgo+ID4gCj4gPiBDb3JuZXIgY2FzZXM6Cj4g
PiAKPiA+IE9uIGluY29tcGxldGUgdGVzdCBydW5zLCB0aGUgZW5kIHRpbWVzdGFtcCB3aWxsIGJl
IG1pc3NpbmcuIFRoZQo+ID4gdGltZV9lbGFwc2VkIGZpZWxkIHdpbGwgb25seSBoYXZlIHRoZSBz
dGFydCB0aW1lc3RhbXAuIFRoaXMgbWF0Y2hlcwo+ID4gcGlnbGl0IGJlaGF2aW91ciBleGFjdGx5
Lgo+ID4gCj4gPiBPbiBpbmNvbXBsZXRlIGJ1dCByZXN1bWVkIHRlc3QgcnVucywgdGhlIGVuZCB0
aW1lc3RhbXAgd2lsbCBiZSB0aGUKPiA+IHRpbWUgd2hlbiB0aGUgcmVzdW1lIGZpbmlzaGVzLiBQ
aWdsaXQgZG9lc24ndCBkbyB0aGlzLCBhbmQgaW5zdGVhZAo+ID4gbGVhdmVzIHRoZSBlbmQgdGlt
ZXN0YW1wIG1pc3NpbmcuIERpc2N1c3Npbmcgd2hpY2ggYmVoYXZpb3VyIGlzIGJldHRlcgo+ID4g
aXMgbGVmdCBhcyBhbiBleGVyY2lzZSB0byB0aGUgcmVhZGVycy4KPiA+IAo+ID4gU2lnbmVkLW9m
Zi1ieTogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+Cj4gPiBDYzogQXJr
YWRpdXN6IEhpbGVyIDxhcmthZGl1c3ouaGlsZXJAaW50ZWwuY29tPgo+ID4gQ2M6IFRvbWkgU2Fy
dmVsYSA8dG9taS5wLnNhcnZlbGFAaW50ZWwuY29tPgo+IAo+IFJldmlld2VkLWJ5OiBBcmthZGl1
c3ogSGlsZXIgPGFya2FkaXVzei5oaWxlckBpbnRlbC5jb20+Cj4gCj4gT25jZSB0aGlzIGdldHMg
bWVyZ2VkIHdlIHdpbGwgaGF2ZSB0byB1cGRhdGUgSUdUIG9uIHRoZSB0aGUgQ0kgaG9zdC4KCk1l
cmdlZCBub3csIHRoYW5rcy4KCgotLSAKUGV0cmkgTGF0dmFsYQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2lndC1kZXYK
