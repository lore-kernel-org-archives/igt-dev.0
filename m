Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 782076E12C
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2019 10:27:42 +0000 (UTC)
Received: from platvala by thrakatuluk with local (Exim 4.91)
 (envelope-from <petri.latvala@intel.com>) id 1h4NaO-0001NK-6d
 for igt-dev@lists.freedesktop.org; Thu, 14 Mar 2019 12:27:40 +0200
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu, 14 Mar 2019 12:27:39 +0200
Message-Id: <20190314102740.5243-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [CI 1/2] lib/sw_sync: Fix querying fence status
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

RnJvbTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CgpUbyBxdWVyeSB0
aGUgZmVuY2Ugc3RhdHVzLCBhbmQgb25seSB0aGUgZmVuY2Ugc3RhdHVzLCB5b3Ugb25seSBuZWVk
IHRvCnBhc3MgLm51bV9mZW5jZXMgPSAwLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxj
aHJpc0BjaHJpcy13aWxzb24uY28udWs+CkNjOiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxh
QGludGVsLmNvbT4KLS0tCiBsaWIvc3dfc3luYy5jIHwgMTMgKysrLS0tLS0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
bGliL3N3X3N5bmMuYyBiL2xpYi9zd19zeW5jLmMKaW5kZXggZjIwODYwMzMuLmQ2NzE5MjNjIDEw
MDY0NAotLS0gYS9saWIvc3dfc3luYy5jCisrKyBiL2xpYi9zd19zeW5jLmMKQEAgLTIwNiwxOSAr
MjA2LDEyIEBAIGludCBzeW5jX2ZlbmNlX2NvdW50X3N0YXR1cyhpbnQgZmQsIGludCBzdGF0dXMp
CiAKIGludCBzeW5jX2ZlbmNlX3N0YXR1cyhpbnQgZmVuY2UpCiB7Ci0Jc3RydWN0IHN5bmNfZmVu
Y2VfaW5mbyBmZW5jZV9pbmZvOwotCXN0cnVjdCBzeW5jX2ZpbGVfaW5mbyBmaWxlX2luZm8gPSB7
Ci0JCS5zeW5jX2ZlbmNlX2luZm8gPSB0b191c2VyX3BvaW50ZXIoJmZlbmNlX2luZm8pLAotCQku
bnVtX2ZlbmNlcyA9IDEsCi0JfTsKKwlzdHJ1Y3Qgc3luY19maWxlX2luZm8gaW5mbyA9IHsgfTsK
IAotCWlmIChpb2N0bChmZW5jZSwgU1lOQ19JT0NfRklMRV9JTkZPLCAmZmlsZV9pbmZvKSkKKwlp
ZiAoaW9jdGwoZmVuY2UsIFNZTkNfSU9DX0ZJTEVfSU5GTywgJmluZm8pKQogCQlyZXR1cm4gLWVy
cm5vOwogCi0JaWYgKGZpbGVfaW5mby5udW1fZmVuY2VzICE9IDEpCi0JCXJldHVybiAtRUlOVkFM
OwotCi0JcmV0dXJuIGZlbmNlX2luZm8uc3RhdHVzOworCXJldHVybiBpbmZvLnN0YXR1czsKIH0K
IAogc3RhdGljIHZvaWQgbW9kcHJvYmUoY29uc3QgY2hhciAqZHJpdmVyKQotLSAKMi4xOS4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1h
aWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
