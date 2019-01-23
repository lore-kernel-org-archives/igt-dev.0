Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7DA289A20
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jan 2019 14:12:41 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20190123140404.11299-1-katarzyna.dec@intel.com>
In-Reply-To: <20190123140404.11299-1-katarzyna.dec@intel.com>
Message-ID: <154825274792.693.9396190037053540099@skylake-alporthouse-com>
Date: Wed, 23 Jan 2019 14:12:33 +0000
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
To: Katarzyna Dec <katarzyna.dec@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBLYXRhcnp5bmEgRGVjICgyMDE5LTAxLTIzIDE0OjA0OjA0KQo+IFdlIGFyZSB0cnlp
bmcgdG8gc2V0IHJlc2V0IHBhcmFtZXRlciBlYXJsaWVyIHRoYW4gY2hlY2tpbmcgSUdUIGVudi4K
PiBMZXQncyBtb3ZlIGl0IGFmdGVyIGNoZWNraW5nIElHVCBlbnYgdG8gYXZvaWQgc2V0dGluZyBy
ZXNldCBwYXJhbWV0ZXIKPiB3aGVuIGhhbmcgaW5qZWN0aW9uIGlzIGRpc2FibGVkLgo+IAo+IENj
OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiBTaWduZWQtb2ZmLWJ5
OiBLYXRhcnp5bmEgRGVjIDxrYXRhcnp5bmEuZGVjQGludGVsLmNvbT4KCkkgY2FuIHNlZSB0aGUg
c2Vuc2UgaW4gdGhhdC4gQ2FuIHdlIGtpbGwgdGhlIGVudiB2YXIgdGhvdWdoPwpSZXZpZXdlZC1i
eTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CgpJZiB0aGUgc3lzdGVt
IGlzIG5vdCBzdWl0YWJsZSBmb3IgcmVzZXQgdGVzdHMsIGNhbiB3ZSBub3QgZGVyaXZlIHRoYXQK
ZnJvbSBxdWVyeWluZyB0aGUgc3lzdGVtIHJhdGhlciB0aGFuIHJlbHkgb24gdGhlIHVzZXI/IFdl
IGhhdmUgYmV0dGVyCm1lYW5zIG9mIHRlc3Qgc2VsZWN0aW9uIG5vdyB0aGFuIGp1c3Qgc2V0dGlu
ZyBlbnYgdmFyIChhbmQgaWYgbm90LCB3aHkKbm90KSBzbyBhZmFpayBDSSBpcyBub3QgdXNpbmcg
aXQuCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
