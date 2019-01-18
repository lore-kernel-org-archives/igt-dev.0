Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB436F6BA
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Jan 2019 10:42:21 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Fri, 18 Jan 2019 12:42:10 +0200
Message-Id: <20190118104210.7168-1-petri.latvala@intel.com>
In-Reply-To: <20190116112050.27647-3-petri.latvala@intel.com>
References: <20190116112050.27647-3-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 02/21] lib/i915/gem_context: Help static
 analysis with execution flow
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

SWYgYW4gaWd0X2lvY3RsIGZhaWxzLCBlcnJubyBpcyBzZXQgdG8gbm9uLXplcm8sIGFuZCBzdGF0
aWMgYW5hbHlzaXMKZG9lc24ndCBxdWl0ZSBnZXQgaXQuIEFkZCBhbiBpZ3RfYXNzdW1lKCkgdG8g
aGVscC4KCnYyOiBCcmFjZXMgb24gYm90aCBicmFuY2hlcyBvZiBhbiBpZiAoQ2hyaXMpCgpTaWdu
ZWQtb2ZmLWJ5OiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4KQ2M6IENo
cmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgpDYzogTWljaGHFgiBXaW5pYXJz
a2kgPG1pY2hhbC53aW5pYXJza2lAaW50ZWwuY29tPgpSZXZpZXdlZC1ieTogQ2hyaXMgV2lsc29u
IDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Ci0tLQogbGliL2k5MTUvZ2VtX2NvbnRleHQuYyB8
IDggKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvbGliL2k5MTUvZ2VtX2NvbnRleHQuYyBiL2xpYi9pOTE1L2dlbV9j
b250ZXh0LmMKaW5kZXggNjY5YmQzMTguLjE2MDA0Njg1IDEwMDY0NAotLS0gYS9saWIvaTkxNS9n
ZW1fY29udGV4dC5jCisrKyBiL2xpYi9pOTE1L2dlbV9jb250ZXh0LmMKQEAgLTgwLDEwICs4MCwx
MiBAQCBpbnQgX19nZW1fY29udGV4dF9jcmVhdGUoaW50IGZkLCB1aW50MzJfdCAqY3R4X2lkKQog
ICAgICAgIGludCBlcnIgPSAwOwogCiAgICAgICAgbWVtc2V0KCZjcmVhdGUsIDAsIHNpemVvZihj
cmVhdGUpKTsKLSAgICAgICBpZiAoaWd0X2lvY3RsKGZkLCBEUk1fSU9DVExfSTkxNV9HRU1fQ09O
VEVYVF9DUkVBVEUsICZjcmVhdGUpID09IDApCisgICAgICAgaWYgKGlndF9pb2N0bChmZCwgRFJN
X0lPQ1RMX0k5MTVfR0VNX0NPTlRFWFRfQ1JFQVRFLCAmY3JlYXRlKSA9PSAwKSB7CiAgICAgICAg
ICAgICAgICAqY3R4X2lkID0gY3JlYXRlLmN0eF9pZDsKLSAgICAgICBlbHNlCi0gICAgICAgICAg
ICAgICBlcnIgPSAtZXJybm87CisgICAgICAgfSBlbHNlIHsKKwkgICAgICAgZXJyID0gLWVycm5v
OworCSAgICAgICBpZ3RfYXNzdW1lKGVyciAhPSAwKTsKKyAgICAgICB9CiAKICAgICAgICBlcnJu
byA9IDA7CiAgICAgICAgcmV0dXJuIGVycjsKLS0gCjIuMTkuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
