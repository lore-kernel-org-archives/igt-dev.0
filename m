Return-Path: <igt-dev-bounces@lists.freedesktop.org>
In-Reply-To: <20190212101601.25562-1-chris@chris-wilson.co.uk>
References: <20190212101601.25562-1-chris@chris-wilson.co.uk>
Date: Tue, 12 Feb 2019 12:56:13 +0200
Message-ID: <87lg2l1diq.fsf@gaia.fi.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] i915/gem_mmap_gtt: Impose a
 timeout for "hang"
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
From: Mika Kuoppala via igt-dev <igt-dev@lists.freedesktop.org>
Reply-To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Q2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+IHdyaXRlczoKCj4gT25seSB3
YWl0IGEgbWF4aW11bSBvZiAyIG1vcmUgc2Vjb25kcyBmb3IgdGhlIGhhbmcgY2hpbGRyZW4gdG8g
Y29tcGxldGUsCj4gdG8gY2F0Y2ggZGVhZGxvY2tzIGluIGEgdGltZWx5IGZhc2hpb24uCj4KPiBT
aWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiBD
YzogTWlrYSBLdW9wcGFsYSA8bWlrYS5rdW9wcGFsYUBpbnRlbC5jb20+Cj4gLS0tCj4gIHRlc3Rz
L2k5MTUvZ2VtX21tYXBfZ3R0LmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUvZ2VtX21tYXBf
Z3R0LmMgYi90ZXN0cy9pOTE1L2dlbV9tbWFwX2d0dC5jCj4gaW5kZXggZjlkODExYWQ2Li5mNmZi
YmUxOTMgMTAwNjQ0Cj4gLS0tIGEvdGVzdHMvaTkxNS9nZW1fbW1hcF9ndHQuYwo+ICsrKyBiL3Rl
c3RzL2k5MTUvZ2VtX21tYXBfZ3R0LmMKPiBAQCAtNDUwLDcgKzQ1MCw3IEBAIHRlc3RfaGFuZyhp
bnQgZmQpCj4gIAlpZ3RfaW5mbygiJWx1IHJlc2V0c1xuIiwgY291bnQpOwo+ICAKPiAgCWNvbnRy
b2wtPmRvbmUgPSB0cnVlOwo+IC0JaWd0X3dhaXRjaGlsZHJlbigpOwo+ICsJaWd0X3dhaXRjaGls
ZHJlbl90aW1lb3V0KDIsIE5VTEwpOwoKU2VlbXMgdGhhdCBuby1vbmUgaXMgdXNpbmcgdGhlIHJl
YXNvbiBhcmd1bWVudC4gWW91IGNvdWxkIGhhdmUKYmVlbiB0aGUgZmlyc3QgZXZlciEKClJldmll
d2VkLWJ5OiBNaWthIEt1b3BwYWxhIDxtaWthLmt1b3BwYWxhQGxpbnV4LmludGVsLmNvbT4KCj4g
IAo+ICAJaWd0X2Fzc2VydCghY29udHJvbC0+ZXJyb3IpOwo+ICAJbXVubWFwKGNvbnRyb2wsIDQw
OTYpOwo+IC0tIAo+IDIuMjAuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBJbnRlbC1nZnggbWFpbGluZyBsaXN0Cj4gSW50ZWwtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaW50ZWwtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRl
dg==
