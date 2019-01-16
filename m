Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC0556EFCD
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jan 2019 11:21:04 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed, 16 Jan 2019 13:20:50 +0200
Message-Id: <20190116112050.27647-22-petri.latvala@intel.com>
In-Reply-To: <20190116112050.27647-1-petri.latvala@intel.com>
References: <20190116112050.27647-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 21/21] lib/drmtest: Don't read from NULL in
 set_forced_driver
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
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>, Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
List-ID: <igt-dev@lists.freedesktop.org>

VGhlIG9ubHkgY2FsbGVyIHNvIGZhciBuZXZlciBwYXNzZXMgTlVMTCBzbyBubyBlZmZlY3RzIHRv
ZGF5LgoKU2lnbmVkLW9mZi1ieTogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5j
b20+CkNjOiBSb2RyaWdvIFNpcXVlaXJhIDxyb2RyaWdvc2lxdWVpcmFtZWxvQGdtYWlsLmNvbT4K
Q2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Ci0tLQogbGliL2RybXRl
c3QuYyB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2xpYi9kcm10ZXN0LmMgYi9saWIvZHJtdGVzdC5jCmluZGV4IDdj
MTI0YWM2Li4xOTY0Nzk1YSAxMDA2NDQKLS0tIGEvbGliL2RybXRlc3QuYworKysgYi9saWIvZHJt
dGVzdC5jCkBAIC0xMzQsOCArMTM0LDEwIEBAIHN0YXRpYyBjaGFyIF9mb3JjZWRfZHJpdmVyWzE2
XSA9ICIiOwogICovCiB2b2lkIF9fc2V0X2ZvcmNlZF9kcml2ZXIoY29uc3QgY2hhciAqbmFtZSkK
IHsKLQlpZiAoIW5hbWUpCisJaWYgKCFuYW1lKSB7CiAJCWlndF93YXJuKCJObyBkcml2ZXIgc3Bl
Y2lmaWVkLCBrZWVwIGRlZmF1bHQgYmVoYXZpb3VyXG4iKTsKKwkJcmV0dXJuOworCX0KIAogCXN0
cm5jcHkoX2ZvcmNlZF9kcml2ZXIsIG5hbWUsIHNpemVvZihfZm9yY2VkX2RyaXZlcikgLSAxKTsK
IH0KLS0gCjIuMTkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
