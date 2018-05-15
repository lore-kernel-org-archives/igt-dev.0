Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6037F6E1D3
 for <igt-dev@lists.freedesktop.org>; Tue, 15 May 2018 08:41:06 +0000 (UTC)
From: Katarzyna Dec <katarzyna.dec@intel.com>
Date: Tue, 15 May 2018 10:40:55 +0200
Message-Id: <20180515084055.8957-1-katarzyna.dec@intel.com>
In-Reply-To: <20180514125155.19040-1-katarzyna.dec@intel.com>
References: <20180514125155.19040-1-katarzyna.dec@intel.com>
Subject: [igt-dev] [PATCH i-g-t v4] lib/igt_device: Add information why
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
Z3RfcmVxdWlyZSB0byBpZ3RfYXNzZXJ0Lgp2NDogQWRkZWQgY2hlY2tpbmcgaWYgd2UgYXJlIG1h
c3RlciBhbHJlYWR5LgoKU2lnbmVkLW9mZi1ieTogS2F0YXJ6eW5hIERlYyA8a2F0YXJ6eW5hLmRl
Y0BpbnRlbC5jb20+CkNjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4K
LS0tCiBsaWIvaWd0X2RldmljZS5jIHwgMTEgKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA5
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbGliL2lndF9kZXZp
Y2UuYyBiL2xpYi9pZ3RfZGV2aWNlLmMKaW5kZXggOGEyZGQwZTMuLjc4ZGI1NDBkIDEwMDY0NAot
LS0gYS9saWIvaWd0X2RldmljZS5jCisrKyBiL2xpYi9pZ3RfZGV2aWNlLmMKQEAgLTcwLDkgKzcw
LDE2IEBAIGludCBfX2lndF9kZXZpY2VfZHJvcF9tYXN0ZXIoaW50IGZkKQogICogQGZkOiB0aGUg
ZGV2aWNlCiAgKgogICogVGVsbCB0aGUga2VybmVsIHdlIG5vIGxvbmdlciB3YW50IHRoaXMgZGV2
aWNlIGZkIHRvIGJlIHRoZSBEUk0gbWFzdGVyOwotICogYXNzZXJ0aW5nIHRoYXQgd2UgbG9zZSB0
aGUgcHJpdmlsZWdlLgorICogYXNzZXJ0aW5nIHRoYXQgd2UgbG9zZSB0aGUgcHJpdmlsZWdlLiBS
ZXR1cm4gaWYgd2UgYXJlIG1hc3RlciBhbHJlYWR5LgogICovCiB2b2lkIGlndF9kZXZpY2VfZHJv
cF9tYXN0ZXIoaW50IGZkKQogewotCWlndF9hc3NlcnRfZXEoX19pZ3RfZGV2aWNlX2Ryb3BfbWFz
dGVyKGZkKSwgMCk7CisJLyogQ2hlY2sgaWYgd2UgYXJlIG1hc3RlciBiZWZvcmUgZHJvcHBpbmcg
Ki8KKwlpZiAoX19pZ3RfZGV2aWNlX3NldF9tYXN0ZXIoZmQpKQorCQlyZXR1cm47CisJaWYgKF9f
aWd0X2RldmljZV9kcm9wX21hc3RlcihmZCkpIHsKKwkJaWd0X2RlYnVnZnNfZHVtcChmZCwgImNs
aWVudHMiKTsKKwkJaWd0X2Fzc2VydF9mKF9faWd0X2RldmljZV9kcm9wX21hc3RlcihmZCkgPT0g
MCwKKwkJCSAgICAgICJGYWlsZWQgdG8gZHJvcCBEUk0gbWFzdGVyLlxuIik7CisJfQogfQotLSAK
Mi4xNC4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
