Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9FE66E8ED
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jul 2018 18:51:36 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180704184705.GU5565@intel.com>
References: <20180704161646.2626-1-ville.syrjala@linux.intel.com>
 <20180704161646.2626-3-ville.syrjala@linux.intel.com>
 <153072249710.15734.16515204671492559138@skylake.alporthouse.com>
 <20180704184705.GU5565@intel.com>
Message-ID: <153073029027.15734.15055003390804201585@skylake.alporthouse.com>
Date: Wed, 04 Jul 2018 19:51:30 +0100
Subject: Re: [igt-dev] [PATCH i-g-t 3/7] lib/rendercopy: Set the upper
 32bits of surface base address on gen8+
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
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBWaWxsZSBTeXJqw6Rsw6QgKDIwMTgtMDctMDQgMTk6NDc6MDUpCj4gT24gV2VkLCBK
dWwgMDQsIDIwMTggYXQgMDU6NDE6MzdQTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+ID4g
UXVvdGluZyBWaWxsZSBTeXJqYWxhICgyMDE4LTA3LTA0IDE3OjE2OjQyKQo+ID4gPiBkaWZmIC0t
Z2l0IGEvbGliL3JlbmRlcmNvcHlfZ2VuOC5jIGIvbGliL3JlbmRlcmNvcHlfZ2VuOC5jCj4gPiA+
IGluZGV4IDQ0MDZhMGEwZTZlYi4uNWE5YmYzMmU2YjliIDEwMDY0NAo+ID4gPiAtLS0gYS9saWIv
cmVuZGVyY29weV9nZW44LmMKPiA+ID4gKysrIGIvbGliL3JlbmRlcmNvcHlfZ2VuOC5jCj4gPiA+
IEBAIC0xNzIsNyArMTcyLDggQEAgZ2VuOF9iaW5kX2J1ZihzdHJ1Y3QgaW50ZWxfYmF0Y2hidWZm
ZXIgKmJhdGNoLAo+ID4gPiAgICAgICAgIGVsc2UgaWYgKGJ1Zi0+dGlsaW5nID09IEk5MTVfVElM
SU5HX1kpCj4gPiA+ICAgICAgICAgICAgICAgICBzcy0+c3MwLnRpbGVkX21vZGUgPSAzOwo+ID4g
PiAgCj4gPiA+IC0gICAgICAgc3MtPnNzOC5iYXNlX2FkZHIgPSBidWYtPmJvLT5vZmZzZXQ7Cj4g
PiA+ICsgICAgICAgc3MtPnNzOC5iYXNlX2FkZHIgPSBidWYtPmJvLT5vZmZzZXQ2NDsKPiA+ID4g
KyAgICAgICBzcy0+c3M5LmJhc2VfYWRkcl9oaSA9IGJ1Zi0+Ym8tPm9mZnNldDY0ID4+IDMyOwo+
ID4gCj4gPiBUbyBiZSBwZWRhbnRpYywgd2UgbWlnaHQgd2FudCB0byB1c2UgZ2VuOF9jYW5vbmlj
YWxfYWRkcih4KQo+ID4geyByZXR1cm4gKGludDY0X3QpKCh1aW50NjRfdCl4IDw8ICg2My00Nykp
ID4+ICg2My00Nyk7IH0KPiAKPiBMb29rcyB0byBtZSBsaWtlIGJvLT5vZmZzZXQ2NCBzaG91bGQg
YWxyZWFkeSBiZSBhIGNhbm9uaWNhbAo+IGFkZHJlc3MgYXMgdGhhdCdzIHdoYXQgdGhlIGtlcm5l
bCBoYW5kcyBiYWNrIG91dCBhZnRlciByZWxvY2F0aW5nLgo+IE9yIGFtIEkgbWlzc2luZyBzb21l
dGhpbmc/CgpJJ20gZXhwZWN0aW5nIGEgKyBkZWx0YSwgd2hpY2ggYXBwYXJlbnRseSBpcyAwIGlu
IGFsbCBjYXNlcy4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRl
dgo=
