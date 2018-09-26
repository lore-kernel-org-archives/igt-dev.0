Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B474890CE
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Sep 2018 16:00:56 +0000 (UTC)
From: Jyoti Yadav <jyoti.r.yadav@intel.com>
Date: Wed, 26 Sep 2018 11:59:22 -0400
Message-Id: <1537977563-18878-6-git-send-email-jyoti.r.yadav@intel.com>
In-Reply-To: <1537977563-18878-1-git-send-email-jyoti.r.yadav@intel.com>
References: <1537977563-18878-1-git-send-email-jyoti.r.yadav@intel.com>
Subject: [igt-dev] [PATCH i-g-t v1 5/6] [intel-gfx] lib/intel_reg : This
 patch adds Display C States related residency counters.
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
Cc: Jyoti Yadav <jyoti.r.yadav@intel.com>, anusha.srivatsa@intel.com, intel-gfx@lists.freedektop.org
List-ID: <igt-dev@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogSnlvdGkgWWFkYXYgPGp5b3RpLnIueWFkYXZAaW50ZWwuY29tPgotLS0K
IGxpYi9pbnRlbF9yZWcuaCB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9saWIvaW50ZWxfcmVnLmggYi9saWIvaW50ZWxfcmVnLmgKaW5kZXgg
Zjg1ZmI3NC4uNGY0MjRmMCAxMDA2NDQKLS0tIGEvbGliL2ludGVsX3JlZy5oCisrKyBiL2xpYi9p
bnRlbF9yZWcuaApAQCAtMzYyMSw0ICszNjIxLDkgQEAgdHlwZWRlZiBlbnVtIHsKICNkZWZpbmUg
VkxWX0lPU0ZfREFUQQkJCQkoVkxWX0RJU1BMQVlfQkFTRSArIDB4MjEwNCkKICNkZWZpbmUgVkxW
X0lPU0ZfQUREUgkJCQkoVkxWX0RJU1BMQVlfQkFTRSArIDB4MjEwOCkKIAorLyogRGlzcGxheSBD
IHN0YXRlcyByZWxhdGVkIHJlc2lkZW5jeSBjb3VudGVyIHJlZ2lzdGVycy4gKi8KKyNkZWZpbmUg
U0tMX0NTUl9EQzNfREM1X0NPVU5UICAweDgwMDMwCisjZGVmaW5lIFNLTF9DU1JfREM1X0RDNl9D
T1VOVCAgMHg4MDAyQworI2RlZmluZSBCWFRfQ1NSX0RDM19EQzVfQ09VTlQgIDB4ODAwMzgKKwog
I2VuZGlmIC8qIF9JODEwX1JFR19IICovCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9pZ3QtZGV2Cg==
