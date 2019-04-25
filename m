Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05FFC89228
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2019 10:02:10 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu, 25 Apr 2019 13:02:06 +0300
Message-Id: <20190425100206.29864-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] drmtest: Properly handle virtio-gpu's naming
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

SW5zdGVhZCBvZiBsaXN0aW5nIHZpcnRpby1ncHUgd2l0aCBib3RoIHNwZWxsaW5ncyBpbiB0aGUg
bW9kdWxlcwphcnJheSwgcHJvcGVybHkgdXNlIGl0cyBkcml2ZXIgbmFtZSBmb3Igb3BlbmluZyBh
bmQgbW9kdWxlIG5hbWUgZm9yCmxvYWRpbmcuCgpTaWduZWQtb2ZmLWJ5OiBQZXRyaSBMYXR2YWxh
IDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4KLS0tCiBsaWIvZHJtdGVzdC5jIHwgOSArKysrKysr
LS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvbGliL2RybXRlc3QuYyBiL2xpYi9kcm10ZXN0LmMKaW5kZXggNGE5MmZiNWMuLmNl
MzgwNGY5IDEwMDY0NAotLS0gYS9saWIvZHJtdGVzdC5jCisrKyBiL2xpYi9kcm10ZXN0LmMKQEAg
LTE4Nyw2ICsxODcsMTIgQEAgc3RhdGljIGludCBtb2Rwcm9iZShjb25zdCBjaGFyICpkcml2ZXIp
CiAJcmV0dXJuIGlndF9rbW9kX2xvYWQoZHJpdmVyLCAiIik7CiB9CiAKKy8qIHZpcnRpbydzIGRy
aXZlciBuYW1lIGlzIHZpcnRpb19ncHUgYnV0IHRoZSBtb2R1bGUgaXMgdmlydGlvLWdwdS5rbyAq
Lworc3RhdGljIHZvaWQgbW9kcHJvYmVfdmlydGlvKGNvbnN0IGNoYXIgKm5hbWUpCit7CisJaWd0
X2ttb2RfbG9hZCgidmlydGlvLWdwdSIsICIiKTsKK30KKwogc3RhdGljIHZvaWQgbW9kcHJvYmVf
aTkxNShjb25zdCBjaGFyICpuYW1lKQogewogCS8qIFdoZW4gbG9hZGluZyBpOTE1LCB3ZSBhbHNv
IHdhbnQgdG8gbG9hZCBzbmQtaGRhIGV0IGFsICovCkBAIC0yMDMsOCArMjA5LDcgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBtb2R1bGUgewogCXsgRFJJVkVSX1YzRCwgInYzZCIgfSwKIAl7IERSSVZF
Ul9WQzQsICJ2YzQiIH0sCiAJeyBEUklWRVJfVkdFTSwgInZnZW0iIH0sCi0JeyBEUklWRVJfVklS
VElPLCAidmlydGlvLWdwdSIgfSwKLQl7IERSSVZFUl9WSVJUSU8sICJ2aXJ0aW9fZ3B1IiB9LAor
CXsgRFJJVkVSX1ZJUlRJTywgInZpcnRpb19ncHUiLCBtb2Rwcm9iZV92aXJ0aW8gfSwKIAl7fQog
fTsKIAotLSAKMi4xOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
