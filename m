Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 017FF89BB0
 for <igt-dev@lists.freedesktop.org>; Mon, 14 May 2018 11:37:38 +0000 (UTC)
From: Katarzyna Dec <katarzyna.dec@intel.com>
Date: Mon, 14 May 2018 13:37:22 +0200
Message-Id: <20180514113722.28594-1-katarzyna.dec@intel.com>
In-Reply-To: <20180514101930.27085-1-katarzyna.dec@intel.com>
References: <20180514101930.27085-1-katarzyna.dec@intel.com>
Subject: [igt-dev] [PATCH i-g-t v2] lib/igt_device: Add information why
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
IENoYW5nZWQgY29tbWVudCBhbmQgYWRkZWQgbGlzdGluZyBjbGllbnRzLgoKU2lnbmVkLW9mZi1i
eTogS2F0YXJ6eW5hIERlYyA8a2F0YXJ6eW5hLmRlY0BpbnRlbC5jb20+CkNjOiBDaHJpcyBXaWxz
b24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KLS0tCiBsaWIvaWd0X2RldmljZS5jIHwgNiAr
KysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9saWIvaWd0X2RldmljZS5jIGIvbGliL2lndF9kZXZpY2UuYwppbmRleCA4YTJk
ZDBlMy4uYjJhMGExNjAgMTAwNjQ0Ci0tLSBhL2xpYi9pZ3RfZGV2aWNlLmMKKysrIGIvbGliL2ln
dF9kZXZpY2UuYwpAQCAtNzQsNSArNzQsOSBAQCBpbnQgX19pZ3RfZGV2aWNlX2Ryb3BfbWFzdGVy
KGludCBmZCkKICAqLwogdm9pZCBpZ3RfZGV2aWNlX2Ryb3BfbWFzdGVyKGludCBmZCkKIHsKLQlp
Z3RfYXNzZXJ0X2VxKF9faWd0X2RldmljZV9kcm9wX21hc3RlcihmZCksIDApOworCWlmIChfX2ln
dF9kZXZpY2VfZHJvcF9tYXN0ZXIoZmQpKSB7CisJCWlndF9kZWJ1Z2ZzX2R1bXAoZmQsICJjbGll
bnRzIik7CisJCWlndF9yZXF1aXJlX2YoX19pZ3RfZGV2aWNlX2Ryb3BfbWFzdGVyKGZkKSA9PSAw
LAorCQkJICAgICAgIkZhaWxlZCB0byBkcm9wIERSTSBtYXN0ZXIuXG4iKTsKKwl9CiB9Ci0tIAoy
LjE0LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmln
dC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
