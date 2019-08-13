Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E91BB89E47
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Aug 2019 14:03:13 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
Date: Tue, 13 Aug 2019 12:34:21 +0530
Message-Id: <20190813070421.17633-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/display_require: reset hdcp on all
 connectors
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
To: igt-dev <igt-dev@lists.freedesktop.org>
Cc: petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

QXQgdGhlIHN0YXJ0IG9mIGV2ZXJ5IHRlc3QsIHJlc2V0IEhEQ1Agc3RhdGUgdG8gVU5ERVNJUkVE
IG9uIGFsbApjb25uZWN0b3JzLCBzbyB0aGF0IHdlIHdpbGwgbm90IGhhdmUgYW55IGhkY3AgcmVs
YXRlZCBub2lzZXMgaW4KdGhlIHN1YnNlcXVlbnQgdGVzdHMuCgpTaWduZWQtb2ZmLWJ5OiBSYW1h
bGluZ2FtIEMgPHJhbWFsaW5nYW0uY0BpbnRlbC5jb20+CkJ1Z3ppbGxhOiBodHRwczovL2J1Z3Mu
ZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMTEzOTAKLS0tCiBsaWIvaWd0X2ttcy5j
IHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
bGliL2lndF9rbXMuYyBiL2xpYi9pZ3Rfa21zLmMKaW5kZXggYjAxNjlmNzNiNzUyLi42ODY1MGFl
M2Q3ZTkgMTAwNjQ0Ci0tLSBhL2xpYi9pZ3Rfa21zLmMKKysrIGIvbGliL2lndF9rbXMuYwpAQCAt
MTg1OSw2ICsxODU5LDEwIEBAIHN0YXRpYyB2b2lkIGlndF9vdXRwdXRfcmVzZXQoaWd0X291dHB1
dF90ICpvdXRwdXQpCiAJaWYgKGlndF9vdXRwdXRfaGFzX3Byb3Aob3V0cHV0LCBJR1RfQ09OTkVD
VE9SX0JST0FEQ0FTVF9SR0IpKQogCQlpZ3Rfb3V0cHV0X3NldF9wcm9wX3ZhbHVlKG91dHB1dCwg
SUdUX0NPTk5FQ1RPUl9CUk9BRENBU1RfUkdCLAogCQkJCQkgIEJST0FEQ0FTVF9SR0JfRlVMTCk7
CisKKwlpZiAoaWd0X291dHB1dF9oYXNfcHJvcChvdXRwdXQsIElHVF9DT05ORUNUT1JfQ09OVEVO
VF9QUk9URUNUSU9OKSkKKwkJaWd0X291dHB1dF9zZXRfcHJvcF92YWx1ZShvdXRwdXQsIElHVF9D
T05ORUNUT1JfQ09OVEVOVF9QUk9URUNUSU9OLAorCQkJCQkgIDApOwogfQogCiAvKioKLS0gCjIu
MjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0
LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
