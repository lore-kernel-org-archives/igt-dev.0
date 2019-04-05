Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from 9.mo68.mail-out.ovh.net (9.mo68.mail-out.ovh.net
 [46.105.78.111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F0636E085
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2019 08:35:29 +0000 (UTC)
Received: from player699.ha.ovh.net (unknown [10.109.160.232])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id 6BF831206AC
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2019 10:35:26 +0200 (CEST)
Date: Fri, 5 Apr 2019 11:35:20 +0300
From: Andi Shyti <andi@etezian.org>
Message-ID: <20190405083520.GD18786@jack.zhora.eu>
References: <20190405010737.19111-1-andi@etezian.org>
 <20190405010737.19111-3-andi@etezian.org>
 <155445117093.8259.8706988676557218468@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <155445117093.8259.8706988676557218468@skylake-alporthouse-com>
Subject: Re: [igt-dev] [PATCH v17 2/7] lib: ioctl_wrappers: reach engines by
 index as well
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: IGT dev <igt-dev@lists.freedesktop.org>, Andi Shyti <andi@etezian.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCBBcHIgMDUsIDIwMTkgYXQgMDg6NTk6MzBBTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFF1b3RpbmcgQW5kaSBTaHl0aSAoMjAxOS0wNC0wNSAwMjowNzozMikKPiA+IEZyb206
IEFuZGkgU2h5dGkgPGFuZGkuc2h5dGlAaW50ZWwuY29tPgo+ID4gCj4gPiBXaXRoIHRoZSBuZXcg
ZW5naW5lIHF1ZXJ5IG1ldGhvZCBlbmdpbmVzIGFyZSByZWFjaGFibGUgdGhyb3VnaAo+ID4gYW4g
aW5kZXggYW5kIGNvbnRleHQgdGhleSBhcmUgY29tYmluZWQgd2l0aC4KPiA+IAo+ID4gVGhlICdn
ZW1faGFzX3JpbmcoKScgYmVjb21lcyAnZ2VtX2NvbnRleHRfaGFzX2VuZ2luZSgpJyB0aGF0Cj4g
PiByZXF1aXJlcyB0aGUgaW5kZXggdGhhdCB0aGUgZW5naW5lIGlzIG1hcHBlZCB3aXRoaW4gdGhl
IGRyaXZlci4KPiA+IFRoZSBmdW5jdGlvbiBoYXMgYmVlbiBtb3ZlZCBmcm9tIGxpYi9pb2N0bF93
YXBwZXJzIHRvCj4gPiBsaWIvaTkxNS9nZW1fY29udGV4dCB3aGVyZSBpdCBpcyBtb3JlIGFwcHJv
cHJpYXRlLgo+ID4gCj4gPiBUaGUgcHJldmlvdXMgJ2dlbV9oYXNfcmluZygpJyBmdW5jdGlvbiBi
ZWNvbWVzIGEgd3JhcHBlciB0byB0aGUKPiA+IG5ldyAnZ2VtX2NvbnRleHRfaGFzX2VuZ2luZSgp
Jy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogQW5kaSBTaHl0aSA8YW5kaS5zaHl0aUBpbnRlbC5j
b20+Cj4gPiBSZXZpZXdlZC1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28u
dWs+Cj4gPiBSZXZpZXdlZC1ieTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVs
LmNvbT4KPiA+IC0tLQo+ID4gIGxpYi9pOTE1L2dlbV9jb250ZXh0LmMgfCAyNyArKysrKysrKysr
KysrKysrKysrKysrKysrKysKPiA+ICBsaWIvaTkxNS9nZW1fY29udGV4dC5oIHwgIDIgKysKPiA+
ICBsaWIvaW9jdGxfd3JhcHBlcnMuYyAgIHwgMTkgLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gIGxp
Yi9pb2N0bF93cmFwcGVycy5oICAgfCAgMyArKy0KPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDMxIGlu
c2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvbGliL2k5
MTUvZ2VtX2NvbnRleHQuYyBiL2xpYi9pOTE1L2dlbV9jb250ZXh0LmMKPiA+IGluZGV4IDhiNGQ1
YjcwNDY1MC4uNDg4ZjQ5NzFjNDQ4IDEwMDY0NAo+ID4gLS0tIGEvbGliL2k5MTUvZ2VtX2NvbnRl
eHQuYwo+ID4gKysrIGIvbGliL2k5MTUvZ2VtX2NvbnRleHQuYwo+ID4gQEAgLTI3MSwzICsyNzEs
MzAgQEAgdm9pZCBnZW1fY29udGV4dF9zZXRfcHJpb3JpdHkoaW50IGZkLCB1aW50MzJfdCBjdHhf
aWQsIGludCBwcmlvKQo+ID4gIHsKPiA+ICAgICAgICAgaWd0X2Fzc2VydF9lcShfX2dlbV9jb250
ZXh0X3NldF9wcmlvcml0eShmZCwgY3R4X2lkLCBwcmlvKSwgMCk7Cj4gPiAgfQo+ID4gKwo+ID4g
K2Jvb2wgZ2VtX2NvbnRleHRfaGFzX2VuZ2luZShpbnQgZmQsIHVpbnQ2NF90IGN0eCwgdWludDY0
X3QgZW5naW5lKQo+IAo+IERlc3BpdGUgYXBwZWFyYW5jZXMsIGN0eCBpcyBvbmx5IGEgdTMyLiBB
bmQgcnN2ZDEgaGFzIHRoZSB1cHBlciAzMmJpdHMKPiBzdGlsbCB1bmFzc2lnbmVkLiBMZWZ0IGVu
Z2luZSBhcyB1aW50NjRfdCwgZmVlbHMgb3ZlcmtpbGwgYnV0IGZsYWdzIGlzIGEKPiBmdWxsIDY0
YiBhbmQgdGhlcmUgbWF5IGJlIGdvb2QgcmVhc29uIHRvIHN0dWZmIGV4dHJhIGZsYWdzIHRocm91
Z2ggdGhpcwo+IGludGVyZmFjZSAodGhvdWdoIHRoYXQgbWF5IGJlIHJpZ2h0ZnVsbHkgY29uc2lk
ZXJlZCBhYnVzZSkuCgpUaGFua3MsIENocmlzIQoKQW5kaQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2lndC1kZXY=
