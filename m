Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 231C26E261
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2019 00:58:49 +0000 (UTC)
From: don.hiatt@intel.com
Date: Thu, 21 Nov 2019 17:10:36 -0800
Message-Id: <20191122011036.136424-1-don.hiatt@intel.com>
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
IV0KdjM6IFVzZSBpZ3Rfc2tpcF9vbl9mKCkKCkNjOiBTdWphcml0aGEgU3VuZGFyZXNhbiA8c3Vq
YXJpdGhhLnN1bmRhcmVzYW5AaW50ZWwuY29tPgpDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJp
cy13aWxzb24uY28udWs+ClNpZ25lZC1vZmYtYnk6IERvbiBIaWF0dCA8ZG9uLmhpYXR0QGludGVs
LmNvbT4KLS0tCiBsaWIvaWd0X2F1eC5jIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvbGliL2lndF9hdXguYyBiL2xpYi9pZ3RfYXV4LmMKaW5k
ZXggNTc4Zjg1NzkzM2YwLi5hNmIxMTRlZDdlNjUgMTAwNjQ0Ci0tLSBhL2xpYi9pZ3RfYXV4LmMK
KysrIGIvbGliL2lndF9hdXguYwpAQCAtODY0LDYgKzg2NCwxMCBAQCB2b2lkIGlndF9zeXN0ZW1f
c3VzcGVuZF9hdXRvcmVzdW1lKGVudW0gaWd0X3N1c3BlbmRfc3RhdGUgc3RhdGUsCiAJaWd0X3Jl
cXVpcmUodGVzdCA9PSBTVVNQRU5EX1RFU1RfTk9ORSB8fAogCQkgICAgZmFjY2Vzc2F0KHBvd2Vy
X2RpciwgInBtX3Rlc3QiLCBSX09LIHwgV19PSywgMCkgPT0gMCk7CiAKKwlpZ3Rfc2tpcF9vbl9m
KHN0YXRlID09IFNVU1BFTkRfU1RBVEVfRElTSyAmJgorCQkgICAgICAhaW50ZWxfZ2V0X3RvdGFs
X3N3YXBfbWIoKSwKKwkJICAgICAgIlN1c3BlbmQgdG8gZGlzayByZXF1aXJlcyBzd2FwIHNwYWNl
LlxuIik7CisKIAlvcmlnX3Rlc3QgPSBnZXRfc3VzcGVuZF90ZXN0KHBvd2VyX2Rpcik7CiAJc2V0
X3N1c3BlbmRfdGVzdChwb3dlcl9kaXIsIHRlc3QpOwogCi0tIAoyLjE3LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0
CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
