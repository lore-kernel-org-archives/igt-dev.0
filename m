Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5131B6E1ED
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Oct 2018 13:02:40 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id z21-v6so4045755edb.11
 for <igt-dev@lists.freedesktop.org>; Thu, 04 Oct 2018 06:02:40 -0700 (PDT)
Date: Thu, 4 Oct 2018 15:02:30 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20181004130230.GK31561@phenom.ffwll.local>
References: <20180928102002.10541-1-chris@chris-wilson.co.uk>
 <c67237b6-a3e5-4d11-a483-aa7ecd800ff4@intel.com>
 <153842301482.23109.9425007086680751049@skylake-alporthouse-com>
 <b01d74fe-763a-0b65-b0b9-49ca091077b6@intel.com>
 <153846900061.7415.2196966772772919022@jlahtine-desk.ger.corp.intel.com>
 <7287aacb-ae70-7c4f-420b-46f27e0910cf@intel.com>
 <153857186067.4477.7493889521236990498@jlahtine-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <153857186067.4477.7493889521236990498@jlahtine-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 1/5] igt/kms_getfb: Check
 the iface exists before use
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
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBPY3QgMDMsIDIwMTggYXQgMDQ6MDQ6MjBQTSArMDMwMCwgSm9vbmFzIExhaHRpbmVu
IHdyb3RlOgo+IFF1b3RpbmcgQW50b25pbyBBcmdlbnppYW5vICgyMDE4LTEwLTAyIDIzOjI3OjQ2
KQo+ID4gCj4gPiAKPiA+IE9uIDAyLzEwLzE4IDAxOjMwLCBKb29uYXMgTGFodGluZW4gd3JvdGU6
Cj4gPiA+IFF1b3RpbmcgQW50b25pbyBBcmdlbnppYW5vICgyMDE4LTEwLTAxIDIyOjUzOjQ2KQo+
ID4gPj4gRmFpciBlbm91Z2guCj4gPiA+Pgo+ID4gPj4gQWNrZWQtYnk6IEFudG9uaW8gQXJnZW56
aWFubyA8YW50b25pby5hcmdlbnppYW5vQGludGVsLmNvbT4KPiA+ID4+Cj4gPiA+PiBmb3IgdGhl
IHNlcmllcy4KPiA+ID4gCj4gPiA+IFBsZWFzZSwgcmVhZCB0aGUgZm9sbG93aW5nIGNoYXB0ZXJz
ICh0aGV5J3JlIGFwcGxpY2FibGUgZm9yIHRoZSBwYXRjaAo+ID4gPiB0YWcgbWVhbmluZ3MgaW4g
SUdULCB0b28pOgo+ID4gPiAKPiA+ID4gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC92
NC4xOC9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5odG1sI3doZW4tdG8tdXNlLWFja2VkLWJ5
LWNjLWFuZC1jby1kZXZlbG9wZWQtYnkKPiA+ID4gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2Mv
aHRtbC92NC4xOC9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5odG1sI3VzaW5nLXJlcG9ydGVk
LWJ5LXRlc3RlZC1ieS1yZXZpZXdlZC1ieS1zdWdnZXN0ZWQtYnktYW5kLWZpeGVzCj4gPiA+IAo+
ID4gPiBJZiB3ZSBzcGVuZCB0aGUgdGltZSB0byBhY3R1YWxseSByZXZpZXcgdGhlIHBhdGNoZXMs
IHRoYXQgc2hvdWxkIGJlCj4gPiA+IGRvY3VtZW50ZWQgd2l0aCBhIHByb3BlciBSZXZpZXdlZC1i
eSBhbmQgbm90IGEgdmFndWUgQWNrZWQtYnkuCj4gPiAKPiA+IEtNUyBpcyByZWFsbHkgYW4gYXJl
YSBJIGRvIG5vdCBrbm93IG11Y2ggYWJvdXQuIFdoaWxlIEkgY2FuIHNheSB0aGUgCj4gPiBwYXRj
aGVzIGFyZSBsb29raW5nIGdvb2Qgb24gdGhlIElHVCBzaWRlLCBJIGNhbm5vdCBndWFyYW50ZWUg
dGhleSB1c2UgCj4gPiB0aGUgS01TIGludGVyZmFjZSBhcHByb3ByaWF0ZWx5IHRoZXJlZm9yZSB0
aGUgJ0Fja2VkLWJ5Jy4gQWZ0ZXIgcmVhZGluZyAKPiA+IHRoZSBkb2N1bWVudGF0aW9uIHlvdSBs
aW5rZWQgSSB0aGluayBpdCBmaXRzIHJhdGhlciB3ZWxsIHNpbmNlIHRoZSBvbmx5IAo+ID4gZmVl
ZGJhY2sgSSBnYXZlIHdhcyBvbiBhIHNtYWxsIG92ZXJzaWdodC4KPiAKPiBGYWlyIGVub3VnaC4g
Rm9yIGZ1dHVyZSByZWZlcmVuY2UsIHlvdSBtYXkgd2FudCB0byBjb21tZW50IHdoZW4gZ2l2aW5n
Cj4geW91ciBBY2tlZC1ieSwgdGhlIHJlYXNvbiBmb3Igb25seSBsaW1pdGVkIHJldmlldyBhbmQg
bm90IGZ1bGwgUi1iLgoKRnlpIEkgYWxzbyBkaWQgcmV2aWV3IHRoaXMgb25lLCBidXQgYW4gb2xk
ZXIgdmVyc2lvbiwgYW5kIHRob3NlIGNvbW1lbnRzCmRpZG4ndCBnZXQgYWRkcmVzc2VkLiBTbyBu
b3QgdGhlIG9ubHkgdGhpbmcgdGhhdCB3ZW50IHNsaWdodGx5IHNpZGV3YXlzCmhlcmUuCi1EYW5p
ZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9u
Cmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0
LWRldgo=
