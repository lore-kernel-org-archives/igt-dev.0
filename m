Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 199166E3A0
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Mar 2019 14:57:38 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Fri,  8 Mar 2019 16:57:28 +0200
Message-Id: <20190308145728.18573-3-ville.syrjala@linux.intel.com>
In-Reply-To: <20190308145728.18573-1-ville.syrjala@linux.intel.com>
References: <20190308145728.18573-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/3] tools/intel_vbt_decode: Dump the GPIO
 value/config/flag as a raw hex byte
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClRo
ZSBzcGVjIGlzIHRvdGFsbHkgY29uZnVzZWQgd2hlbiBpdCBjb21lcyB0byB0aGUgR1BJTyBmbGFn
cyBieXRlLgpUbyBhbGxvdyB1cyB0byBpbnNwZWN0IHRoYXQgdGhlIGRlY29kZWQgcmVzdWx0IGF0
IGxlYXN0IHNlZW1zCnNlbnNpYmxlIGxldCdzIGFsc28gZHVtcCB0aGUgcmF3IGJ5dGUuIFNob3Vs
ZCBhdCBsZWFzdCBzaG93IGlmCnNvbWUgYml0cyBhcmUgc2V0IHdoaWNoIHdlJ3JlIG5vdCBleHBl
Y3RpbmcuCgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGlu
dXguaW50ZWwuY29tPgotLS0KIHRvb2xzL2ludGVsX3ZidF9kZWNvZGUuYyB8IDggKysrKy0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvdG9vbHMvaW50ZWxfdmJ0X2RlY29kZS5jIGIvdG9vbHMvaW50ZWxfdmJ0X2RlY29kZS5j
CmluZGV4IDU3NDIwODFlYTI5YS4uODU3YjAxN2I0MWRkIDEwMDY0NAotLS0gYS90b29scy9pbnRl
bF92YnRfZGVjb2RlLmMKKysrIGIvdG9vbHMvaW50ZWxfdmJ0X2RlY29kZS5jCkBAIC0xMTkwLDE0
ICsxMTkwLDE0IEBAIHN0YXRpYyBjb25zdCB1aW50OF90ICptaXBpX2R1bXBfZ3Bpbyhjb25zdCB1
aW50OF90ICpkYXRhLCB1aW50OF90IHNlcV92ZXJzaW9uKQogCQludW1iZXIgPSAqZGF0YSsrOwog
CQlmbGFncyA9ICpkYXRhKys7CiAKLQkJcHJpbnRmKCJcdFx0R1BJTyBpbmRleCAldSwgbnVtYmVy
ICV1LCBzZXQgJWRcbiIsCi0JCSAgICAgICBpbmRleCwgbnVtYmVyLCBmbGFncyAmIDEpOworCQlw
cmludGYoIlx0XHRHUElPIGluZGV4ICV1LCBudW1iZXIgJXUsIHNldCAlZCAoMHglMDJ4KVxuIiwK
KwkJICAgICAgIGluZGV4LCBudW1iZXIsIGZsYWdzICYgMSwgZmxhZ3MpOwogCX0gZWxzZSB7CiAJ
CWluZGV4ID0gKmRhdGErKzsKIAkJZmxhZ3MgPSAqZGF0YSsrOwogCi0JCXByaW50ZigiXHRcdEdQ
SU8gaW5kZXggJXUsIHNvdXJjZSAlZCwgc2V0ICVkXG4iLAotCQkgICAgICAgaW5kZXgsIChmbGFn
cyA+PiAxKSAmIDMsIGZsYWdzICYgMSk7CisJCXByaW50ZigiXHRcdEdQSU8gaW5kZXggJXUsIHNv
dXJjZSAlZCwgc2V0ICVkICgweCUwMngpXG4iLAorCQkgICAgICAgaW5kZXgsIChmbGFncyA+PiAx
KSAmIDMsIGZsYWdzICYgMSwgZmxhZ3MpOwogCX0KIAogCXJldHVybiBkYXRhOwotLSAKMi4xOS4y
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2
IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
