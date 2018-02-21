Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr0-x244.google.com (mail-wr0-x244.google.com
 [IPv6:2a00:1450:400c:c0c::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 010396E082
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Feb 2018 10:57:48 +0000 (UTC)
Received: by mail-wr0-x244.google.com with SMTP id m5so3231493wrg.1
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Feb 2018 02:57:48 -0800 (PST)
From: Tvrtko Ursulin <tursulin@ursulin.net>
Date: Wed, 21 Feb 2018 10:57:38 +0000
Message-Id: <20180221105738.6690-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t] tests/perf_pmu: Skip hotplug test on Broxton
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
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KCkFwb2xsb2xh
a2UgbWFjaGluZSBpbiB0aGUgc2hhcmRzIGNhbm5vdCBicmluZyB0aGUgQ1BVMCBiYWNrIG9ubGlu
ZSBzbwpza2lwIHRoZSB0ZXN0IG9uIGFsbCBCcm94dG9ucyBmb3Igbm93LgoKU2lnbmVkLW9mZi1i
eTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KLS0tCiB0ZXN0cy9w
ZXJmX3BtdS5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1n
aXQgYS90ZXN0cy9wZXJmX3BtdS5jIGIvdGVzdHMvcGVyZl9wbXUuYwppbmRleCAwYmViOTE5NzYx
MDIuLmI2ZGViZjUyMzIwMSAxMDA2NDQKLS0tIGEvdGVzdHMvcGVyZl9wbXUuYworKysgYi90ZXN0
cy9wZXJmX3BtdS5jCkBAIC05NjYsNiArOTY2LDcgQEAgc3RhdGljIHZvaWQgY3B1X2hvdHBsdWco
aW50IGdlbV9mZCkKIAlpbnQgZmQsIHJldDsKIAlpbnQgY3VyID0gMDsKIAorCWlndF9yZXF1aXJl
KElTX0JST1hUT04oaW50ZWxfZ2V0X2RybV9kZXZpZChnZW1fZmQpKSk7CiAJaWd0X3JlcXVpcmUo
Y3B1MF9ob3RwbHVnX3N1cHBvcnQoKSk7CiAKIAlmZCA9IG9wZW5fcG11KEk5MTVfUE1VX0VOR0lO
RV9CVVNZKEk5MTVfRU5HSU5FX0NMQVNTX1JFTkRFUiwgMCkpOwotLSAKMi4xNC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcg
bGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
