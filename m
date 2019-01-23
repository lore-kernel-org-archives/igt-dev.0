Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB366E50B
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jan 2019 16:54:14 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id t24so2224616ioi.0
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jan 2019 08:54:14 -0800 (PST)
MIME-Version: 1.0
References: <20190123140404.11299-1-katarzyna.dec@intel.com>
 <154825274792.693.9396190037053540099@skylake-alporthouse-com>
In-Reply-To: <154825274792.693.9396190037053540099@skylake-alporthouse-com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 23 Jan 2019 17:54:01 +0100
Message-ID: <CAKMK7uFcivmgFaGsi693Og9r4YqP2sx9ODjzjVyS27rQwoACRg@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_gt: Move assert with setting
 'reset' parameter after IGT env check
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
Cc: IGT development <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBKYW4gMjMsIDIwMTkgYXQgMzoxMiBQTSBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlz
LXdpbHNvbi5jby51az4gd3JvdGU6Cj4KPiBRdW90aW5nIEthdGFyenluYSBEZWMgKDIwMTktMDEt
MjMgMTQ6MDQ6MDQpCj4gPiBXZSBhcmUgdHJ5aW5nIHRvIHNldCByZXNldCBwYXJhbWV0ZXIgZWFy
bGllciB0aGFuIGNoZWNraW5nIElHVCBlbnYuCj4gPiBMZXQncyBtb3ZlIGl0IGFmdGVyIGNoZWNr
aW5nIElHVCBlbnYgdG8gYXZvaWQgc2V0dGluZyByZXNldCBwYXJhbWV0ZXIKPiA+IHdoZW4gaGFu
ZyBpbmplY3Rpb24gaXMgZGlzYWJsZWQuCj4gPgo+ID4gQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNA
Y2hyaXMtd2lsc29uLmNvLnVrPgo+ID4gU2lnbmVkLW9mZi1ieTogS2F0YXJ6eW5hIERlYyA8a2F0
YXJ6eW5hLmRlY0BpbnRlbC5jb20+Cj4KPiBJIGNhbiBzZWUgdGhlIHNlbnNlIGluIHRoYXQuIENh
biB3ZSBraWxsIHRoZSBlbnYgdmFyIHRob3VnaD8KPiBSZXZpZXdlZC1ieTogQ2hyaXMgV2lsc29u
IDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4KPiBJZiB0aGUgc3lzdGVtIGlzIG5vdCBzdWl0
YWJsZSBmb3IgcmVzZXQgdGVzdHMsIGNhbiB3ZSBub3QgZGVyaXZlIHRoYXQKPiBmcm9tIHF1ZXJ5
aW5nIHRoZSBzeXN0ZW0gcmF0aGVyIHRoYW4gcmVseSBvbiB0aGUgdXNlcj8gV2UgaGF2ZSBiZXR0
ZXIKPiBtZWFucyBvZiB0ZXN0IHNlbGVjdGlvbiBub3cgdGhhbiBqdXN0IHNldHRpbmcgZW52IHZh
ciAoYW5kIGlmIG5vdCwgd2h5Cj4gbm90KSBzbyBhZmFpayBDSSBpcyBub3QgdXNpbmcgaXQuCgpZ
ZWFoIEkgdGhvdWdodCB0aGUgcGxhbiBmb3IgdGhlc2Ugd2FzIHRvIGFkZCBzb21lIGtlcm5lbCBw
YXRjaCAoaW4KZHJtLWludGVsLWludGVybmFsIG9ubHkgb2ZjKSB3aGljaCB0ZWxscyBpZ3QgdGhh
dCByZXNldCBpc24ndCBhIHRoaW5nLgpXZSd2ZSBkZWZpbml0ZWx5IGhhZCB0aGlzIHllYXJzIGFn
bywgd2hlbiB0aGVyZSB3YXMgbm8gcmVzZXQgb24gZ2VuMi4KQnV0IG1heWJlIHRoZSB3aGVlbHMg
ZmVsbCBvZmYgb24gdGhhdCBvbmUgZHVlIHRvIGxhY2sgb2YgdXNlLCBkdW5uby4KLURhbmllbAot
LSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQx
ICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3Qt
ZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
