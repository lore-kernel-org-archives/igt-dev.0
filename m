Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 284E86E3B0
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Apr 2018 09:34:09 +0000 (UTC)
References: <20180411023732.32362-1-dhinakaran.pandiyan@intel.com>
 <20180411023732.32362-20-dhinakaran.pandiyan@intel.com>
 <20180411084259.uxn2ub6op7jueeni@platvala-desk.ger.corp.intel.com>
 <C56C55B681623645A065C9EE352337D619C2F28A@ORSMSX109.amr.corp.intel.com>
 <20180413091600.twtum2yil7jvqlsu@platvala-desk.ger.corp.intel.com>
 <1523754820.2453.22.camel@dk-H97M-D3H> <20180423230650.GC27583@intel.com>
 <1524527912.24461.2.camel@dk-H97M-D3H>
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <01f5243c-0987-f60b-b31c-9a5002bab94b@intel.com>
Date: Tue, 24 Apr 2018 12:34:07 +0300
MIME-Version: 1.0
In-Reply-To: <1524527912.24461.2.camel@dk-H97M-D3H>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 20/20] tests/psr: Add more PSR subtests
 to fast feedback list
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: dhinakaran.pandiyan@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

CgpPbiAwNC8yNC8yMDE4IDAyOjU4IEFNLCBEaGluYWthcmFuIFBhbmRpeWFuIHdyb3RlOgo+Cj4K
PiBPbiBNb24sIDIwMTgtMDQtMjMgYXQgMTY6MDYgLTA3MDAsIFJvZHJpZ28gVml2aSB3cm90ZToK
Pj4gT24gU2F0LCBBcHIgMTQsIDIwMTggYXQgMDY6MTM6NDBQTSAtMDcwMCwgRGhpbmFrYXJhbiBQ
YW5kaXlhbiB3cm90ZToKPj4+IE9uIEZyaSwgMjAxOC0wNC0xMyBhdCAxMjoxNiArMDMwMCwgUGV0
cmkgTGF0dmFsYSB3cm90ZToKPj4+PiBPbiBXZWQsIEFwciAxMSwgMjAxOCBhdCAwNzoxNDozNlBN
ICswMzAwLCBQYW5kaXlhbiwgRGhpbmFrYXJhbiB3cm90ZToKPj4+Pj4gWWVhaCwgdGhhdCBpcyBl
eHBlY3RlZC4gVGhlIGtlcm5lbCBwYXRjaGVzIGFyZSBub3QgaW4geWV0Lgo+Pj4+IFRoZSByZXF1
aXJlbWVudCBmb3IgdXNpbmcgLS1zaW5rLWNyYyBpcyBnb2luZyBhd2F5IHdoZW4ga2VybmVsIHNp
ZGUKPj4+PiBwYXRjaGVzIGxhbmQ/IE9yIGhvdyBpcyB0aGlzIHBsYW5uZWQ/Cj4+Pj4KPj4+IEly
cmVzcGVjdGl2ZSBvZiB3aGV0aGVyIG9yIHdoZW4gdGhlIGtlcm5lbCBwYXRjaGVzIGxhbmQsIC0t
c2luay1jcmMgd2lsbAo+Pj4gbm90IGJlIHVzZWQgZm9yIENJLiAtLXNpbmstY3JjIGlzIGJlaW5n
IHJldGFpbmVkIGZvciBkZXZlbG9wZXJzIHRvCj4+PiBtYW51YWxseSB1c2UgaXQgZm9yIGRlYnVn
IGFuZCBwb3NzaWJseSBmaXggdGhlIGNvZGUgaW4gZnV0dXJlLgo+Pj4KPj4+IEhhdmluZyBzYWlk
IHRoYXQsIHRoZSBrZXJuZWwgcGF0Y2hlcyBhZGRpbmcgdGltZSBzdGFtcCBzdXBwb3J0IHNob3Vs
ZAo+Pj4gbGFuZCBzb29uLCBhZnRlciB3aGljaCB0aGUgdGVzdHMgd2lsbCBub3Qgc2tpcC4KPj4g
T2ssIEkgZmluYWxseSBsb29rZWQgdG8gYWxsIHBhdGNoZXMgb24gdGhpcyBzZXJpZXMgYW5kIEkg
c3VwcG9ydCBhbGwgb2YgdGhlbS4KPj4KPj4gTXkgb25seSBjb25jZXJuIGlzIGFjdHVhbGx5IHdp
dGggcGF0Y2ggMTQgdGhhdCBpcyBhcm91bmQgdGhpcyBkaXNjdXNzaW9uIGhlcmUuLi4KPj4KPj4g
Rm9yIG1lIGl0IHNlZW1zIHRoYXQgb3IgeW91IHJ1biB3aXRoIGludGVyYWN0aXZlIGRlYnVnIG9u
IG9yIHdpdGggc2lua19jcmMKPj4gYW5kIENJIGlzIG5vdCBydW5uaW5nIHdpdGggYW55IHNvIGl0
IHdpbGwgYWxsIHNraXAuCj4+Cj4+IFVubGVzcyBJIG1pc3N1bmRlcnN0b29kIHNvbWV0aGluZyBv
biB0aGF0IHBhdGNoLi4uCj4+Cj4+IElmIENJIHN0aWxsIHJ1bnMgd2l0aG91dCByZXF1aXJpbmcg
YW55IGV4dHJhIG9wdGlvbiBJJ20gaW4gZmF2b3Igb2YgdGhlIHdob2xlIHNlcmllcwo+PiBhbmQg
SSdtIHRlbmRpbmcgdG8gbWVyZ2UgaXQgc29vbi4uLgo+Pgo+IENJIHdpbGwgbm90IG5lZWQgYW55
IG9wdGlvbnMuIFRpbWVzdGFtcHMgYXJlIHN1cHBvcnRlZCBieSBkZWZhdWx0IG9uIGFsbAo+IHBs
YXRmb3JtcyBleGNlcHQgQ0hWL1ZMVi4gV2UgZG9uJ3QgaGF2ZSB0aG9zZSBwbGF0Zm9ybXMgaW4g
Q0kgYW5kIEkgYW0KPiBwbGFubmluZyB0byBudWtlIFBTUiBzdXBwb3J0IGZvciB0aGVtLgo+CgpU
aGVzZSBtYWNoaW5lcyBhcmUgVkxWOgpmaS1ieXQtajE5MDAKZmktYnl0LW4yODIwCgoKLS0gClBl
dHJpIExhdHZhbGEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
