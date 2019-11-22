Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7059D6E23B
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2019 00:32:06 +0000 (UTC)
From: don.hiatt@intel.com
Date: Thu, 21 Nov 2019 16:43:53 -0800
Message-Id: <20191122004353.133274-1-don.hiatt@intel.com>
Subject: [igt-dev] [PATCH i-g-t] lib/aux: Ensure swap space prior to suspend
 to disk
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogRG9uIEhpYXR0IDxkb24uaGlhdHRAaW50ZWwuY29tPgoKU3VzcGVuZGluZyB0byBkaXNr
IHJlcXVpcmVzIHN3YXAgc3BhY2UsIG1ha2Ugc3VyZSBpdCBleGlzdHMKYmVmb3JlIGF0dGVtcHRp
bmcgdG8gc3VzcGVuZCB0byBkaXNrLgoKQ2M6IFN1amFyaXRoYSBTdW5kYXJlc2FuIDxzdWphcml0
aGEuc3VuZGFyZXNhbkBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IERvbiBIaWF0dCA8ZG9uLmhp
YXR0QGludGVsLmNvbT4KLS0tCiBsaWIvaWd0X2F1eC5jIHwgNCArKysrCiAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvbGliL2lndF9hdXguYyBiL2xpYi9pZ3Rf
YXV4LmMKaW5kZXggNTc4Zjg1NzkzM2YwLi4zMWMwMTYyNGE2NTEgMTAwNjQ0Ci0tLSBhL2xpYi9p
Z3RfYXV4LmMKKysrIGIvbGliL2lndF9hdXguYwpAQCAtODY0LDYgKzg2NCwxMCBAQCB2b2lkIGln
dF9zeXN0ZW1fc3VzcGVuZF9hdXRvcmVzdW1lKGVudW0gaWd0X3N1c3BlbmRfc3RhdGUgc3RhdGUs
CiAJaWd0X3JlcXVpcmUodGVzdCA9PSBTVVNQRU5EX1RFU1RfTk9ORSB8fAogCQkgICAgZmFjY2Vz
c2F0KHBvd2VyX2RpciwgInBtX3Rlc3QiLCBSX09LIHwgV19PSywgMCkgPT0gMCk7CiAKKwlpZiAo
c3RhdGUgPT0gU1VTUEVORF9TVEFURV9ESVNLKQorCQlpZ3RfcmVxdWlyZV9mKGludGVsX2dldF90
b3RhbF9zd2FwX21iKCkgPiAwLAorCQkJICAgICAgIlN1c3BlbmQgdG8gZGlzayByZXF1aXJlcyBz
d2FwIHNwYWNlLlxuIik7CisKIAlvcmlnX3Rlc3QgPSBnZXRfc3VzcGVuZF90ZXN0KHBvd2VyX2Rp
cik7CiAJc2V0X3N1c3BlbmRfdGVzdChwb3dlcl9kaXIsIHRlc3QpOwogCi0tIAoyLjE3LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFp
bGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
