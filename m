Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D32436E122
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Feb 2018 13:07:15 +0000 (UTC)
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
In-Reply-To: <20180202101025.15954-1-chris@chris-wilson.co.uk>
References: <20180202101025.15954-1-chris@chris-wilson.co.uk>
Date: Fri, 02 Feb 2018 15:06:39 +0200
Message-ID: <87zi4rv8v4.fsf@gaia.fi.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH igt] tools: Clear unused fields in register
 spec
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
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Q2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+IHdyaXRlczoKCj4gSWYgd2Ug
ZmFpbCB0byBjbGVhciB0aGUgb3RoZXIgZmllbGRzIGluc2lkZSB0aGUgcmVnaXN0ZXIgc3BlYywg
dGhhdCBtYXkKPiBiZSBsZWZ0IHdpdGggZ2FyYmFnZSBpbnN0cnVjdGluZyB1cyB0byBhY2Nlc3Mg
dGhlIHJlZ2lzdGVyIHZpYSBhbgo+IGludmFsaWQgcGF0aC4KPgo+IEJ1Z3ppbGxhOiBodHRwczov
L2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMDQ4OTUKPiBGaXhlczogN2Yw
YmUwZTdkOWJlICgidG9vbHMvaW50ZWxfcmVnOiBBZGQgcmVhZGluZyBhbmQgd3JpdGluZyByZWdp
c3RlcnMgdGhyb3VnaCBlbmdpbmUiKQo+IFNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hy
aXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+IENjOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50
ZWwuY29tPgo+IENDOiBKb29uYXMgTGFodGluZW4gPGpvb25hcy5sYWh0aW5lbkBsaW51eC5pbnRl
bC5jb20+Cj4gQ2M6IE1pa2EgS3VvcHBhbGEgPG1pa2Eua3VvcHBhbGFAbGludXguaW50ZWwuY29t
Pgo+IC0tLQoKSSBtYWlsZWQgYSBzZXBhcmF0ZSBwYXRjaCB3aGljaCBkb2VzIGhhbmRsZSB0aGUg
YnVpbHRpbmcgc3BlYywKd2hpY2ggaXMgbW9yZSBwcmVjaXNlIHRoZSBidWcjMTA0ODk1LiBCdXQg
dGhpcyBpcyBuZWVkZWQgYWxzbwphcyBpdCBpcyBmb3IgdGhlIHNhbWUgcHJvYmxlbSB3aXRoIGZp
bGUgYmFzZWQgcmVnIHNwZWNzLgoKV2UgbmVlZCBib3RoLgoKUmV2aWV3ZWQtYnk6IE1pa2EgS3Vv
cHBhbGEgPG1pa2Eua3VvcHBhbGFAbGludXguaW50ZWwuY29tPgoKPiAgdG9vbHMvaW50ZWxfcmVn
X3NwZWMuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvaW50ZWxfcmVnX3NwZWMuYyBiL3Rvb2xzL2lu
dGVsX3JlZ19zcGVjLmMKPiBpbmRleCA1NTk0ZDcwNzcuLjU4YzhmN2U0YyAxMDA2NDQKPiAtLS0g
YS90b29scy9pbnRlbF9yZWdfc3BlYy5jCj4gKysrIGIvdG9vbHMvaW50ZWxfcmVnX3NwZWMuYwo+
IEBAIC0yNjcsNyArMjY3LDcgQEAgc3RhdGljIHNzaXplX3QgcGFyc2VfZmlsZShzdHJ1Y3QgcmVn
ICoqcmVncywgc2l6ZV90ICpucmVncywKPiAgCX0KPiAgCj4gIAl3aGlsZSAoZ2V0bGluZSgmbGlu
ZSwgJmxpbmVzaXplLCBmaWxlKSAhPSAtMSkgewo+IC0JCXN0cnVjdCByZWcgcmVnOwo+ICsJCXN0
cnVjdCByZWcgcmVnID0ge307Cj4gIAo+ICAJCWxpbmVubysrOwo+ICAKPiAtLSAKPiAyLjE1LjEK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
