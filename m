Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F7D089C56
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2019 09:14:53 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190319234441.1449-3-andi.shyti@intel.com>
References: <20190319234441.1449-1-andi.shyti@intel.com>
 <20190319234441.1449-3-andi.shyti@intel.com>
Message-ID: <155307326784.8718.7766742821102638266@skylake-alporthouse-com>
Date: Wed, 20 Mar 2019 09:14:28 +0000
Subject: Re: [igt-dev] [PATCH v13 2/9] lib: ioctl_wrappers: reach engines by
 index as well
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
To: Andi Shyti <andi.shyti@intel.com>, IGT dev <igt-dev@lists.freedesktop.org>
Cc: Andi Shyti <andi@etezian.org>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBbmRpIFNoeXRpICgyMDE5LTAzLTE5IDIzOjQ0OjM0KQo+IFdpdGggdGhlIG5ldyBl
bmdpbmUgcXVlcnkgbWV0aG9kIGVuZ2luZXMgYXJlIHJlYWNoYWJsZSB0aHJvdWdoCj4gYW4gaW5k
ZXggYW5kIGNvbnRleHQgdGhleSBhcmUgY29tYmluZWQgd2l0aC4KPiAKPiBUaGUgJ2dlbV9oYXNf
cmluZygpJyBiZWNvbWVzICdnZW1fY29udGV4dF9oYXNfZW5naW5lKCknIHRoYXQKPiByZXF1aXJl
cyB0aGUgaW5kZXggdGhhdCB0aGUgZW5naW5lIGlzIG1hcHBlZCB3aXRoaW4gdGhlIGRyaXZlci4K
PiAKPiBUaGUgcHJldmlvdXMgJ2dlbV9oYXNfcmluZygpJyBmdW5jdGlvbiBiZWNvbWVzIGEgd3Jh
cHBlciB0byB0aGUgbmV3Cj4gJ2dlbV9jb250ZXh0X2hhc19lbmdpbmUoKScuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBBbmRpIFNoeXRpIDxhbmRpLnNoeXRpQGludGVsLmNvbT4KPiAtLS0KPiAgbGliL2lv
Y3RsX3dyYXBwZXJzLmMgfCA0ICsrKy0KPiAgbGliL2lvY3RsX3dyYXBwZXJzLmggfCA0ICsrKy0K
PiAgMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2xpYi9pb2N0bF93cmFwcGVycy5jIGIvbGliL2lvY3RsX3dyYXBwZXJzLmMK
PiBpbmRleCAzOTkyMGY4NzA3ZDIuLmEyNTk3ZTI4MjcwNCAxMDA2NDQKPiAtLS0gYS9saWIvaW9j
dGxfd3JhcHBlcnMuYwo+ICsrKyBiL2xpYi9pb2N0bF93cmFwcGVycy5jCj4gQEAgLTEyNTIsNyAr
MTI1Miw3IEBAIHZvaWQgaWd0X3JlcXVpcmVfZ2VtKGludCBmZCkKPiAgICAgICAgIGlndF9yZXF1
aXJlX2YoZXJyID09IDAsICJVbnJlc3BvbnNpdmUgaTkxNS9HRU0gZGV2aWNlXG4iKTsKPiAgfQo+
ICAKPiAtYm9vbCBnZW1faGFzX3JpbmcoaW50IGZkLCB1bnNpZ25lZCByaW5nKQo+ICtib29sIGdl
bV9jb250ZXh0X2hhc19lbmdpbmUoaW50IGZkLCB1bnNpZ25lZCByaW5nLCB1bnNpZ25lZCBjdHgp
CgpNYWtlIHRoaXMgKGZkLCBjdHgsIGVuZ2luZSkgYW5kIHNxdWFzaCBpbiB3aXRoIHRoZSBzZWNv
bmQgcGF0Y2ggdG8gbW92ZQppdCB0byBnZW1fY29udGV4dCBhbmQgeW91IGNhbiBoYXZlIG15IHIt
YiBmb3IgaW1tZWRpYXRlIGFwcGxpY2F0aW9uLgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9pZ3QtZGV2
