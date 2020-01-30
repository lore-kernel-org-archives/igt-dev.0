Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6613F6F9F5
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2020 16:00:30 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200130155410.GE13686@intel.com>
References: <20200130151229.984-1-ville.syrjala@linux.intel.com>
 <158039830112.18112.1082852252008596408@skylake-alporthouse-com>
 <20200130155410.GE13686@intel.com>
Message-ID: <158040002443.18112.10223513693967405399@skylake-alporthouse-com>
Date: Thu, 30 Jan 2020 16:00:24 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] lib/vec: Add igt_vec
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
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBWaWxsZSBTeXJqw6Rsw6QgKDIwMjAtMDEtMzAgMTU6NTQ6MTApCj4gT24gVGh1LCBK
YW4gMzAsIDIwMjAgYXQgMDM6MzE6NDFQTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+ID4g
UXVvdGluZyBWaWxsZSBTeXJqYWxhICgyMDIwLTAxLTMwIDE1OjEyOjI3KQo+ID4gPiArI2lmbmRl
ZiBfX0lHVF9WRUNfSF9fCj4gPiA+ICsjZGVmaW5lIF9fSUdUX1ZFQ19IX18KPiA+ID4gKwo+ID4g
PiArc3RydWN0IGlndF92ZWMgewo+ID4gPiArICAgICAgIHZvaWQgKmVsZW1zOwo+ID4gPiArICAg
ICAgIGludCBlbGVtX3NpemUsIHNpemUsIGxlbjsKPiA+IAo+ID4gSSB3b3VsZCBoYXZlIHVzZWQg
Y2hhclswXSBhbmQgY2FzdGluZyBqdXN0IHRvIGhhdmUgYSB2YXJpYWJsZSBsZW5ndGgKPiA+IHN0
cnVjdCA6KQo+IAo+IFRoZW4gd2UnZCBoYXZlIHRvIHJlYWxsb2NhdGUgdGhlIHdob2xlIHN0cnVj
dCB0byBncm93IGl0Lgo+IFdvdWxkbid0IHdvcmsgc2luY2UgdGhlIGNhbGxlciBvd25zIHRoZSBz
dHJ1Y3QuCgpUcnVlLgoKPiA+IAo+ID4gSSBtaWdodCBoYXZlIGFsc28gdXNlZCBsb25ncyB0aHJv
dWdob3V0IGluc3RlYWQgb2YgaW50cywgb3IgaW4gdGhpcyBkYXkKPiA+IGFuZCBhZ2UsIHNpemVf
dC4KPiAKPiBJIHdhcyBhY3R1YWxseSB0aGlua2luZyBvZiBzb21ldGhpbmcgc21hbGxlciBzaW5j
ZSBJIGRvdWJ0IGFueW9uZQo+IHdhbnRzIHRvIHVzZSB0aGlzIHdpdGggbGFyZ2UgYW1vdW50cyBv
ZiBkYXRhIGR1ZSB0byBPKG4pLgoKSGVoLCBJIHdhcyB0aGlua2luZyBvZiBjb21iaW5pbmcgdGhp
cyB3aXRoIHRoZSBpZ3RfY29sbGVjdGlvbnMgZWxzZXdoZXJlCmZvciByYW5kb20gc2V0IHBlcm11
dGF0aW9ucy4gQm90aCBBUEkgYXJlIG5vdCBzbyBrZWVuIHdpdGggbXkgaWRlYSBvZgp0ZXN0aW5n
IGV2ZXJ5dGhpbmcgdW5kZXIgdGhlIHN1biBhdCBvbmNlLiBTZWxmLW11dGF0aW5nIHRlc3Qgc2V0
cz8KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
