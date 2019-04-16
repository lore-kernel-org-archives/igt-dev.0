Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F325289C1F
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Apr 2019 13:39:41 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Tue, 16 Apr 2019 19:05:34 +0530
Message-Id: <1555421738-15223-1-git-send-email-anshuman.gupta@intel.com>
Subject: [igt-dev] [PATCH i-g-t v3 0/4] igt/i915/i915_pm_lpsp enable pm_lpsp
 for platforms till Gen11 v3
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
Cc: animesh.manna@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

aTkxNV9wbV9scHNwIHBhdGNoLCBzZW5kaW5nIHYzIHZlcnNpb24gYWZ0ZXIgYWRkaW5nIGZldwpt
b3JlIHBhY3RoZXMgdG8gc2VyaWVzIGluIG9yZGVyIGZpeCBDSSBJR1QgZmFpbHVyZXMuCjEuIENo
ZWNrIGxwc3AgcmVsZXZhbmNlIG9uIG5vbiBlZHAgcGFuZWwgd2hpY2guCjIuIHNraXAgZWRwLXBh
bmVsLWZpdHRlciB0ZXN0IGZvciBHZW45IHBsYXRmcm9tIG9ud2FyZHMuCgpUaGlzIHNlcmllcyBo
YXMgYWRkZWQgaTkxNV9wbV9scHNwIHN1YnRlc3RzIHRvIENJIGZhc3QgCmZlZWRiYWNrIGxpc3Qg
aW4gb3JkZXIgdG8gcnVuIGNvdmVyIHRoZXNlIHN1YnRlc3Qgb24gYWxsCmFmZmVjdGVkIHBsYXRm
b3Jtcy4KClJldmlzaW9uIDEgTGluazogIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9y
Zy9zZXJpZXMvNTgwNTEvCgpBbnNodW1hbiBHdXB0YSAoNCk6CiAgaWd0L2k5MTUvaTkxNV9wbV9s
cHNwIGVuYWJsZSBwbV9scHNwIGZvciBwbGF0Zm9ybXMgdGlsbCBHZW4xMS4KICBpZ3QvaTkxNS9p
OTE1X3BtX2xwc3AgY2hlY2sgbHBzcCByZWxldmFuY2Ugb24gbm9uIGVkcCBwYW5lbC4KICBpZ3Qv
aTkxNS9pOTE1X3BtX2xwc3Agc2tpcCBlZHAtcGFuZWwtZml0dGVyIHRlc3QuCiAgRE9fTk9UX01F
UkdFIGFkZCBpOTE1X3BtX2xwc3Agc3VidGVzdHMgdG8gQ0kgZmFzdCBmZWVkYmFjayBsaXN0LgoK
IHRlc3RzL2k5MTUvaTkxNV9wbV9scHNwLmMgICAgICAgICAgICAgfCA5MSArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKystLQogdGVzdHMvaW50ZWwtY2kvZmFzdC1mZWVkYmFjay50ZXN0
bGlzdCB8ICA0ICsrCiAyIGZpbGVzIGNoYW5nZWQsIDkxIGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCgotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRl
dg==
