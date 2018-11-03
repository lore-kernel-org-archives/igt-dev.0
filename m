Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63F6F6EB60
 for <igt-dev@lists.freedesktop.org>; Sat,  3 Nov 2018 11:36:13 +0000 (UTC)
From: Jyoti Yadav <jyoti.r.yadav@intel.com>
Date: Sat,  3 Nov 2018 07:36:01 -0400
Message-Id: <1541244966-27134-1-git-send-email-jyoti.r.yadav@intel.com>
Subject: [igt-dev] [PATCH i-g-t v3 0/5] Added new test file pm_dc.c
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
Cc: Jyoti Yadav <jyoti.r.yadav@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

VGhpcyBwYXRjaCBzZXJpZXMgYWRkcyBuZXcgdGVzdHMgdG8gdmFsaWRhdGUgRGlzcGxheSBDIHN0
YXRlcy4KREMgc3RhdGVzIGxpa2UgREM1IGFuZCBEQzYgYXJlIHZhbGlkYXRlZCBkdXJpbmcgUFNS
IGVudHJ5L2V4aXQKYW5kIGR1cmluZyBEUE1TIG9uL29mZiBjeWNsZS4KCgoKCkp5b3RpIFlhZGF2
ICg1KToKICBbaW50ZWwtZ2Z4XVtpZ3QtZGV2XSBsaWIvaWd0X3BtOiBNb3ZlcyBEbWNfbG9hZGVk
KCkgZnVuY3Rpb24gaW50bwogICAgbGlicmFyeQogIFtpbnRlbC1nZnhdW2lndC1kZXZdIHRlc3Rz
L3BtX2RjOiBBZGRlZCBuZXcgdGVzdCB0byB2ZXJpZnkgRGlzcGxheSBDCiAgICBTdGF0ZXMuCiAg
W2ludGVsLWdmeF1baWd0LWRldl0gdGVzdHMvcG1fZGM6IEFkZGVkIHRlc3QgZm9yIERDNiBkdXJp
bmcgUFNSCiAgW2ludGVsLWdmeF1baWd0LWRldl0gdGVzdHMvcG1fZGM6IEFkZGVkIHRlc3QgZm9y
IERDNSBkdXJpbmcgRFBNUwogIFtpbnRlbC1nZnhdW2lndC1kZXZdIHRlc3RzL3BtX2RjOiBBZGRl
ZCB0ZXN0IGZvciBEQzYgZHVyaW5nIERQTVMKCiBsaWIvaWd0X3BtLmMgICAgICAgICAgIHwgIDI4
ICsrKysrKwogbGliL2lndF9wbS5oICAgICAgICAgICB8ICAgMSArCiB0ZXN0cy9NYWtlZmlsZS5z
b3VyY2VzIHwgICAxICsKIHRlc3RzL21lc29uLmJ1aWxkICAgICAgfCAgIDEgKwogdGVzdHMvcG1f
ZGMuYyAgICAgICAgICB8IDI2NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCiB0ZXN0cy9wbV9ycG0uYyAgICAgICAgIHwgIDE3ICstLS0KIDYgZmlsZXMg
Y2hhbmdlZCwgMjk4IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUg
MTAwNjQ0IHRlc3RzL3BtX2RjLmMKCi0tIAoxLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pZ3QtZGV2Cg==
