Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C48B06E463
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Dec 2018 21:27:07 +0000 (UTC)
Message-ID: <10f881c3d24970952303b1a68e8b20969fedeb63.camel@intel.com>
From: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Date: Tue, 11 Dec 2018 13:27:04 -0800
In-Reply-To: <20181211161608.7345-1-maarten.lankhorst@linux.intel.com>
References: <20181211161608.7345-1-maarten.lankhorst@linux.intel.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] PSR: Bump wait for active timeout to
 2.5s
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: dhinakaran.pandiyan@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCAyMDE4LTEyLTExIGF0IDE3OjE2ICswMTAwLCBNYWFydGVuIExhbmtob3JzdCB3cm90
ZToKPiBUeXBpY2FsbHkgUFNSIGVuYWJsZXMgaW4gYXJvdW5kIDEzNiBtcywgYnV0IHdoZW4gZW5h
YmxpbmcgMgo+IHNjcmVlbnMsIDUwMCBtcyBpcyBub3QgZW5vdWdoIG9uIGljZWxha2Ugc29tZXRp
bWVzLCBzbyBidW1wCj4gaXQgYSBiaXQgaGlnaGVyLgo+IAo+IE9uIGttc19mcm9udGJ1ZmZlcl90
cmFja2luZzoKPiBTdGFydGluZyBzdWJ0ZXN0OiBwc3ItMnAtc2NuZHNjcm4tc2hyZmItcGxmbGlw
LWJsdAo+IHBzcl9hY3RpdmUoZGVidWdmc19mZCwgdHJ1ZSkgdG9vayAxMzZtcwo+IHBzcl9hY3Rp
dmUoZGVidWdmc19mZCwgdHJ1ZSkgdG9vayAxMzZtcwo+IHBzcl9hY3RpdmUoZGVidWdmc19mZCwg
dHJ1ZSkgdG9vayAzNTBtcwo+IHBzcl9hY3RpdmUoZGVidWdmc19mZCwgdHJ1ZSkgdG9vayAxMzZt
cwo+IHBzcl9hY3RpdmUoZGVidWdmc19mZCwgdHJ1ZSkgdG9vayAxNTk4bXMKCldlIGhhdmUgdG8g
ZmluZCBvdXQgd2h5IGl0IHRvb2sgdGhhdCBsb25nLCB+OTYgZnJhbWVzIGV4Y2VlZHMgdGhlIGlk
bGUKZnJhbWUgbGltaXQgd2Ugc2V0IGluIHRoZSBkcml2ZXIuIEknbSBjb25jZXJuZWQgd2UgbWln
aHQgYmUgY292ZXJpbmcgdXAKYSBidWcgYnkgaW5jcmVhc2luZyB0aGUgbGltaXQgc28gaGlnaC4K
Ci1ESwoKPiAKPiBDYzogRGhpbmFrYXJhbiBQYW5kaXlhbiA8ZGhpbmFrYXJhbi5wYW5kaXlhbkBp
bnRlbC5jb20+Cj4gQ2M6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwu
Y29tPgo+IEJ1Z3ppbGxhOiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNn
aT9pZD0xMDg3MzMKPiAtLS0KPiAgbGliL2lndF9wc3IuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2xpYi9p
Z3RfcHNyLmMgYi9saWIvaWd0X3Bzci5jCj4gaW5kZXggMGRkZmI2NGYwZTcyLi4yNjU1MjEyMTdh
MmQgMTAwNjQ0Cj4gLS0tIGEvbGliL2lndF9wc3IuYwo+ICsrKyBiL2xpYi9pZ3RfcHNyLmMKPiBA
QCAtMzksNyArMzksNyBAQCBzdGF0aWMgYm9vbCBwc3JfYWN0aXZlKGludCBkZWJ1Z2ZzX2ZkLCBi
b29sCj4gY2hlY2tfYWN0aXZlKQo+ICAKPiAgYm9vbCBwc3Jfd2FpdF9lbnRyeShpbnQgZGVidWdm
c19mZCkKPiAgewo+IC0JcmV0dXJuIGlndF93YWl0KHBzcl9hY3RpdmUoZGVidWdmc19mZCwgdHJ1
ZSksIDUwMCwgMjApOwo+ICsJcmV0dXJuIGlndF93YWl0KHBzcl9hY3RpdmUoZGVidWdmc19mZCwg
dHJ1ZSksIDI1MDAsIDIwKTsKPiAgfQo+ICAKPiAgYm9vbCBwc3Jfd2FpdF9leGl0KGludCBkZWJ1
Z2ZzX2ZkKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
aWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
