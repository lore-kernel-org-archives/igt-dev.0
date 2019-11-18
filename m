Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB4789D2F
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2019 10:25:01 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20191117143916.110714-1-stuart.summers@intel.com>
 <157400169496.24372.15824845542482878106@skylake-alporthouse-com>
 <c0c88ecc576ec4d6ad19d02bfb17a343f85c7ea5.camel@intel.com>
In-Reply-To: <c0c88ecc576ec4d6ad19d02bfb17a343f85c7ea5.camel@intel.com>
Message-ID: <157407269630.24372.16674194105284400953@skylake-alporthouse-com>
Date: Mon, 18 Nov 2019 10:24:56 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] lib/i915/gem_mman: Add helper routine
 to check GTT version
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

UXVvdGluZyBTdW1tZXJzLCBTdHVhcnQgKDIwMTktMTEtMTcgMjI6MTI6MzIpCj4gT24gU3VuLCAy
MDE5LTExLTE3IGF0IDE0OjQxICswMDAwLCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gPiBRdW90aW5n
IFN0dWFydCBTdW1tZXJzICgyMDE5LTExLTE3IDE0OjM5OjE2KQo+ID4gPiBBZGQgYSBjaGVjayB0
byBnZW1fcHJlYWQgYW5kIGdlbV9wd3JpdGUgdG8gb25seSBhbGxvdyBHVFQgc3VidGVzdHMKPiA+
ID4gd2hlbiB0aGUgR1RUIHZlcnNpb24gaXMgYXQgbGVhc3QgMS4KPiA+IAo+ID4gTm8sIGl0IG11
c3QgYWxzbyBydW4gb24ga2VybmVscyBiZWZvcmUgaW9jdGwgdmVyc2lvbmluZy4gV2h5Pwo+IAo+
IEhtLi4geWVhaCB0aGF0IG1ha2VzIHNlbnNlLiBJJ2xsIGhhdmUgdG8gY29tZSB1cCB3aXRoIHNv
bWV0aGluZyBlbHNlIDopCj4gTG9va2luZyBmb3IgYSB3YXkgdG8gZGV0ZXJtaW5lIHdoZXRoZXIg
d2UgY2FuIG1tYXAgdG8gdGhlIEdUVC4gSSdsbAo+IHJldGhpbmsgYW5kIHJlcG9zdC4KCkl0J3Mg
dGhlIHNhbWUgd2F5IGFzIGRldGVjdGluZyB3aGV0aGVyIG9yIG5vdCB3ZSBjYW4gdXNlIFdDLCBV
QyBvciBXQgpwYWdlIHByb3RlY3Rpb25zOiB0cmlhbC1hbmQtZXJyb3IgYXQgcHJlc2VudC4KCkl0
J3Mgbm90IHRoZSB3b3JzdCB3YXkuLi4gSWYgSSB3YXMgc3VnZ2VzdGluZyBBUEksIEkgd291bGQg
c3VnZ2VzdCBpdAp3b3VsZCBiZSBhIHBhcnQgb2YgdGhlIG1lbW9yeSBkaXNjb3ZlcnkgaTkxNV9x
dWVyeS4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
