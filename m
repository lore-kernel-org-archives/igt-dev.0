Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B068C6E995
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Feb 2021 13:49:30 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Tue, 23 Feb 2021 15:49:24 +0200
Message-Id: <20210223134924.10045-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20210223134924.10045-1-ville.syrjala@linux.intel.com>
References: <20210223134924.10045-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/kms_plane: Restore RGB pixel
 format tests for non-atomic drivers
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClJl
c3RvcmUgdGhlIGNhcGFiaWxpdHkgdG8gcnVuIFJHQiBwaXhlbCBmb3JtYXQgdGVzdHMgd2hlbiB0
aGUgZHJpdmVyCmRvZXNuJ3QgYWR2ZXJ0aXplIHRoZSBhdG9taWMgY2FwYWJpbGl0eS4KCkNjOiBK
dWhhLVBla2thIEhlaWtraWxhIDxqdWhhcGVra2EuaGVpa2tpbGFAZ21haWwuY29tPgpGaXhlczog
ZTk2YzBkOGU2OTUyICgidGVzdHMva21zX3BsYW5lOiBvcHRpbWl6ZSBwaXhlbCBmb3JtYXQgdGVz
dHMiKQpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXgu
aW50ZWwuY29tPgotLS0KIHRlc3RzL2ttc19wbGFuZS5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2tt
c19wbGFuZS5jIGIvdGVzdHMva21zX3BsYW5lLmMKaW5kZXggZWNiYTE5N2M4MGY1Li4yOThhOTM3
NWI5ZjQgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19wbGFuZS5jCisrKyBiL3Rlc3RzL2ttc19wbGFu
ZS5jCkBAIC01NjcsOCArNTY3LDggQEAgc3RhdGljIHZvaWQgY2FwdHVyZV9mb3JtYXRfY3Jjc19w
YWNrZWQoZGF0YV90ICpkYXRhLCBlbnVtIHBpcGUgcGlwZSwKIAlwcmVwYXJlX2Zvcm1hdF9jb2xv
cihkYXRhLCBwaXBlLCBwbGFuZSwgZm9ybWF0LCBtb2RpZmllciwKIAkJCSAgICAgd2lkdGgsIGhl
aWdodCwgZW5jb2RpbmcsIHJhbmdlLCAmYmxhY2ssIGZiLCB0cnVlKTsKIAotCWlndF9kaXNwbGF5
X2NvbW1pdF9hdG9taWMoJmRhdGEtPmRpc3BsYXksIERSTV9NT0RFX0FUT01JQ19BTExPV19NT0RF
U0VULAotCQkJCSAgTlVMTCk7CisJaWd0X2Rpc3BsYXlfY29tbWl0MigmZGF0YS0+ZGlzcGxheSwg
ZGF0YS0+ZGlzcGxheS5pc19hdG9taWMgPworCQkJICAgIENPTU1JVF9BVE9NSUMgOiBDT01NSVRf
VU5JVkVSU0FMKTsKIAogCWlndF9yZW1vdmVfZmIoZGF0YS0+ZHJtX2ZkLCAmb2xkX2ZiKTsKIAot
LSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
