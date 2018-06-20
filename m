Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 042C46E6EB
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Jun 2018 09:57:49 +0000 (UTC)
Date: Wed, 20 Jun 2018 12:57:45 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20180620095745.c4p35a6ftor3z5jg@platvala-desk.ger.corp.intel.com>
References: <20180606222741.24096-1-lucas.demarchi@intel.com>
 <CAKi4VALGU5K5oNxQijgXi6gLdx3N3-6fphu6k14LGO9fLrv9Xw@mail.gmail.com>
 <20180619073741.lgaa2kbvc3o46yc2@platvala-desk.ger.corp.intel.com>
 <CAKi4VA+cOxESw17N3Yjyj-CH87uBfjQUJj=p_a1JAFz_6yGNEA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKi4VA+cOxESw17N3Yjyj-CH87uBfjQUJj=p_a1JAFz_6yGNEA@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/4] tests/sw_sync: fix pthread
 start_routine declaration
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
To: Lucas De Marchi <lucas.de.marchi@gmail.com>
Cc: igt-dev@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTksIDIwMTggYXQgMDE6MzA6MjdQTSAtMDcwMCwgTHVjYXMgRGUgTWFyY2hp
IHdyb3RlOgo+IE9uIFR1ZSwgSnVuIDE5LCAyMDE4IGF0IDEyOjM3IEFNIFBldHJpIExhdHZhbGEg
PHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBNb24sIEp1biAxOCwg
MjAxOCBhdCAxMTo0NjozMVBNIC0wNzAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6Cj4gPiA+IFBp
bmc/Cj4gPgo+ID4gQSB0ZW50YXRpdmUKPiA+Cj4gPiBSZXZpZXdlZC1ieTogUGV0cmkgTGF0dmFs
YSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+Cj4gPgo+ID4gb24gdGhlIHNlcmllcy4KPiA+Cj4g
PiBXaGF0IGlzIHRoZSBwcmFjdGljYWwgZWZmZWN0IG9mIC1zdGQ9Z251MTEgaW4gdGVybXMgb2Yg
Z2NjIHZlcnNpb24KPiA+IHJlcXVpcmVtZW50PyBJIGtub3cgdXNpbmcgQysrMTEgcmVxdWlyZXMg
c29tZSBjcmVhdGl2ZSBzZWxlY3Rpb24gb2YKPiA+IGdjYyB2ZXJzaW9ucywgYnV0IEkgaGF2ZSBu
byBpZGVhIGFib3V0IEMxMS4KPiAKPiBJIHVzZSBpdCBzaW5jZSBmb3JldmVyIGluIGttb2QsIGJ1
dCB0aGVyZSBJIGhhdmUgc29tZQo+IGNydWZ0Xldjb21wYXRpYmlsaXR5IG1hY3Jvcy4gSSBjYW4g
YnJpbmcgaXQgb3ZlciB0byBpZ3QgaWYgaXQncwo+IG5lZWRlZCwgYnV0IEkgdGhpbmsgaXQgd291
bGQgYmUgYmV0dGVyIHRvIGhhdmUgYSB0ZW50YXRpdmUgcHVzaAo+IHdpdGhvdXQgdGhlbS4KPiAK
PiBBbnN3ZXJpbmcgeW91ciBxdWVzdGlvbiwgYWNjb3JkaW5nIHRvCj4gaHR0cHM6Ly9nY2MuZ251
Lm9yZy93aWtpL0MxMVN0YXR1cyBfU3RhdGljX2Fzc2VydCgpIHRoYXQgSSdtIHVzaW5nIGluCj4g
dGhpcyBzZXJpZXMgaXMgYXZhaWxhYmxlIHNpbmNlIGdjYyA0LjYuIFNvbWUgQzExIGZlYXR1cmVz
IGVudGVyZWQgaW4KPiA0LjcgYW5kIGluIDQuOSBpdCB3YXMgImZlYXR1cmUgY29tcGxldGUiLgoK
ClRoYXQgc291bmRzIGFscmlnaHQuIEV2ZW4gZGViaWFuIG9sZHN0YWJsZSBoYXMgNC45LgoKCi0t
IApQZXRyaSBMYXR2YWxhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
