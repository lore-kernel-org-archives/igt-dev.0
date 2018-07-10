Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C58C56E2ED
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Jul 2018 15:59:49 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20180710153155.31507-1-antonio.argenziano@intel.com>
 <153123710397.18500.4953074989442949108@skylake-alporthouse-com>
 <b2243515-9bb2-d1ad-9af0-4efcd76a5e04@intel.com>
In-Reply-To: <b2243515-9bb2-d1ad-9af0-4efcd76a5e04@intel.com>
Message-ID: <153123837406.18500.8376843987430459341@skylake-alporthouse-com>
Date: Tue, 10 Jul 2018 16:59:44 +0100
Subject: Re: [igt-dev] [PATCH i-g-t v2] lib/hang_ctx: Make use of dummyload
 library to create recursive batch
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
To: Antonio Argenziano <antonio.argenziano@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBbnRvbmlvIEFyZ2Vuemlhbm8gKDIwMTgtMDctMTAgMTY6NDg6MzgpCj4gT24gMTAv
MDcvMTggMDg6MzgsIENocmlzIFdpbHNvbiB3cm90ZToKPiA+IFF1b3RpbmcgQW50b25pbyBBcmdl
bnppYW5vICgyMDE4LTA3LTEwIDE2OjMxOjU1KQo+ID4gT3ZlcmFsbCBJIGFtIHN0aWxsIGR1Ymlv
dXMgdGhlcmUgaXMgYW55IHJlYXNvbiB0byBzZXQgdGhpcyBmbGFnLiBUaGUKPiA+IHJhdGVsaW1p
dGluZyBzdGVwIGhlcmUgaXNuJ3QgdGhlIHNwZWVkIGF0IHdoaWNoIHRoZSBiYXRjaCBzcGlucywg
YnV0IHRoZQo+ID4gdGltZSBmb3IgaGFuZ2NoZWNrIHRvIGtpY2sgaW4uIFdoZXJlIGEgZmFzdCBz
cGlubmVyIGlzIGludGVyZXN0aW5nIGlzCj4gPiB0aGUgbGF0ZW5jeSBpbiByZXNwb25kaW5nIHRv
IHRlcm1pbmF0aW5nIHRoZSBzcGlubmVyICh3aGljaCBuZXZlcgo+ID4gaGFwcGVucyBmb3IgYSBo
YW5nISkuCj4gCj4gVGhlIGZsYWcgbWFrZXMgc2Vuc2UgdG8gbWUgYmVjYXVzZSBoYW5nY2hlY2sg
d2lsbCBhbHdheXMgc2FtcGxlIHRoZSBzYW1lIAo+IGhlYWQgb24gYSB2ZXJ5IHRpZ2h0IGxvb3Ag
bGlrZSB0aGUgZmFzdCBzcGlubmVyLiBUaGUgY3VycmVudCAKPiBpbXBsZW1lbnRhdGlvbiBvZiBo
YW5nY2hlY2sgd2lsbCBhbHNvIGRlY2xhcmUgdGhlIGVuZ2luZSBodW5nIG11Y2ggCj4gcXVpY2tl
ci4KClRydWUsIGJ1dCBJIGRvbid0IHRoaW5rIG11Y2ggbW9yZSB0aGFuIDEgb3IgMiBleHRyYSB0
aWNrcy4gSW4gdGhlIGdyYW5kCnNjaGVtZSBvZiB0aGluZ3MsIHVzaW5nIHRoZSBwb2xsYWJsZSBz
cGlubmVyICsgbWFudWFsIGhhbmcgaW5qZWN0aW9uIGlzCmZhciBmYXIgZmFyIGZhciBmYXIgZmFy
IHF1aWNrZXIgYW5kIHByZWNpc2UuCgo+IEluIGdlbmVyYWwgSSB0aGluayB3ZSBzaG91bGQgZXhw
b3NlIGRpZmZlcmVudCBoYW5naW5nIGJhdGNoIHRvIAo+IHRoZSBkcml2ZXIgdG8gbWFrZSBzdXJl
IGl0IGNhbiByZWFjdCB0byB0aGUgZGlmZmVyZW50IHNpdHVhdGlvbnMuCgpIYXJkZXIgdG8gY2Fs
bCAod2hlcmUgZG8geW91IGRyYXcgdGhlIGxpbmUgYmV0d2VlbiBtZWFuaW5nZnVsIGFuZApoYW5n
aW5nIGJhdGNoKSwgYnV0IHN1Y2ggY29uc3RydWN0aW9uIGlzIGJldHRlciBkb25lIGluc2lkZSB0
aGUgdGVzdAp0aGFuIGluc2lkZSBhIGdlbmVyYWwgcHVycG9zZSBsaWJyYXJ5IChhcyBpdCBpcyBu
byBsb25nZXIgZ2VuZXJhbApwdXJwb3NlKS4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaWd0LWRldgo=
