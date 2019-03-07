Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C4F6E238
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Mar 2019 21:39:39 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Thu,  7 Mar 2019 23:39:25 +0200
Message-Id: <20190307213926.18051-4-ville.syrjala@linux.intel.com>
In-Reply-To: <20190307213926.18051-1-ville.syrjala@linux.intel.com>
References: <20190307213926.18051-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/5] tests/kms_flip: Validate the vbl
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
bXNfZmxpcC5jIHwgOSArKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS90ZXN0cy9rbXNfZmxpcC5jIGIvdGVzdHMva21zX2ZsaXAuYwppbmRleCBj
ZGU4YjczOWVhODMuLjk5Nzk1NzU0MjMyOSAxMDA3NTUKLS0tIGEvdGVzdHMva21zX2ZsaXAuYwor
KysgYi90ZXN0cy9rbXNfZmxpcC5jCkBAIC0xMTE4LDggKzExMTgsMTcgQEAgc3RhdGljIHZvaWQg
Y2FsaWJyYXRlX3RzKHN0cnVjdCB0ZXN0X291dHB1dCAqbywgaW50IGNydGNfaWR4KQogCXdhaXQu
cmVxdWVzdC50eXBlIHw9IERSTV9WQkxBTktfQUJTT0xVVEUgfCBEUk1fVkJMQU5LX0VWRU5UOwog
CXdhaXQucmVxdWVzdC5zZXF1ZW5jZSA9IGxhc3Rfc2VxOwogCWZvciAobiA9IDA7IG4gPCBDQUxJ
QlJBVEVfVFNfU1RFUFM7IG4rKykgeworCQlkcm1WQmxhbmsgY2hlY2sgPSB7fTsKKwogCQkrK3dh
aXQucmVxdWVzdC5zZXF1ZW5jZTsKIAkJZG9fb3JfZGllKGRybVdhaXRWQmxhbmsoZHJtX2ZkLCAm
d2FpdCkpOworCisJCS8qIERvdWJsZSBjaGVjayB0aGF0IGhhdmVuJ3QgYWxyZWFkeSBtaXNzZWQg
dGhlIHZibGFuayAqLworCQljaGVjay5yZXF1ZXN0LnR5cGUgPSBrbXN0ZXN0X2dldF92YmxfZmxh
ZyhjcnRjX2lkeCk7CisJCWNoZWNrLnJlcXVlc3QudHlwZSB8PSBEUk1fVkJMQU5LX1JFTEFUSVZF
OworCQlkb19vcl9kaWUoZHJtV2FpdFZCbGFuayhkcm1fZmQsICZjaGVjaykpOworCisJCWlndF9h
c3NlcnQoIWlndF92YmxhbmtfYWZ0ZXIoY2hlY2sucmVwbHkuc2VxdWVuY2UsIHdhaXQucmVxdWVz
dC5zZXF1ZW5jZSkpOwogCX0KIAogCWlndF9zdGF0c19pbml0X3dpdGhfc2l6ZSgmc3RhdHMsIENB
TElCUkFURV9UU19TVEVQUyk7Ci0tIAoyLjE5LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaWd0LWRldg==
