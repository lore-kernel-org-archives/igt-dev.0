Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D31416E8F6
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Apr 2021 22:17:30 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Wed, 21 Apr 2021 01:17:19 +0300
Message-Id: <20210420221720.14656-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20210420221720.14656-1-ville.syrjala@linux.intel.com>
References: <20210420221720.14656-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 2/3] lib/kms: Reset color encoding to
 BT.709
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCmln
dF9mYiB1c2VzIEJULjcwOSBhcyB0aGUgZGVmYXVsdCBjb2xvciBlbmNvZGluZyBmb3IgWUNiQ3Iu
ClN3aXRjaCBpZ3RfcGxhbmVfcmVzZXQoKSB0byB1c2UgdGhlIHNhbWUgYXMgdGhlIHJlc2V0IHZh
bHVlLgoKU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4
LmludGVsLmNvbT4KLS0tCiBsaWIvaWd0X2ttcy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbGliL2lndF9rbXMuYyBi
L2xpYi9pZ3Rfa21zLmMKaW5kZXggMjc5YjhjZWU0MmQwLi45YWJhN2I2ZTRiNDAgMTAwNjQ0Ci0t
LSBhL2xpYi9pZ3Rfa21zLmMKKysrIGIvbGliL2lndF9rbXMuYwpAQCAtMTc2MCw3ICsxNzYwLDcg
QEAgc3RhdGljIHZvaWQgaWd0X3BsYW5lX3Jlc2V0KGlndF9wbGFuZV90ICpwbGFuZSkKIAogCWlm
IChpZ3RfcGxhbmVfaGFzX3Byb3AocGxhbmUsIElHVF9QTEFORV9DT0xPUl9FTkNPRElORykpCiAJ
CWlndF9wbGFuZV9zZXRfcHJvcF9lbnVtKHBsYW5lLCBJR1RfUExBTkVfQ09MT1JfRU5DT0RJTkcs
Ci0JCQlpZ3RfY29sb3JfZW5jb2RpbmdfdG9fc3RyKElHVF9DT0xPUl9ZQ0JDUl9CVDYwMSkpOwor
CQkJaWd0X2NvbG9yX2VuY29kaW5nX3RvX3N0cihJR1RfQ09MT1JfWUNCQ1JfQlQ3MDkpKTsKIAog
CWlmIChpZ3RfcGxhbmVfaGFzX3Byb3AocGxhbmUsIElHVF9QTEFORV9DT0xPUl9SQU5HRSkpCiAJ
CWlndF9wbGFuZV9zZXRfcHJvcF9lbnVtKHBsYW5lLCBJR1RfUExBTkVfQ09MT1JfUkFOR0UsCi0t
IAoyLjI2LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
