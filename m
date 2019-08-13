Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 13 Aug 2019 07:20:14 +0100
Message-Id: <20190813062016.7870-7-chris@chris-wilson.co.uk>
In-Reply-To: <20190813062016.7870-1-chris@chris-wilson.co.uk>
References: <20190813062016.7870-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 7/9] i915/perf_pmu: Flush idle work before
 waiting for suspend
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UnVudGltZSBzdXNwZW5kIGtpY2tzIGluIHF1aWNrZXIgaWYgd2UgZmx1c2ggYW55IGlkbGUgd29y
ayB0aGF0IG1heSBiZWVuCmFjY3J1ZWQuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNo
cmlzQGNocmlzLXdpbHNvbi5jby51az4KLS0tCiB0ZXN0cy9wZXJmX3BtdS5jIHwgMSArCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS90ZXN0cy9wZXJmX3BtdS5j
IGIvdGVzdHMvcGVyZl9wbXUuYwppbmRleCBkMzkyYTY3ZDQuLjM1MTA5MDcxMCAxMDA2NDQKLS0t
IGEvdGVzdHMvcGVyZl9wbXUuYworKysgYi90ZXN0cy9wZXJmX3BtdS5jCkBAIC0xNDE3LDYgKzE0
MTcsNyBAQCB0ZXN0X3JjNihpbnQgZ2VtX2ZkLCB1bnNpZ25lZCBpbnQgZmxhZ3MpCiAJCWRybU1v
ZGVGcmVlUmVzb3VyY2VzKHJlcyk7CiAKIAkJaWd0X3JlcXVpcmUoaWd0X3NldHVwX3J1bnRpbWVf
cG0oKSk7CisJCWlndF9kcm9wX2NhY2hlc19zZXQoZ2VtX2ZkLCBEUk9QX0lETEUpOwogCQlpZ3Rf
cmVxdWlyZShpZ3Rfd2FpdF9mb3JfcG1fc3RhdHVzKElHVF9SVU5USU1FX1BNX1NUQVRVU19TVVNQ
RU5ERUQpKTsKIAogCQkvKgotLSAKMi4yMy4wLnJjMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pZ3QtZGV2
