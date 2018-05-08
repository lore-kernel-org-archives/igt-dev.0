Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFFAE6E66A
 for <igt-dev@lists.freedesktop.org>; Tue,  8 May 2018 10:10:19 +0000 (UTC)
References: <20180507131430.3799-1-maarten.lankhorst@linux.intel.com>
 <20180507131430.3799-4-maarten.lankhorst@linux.intel.com>
 <20180507145750.GB28661@phenom.ffwll.local>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <6bc72fe7-e265-4c45-0b72-b2f87099e3dc@linux.intel.com>
Date: Tue, 8 May 2018 12:10:17 +0200
MIME-Version: 1.0
In-Reply-To: <20180507145750.GB28661@phenom.ffwll.local>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 3/4] lib/igt_kms: Remove
 igt_output_get_plane(), v2.
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
Cc: igt-dev@lists.freedesktop.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-ID: <igt-dev@lists.freedesktop.org>

T3AgMDctMDUtMTggb20gMTY6NTcgc2NocmVlZiBEYW5pZWwgVmV0dGVyOgo+IE9uIE1vbiwgTWF5
IDA3LCAyMDE4IGF0IDAzOjE0OjI5UE0gKzAyMDAsIE1hYXJ0ZW4gTGFua2hvcnN0IHdyb3RlOgo+
PiBCZWNhdXNlIHBsYW5lcyB3aWxsIG5vIGxvbmdlciBiZSBmaXhlZCB0byBhIHBpcGUsIHRoZSBp
bmRleCBiZWNvbWVzCj4+IHVzZWxlc3MuIFVzZSBpZ3Rfb3V0cHV0X2dldF9wbGFuZV90eXBlKCkg
aW5zdGVhZCB0byBnZXQgYSBwbGFuZSwKPj4gb3IgZm9yX2VhY2hfcGxhbmVfb25fcGlwZSgpLgo+
Pgo+PiBDaGFuZ2VzIHNpbmNlIHYxOgo+PiAtIE9ubHkgdGVzdCBvdmVybGF5IHBsYW5lcyBpbiB0
aGUgcGxhbmUtcG9zaXRpb24gdGVzdHMsCj4+ICAganVzdCBsaWtlIGJlZm9yZSB0aGlzIGNvbW1p
dC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hv
cnN0QGxpbnV4LmludGVsLmNvbT4KPiBIbSwgaWd0X3BpcGVfZ2V0X3BsYW5lX3R5cGUgaXMgc3Vw
ZXIgdmVyYm9zZS4gQ2FuJ3Qgd2UganVzdCBtYXNzLXN3aXRjaCB0bwo+IGEgc2ltcGxlIHBpcGUt
PnBsYW5lX3ByaW1hcnk/IFRoYXQgYWxzbyBoYXMgdGhlIHVwc2hvdCBvZiBiZWluZyBtdWNoIG1v
cmUKPiBhbGlnbmVkIHdpdGgga2VybmVsIGNvZGUgLi4uCj4KPiBPbiB0aGF0IG5vdGUsIGlndF9v
dXRwdXRfZ2V0X2RyaXZpbmdfcGlwZSBpcyBhbHNvIGEgdmVyYm9zZSBiZWFzdC4gSSB0aGluawo+
IHN0b3JpbmcgdGhlIHBlbmRpbmdfcGlwZSBhcyBhIGZ1bGwgaWd0X3BpcGVfdCAqIHBvaW50ZXIg
d291bGQgcmVzdWx0IGluCj4gcGxlbnR5IGNsZWFuZXIgY29kZS4KCldpdGggdGhlIGV4aXN0aW5n
IGFwaSB3ZSBoYXZlIG5vIHdheSB0byBrbm93IHdoYXQgcGlwZSBoYXMgd2hhdCBwbGFuZSBhcyBw
cmltYXJ5CmN1cnJlbnRseSBzbyB3ZSBvbmx5IGVuZCB1cCB3aXRoIGd1ZXNzZXMuIFdoZW4gdGhl
IG1hcHBpbmcgaXMgZXhwb3NlZCBpbiB0aGUgZnV0dXJlLAp3ZSBjb3VsZCBob29rIGl0IHVwIGFn
YWluIHRvIGlndF9waXBlX2dldF9wbGFuZV90eXBlIGFnYWluLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
