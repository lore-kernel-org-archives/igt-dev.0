Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB725890C5
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Apr 2019 20:19:10 +0000 (UTC)
Date: Wed, 24 Apr 2019 23:19:06 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20190424201906.GI1747@intel.com>
References: <1554495245-27955-1-git-send-email-kevin.strasser@intel.com>
 <1554495245-27955-2-git-send-email-kevin.strasser@intel.com>
 <20190424200528.GV9857@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190424200528.GV9857@phenom.ffwll.local>
Subject: Re: [igt-dev] [PATCH 1/3] lib: Add halffloat implementation
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
To: Daniel Vetter <daniel@ffwll.ch>
Cc: igt-dev@lists.freedesktop.org, Kevin Strasser <kevin.strasser@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBBcHIgMjQsIDIwMTkgYXQgMTA6MDU6MjhQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBGcmksIEFwciAwNSwgMjAxOSBhdCAwMToxNDowM1BNIC0wNzAwLCBLZXZpbiBT
dHJhc3NlciB3cm90ZToKPiA+IFByb2JlIGZvciBhbmQgbWFrZSBhbiBBUEkgYXZhaWxhYmxlIGZv
ciB0ZXN0cyB0byB1c2UgZjE2YyBpbnRyaW5zaWNzIHRvCj4gPiBnZW5lcmF0ZSBuZWVkZWQgZnAx
NiBwaXhlbCBkYXRhLgo+ID4gCj4gPiBBbHNvIGltcG9ydCBhIHB1cmUgYyBmcDMyIDwtPiBmcDE2
IGNvbnZlcnNpb24gaW1wbGVtZW50YXRpb24gZnJvbSBNZXNhCj4gPiAxOC4zLjQsIHdoaWNoIHdp
bGwgYWN0IGFzIGEgZmFsbGJhY2sgd2hlbiBmMTZjIGlzIHVuYXZhaWxhYmxlLgo+ID4gCj4gPiBy
ZmMyOgo+ID4gLSBDaGFuZ2UgQVBJIHRvIHJlZHVjZSBudW1iZXIgb2YgZnVuY3Rpb24gY2FsbHMg
KE1hYXJ0ZW4pCj4gPiAKPiA+IHYxOgo+ID4gLSBNb3ZlIHByYWdtYSBzbyBBVlggY29kZSBpc24n
dCBlbWl0dGVkIGZvciBmYWxsYmFja3MgKFZpbGxlKQo+ID4gLSBDaGFuZ2UgZWR4IHRvIGVjeCAo
VmlsbGUpCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEtldmluIFN0cmFzc2VyIDxrZXZpbi5zdHJh
c3NlckBpbnRlbC5jb20+Cj4gPiBSZXZpZXdlZC1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5z
eXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiAKPiBidHcgdGhpcyBicm9rZSB0aGUgYnVpbGQsIGFu
ZCBzb21lb25lIGVsc2UgZ290IHRvIGZpeCBpdCB1cCBmb3IgeW91Ogo+IAo+IGNvbW1pdCAxMWUx
MGJjNTc1NTE2YzU2OTc4NjQwZmNjNjk3YzI3ZjI3N2M2NjBhCj4gQXV0aG9yOiBTaW1vbiBTZXIg
PHNpbW9uLnNlckBpbnRlbC5jb20+Cj4gRGF0ZTogICBXZWQgQXByIDI0IDEwOjAxOjI5IDIwMTkg
KzAzMDAKPiAKPiAgICAgbGliL2lndF9oYWxmZmxvYXQ6IGZpeCBjb21waWxhdGlvbiB3aXRoIENs
YW5nCgpTaW5jZSB3aGVuIGlzIGJ1aWxkaW5nIHdpdGggY2xhbmcgYSByZXF1aXJlbWVudD8KCi0t
IApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
Z3QtZGV2
