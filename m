Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB5CD6E044
 for <igt-dev@lists.freedesktop.org>; Mon, 14 May 2018 12:52:03 +0000 (UTC)
From: Katarzyna Dec <katarzyna.dec@intel.com>
Date: Mon, 14 May 2018 14:51:55 +0200
Message-Id: <20180514125155.19040-1-katarzyna.dec@intel.com>
In-Reply-To: <20180514113722.28594-1-katarzyna.dec@intel.com>
References: <20180514113722.28594-1-katarzyna.dec@intel.com>
Subject: [igt-dev] [PATCH i-g-t v3] lib/igt_device: Add information why
 cannot drop drm master
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

TGV0J3MgYWRkIGFkZGl0aW9uYWwgaW5mb3JtYXRpb24gdG8gaWd0X2RldmljZV9kcm9wX21hc3Rl
cgppbiBjYXNlIHdlIHRyeSB0byBydW4gdGVzdHMgd2l0aCBlLmcuIHgxMSBlbmFibGVkLgoKdjI6
IENoYW5nZWQgY29tbWVudCBhbmQgYWRkZWQgbGlzdGluZyBjbGllbnRzLgp2MzogQ2hhbmdlZCBp
Z3RfcmVxdWlyZSB0byBpZ3RfYXNzZXJ0CgpTaWduZWQtb2ZmLWJ5OiBLYXRhcnp5bmEgRGVjIDxr
YXRhcnp5bmEuZGVjQGludGVsLmNvbT4KQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2ls
c29uLmNvLnVrPgotLS0KIGxpYi9pZ3RfZGV2aWNlLmMgfCA2ICsrKysrLQogMSBmaWxlIGNoYW5n
ZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3Rf
ZGV2aWNlLmMgYi9saWIvaWd0X2RldmljZS5jCmluZGV4IDhhMmRkMGUzLi43MTM1ZmMyMCAxMDA2
NDQKLS0tIGEvbGliL2lndF9kZXZpY2UuYworKysgYi9saWIvaWd0X2RldmljZS5jCkBAIC03NCw1
ICs3NCw5IEBAIGludCBfX2lndF9kZXZpY2VfZHJvcF9tYXN0ZXIoaW50IGZkKQogICovCiB2b2lk
IGlndF9kZXZpY2VfZHJvcF9tYXN0ZXIoaW50IGZkKQogewotCWlndF9hc3NlcnRfZXEoX19pZ3Rf
ZGV2aWNlX2Ryb3BfbWFzdGVyKGZkKSwgMCk7CisJaWYgKF9faWd0X2RldmljZV9kcm9wX21hc3Rl
cihmZCkpIHsKKwkJaWd0X2RlYnVnZnNfZHVtcChmZCwgImNsaWVudHMiKTsKKwkJaWd0X2Fzc2Vy
dF9mKF9faWd0X2RldmljZV9kcm9wX21hc3RlcihmZCkgPT0gMCwKKwkJCSAgICAgICJGYWlsZWQg
dG8gZHJvcCBEUk0gbWFzdGVyLlxuIik7CisJfQogfQotLSAKMi4xNC4zCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdApp
Z3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
