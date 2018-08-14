Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180814135216.GB2915@ideak-desk.fi.intel.com>
References: <20180810070116.29667-1-chris@chris-wilson.co.uk>
 <20180814135216.GB2915@ideak-desk.fi.intel.com>
Message-ID: <153425538112.31398.6244248679090983549@skylake-alporthouse-com>
Date: Tue, 14 Aug 2018 15:03:01 +0100
Subject: Re: [Intel-gfx] [PATCH i-g-t 1/2] igt/pm_rpm: Test
 incomplete(debug) suspends vs rpm
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Imre Deak <imre.deak@intel.com>
Cc: igt-dev@lists.freedesktop.org, imre.deak@linux.intel.com, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBJbXJlIERlYWsgKDIwMTgtMDgtMTQgMTQ6NTI6MTYpCj4gT24gRnJpLCBBdWcgMTAs
IDIwMTggYXQgMDg6MDE6MTVBTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+ID4gQ2hlY2sg
dGhhdCB3ZSByZXN0b3JlIHJ1bnRpbWUgcG0gYXJvdW5kIGRlYnVnIHN1c3BlbmRzIGFuZCBoaWJl
cm5hdGVzLgo+ID4gCj4gPiB2MjogRGlmZmVyZW50aWF0ZSBiZXR3ZWVuIGV4dGVybmFsIHRlc3Qg
c2V0dXAgZmFpbHVyZSBhbmQgb25lIG9mCj4gPiBpbnRlcmVzdAo+ID4gCj4gPiBTaWduZWQtb2Zm
LWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiA+IC0tLQo+ID4g
IHRlc3RzL3BtX3JwbS5jIHwgMTggKysrKysrKysrKysrKystLS0tCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDE0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQg
YS90ZXN0cy9wbV9ycG0uYyBiL3Rlc3RzL3BtX3JwbS5jCj4gPiBpbmRleCA0MjY4YmIxOWEuLjFm
YmRkYTRlZCAxMDA2NDQKPiA+IC0tLSBhL3Rlc3RzL3BtX3JwbS5jCj4gPiArKysgYi90ZXN0cy9w
bV9ycG0uYwo+ID4gQEAgLTcwNyw4ICs3MDcsMTAgQEAgc3RhdGljIHZvaWQgc2V0dXBfZW52aXJv
bm1lbnQodm9pZCkKPiA+ICAKPiA+ICAgICAgIGlndF9pbmZvKCJSdW50aW1lIFBNIHN1cHBvcnQ6
ICVkXG4iLCBoYXNfcnVudGltZV9wbSk7Cj4gPiAgICAgICBpZ3RfaW5mbygiUEM4IHJlc2lkZW5j
eSBzdXBwb3J0OiAlZFxuIiwgaGFzX3BjOCk7Cj4gPiAtCj4gPiAgICAgICBpZ3RfcmVxdWlyZSho
YXNfcnVudGltZV9wbSk7Cj4gPiArCj4gPiArICAgICBkaXNhYmxlX2FsbF9zY3JlZW5zKCZtc19k
YXRhKTsKPiA+ICsgICAgIGlndF9yZXF1aXJlKHdhaXRfZm9yX3N1c3BlbmRlZCgpKTsKPiAKPiBG
b3Igc29tZSBzdWJ0ZXN0cyAoZS5nLiBiYXNpYy1ydGUpIHRoaXMgY2hlY2sgaXMgdGhlIG9ubHkg
KHJlYWwpCj4gcHVycG9zZS4gU28gc2hvdWxkbid0IHRoaXMgYmUgYWRkZWQgdG8gc3BlY2lmaWMg
c3VidGVzdHMgaW5zdGVhZCAoZS5nLgo+IHRoZSBzeXN0ZW0gc3VzcGVuZCBvbmVzKSB0byBhdm9p
ZCBjb252ZXJ0aW5nIGZhaWwgdG8gc2tpcD8KClRoZSBmbGlwIGZsb3AgZnJvbSBQQVNTL1NLSVAg
aXMgc3RpbGwgc2lnbmlmaWNhbnQsIHNvIEkgZG9uJ3Qgd29ycnkgdG9vCm11Y2guIFdpdGggYSBs
aXR0bGUgdHdlYWssIGl0IHNoYWxsIGJlIGRvbmUuCi1DaHJpcwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVs
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
