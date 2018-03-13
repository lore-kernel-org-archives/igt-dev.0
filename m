Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D1946E61D
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Mar 2018 21:19:18 +0000 (UTC)
Date: Tue, 13 Mar 2018 23:19:14 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20180313211914.GC5453@intel.com>
References: <20180312204224.31557-2-ville.syrjala@linux.intel.com>
 <20180313183013.24368-1-ville.syrjala@linux.intel.com>
 <152097459933.515.1890704959553501946@mail.alporthouse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <152097459933.515.1890704959553501946@mail.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/3] lib: Parse plane IN_FORMATS
 blobifiers into a nicer form
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
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBNYXIgMTMsIDIwMTggYXQgMDg6NTY6MzlQTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFF1b3RpbmcgVmlsbGUgU3lyamFsYSAoMjAxOC0wMy0xMyAxODozMDoxMykKPiA+ICsg
ICAgICAgZm9yIChpbnQgaSA9IDA7IGkgPCBibG9iX2RhdGEtPmNvdW50X21vZGlmaWVyczsgaSsr
KSB7Cj4gPiArICAgICAgICAgICAgICAgZm9yIChpbnQgaiA9IDA7IGogPCA2NDsgaisrKSB7Cj4g
PiArICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgZHJtX2Zvcm1hdF9tb2RpZmll
ciAqbW9kaWZpZXJzID0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbW9kaWZp
ZXJzX3B0cihibG9iX2RhdGEpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgdWlu
dDMyX3QgKmZvcm1hdHMgPSBmb3JtYXRzX3B0cihibG9iX2RhdGEpOwo+ID4gKwo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgaWYgKCEobW9kaWZpZXJzW2ldLmZvcm1hdHMgJiAoMVVMTCA8PCBq
KSkpCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ID4gKwo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcGxhbmUtPmZvcm1hdHNbaWR4XSA9IGZvcm1hdHNb
bW9kaWZpZXJzW2ldLm9mZnNldCArIGpdOwo+IAo+IFNvIGZhciBldmVyeXRoaW5nIGhhcyBiZWVu
IGJ5dGUgb2Zmc2V0LCBidXQgZm9yIGRybV9mb3JtYXRfbW9kaWZpZXIgeW91Cj4gbm93IHN3aXRj
aCB0byBhbiBpbmRleCBvZmZzZXQuIEluIGRybV9wbGFuZS5jLCBJIG9ubHkgZm91bmQKPiBkcm1f
Zm9ybWF0X21vZGlmaWVyLm9mZnNldCA9IDAgYW5kIG5vIGV4YW1wbGVzIG9mIGEgbm9uLXplcm8g
b2Zmc2V0IHRvCj4gY2hlY2sgYWdhaW5zdC4KPiAKPiBJIHByZXN1bWUgeW91IGtub3cgd2hhdCB5
b3UgYXJlIGRvaW5nLiA6KQoKUG9zc2libHkuIElJUkMgdGhlIG9mZnNldCBpcyB3YXMganVzdCBz
dXBwb3NlZCB0byBiZSBuKjY0IHRvIGluZGV4IG1vcmUKdGhhbiA2NCBmb3JtYXRzLiBCdXQgb2Yg
Y291cnNlIGl0J3MgYWxsIHZlcnkgbXVjaCB0aGVvcmV0aWNhbCB1bnRpbCBhCnBsYW5lIGV4cG9z
ZXMgdGhhdCBtYW55IGZvcm1hdHMuCgo+IAo+IE90aGVyd2lzZSB0aGUgY29kZSBsb29rcyBjb25z
aXN0ZW50IHdpdGggaXRzZWxmIGFuZCBkcm1fcGxhbmUuYwo+IAo+IFJldmlld2VkLWJ5OiBDaHJp
cyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiAtQ2hyaXMKCi0tIApWaWxsZSBT
eXJqw6Rsw6QKSW50ZWwgT1RDCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRl
dgo=
