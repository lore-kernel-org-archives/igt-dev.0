Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
Date: Wed, 15 Aug 2018 14:01:31 +0300
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20180815110131.GA8037@ideak-desk.fi.intel.com>
References: <20180815092511.3838-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180815092511.3838-1-chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t] igt/pm_rpm: Close local fd
 before trying to unload module
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Reply-To: imre.deak@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBBdWcgMTUsIDIwMTggYXQgMTA6MjU6MTFBTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IEZpeGVzOiBkOGU3ODk5MGFhMmIgKCJpZ3QvcG1fcnBtOiBUZXN0IHJlYXF1aXNpdGlv
biBvZiBydW50aW1lLXBtIGFmdGVyIG1vZHVsZSByZWxvYWQiKQo+IFNpZ25lZC1vZmYtYnk6IENo
cmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+IC0tLQo+ICB0ZXN0cy9wbV9y
cG0uYyB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYg
LS1naXQgYS90ZXN0cy9wbV9ycG0uYyBiL3Rlc3RzL3BtX3JwbS5jCj4gaW5kZXggNjU0ODliY2Ri
Li5hNGY5Zjc4M2UgMTAwNjQ0Cj4gLS0tIGEvdGVzdHMvcG1fcnBtLmMKPiArKysgYi90ZXN0cy9w
bV9ycG0uYwo+IEBAIC0yMDM0LDYgKzIwMzQsOCBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAq
YXJndltdKQo+ICAJCXRlYXJkb3duX2Vudmlyb25tZW50KCk7Cj4gIAo+ICAJaWd0X3N1YnRlc3Qo
Im1vZHVsZS1yZWxvYWQiKSB7Cj4gKwkJdGVhcmRvd25fZW52aXJvbm1lbnQoKTsKPiArCgpXaHkg
aXNuJ3QgdGhlIHRlYXJkb3duX2Vudmlyb25tZW50KCk7IHVuZGVyIGlndF9maXh0dXJlIGVub3Vn
aD8KCj4gIAkJaWd0X2RlYnVnKCJSZWxvYWQgdy9vIGRpc3BsYXlcbiIpOwo+ICAJCWlndF9pOTE1
X2RyaXZlcl91bmxvYWQoKTsKPiAgCQlpZ3RfYXNzZXJ0X2VxKGlndF9pOTE1X2RyaXZlcl9sb2Fk
KCJkaXNhYmxlX2Rpc3BsYXk9MSIpLCAwKTsKPiAtLSAKPiAyLjE4LjAKPiAKPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGlndC1kZXYgbWFpbGluZyBs
aXN0Cj4gaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
