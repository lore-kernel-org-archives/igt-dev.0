Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Tue, 4 Sep 2018 16:52:39 +0300
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20180904135239.GG23558@ideak-desk.fi.intel.com>
References: <20180904101938.5545-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180904101938.5545-1-chris@chris-wilson.co.uk>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/pm: Increase snd module probe
 timeout to 10s
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: imre.deak@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org, Imre Deak <imre.deak@intel.linux.com>, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBTZXAgMDQsIDIwMTggYXQgMTE6MTk6MzhBTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IDVzIGlzIG9mdGVuIG5vdCBlbm91Z2ggZm9yIHRoZSBzb3VuZCBtb2R1bGUgdG8gZmlu
aXNoIGxvYWRpbmcsIHNvIGJ1bXAKPiB0aGUgdGltZW91dCB0byAxMHMuIEZvciBmdW4sIHBvbGwg
cXVpY2tlciBvdmVyIHRoZSAxcyEKPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNo
cmlzQGNocmlzLXdpbHNvbi5jby51az4KPiBDYzogSW1yZSBEZWFrIDxpbXJlLmRlYWtAaW50ZWwu
bGludXguY29tPgoKUmV2aWV3ZWQtYnk6IEltcmUgRGVhayA8aW1yZS5kZWFrQGludGVsLmNvbT4K
Cj4gLS0tCj4gIGxpYi9pZ3RfcG0uYyB8IDcgKysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9saWIvaWd0X3Bt
LmMgYi9saWIvaWd0X3BtLmMKPiBpbmRleCBlODZmYTRhNDAuLjYxNTQ2M2EwOCAxMDA2NDQKPiAt
LS0gYS9saWIvaWd0X3BtLmMKPiArKysgYi9saWIvaWd0X3BtLmMKPiBAQCAtMjU4LDEyICsyNTgs
MTUgQEAgdm9pZCBpZ3RfcG1fZW5hYmxlX2F1ZGlvX3J1bnRpbWVfcG0odm9pZCkKPiAgCWlmIChf
X2lndF9wbV9hdWRpb19ydW50aW1lX3Bvd2VyX3NhdmVbMF0pCj4gIAkJcmV0dXJuOwo+ICAKPiAt
CWZvciAoaW50IGNvdW50ID0gMDsgY291bnQgPCA1OyBjb3VudCsrKSB7Cj4gKwlmb3IgKGludCBj
b3VudCA9IDA7IGNvdW50IDwgMTEwOyBjb3VudCsrKSB7Cj4gIAkJaWYgKCFfX2lndF9wbV9lbmFi
bGVfYXVkaW9fcnVudGltZV9wbSgpKQo+ICAJCQlyZXR1cm47Cj4gIAo+ICAJCS8qIG1vZHByb2Jl
KHNuYS1oZGEtaW50ZWwpIGFjdHMgYXN5bmMgc28gcG9sbCBmb3Igc3lzZnMgKi8KPiAtCQlzbGVl
cCgxKTsKPiArCQlpZiAoY291bnQgPCAxMDApCj4gKwkJCXVzbGVlcCgxMCAqIDEwMDApOyAvKiBw
b2xsIGF0IDEwbXMgZm9yIHRoZSBmaXJzdCAxcyAqLwo+ICsJCWVsc2UKPiArCQkJc2xlZXAoMSk7
Cj4gIAl9Cj4gIAo+ICAJZXJyID0gX19pZ3RfcG1fZW5hYmxlX2F1ZGlvX3J1bnRpbWVfcG0oKTsK
PiAtLSAKPiAyLjE5LjAucmMxCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBpZ3QtZGV2IG1haWxpbmcgbGlzdAo+IGlndC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pZ3QtZGV2Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
