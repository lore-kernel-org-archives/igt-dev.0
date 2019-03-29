Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 795056E89B
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Mar 2019 10:35:29 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Fri, 29 Mar 2019 11:35:25 +0100
Message-Id: <20190329103526.12364-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/igt_kms: Clear pipe color
 management properties on reset.
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

SnVzdCBsaWtlIHdlIHRyeSB0byBzYW5pdGl6ZSBhbGwgcHJvcGVydGllcyBpbiBpZ3RfcGxhbmVf
cmVzZXQsIHdlCnNob3VsZCBkbyB0aGUgc2FtZSBmb3IgcGlwZSBwcm9wZXJ0aWVzLiBMb2FkaW5n
IGEgd3JvbmcgbHV0IGNvdWxkCmFmZmVjdCBwYXNzaW5nIGFuZCBmYWlsaW5nIHRlc3RzLCBzbyB3
ZSBuZWVkIHRvIGJlIGNhcmVmdWwgYW5kIHNldApzYW5lIGRlZmF1bHRzIGZvciBldmVyeXRoaW5n
LgoKU2lnbmVkLW9mZi1ieTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxp
bnV4LmludGVsLmNvbT4KLS0tCiBsaWIvaWd0X2ttcy5jIHwgOSArKysrKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCA5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9saWIvaWd0X2ttcy5jIGIvbGli
L2lndF9rbXMuYwppbmRleCA0M2Y0NTk5NzA3M2MuLjA1Y2I5YmQyMjA5MCAxMDA2NDQKLS0tIGEv
bGliL2lndF9rbXMuYworKysgYi9saWIvaWd0X2ttcy5jCkBAIC0xODA0LDYgKzE4MDQsMTUgQEAg
c3RhdGljIHZvaWQgaWd0X3BpcGVfcmVzZXQoaWd0X3BpcGVfdCAqcGlwZSkKIAlpZ3RfcGlwZV9v
Ympfc2V0X3Byb3BfdmFsdWUocGlwZSwgSUdUX0NSVENfQUNUSVZFLCAwKTsKIAlpZ3RfcGlwZV9v
YmpfY2xlYXJfcHJvcF9jaGFuZ2VkKHBpcGUsIElHVF9DUlRDX09VVF9GRU5DRV9QVFIpOwogCisJ
aWYgKGlndF9waXBlX29ial9oYXNfcHJvcChwaXBlLCBJR1RfQ1JUQ19DVE0pKQorCQlpZ3RfcGlw
ZV9vYmpfc2V0X3Byb3BfdmFsdWUocGlwZSwgSUdUX0NSVENfQ1RNLCAwKTsKKworCWlmIChpZ3Rf
cGlwZV9vYmpfaGFzX3Byb3AocGlwZSwgSUdUX0NSVENfR0FNTUFfTFVUKSkKKwkJaWd0X3BpcGVf
b2JqX3NldF9wcm9wX3ZhbHVlKHBpcGUsIElHVF9DUlRDX0dBTU1BX0xVVCwgMCk7CisKKwlpZiAo
aWd0X3BpcGVfb2JqX2hhc19wcm9wKHBpcGUsIElHVF9DUlRDX0RFR0FNTUFfTFVUKSkKKwkJaWd0
X3BpcGVfb2JqX3NldF9wcm9wX3ZhbHVlKHBpcGUsIElHVF9DUlRDX0RFR0FNTUFfTFVULCAwKTsK
KwogCXBpcGUtPm91dF9mZW5jZV9mZCA9IC0xOwogfQogCi0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0
CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
