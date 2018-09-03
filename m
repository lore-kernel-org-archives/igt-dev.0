Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB8A76E159
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Sep 2018 09:46:39 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon,  3 Sep 2018 10:46:29 +0100
Message-Id: <20180903094629.27262-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib: Fix strcmp() direction for bsearch.
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

SSBmbHVrZWQgb3V0IGFzIHZnZW0gd2FzIHRoZSBpbml0aWFsIG1pZCB2YWx1ZSwgaGlkZGluZyB0
aGUgd29yc3Qgb2YgdGhlCmVycm9ycyBhcyBpOTE1IG1hdGNoZWQgd2l0aCBEUklWRVJfQU5ZLgoK
Rml4ZXM6IDIwMDg3YmYyMjY5OCAoImxpYjogVXNlIGEgYnNlYXJjaCB0byBmaW5kIHRoZSBtb2R1
bGUgbmFtZSIpClJlcG9ydGVkLWJ5OiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVs
LmNvbT4KU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28u
dWs+CkNjOiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4KLS0tCiBsaWIv
ZHJtdGVzdC5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2xpYi9kcm10ZXN0LmMgYi9saWIvZHJtdGVzdC5jCmlu
ZGV4IGJmYjM4ZjFlOS4uYWRmZjFhODFmIDEwMDY0NAotLS0gYS9saWIvZHJtdGVzdC5jCisrKyBi
L2xpYi9kcm10ZXN0LmMKQEAgLTIyNiw5ICsyMjYsOSBAQCBzdGF0aWMgaW50IG9wZW5fZGV2aWNl
KGNvbnN0IGNoYXIgKm5hbWUsIHVuc2lnbmVkIGludCBjaGlwc2V0KQogCQlpbnQgbWlkID0gc3Rh
cnQgKyAoZW5kIC0gc3RhcnQpIC8gMjsKIAkJaW50IHJldCA9IHN0cmNtcChtb2R1bGVzW21pZF0u
bW9kdWxlLCBkZXZfbmFtZSk7CiAJCWlmIChyZXQgPCAwKSB7Ci0JCQllbmQgPSBtaWQ7Ci0JCX0g
ZWxzZSBpZiAocmV0ID4gMCkgewogCQkJc3RhcnQgPSBtaWQgKyAxOworCQl9IGVsc2UgaWYgKHJl
dCA+IDApIHsKKwkJCWVuZCA9IG1pZDsKIAkJfSBlbHNlIHsKIAkJCWNoaXAgPSBtb2R1bGVzW21p
ZF0uYml0OwogCQkJYnJlYWs7Ci0tIAoyLjE5LjAucmMxCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2lndC1kZXYK
