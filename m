Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
In-Reply-To: <20190130095500.23596-1-chris@chris-wilson.co.uk>
References: <20190130095500.23596-1-chris@chris-wilson.co.uk>
Date: Wed, 30 Jan 2019 13:07:32 +0200
Message-ID: <87o97ye74b.fsf@gaia.fi.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 1/8] lib: Skip unused fork
 helpers
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
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Q2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+IHdyaXRlczoKCj4gU2tpcCB0
cnlpbmcgdG8gc3RvcCB1bnVzZWQgZm9yayBoZWxwZXJzIHRvIGF2b2lkIHRoZSB2YXJpb3VzIGFz
c2VydHMKPiB0aGF0IHRoZXkgd2VyZSBydW5uaW5nIGFuZCBkaWRuJ3QgZGllIGVhcmx5Lgo+Cj4g
QnVnemlsbGE6IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTEw
OTQ2OAo+IFNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNv
LnVrPgo+IC0tLQo+ICBsaWIvaWd0X2NvcmUuYyB8IDMgKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9saWIvaWd0X2NvcmUuYyBiL2xpYi9pZ3Rf
Y29yZS5jCj4gaW5kZXggNDlmYmY3MGRlLi4wNzk0ZTExYTAgMTAwNjQ0Cj4gLS0tIGEvbGliL2ln
dF9jb3JlLmMKPiArKysgYi9saWIvaWd0X2NvcmUuYwo+IEBAIC0xNjc4LDYgKzE2NzgsOSBAQCB2
b2lkIGlndF9zdG9wX2hlbHBlcihzdHJ1Y3QgaWd0X2hlbHBlcl9wcm9jZXNzICpwcm9jKQo+ICB7
Cj4gIAlpbnQgc3RhdHVzOwo+ICAKPiArCWlmICghcHJvYy0+cnVubmluZykgLyogbmV2ZXIgZXZl
biBzdGFydGVkICovCj4gKwkJcmV0dXJuOwo+ICsKClRoZSBjb21tZW50IGFib3ZlIG1lbnRpb25z
IHRoYXQgaXQgaXMgZXJyb3IgdG8gY2FsbCB0aGlzIG9uIGEgaGVscGVyCnByb2Nlc3Mgd2hpY2gg
aGFzbid0IGJlZW4gc3Bhd25lZCB5ZXQuIFNvIGFzIHdlIHJlbGF4IHRoZSByZXF1aXJlbWVudHMs
CnJlbW92ZSB0aGF0IGNvbW1lbnQuCgpXaXRoIHRoYXQsClJldmlld2VkLWJ5OiBNaWthIEt1b3Bw
YWxhIDxtaWthLmt1b3BwYWxhQGxpbnV4LmludGVsLmNvbT4KCj4gIAkvKiBmYWlsdXJlIGhlcmUg
bWVhbnMgdGhlIHBpZCBpcyBhbHJlYWR5IGRlYWQgYW5kIHNvIHdhaXRpbmcgaXMgc2FmZSAqLwo+
ICAJa2lsbChwcm9jLT5waWQsIHByb2MtPnVzZV9TSUdLSUxMID8gU0lHS0lMTCA6IFNJR1RFUk0p
Owo+ICAKPiAtLSAKPiAyLjIwLjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdAo+IEludGVsLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2ludGVsLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1k
ZXYK
