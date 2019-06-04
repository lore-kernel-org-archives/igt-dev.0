Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4129889B8F
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Jun 2019 18:01:26 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Tue,  4 Jun 2019 23:26:01 +0530
Message-Id: <20190604175601.14735-6-anshuman.gupta@intel.com>
In-Reply-To: <20190604175601.14735-1-anshuman.gupta@intel.com>
References: <20190604175601.14735-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v7 5/5] DO_NOT_MERGE: adding i915_pm_rpm pc8
 subtest to fast feedback list.
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

Rm9yY2luZyBDSSB0byB0ZXN0IGJlbG93IHN1Yi10ZXN0IG9uIElDTC4KcGM4LXJlc2lkZW5jeQpt
b2Rlc2V0LXBjOC1yZXNpZGVuY3ktc3RyZXNzCmdlbS1leGVjYnVmLXN0cmVzcy1wYzgKClNpZ25l
ZC1vZmYtYnk6IEFuc2h1bWFuIEd1cHRhIDxhbnNodW1hbi5ndXB0YUBpbnRlbC5jb20+Ci0tLQog
dGVzdHMvaW50ZWwtY2kvZmFzdC1mZWVkYmFjay50ZXN0bGlzdCB8IDQgKysrKwogMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsLWNpL2Zhc3Qt
ZmVlZGJhY2sudGVzdGxpc3QgYi90ZXN0cy9pbnRlbC1jaS9mYXN0LWZlZWRiYWNrLnRlc3RsaXN0
CmluZGV4IDQwNDc1YjFhLi44MTI5MWRmZSAxMDA2NDQKLS0tIGEvdGVzdHMvaW50ZWwtY2kvZmFz
dC1mZWVkYmFjay50ZXN0bGlzdAorKysgYi90ZXN0cy9pbnRlbC1jaS9mYXN0LWZlZWRiYWNrLnRl
c3RsaXN0CkBAIC0yMTgsNiArMjE4LDEwIEBAIGlndEBrbXNfc2V0bW9kZUBiYXNpYy1jbG9uZS1z
aW5nbGUtY3J0YwogaWd0QGk5MTVfcG1fYmFja2xpZ2h0QGJhc2ljLWJyaWdodG5lc3MKIGlndEBp
OTE1X3BtX3JwbUBiYXNpYy1wY2ktZDMtc3RhdGUKIGlndEBpOTE1X3BtX3JwbUBiYXNpYy1ydGUK
K2lndEBpOTE1X3BtX3JwbUBwYzgtcmVzaWRlbmN5CitpZ3RAaTkxNV9wbV9ycG1AcGM4LXJlc2lk
ZW5jeS1hbGwtcGlwZXMtcGxhbmVzCitpZ3RAaTkxNV9wbV9ycG1AZ2VtLWV4ZWNidWYtc3RyZXNz
LXBjOAoraWd0QGk5MTVfcG1fcnBtQG1vZGVzZXQtcGM4LXJlc2lkZW5jeS1zdHJlc3MKIGlndEBp
OTE1X3BtX3Jwc0BiYXNpYy1hcGkKIGlndEBwcmltZV9idXN5QGJhc2ljLWFmdGVyLWRlZmF1bHQK
IGlndEBwcmltZV9idXN5QGJhc2ljLWJlZm9yZS1kZWZhdWx0Ci0tIAoyLjIxLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
