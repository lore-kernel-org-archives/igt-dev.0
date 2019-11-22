Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B09B46EE20
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2019 00:56:38 +0000 (UTC)
From: don.hiatt@intel.com
Date: Thu, 21 Nov 2019 17:08:25 -0800
Message-Id: <20191122010825.134903-1-don.hiatt@intel.com>
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
bmcgdG8gc3VzcGVuZCB0byBkaXNrLgoKdjI6IFVzZSBpZ3Rfc2tpcCgpIFtUaGFua3MsIENocmlz
IV0KCkNjOiBTdWphcml0aGEgU3VuZGFyZXNhbiA8c3VqYXJpdGhhLnN1bmRhcmVzYW5AaW50ZWwu
Y29tPgpDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+ClNpZ25lZC1v
ZmYtYnk6IERvbiBIaWF0dCA8ZG9uLmhpYXR0QGludGVsLmNvbT4KLS0tCiBsaWIvaWd0X2F1eC5j
IHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
bGliL2lndF9hdXguYyBiL2xpYi9pZ3RfYXV4LmMKaW5kZXggNTc4Zjg1NzkzM2YwLi5mMmE1YmQ3
MWExMTAgMTAwNjQ0Ci0tLSBhL2xpYi9pZ3RfYXV4LmMKKysrIGIvbGliL2lndF9hdXguYwpAQCAt
ODY0LDYgKzg2NCwxMCBAQCB2b2lkIGlndF9zeXN0ZW1fc3VzcGVuZF9hdXRvcmVzdW1lKGVudW0g
aWd0X3N1c3BlbmRfc3RhdGUgc3RhdGUsCiAJaWd0X3JlcXVpcmUodGVzdCA9PSBTVVNQRU5EX1RF
U1RfTk9ORSB8fAogCQkgICAgZmFjY2Vzc2F0KHBvd2VyX2RpciwgInBtX3Rlc3QiLCBSX09LIHwg
V19PSywgMCkgPT0gMCk7CiAKKwlpZ3Rfc2tpcChzdGF0ZSA9PSBTVVNQRU5EX1NUQVRFX0RJU0sg
JiYKKwkJICFpbnRlbF9nZXRfdG90YWxfc3dhcF9tYigpLAorCQkgIlN1c3BlbmQgdG8gZGlzayBy
ZXF1aXJlcyBzd2FwIHNwYWNlLlxuIik7CisKIAlvcmlnX3Rlc3QgPSBnZXRfc3VzcGVuZF90ZXN0
KHBvd2VyX2Rpcik7CiAJc2V0X3N1c3BlbmRfdGVzdChwb3dlcl9kaXIsIHRlc3QpOwogCi0tIAoy
LjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmln
dC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
