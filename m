Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1E9C890D8
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2019 11:19:34 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Wed, 10 Apr 2019 13:19:29 +0200
Message-Id: <20190410111931.28305-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/3] kms_flip: Make busy-flip test less
 strict.
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

UmVtb3ZlIHRoZSAtaW50ZXJydXB0aWJsZSB0ZXN0LCB0aGUgdGVzdCBvbmx5IHRlc3RzIHRoYXQg
d2UgZ2V0IGFuCi1FQlVTWSBhZnRlciBkb2luZyBhIHBhZ2VmbGlwLiBEb2luZyB0aGlzIGludGVy
cnVwdGlibHkgYWRkcyB0aGUKcG9zc2liaWxpdHkgdGhlIHRlc3Qgd2lsbCB0YWtlIHRvbyBsb25n
IGZyb20gcmV0cnlpbmcuCgpTaWduZWQtb2ZmLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRl
bi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgotLS0KIHRlc3RzL2ttc19mbGlwLmMgfCA3ICsr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90ZXN0
cy9rbXNfZmxpcC5jIGIvdGVzdHMva21zX2ZsaXAuYwppbmRleCBkZmE1YTY5ZThmMjguLjA4ZjNi
ZDI5YjhlYiAxMDA3NTUKLS0tIGEvdGVzdHMva21zX2ZsaXAuYworKysgYi90ZXN0cy9rbXNfZmxp
cC5jCkBAIC0xNTc1LDYgKzE1NzUsMTMgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2
KQogCQkgICAgISh0ZXN0c1tpXS5mbGFncyAmIFRFU1RfVkJMQU5LX0FCU09MVVRFKSkKIAkJCWNv
bnRpbnVlOwogCisJCS8qCisJCSAqIC1FQlVTWSBuZWVkcyB0byBjb21wbGV0ZSBpbiBhIHNpbmds
ZSB2YmxhbmssIHNraXAgdGhlbSBmb3IKKwkJICogaW50ZXJydXB0aWJsZSB0ZXN0cworCQkgKi8K
KwkJaWYgKHRlc3RzW2ldLmZsYWdzICYgVEVTVF9FQlVTWSkKKwkJCWNvbnRpbnVlOworCiAJCWln
dF9zdWJ0ZXN0X2YoICIlcy1pbnRlcnJ1cHRpYmxlIiwgdGVzdHNbaV0ubmFtZSkKIAkJCXJ1bl90
ZXN0KHRlc3RzW2ldLmR1cmF0aW9uLCB0ZXN0c1tpXS5mbGFncyk7CiAKLS0gCjIuMjAuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWls
aW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
