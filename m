Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F9C89948
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jun 2019 12:53:56 +0000 (UTC)
Date: Wed, 5 Jun 2019 15:53:54 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20190605125354.GI22949@platvala-desk.ger.corp.intel.com>
References: <20190605121607.28014-1-petri.latvala@intel.com>
 <20190605123656.GT21222@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190605123656.GT21222@phenom.ffwll.local>
Subject: Re: [igt-dev] [PATCH i-g-t] runner: Also consider
 TAINT_MACHINE_CHECK as abortable taint
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
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBKdW4gMDUsIDIwMTkgYXQgMDI6MzY6NTZQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBXZWQsIEp1biAwNSwgMjAxOSBhdCAwMzoxNjowN1BNICswMzAwLCBQZXRyaSBM
YXR2YWxhIHdyb3RlOgo+ID4gU2lnbmVkLW9mZi1ieTogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0
dmFsYUBpbnRlbC5jb20+Cj4gPiBDYzogTWlrYSBLdW9wcGFsYSA8bWlrYS5rdW9wcGFsYUBsaW51
eC5pbnRlbC5jb20+Cj4gCj4gSSd2ZSBzZWVuIGxvdHMgb2YgbWFjaGluZXMgd2hlcmUgdGhlc2Ug
aGFwcGVuIGFzIG5vcm1hbCBzaWRlLWVmZmVjdCBvZgo+IHRoZXJtYWwgdGhyb3RsbGluZy4gRm9y
IHNvbWUgdmFsdWUgb2YgIm5vcm1hbCIuCj4gCj4gRG8gd2UgcmVhbGx5IHdhbnQgdG8gcmVib290
IG9uIHRoZXNlPyBJdCBjb3VsZCBiZSBsaWtlIHRoZSBuZXR3b3JrIHRoaW5nIEkKPiByZWNlbnRs
eSBkaXNhYmxlZCwgYW5kIHRoZW4gZXZlcnlvbmUgc3RhcnRlZCBzY3JlYW1pbmcgYmVjYXVzZSBv
dXIKPiBtYWNoaW5lcyB3aGVyZSBjb25zdGFudGx5IHJlYm9vdGluZyBkdWUgdG8gbmV0d29yayBj
YXJkcy9kcml2ZXJzCj4gdGVtcG9yYXJpbHkgaGF2aW5nIGEgYmFkIHRpbWUgKGJ1dCB1c3VhbGx5
IHJlY292ZXJpbmcpLgoKCkkndmUgc2VlbiBzb21lIE1DRSBsb2cgbWVzc2FnZXMgb24gZG1lc2dz
LCBxdWl0ZSBvZnRlbiBvbiBvbmUgb2YgdGhlCkJYVHMgZm9yIGV4YW1wbGUuIEhvdyBvZnRlbiB0
aG9zZSBNQ0UgdHJpZ2dlcnMgY2F1c2VkIHRhaW50IGlzIGFub3RoZXIKcXVlc3Rpb24uCgpSZWFk
aW5nIHRoZSBtY2UgY29kZSwgaXQgc2VlbXMgdG8gYmUgdGhlcm1hbCBfZmFpbHVyZV8gdGhhdCBj
YXVzZXMgYQp0YWludC4gQW5kIGFsbCBvZiB0aGVzZSBhZGRfdGFpbnQoKSBjYWxscyBhbHNvIHVz
ZQpMT0NLREVQX05PV19VTlJFTElBQkxFIHNvIHdlJ3JlIGFscmVhZHkgZGVlcCB1bmRlciB0aGUg
YnVzIGlmIHdlIGdldAp0aGF0IHRhaW50LgoKCgotLSAKUGV0cmkgTGF0dmFsYQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlz
dAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
