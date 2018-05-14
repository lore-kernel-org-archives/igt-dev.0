Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3218A89E08
 for <igt-dev@lists.freedesktop.org>; Mon, 14 May 2018 15:41:41 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20180320134741.1442-1-lionel.g.landwerlin@intel.com>
 <e6742fcd-0991-d82a-ff79-10a9df2399c0@intel.com>
In-Reply-To: <e6742fcd-0991-d82a-ff79-10a9df2399c0@intel.com>
Message-ID: <152631249623.18532.11999646930988436290@mail.alporthouse.com>
Date: Mon, 14 May 2018 16:41:36 +0100
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib: intel: report GT size from the
 database if available
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBMaW9uZWwgTGFuZHdlcmxpbiAoMjAxOC0wNS0xNCAxNDoxNTowMSkKPiBQaW5nPwo+
IAo+IE9uIDIwLzAzLzE4IDEzOjQ3LCBMaW9uZWwgTGFuZHdlcmxpbiB3cm90ZToKPiA+IFRoZSBz
Y2hlbWUgaWYgZ2V0dGluZyB0aGUgR1Qgc2l6ZSBmcm9tIHRoZSBQQ0ktaWQgZG9lc24ndCB3b3Jr
IGFueW1vcmUKPiA+IG9uIENvZmZlZWxha2UuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogTGlvbmVs
IExhbmR3ZXJsaW4gPGxpb25lbC5nLmxhbmR3ZXJsaW5AaW50ZWwuY29tPgo+ID4gQnVnemlsbGE6
IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTEwNTQ1MSwgaHR0
cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTAxNzQwCj4gPiAtLS0K
PiA+ICAgbGliL2ludGVsX2RldmljZV9pbmZvLmMgfCA5ICsrKysrKysrKwo+ID4gICAxIGZpbGUg
Y2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2xpYi9pbnRlbF9k
ZXZpY2VfaW5mby5jIGIvbGliL2ludGVsX2RldmljZV9pbmZvLmMKPiA+IGluZGV4IDFjNzEwNzMz
Li5jMTA0YzljNCAxMDA2NDQKPiA+IC0tLSBhL2xpYi9pbnRlbF9kZXZpY2VfaW5mby5jCj4gPiAr
KysgYi9saWIvaW50ZWxfZGV2aWNlX2luZm8uYwo+ID4gQEAgLTQxMCw4ICs0MTAsMTcgQEAgdW5z
aWduZWQgaW50ZWxfZ2VuKHVpbnQxNl90IGRldmlkKQo+ID4gICAgKi8KPiA+ICAgdW5zaWduZWQg
aW50ZWxfZ3QodWludDE2X3QgZGV2aWQpCj4gPiAgIHsKPiA+ICsgICAgIGNvbnN0IHN0cnVjdCBp
bnRlbF9kZXZpY2VfaW5mbyAqZGV2aW5mbyA9IGludGVsX2dldF9kZXZpY2VfaW5mbyhkZXZpZCk7
Cj4gPiAgICAgICB1bnNpZ25lZCBtYXNrID0gaW50ZWxfZ2VuKGRldmlkKTsKPiA+ICAgCj4gPiAr
ICAgICAvKiBJZiBpbiB0aGUgZGF0YWJhc2UsIGp1c3QgdXNlIHRoYXQgaW5mb3JtYXRpb24uICov
Cj4gPiArICAgICBpZiAoZGV2aW5mby0+Z3QgIT0gMCkKPiA+ICsgICAgICAgICAgICAgcmV0dXJu
IGRldmluZm8tPmd0IC0gMTsKPiA+ICsKPiA+ICsgICAgIC8qCj4gPiArICAgICAgKiBUaGlzIHNj
aGVtZSBkb2Vzbid0IHdvcmsgb24gQ29mZmVlbGFrZSwgd2Ugc2hvdWxkIHByb2JhYmx5Cj4gPiAr
ICAgICAgKiBub3QgcmVseSBvbiB0aGlzIGFueW1vcmUuCj4gPiArICAgICAgKi8KCkkgZG9uJ3Qg
Z2V0IHRoaXMgY29tbWVudCBpbiBsaWdodCBvZiB0aGUgYWJvdmUuIElmIHlvdSBhcmUgYWRkaW5n
IGEKcHJlZmVycmVkIG1lY2hhbmlzbSwgd2h5IGNvbXBsYWluIGFib3V0IHRoZSBzdHVmZiB5b3Ug
aGF2ZW4ndCBjb252ZXJ0PwotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
Z3QtZGV2Cg==
