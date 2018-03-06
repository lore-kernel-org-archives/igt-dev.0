Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm0-x242.google.com (mail-wm0-x242.google.com
 [IPv6:2a00:1450:400c:c09::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 607F76E04A
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Mar 2018 14:58:45 +0000 (UTC)
Received: by mail-wm0-x242.google.com with SMTP id h21so23331099wmd.1
 for <igt-dev@lists.freedesktop.org>; Tue, 06 Mar 2018 06:58:45 -0800 (PST)
Date: Tue, 6 Mar 2018 15:58:41 +0100
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20180306145841.GQ22212@phenom.ffwll.local>
References: <20180223111058.30973-1-petri.latvala@intel.com>
 <87zi3zlpwx.fsf@anholt.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87zi3zlpwx.fsf@anholt.net>
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] meson: Don't build docs when
 cross-compiling
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
To: Eric Anholt <eric@anholt.net>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCBGZWIgMjMsIDIwMTggYXQgMDY6NTE6NThBTSAtMDgwMCwgRXJpYyBBbmhvbHQgd3Jv
dGU6Cj4gUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+IHdyaXRlczoKPiAK
PiA+IEJ1aWxkaW5nIGRvY3VtZW50YXRpb24gcmVxdWlyZXMgZXhlY3V0aW5nIGFsbCB0ZXN0IGJp
bmFyaWVzIHRvIHByb2R1Y2UKPiA+IHRoZWlyIHJlc3BlY3RpdmUgZGVzY3JpcHRpb24gdGV4dHMu
IFRoaXMgY2FuIGJlIGEgdmVyeSB0aW1lLWNvbnN1bWluZwo+ID4gcHJvY2VzcywgaWYgdmlhYmxl
IGF0IGFsbCwgd2hlbiB0aGUgdGFyZ2V0IGFyY2ggZGlmZmVycyBmcm9tIHRoZQo+ID4gaG9zdC4K
PiA+Cj4gPiBEb24ndCBwcm9jZXNzIHRoZSBkb2MgZGlyZWN0b3J5IGF0IGFsbCB3aGVuIGFuIGV4
ZSB3cmFwcGVyIGlzCj4gPiBzZXR1cC4gVGhpcyBhdm9pZHMgdGhlIHJ1bnRpbWUgcGVuYWx0eSB3
aGVuIHRoZSB0YXJnZXQgYmluYXJpZXMgYXJlCj4gPiBleGVjdXRlZCB0aHJvdWdoIHFlbXUsIGJ1
dCBsZWF2ZXMgZXZlcnl0aGluZyBhcy1pcyB3aGVuIHRoZSB0YXJnZXQKPiA+IGJpbmFyaWVzIGNh
biBiZSBkaXJlY3RseSBleGVjdXRlZCwgbGlrZSB3aGVuIGNyb3NzLWNvbXBpbGluZyB0byB4ODYK
PiA+IGZyb20geDg2XzY0IGhvc3QuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogUGV0cmkgTGF0dmFs
YSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+Cj4gPiBDYzogRXJpYyBBbmhvbHQgPGVyaWNAYW5o
b2x0Lm5ldD4KPiAKPiBSZXZpZXdlZC1ieTogRXJpYyBBbmhvbHQgPGVyaWNAYW5ob2x0Lm5ldD4K
ClJlYXNvbmFibGUgZHVjdC10YXBlIGZvciBub3csIEknbSB3b3JraW5nIG9uIGEgcHJvcGVyIGZp
eCAoYnV0IHRoYXQgYWxzbwpuZWVkcyBzb21lIHVwc3RyZWFtIG1lc29uIGZpeGVzKS4KLURhbmll
bAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24K
aHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3Qt
ZGV2Cg==
