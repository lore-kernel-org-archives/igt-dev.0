Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CAA16E23E
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Mar 2019 21:39:42 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Thu,  7 Mar 2019 23:39:26 +0200
Message-Id: <20190307213926.18051-5-ville.syrjala@linux.intel.com>
In-Reply-To: <20190307213926.18051-1-ville.syrjala@linux.intel.com>
References: <20190307213926.18051-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 5/5] tests/kms_setmode: Validate the vbl
 sequence numbers
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCk1h
a2Ugc3VyZSB3ZSBoYXZlbid0IGFscmVhZHkgcGFzc2VkIHRoZSBzZXEgbnVtYmVycyB3ZSdyZQpy
ZXF1ZXN0aW5nIHdoZW4gZG9pbmcgdGhlIHRzIGNhbGlicmF0aW9uLgoKU3VnZ2VzdGVkLWJ5OiBD
aHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KU2lnbmVkLW9mZi1ieTogVmls
bGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiB0ZXN0cy9r
bXNfc2V0bW9kZS5jIHwgOSArKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS90ZXN0cy9rbXNfc2V0bW9kZS5jIGIvdGVzdHMva21zX3NldG1vZGUu
YwppbmRleCBhY2Q2MDZjZDViNWUuLjVjZTEzOTdmOTY4ZiAxMDA2NDQKLS0tIGEvdGVzdHMva21z
X3NldG1vZGUuYworKysgYi90ZXN0cy9rbXNfc2V0bW9kZS5jCkBAIC00NDcsOCArNDQ3LDE3IEBA
IHN0YXRpYyB2b2lkIGNoZWNrX3RpbWluZ3MoaW50IGNydGNfaWR4LCBjb25zdCBkcm1Nb2RlTW9k
ZUluZm8gKmttb2RlKQogCXdhaXQucmVxdWVzdC50eXBlIHw9IERSTV9WQkxBTktfQUJTT0xVVEUg
fCBEUk1fVkJMQU5LX0VWRU5UOwogCXdhaXQucmVxdWVzdC5zZXF1ZW5jZSA9IGxhc3Rfc2VxOwog
CWZvciAobiA9IDA7IG4gPCBDQUxJQlJBVEVfVFNfU1RFUFM7IG4rKykgeworCQlkcm1WQmxhbmsg
Y2hlY2sgPSB7fTsKKwogCQkrK3dhaXQucmVxdWVzdC5zZXF1ZW5jZTsKIAkJZG9fb3JfZGllKGRy
bVdhaXRWQmxhbmsoZHJtX2ZkLCAmd2FpdCkpOworCisJCS8qIERvdWJsZSBjaGVjayB0aGF0IGhh
dmVuJ3QgYWxyZWFkeSBtaXNzZWQgdGhlIHZibGFuayAqLworCQljaGVjay5yZXF1ZXN0LnR5cGUg
PSBrbXN0ZXN0X2dldF92YmxfZmxhZyhjcnRjX2lkeCk7CisJCWNoZWNrLnJlcXVlc3QudHlwZSB8
PSBEUk1fVkJMQU5LX1JFTEFUSVZFOworCQlkb19vcl9kaWUoZHJtV2FpdFZCbGFuayhkcm1fZmQs
ICZjaGVjaykpOworCisJCWlndF9hc3NlcnQoIWlndF92YmxhbmtfYWZ0ZXIoY2hlY2sucmVwbHku
c2VxdWVuY2UsIHdhaXQucmVxdWVzdC5zZXF1ZW5jZSkpOwogCX0KIAogCWlndF9zdGF0c19pbml0
X3dpdGhfc2l6ZSgmc3RhdHMsIENBTElCUkFURV9UU19TVEVQUyk7Ci0tIAoyLjE5LjIKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGlu
ZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
