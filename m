Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Fri, 11 Sep 2020 12:30:20 +0200
Message-Id: <20200911103039.4574-6-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200911103039.4574-1-janusz.krzysztofik@linux.intel.com>
References: <20200911103039.4574-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v6 05/24] tests/core_hotunplug: Assert
 successful device filter application
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>, Petri Latvala <petri.latvala@intel.com>, intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UmV0dXJuIHZhbHVlIG9mIGlndF9kZXZpY2VfZmlsdGVyX2FkZCgpIHJlcHJlc2VudGluZyBhIG51
bWJlciBvZgpzdWNjZXNzZnVsbHkgaW5zdGFsbGVkIGRldmljZSBmaWx0ZXJzIGlzIG5vdyBpZ25v
cmVkLiAgRmFpbCBpZiBub3QgMS4KClNpZ25lZC1vZmYtYnk6IEphbnVzeiBLcnp5c3p0b2ZpayA8
amFudXN6LmtyenlzenRvZmlrQGxpbnV4LmludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IE1pY2hhxYIg
V2luaWFyc2tpIDxtaWNoYWwud2luaWFyc2tpQGludGVsLmNvbT4KLS0tCiB0ZXN0cy9jb3JlX2hv
dHVucGx1Zy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvY29yZV9ob3R1bnBsdWcuYyBiL3Rlc3RzL2NvcmVf
aG90dW5wbHVnLmMKaW5kZXggZmMyMzkzMjRhLi4yZjcwMzEwOTQgMTAwNjQ0Ci0tLSBhL3Rlc3Rz
L2NvcmVfaG90dW5wbHVnLmMKKysrIGIvdGVzdHMvY29yZV9ob3R1bnBsdWcuYwpAQCAtMTkzLDcg
KzE5Myw3IEBAIHN0YXRpYyB2b2lkIHNldF9maWx0ZXJfZnJvbV9kZXZpY2UoaW50IGZkKQogCWln
dF9hc3NlcnQocmVhbHBhdGgocGF0aCwgZHN0KSk7CiAKIAlpZ3RfZGV2aWNlX2ZpbHRlcl9mcmVl
X2FsbCgpOwotCWlndF9kZXZpY2VfZmlsdGVyX2FkZChmaWx0ZXIpOworCWlndF9hc3NlcnRfZXEo
aWd0X2RldmljZV9maWx0ZXJfYWRkKGZpbHRlciksIDEpOwogfQogCiAvKiBTdWJ0ZXN0cyAqLwot
LSAKMi4yMS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
