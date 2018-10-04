Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98C576E25E
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Oct 2018 13:27:09 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id z21-v6so4123010edb.11
 for <igt-dev@lists.freedesktop.org>; Thu, 04 Oct 2018 06:27:09 -0700 (PDT)
Date: Thu, 4 Oct 2018 15:27:05 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20181004132705.GL31561@phenom.ffwll.local>
References: <20181003194349.16674-1-chris@chris-wilson.co.uk>
 <20181004124446.ewjwxv7jzc6zhuv6@ahiler-desk1.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181004124446.ewjwxv7jzc6zhuv6@ahiler-desk1.fi.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] igt: Check drmModeGetResources()
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBPY3QgMDQsIDIwMTggYXQgMDM6NDQ6NDZQTSArMDMwMCwgQXJrYWRpdXN6IEhpbGVy
IHdyb3RlOgo+IE9uIFdlZCwgT2N0IDAzLCAyMDE4IGF0IDA4OjQzOjQ5UE0gKzAxMDAsIENocmlz
IFdpbHNvbiB3cm90ZToKPiA+IElmIEtNUyBpcyBub3Qgc3VwcG9ydGVkIG9uIHRoZSBkZXZpY2Us
IGRybU1vZGVHZXRSZXNvdXJjZXMoKSB3aWxsIHJldHVybgo+ID4gTlVMTCwgb2Z0ZW4gdGhpcyBp
cyBhbiBpbmRpY2F0aW9uIHRoYXQgd2Ugc2hvdWxkIG5vdCBhdHRlbXB0IHRvIHJ1biB0aGUKPiA+
IHRlc3QuIEFsdGhvdWdoIGl0IHdvdWxkIGJlIHByZWZlcnJlZCB0byB1c2Ugc29tZXRoaW5nIGxp
a2UKPiA+IGlndF9yZXF1aXJlX2Rpc3BsYXkoKSBhcyB0aGUgY2Fub25pY2FsIGNoZWNrIGFuZCBh
c3NlcnQgdGhhdAo+ID4gZHJtTW9kZUdldFJlc291cmNlcygpIGRpZCBub3QgaGl0IGFuIGVycm9y
LCBpdCBpcyBub3QgYWx3YXlzIHByYWN0aWNhbAo+ID4gYXMgdGhlIHRlc3RzIGRvIG5vdCB1dGls
aXplIHRoZSBjb21tb24gaWd0X2Rpc3BsYXkgYWJzdHJhY3Rpb24uCj4gPiAKPiA+IFNpZ25lZC1v
ZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+IFJldmlld2Vk
LWJ5OiBBcmthZGl1c3ogSGlsZXIgPGFya2FkaXVzei5oaWxlckBpbnRlbC5jb20+Cj4gCj4gYW5k
IHB1c2hlZAoKSSBzdGlsbCB0aGluayBhIGttc3Rlc3RfcmVxdWlyZSgpIG9yIHNvLCBwbHVzIHRo
ZW4gcmVtb3ZpbmcgdGhlIHBpbGUgb2YKYWRkLWhvdyBpZ3RfcmVxdWlyZSB3ZSBqdXN0IHNwcmlu
a2xlZCBhbGwgb3Zlciwgd291bGQgYmUgbW9yZSBtYWludGFpbmFibGUKbG9uZyB0ZXJtLiBrbXN0
ZXN0X3JlcXVpcmUoKSB3b3VsZCBhbHNvIGFsbG93IHVzIHRvIGRyb3AgYSBub3Qtc28tY3J5cHRp
YwptZXNzYWdlIGludG8gbG9ncy4KLURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBF
bmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxp
c3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
