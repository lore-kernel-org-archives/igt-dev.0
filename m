Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm0-x243.google.com (mail-wm0-x243.google.com
 [IPv6:2a00:1450:400c:c09::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9319A6E0A8
 for <igt-dev@lists.freedesktop.org>; Wed,  9 May 2018 09:46:28 +0000 (UTC)
Received: by mail-wm0-x243.google.com with SMTP id a8so23457642wmg.5
 for <igt-dev@lists.freedesktop.org>; Wed, 09 May 2018 02:46:28 -0700 (PDT)
Date: Wed, 9 May 2018 11:46:24 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20180509094624.GU28661@phenom.ffwll.local>
References: <20180507131430.3799-1-maarten.lankhorst@linux.intel.com>
 <20180507131430.3799-4-maarten.lankhorst@linux.intel.com>
 <20180507145750.GB28661@phenom.ffwll.local>
 <6bc72fe7-e265-4c45-0b72-b2f87099e3dc@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6bc72fe7-e265-4c45-0b72-b2f87099e3dc@linux.intel.com>
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
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBNYXkgMDgsIDIwMTggYXQgMTI6MTA6MTdQTSArMDIwMCwgTWFhcnRlbiBMYW5raG9y
c3Qgd3JvdGU6Cj4gT3AgMDctMDUtMTggb20gMTY6NTcgc2NocmVlZiBEYW5pZWwgVmV0dGVyOgo+
ID4gT24gTW9uLCBNYXkgMDcsIDIwMTggYXQgMDM6MTQ6MjlQTSArMDIwMCwgTWFhcnRlbiBMYW5r
aG9yc3Qgd3JvdGU6Cj4gPj4gQmVjYXVzZSBwbGFuZXMgd2lsbCBubyBsb25nZXIgYmUgZml4ZWQg
dG8gYSBwaXBlLCB0aGUgaW5kZXggYmVjb21lcwo+ID4+IHVzZWxlc3MuIFVzZSBpZ3Rfb3V0cHV0
X2dldF9wbGFuZV90eXBlKCkgaW5zdGVhZCB0byBnZXQgYSBwbGFuZSwKPiA+PiBvciBmb3JfZWFj
aF9wbGFuZV9vbl9waXBlKCkuCj4gPj4KPiA+PiBDaGFuZ2VzIHNpbmNlIHYxOgo+ID4+IC0gT25s
eSB0ZXN0IG92ZXJsYXkgcGxhbmVzIGluIHRoZSBwbGFuZS1wb3NpdGlvbiB0ZXN0cywKPiA+PiAg
IGp1c3QgbGlrZSBiZWZvcmUgdGhpcyBjb21taXQuCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBN
YWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+ID4g
SG0sIGlndF9waXBlX2dldF9wbGFuZV90eXBlIGlzIHN1cGVyIHZlcmJvc2UuIENhbid0IHdlIGp1
c3QgbWFzcy1zd2l0Y2ggdG8KPiA+IGEgc2ltcGxlIHBpcGUtPnBsYW5lX3ByaW1hcnk/IFRoYXQg
YWxzbyBoYXMgdGhlIHVwc2hvdCBvZiBiZWluZyBtdWNoIG1vcmUKPiA+IGFsaWduZWQgd2l0aCBr
ZXJuZWwgY29kZSAuLi4KPiA+Cj4gPiBPbiB0aGF0IG5vdGUsIGlndF9vdXRwdXRfZ2V0X2RyaXZp
bmdfcGlwZSBpcyBhbHNvIGEgdmVyYm9zZSBiZWFzdC4gSSB0aGluawo+ID4gc3RvcmluZyB0aGUg
cGVuZGluZ19waXBlIGFzIGEgZnVsbCBpZ3RfcGlwZV90ICogcG9pbnRlciB3b3VsZCByZXN1bHQg
aW4KPiA+IHBsZW50eSBjbGVhbmVyIGNvZGUuCj4gCj4gV2l0aCB0aGUgZXhpc3RpbmcgYXBpIHdl
IGhhdmUgbm8gd2F5IHRvIGtub3cgd2hhdCBwaXBlIGhhcyB3aGF0IHBsYW5lIGFzIHByaW1hcnkK
PiBjdXJyZW50bHkgc28gd2Ugb25seSBlbmQgdXAgd2l0aCBndWVzc2VzLiBXaGVuIHRoZSBtYXBw
aW5nIGlzIGV4cG9zZWQgaW4gdGhlIGZ1dHVyZSwKPiB3ZSBjb3VsZCBob29rIGl0IHVwIGFnYWlu
IHRvIGlndF9waXBlX2dldF9wbGFuZV90eXBlIGFnYWluLgoKVGhhdCdzIG5vdCB3aGF0IEkgbWVh
bnQgLi4uCgpDdXJyZW50IHN0YXRlOiBvdXIgYmVzdCBndWVzcyBmb3IgcHJpbWFyeSBhbmQgY3Vy
c29yIHBsYW5lIGlzIGVuY29kZWQgaW4KdGhlIGlndF9waXBlX2dldF9wbGFuZV90eXBlIGZ1bmN0
aW9uLCByZXN1bHRpbmcgaW4gdmVyeSB2ZXJib3NlIGNvZGUuIEFuZApjb2RlIHRoYXQgZG9lc24n
dCBsb29rIGxpa2Uga2VybmVsIGNvZGUuCgpNeSBzdWdnZXN0aW9uOiBFbmNvZGUgdGhhdCBiZXN0
IGd1ZXNzIGludG8gbmV3IGlndF9waXBlX3QtPnByaW1hcnl8Y3Vyc29yCnBvaW50ZXJzLiBJdCdz
IHN0aWxsIGp1c3QgYSBiZXN0IGd1ZXNzLCBidXQgdGhlIHJlc3VsdGluZyBjb2RlIGxvb2tzIG11
Y2gKYmV0dGVyLiBBbmQgc2luY2UgeW91J3JlIHRvdWNoaW5nIGFsbCB0aGVzZSBwbGFjZXMgd2Ug
bWlnaHQgYXMgd2VsbCBkbyBpdApwcmV0dHkuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29m
dHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFp
bGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
