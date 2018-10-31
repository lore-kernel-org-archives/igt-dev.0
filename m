Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2830D6E250
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Oct 2018 09:12:19 +0000 (UTC)
Date: Wed, 31 Oct 2018 10:12:15 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <20181031091215.frxufoeoexfx2fu2@mwiniars-main.ger.corp.intel.com>
References: <20181029193729.13788-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181029193729.13788-1-chris@chris-wilson.co.uk>
Subject: Re: [igt-dev] [PATCH i-g-t] igt/gem_ppgtt: Unroll 32b memset
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

T24gTW9uLCBPY3QgMjksIDIwMTggYXQgMDc6Mzc6MjlQTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IE1hbnVhbGx5IHVucm9sbCB0aGUgMzJiIG1lbXNldCBpbiBjcmVhdGVfYm8oKSB0byBz
ZXQgYSBjYWNoZWxpbmUgYXQgYQo+IHRpbWUsIGZvciBhIDJ4IHNwZWVkIGltcHJvdmUgb2YgdGhl
IHdob2xlIHRlc3QuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJp
cy13aWxzb24uY28udWs+CgpSZXZpZXdlZC1ieTogTWljaGHFgiBXaW5pYXJza2kgPG1pY2hhbC53
aW5pYXJza2lAaW50ZWwuY29tPgoKLU1pY2hhxYIKCj4gLS0tCj4gIHRlc3RzL2k5MTUvZ2VtX3Bw
Z3R0LmMgfCAxMCArKysrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUvZ2VtX3BwZ3R0LmMg
Yi90ZXN0cy9pOTE1L2dlbV9wcGd0dC5jCj4gaW5kZXggYWY1ZTNlMDcuLjg2ZmU1OWYyIDEwMDY0
NAo+IC0tLSBhL3Rlc3RzL2k5MTUvZ2VtX3BwZ3R0LmMKPiArKysgYi90ZXN0cy9pOTE1L2dlbV9w
cGd0dC5jCj4gQEAgLTQ3LDE2ICs0NywyMCBAQAo+ICBzdGF0aWMgZHJtX2ludGVsX2JvICpjcmVh
dGVfYm8oZHJtX2ludGVsX2J1Zm1nciAqYnVmbWdyLAo+ICAJCQkgICAgICAgdWludDMyX3QgcGl4
ZWwpCj4gIHsKPiArCXVpbnQ2NF90IHZhbHVlID0gKHVpbnQ2NF90KXBpeGVsIDw8IDMyIHwgcGl4
ZWwsICp2Owo+ICAJZHJtX2ludGVsX2JvICpibzsKPiAtCXVpbnQzMl90ICp2Owo+ICAKPiAgCWJv
ID0gZHJtX2ludGVsX2JvX2FsbG9jKGJ1Zm1nciwgInN1cmZhY2UiLCBTSVpFLCA0MDk2KTsKPiAg
CWlndF9hc3NlcnQoYm8pOwo+ICAKPiAgCWRvX29yX2RpZShkcm1faW50ZWxfYm9fbWFwKGJvLCAx
KSk7Cj4gIAl2ID0gYm8tPnZpcnR1YWw7Cj4gLQlmb3IgKGludCBpID0gMDsgaSA8IFNJWkUvNDsg
aSsrKQo+IC0JCXZbaV0gPSBwaXhlbDsKPiArCWZvciAoaW50IGkgPSAwOyBpIDwgU0laRSAvIHNp
emVvZih2YWx1ZSk7IGkgKz0gOCkgewo+ICsJCXZbaSArIDBdID0gdmFsdWU7IHZbaSArIDFdID0g
dmFsdWU7Cj4gKwkJdltpICsgMl0gPSB2YWx1ZTsgdltpICsgM10gPSB2YWx1ZTsKPiArCQl2W2kg
KyA0XSA9IHZhbHVlOyB2W2kgKyA1XSA9IHZhbHVlOwo+ICsJCXZbaSArIDZdID0gdmFsdWU7IHZb
aSArIDddID0gdmFsdWU7Cj4gKwl9Cj4gIAlkcm1faW50ZWxfYm9fdW5tYXAoYm8pOwo+ICAKPiAg
CXJldHVybiBibzsKPiAtLSAKPiAyLjE5LjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IGlndC1kZXYgbWFpbGluZyBsaXN0Cj4gaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2lndC1kZXYKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3Qt
ZGV2Cg==
