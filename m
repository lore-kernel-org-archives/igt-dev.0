Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AE9B890F9
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2019 13:04:54 +0000 (UTC)
From: Simon Ser <simon.ser@intel.com>
Date: Tue, 23 Apr 2019 16:04:55 +0300
Message-Id: <20190423130459.31594-5-simon.ser@intel.com>
In-Reply-To: <20190423130459.31594-1-simon.ser@intel.com>
References: <20190423130459.31594-1-simon.ser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v7 4/8] lib/igt_alsa: use variables to
 improve readability
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
List-ID: <igt-dev@lists.freedesktop.org>

TW9zdCBwZW9wbGUgZG9uJ3QgaGF2ZSAicmVtZW1iZXIgd2hhdCB0aGUgbGFzdCB0d28gcGFyYW1l
dGVycyBvZgpzbmRfcGNtX3NldF9wYXJhbXMgYXJlIiBpbiB0aGVpciBsaWZlZ29hbHMgbGlzdC4g
VXNlIHZhcmlhYmxlcyBzbyB0aGF0IGl0J3MKY2xlYXJlciB3aGF0IHRob3NlIGFyZS4KClNpZ25l
ZC1vZmYtYnk6IFNpbW9uIFNlciA8c2ltb24uc2VyQGludGVsLmNvbT4KLS0tCiBsaWIvaWd0X2Fs
c2EuYyB8IDUgKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9saWIvaWd0X2Fsc2EuYyBiL2xpYi9pZ3RfYWxzYS5jCmluZGV4
IDNiMWE5ZTkwLi5hNDc4Njg2YSAxMDA2NDQKLS0tIGEvbGliL2lndF9hbHNhLmMKKysrIGIvbGli
L2lndF9hbHNhLmMKQEAgLTQyNiwxMyArNDI2LDE2IEBAIHZvaWQgYWxzYV9jb25maWd1cmVfb3V0
cHV0KHN0cnVjdCBhbHNhICphbHNhLCBpbnQgY2hhbm5lbHMsCiAJc25kX3BjbV90ICpoYW5kbGU7
CiAJaW50IHJldDsKIAlpbnQgaTsKKwlpbnQgc29mdF9yZXNhbXBsZSA9IDA7IC8qIERvbid0IGFs
bG93IEFMU0EgdG8gcmVzYW1wbGUgKi8KKwl1bnNpZ25lZCBpbnQgbGF0ZW5jeSA9IDA7CiAKIAlm
b3IgKGkgPSAwOyBpIDwgYWxzYS0+b3V0cHV0X2hhbmRsZXNfY291bnQ7IGkrKykgewogCQloYW5k
bGUgPSBhbHNhLT5vdXRwdXRfaGFuZGxlc1tpXTsKIAogCQlyZXQgPSBzbmRfcGNtX3NldF9wYXJh
bXMoaGFuZGxlLCBTTkRfUENNX0ZPUk1BVF9TMTZfTEUsCiAJCQkJCSBTTkRfUENNX0FDQ0VTU19S
V19JTlRFUkxFQVZFRCwKLQkJCQkJIGNoYW5uZWxzLCBzYW1wbGluZ19yYXRlLCAwLCAwKTsKKwkJ
CQkJIGNoYW5uZWxzLCBzYW1wbGluZ19yYXRlLAorCQkJCQkgc29mdF9yZXNhbXBsZSwgbGF0ZW5j
eSk7CiAJCWlndF9hc3NlcnQocmV0ID49IDApOwogCX0KIAotLSAKMi4yMS4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlz
dAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
