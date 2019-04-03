Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308::216:3eff:fe92:dfa3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E03906E897
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2019 10:30:25 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Wed,  3 Apr 2019 12:30:08 +0200
Message-Id: <20190403103009.5258-1-maarten.lankhorst@linux.intel.com>
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
bnV4LmludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFs
YUBsaW51eC5pbnRlbC5jb20+Ci0tLQogbGliL2lndF9rbXMuYyB8IDkgKysrKysrKysrCiAxIGZp
bGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvbGliL2lndF9rbXMuYyBi
L2xpYi9pZ3Rfa21zLmMKaW5kZXggMWUyNDE1YmY5Yzg5Li5hOTc1ZmYxNDk5Y2EgMTAwNjQ0Ci0t
LSBhL2xpYi9pZ3Rfa21zLmMKKysrIGIvbGliL2lndF9rbXMuYwpAQCAtMTc5NSw2ICsxNzk1LDE1
IEBAIHN0YXRpYyB2b2lkIGlndF9waXBlX3Jlc2V0KGlndF9waXBlX3QgKnBpcGUpCiAJaWd0X3Bp
cGVfb2JqX3NldF9wcm9wX3ZhbHVlKHBpcGUsIElHVF9DUlRDX0FDVElWRSwgMCk7CiAJaWd0X3Bp
cGVfb2JqX2NsZWFyX3Byb3BfY2hhbmdlZChwaXBlLCBJR1RfQ1JUQ19PVVRfRkVOQ0VfUFRSKTsK
IAorCWlmIChpZ3RfcGlwZV9vYmpfaGFzX3Byb3AocGlwZSwgSUdUX0NSVENfQ1RNKSkKKwkJaWd0
X3BpcGVfb2JqX3NldF9wcm9wX3ZhbHVlKHBpcGUsIElHVF9DUlRDX0NUTSwgMCk7CisKKwlpZiAo
aWd0X3BpcGVfb2JqX2hhc19wcm9wKHBpcGUsIElHVF9DUlRDX0dBTU1BX0xVVCkpCisJCWlndF9w
aXBlX29ial9zZXRfcHJvcF92YWx1ZShwaXBlLCBJR1RfQ1JUQ19HQU1NQV9MVVQsIDApOworCisJ
aWYgKGlndF9waXBlX29ial9oYXNfcHJvcChwaXBlLCBJR1RfQ1JUQ19ERUdBTU1BX0xVVCkpCisJ
CWlndF9waXBlX29ial9zZXRfcHJvcF92YWx1ZShwaXBlLCBJR1RfQ1JUQ19ERUdBTU1BX0xVVCwg
MCk7CisKIAlwaXBlLT5vdXRfZmVuY2VfZmQgPSAtMTsKIH0KIAotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcg
bGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
