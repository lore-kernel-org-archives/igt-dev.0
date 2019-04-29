Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B73C89333
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Apr 2019 16:06:01 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Mon, 29 Apr 2019 18:05:56 +0200
Message-Id: <20190429160557.17889-4-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20190429160557.17889-1-maarten.lankhorst@linux.intel.com>
References: <20190429160557.17889-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/4] lib/igt_kms: Update cursor when fb
 width/height changes too.
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

Q2FsbCBTZXRDdXJzb3Igb24gdy9oIHNpemUgY2hhbmdlIGFzIHdlbGwsIHRoaXMgZml4ZXMgYSB0
ZXN0CmZhaWx1cmUgd2hlbiB1c2luZyBrbXMgY2FsbHMgdG8gY2hhbmdlIGN1cnNvciBzaXplLgoK
U2lnbmVkLW9mZi1ieTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4
LmludGVsLmNvbT4KLS0tCiBsaWIvaWd0X2ttcy5jIHwgNCArKystCiAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbGliL2lndF9rbXMu
YyBiL2xpYi9pZ3Rfa21zLmMKaW5kZXggNGViNDMyOTE3MzA3Li4xYjM0ODM0Mzk0NzQgMTAwNjQ0
Ci0tLSBhL2xpYi9pZ3Rfa21zLmMKKysrIGIvbGliL2lndF9rbXMuYwpAQCAtMjc0OSw3ICsyNzQ5
LDkgQEAgc3RhdGljIGludCBpZ3RfY3Vyc29yX2NvbW1pdF9sZWdhY3koaWd0X3BsYW5lX3QgKmN1
cnNvciwKIAl1aW50MzJfdCBjcnRjX2lkID0gcGlwZS0+Y3J0Y19pZDsKIAlpbnQgcmV0OwogCi0J
aWYgKGlndF9wbGFuZV9pc19wcm9wX2NoYW5nZWQoY3Vyc29yLCBJR1RfUExBTkVfRkJfSUQpKSB7
CisJaWYgKGlndF9wbGFuZV9pc19wcm9wX2NoYW5nZWQoY3Vyc29yLCBJR1RfUExBTkVfRkJfSUQp
IHx8CisJICAgIGlndF9wbGFuZV9pc19wcm9wX2NoYW5nZWQoY3Vyc29yLCBJR1RfUExBTkVfQ1JU
Q19XKSB8fAorCSAgICBpZ3RfcGxhbmVfaXNfcHJvcF9jaGFuZ2VkKGN1cnNvciwgSUdUX1BMQU5F
X0NSVENfSCkpIHsKIAkJaWYgKGN1cnNvci0+Z2VtX2hhbmRsZSkKIAkJCUxPRyhkaXNwbGF5LAog
CQkJICAgICJTZXRDdXJzb3IgcGlwZSAlcywgZmIgJXUgJWR4JWRcbiIsCi0tIAoyLjIwLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFp
bGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
