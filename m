Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C751789D7C
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2020 09:46:48 +0000 (UTC)
Date: Mon, 16 Nov 2020 10:46:36 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20201116094636.GA30543@zkempczy-mobl2>
References: <20201113133951.1231761-1-chris@chris-wilson.co.uk>
 <20201113133951.1231761-2-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201113133951.1231761-2-chris@chris-wilson.co.uk>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] lib/i915: Include the device name
 in the submission pretty-printer
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

T24gRnJpLCBOb3YgMTMsIDIwMjAgYXQgMDE6Mzk6NTFQTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IEZvciB0ZXN0cyB0aGF0IGNhcmUgZGVlcGx5IGFib3V0IHRoZSBzdWJtaXNzaW9uIG1l
dGhvZCwgYWxzbyBtZW50aW9uCj4gd2hhdCBwbGF0Zm9ybSB0aGUgdGVzdCBpcyBiZWluZyBydW4g
b24uCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24u
Y28udWs+Cj4gLS0tCj4gIGxpYi9pOTE1L2dlbV9zdWJtaXNzaW9uLmMgfCA1ICsrKysrCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvbGliL2k5MTUv
Z2VtX3N1Ym1pc3Npb24uYyBiL2xpYi9pOTE1L2dlbV9zdWJtaXNzaW9uLmMKPiBpbmRleCAyYzE3
ZDkzYWUuLmM4OTgwZGNlZSAxMDA2NDQKPiAtLS0gYS9saWIvaTkxNS9nZW1fc3VibWlzc2lvbi5j
Cj4gKysrIGIvbGliL2k5MTUvZ2VtX3N1Ym1pc3Npb24uYwo+IEBAIC0xMTEsNiArMTExLDExIEBA
IG91dDoKPiAgdm9pZCBnZW1fc3VibWlzc2lvbl9wcmludF9tZXRob2QoaW50IGZkKQo+ICB7Cj4g
IAljb25zdCB1bnNpZ25lZCBmbGFncyA9IGdlbV9zdWJtaXNzaW9uX21ldGhvZChmZCk7Cj4gKwlj
b25zdCBzdHJ1Y3QgaW50ZWxfZGV2aWNlX2luZm8gKmluZm87Cj4gKwo+ICsJaW5mbyA9IGludGVs
X2dldF9kZXZpY2VfaW5mbyhpbnRlbF9nZXRfZHJtX2RldmlkKGZkKSk7Cj4gKwlpZiAoaW5mbykK
PiArCQlpZ3RfaW5mbygiUnVubmluZyBvbiAlc1xuIiwgaW5mby0+Y29kZW5hbWUpOwo+ICAKPiAg
CWlmIChmbGFncyAmIEdFTV9TVUJNSVNTSU9OX0dVQykgewo+ICAJCWlndF9pbmZvKCJVc2luZyBH
dUMgc3VibWlzc2lvblxuIik7Cj4gLS0gCj4gMi4yOS4yCgpPay4gCgpSZXZpZXdlZC1ieTogWmJp
Z25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+CgotLQpa
YmlnbmlldwoKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IGlndC1kZXYgbWFpbGluZyBsaXN0Cj4gaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1k
ZXYKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRl
diBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
