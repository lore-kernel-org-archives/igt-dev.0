Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C3B6E32D
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Apr 2018 10:02:11 +0000 (UTC)
From: Marta Lofstedt <marta.lofstedt@intel.com>
Date: Tue,  3 Apr 2018 13:03:46 +0300
Message-Id: <20180403100346.17248-1-marta.lofstedt@intel.com>
In-Reply-To: <20180326062907.15181-1-marta.lofstedt@intel.com>
References: <20180326062907.15181-1-marta.lofstedt@intel.com>
Subject: [igt-dev] [PATCH i-g-t v2] blacklist: Don't run DRRS test on Intel
 CI system
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

U2tpcHBpbmcgdGFrZXMgdGltZSwgc3BlY2lmaWNhbGx5IGZvciB0aGUgYmlnIGFtb3VudCBvZiBk
cnJzCnJlbGF0ZWQga21zX2Zyb250YnVmZmVyX3RyYWNraW5nIHRlc3RzLiBTaW5jZSB3ZSBjdXJy
ZW50bHkKZG9uJ3QgaGF2ZSBhbnkgc3lzdGVtIHNldCB1cCB3aXRoIERSUlMgcGFuZWxzLCBibGFj
a2xpc3RpbmcKYWxsIHRob3NlIHRlc3Qgd2lsbCBzYXZlIHRpbWUsIGFuZCB3ZSBjYW4gYXZvaWQg
dGhlIG5lZWQgdG8KaW5jcmVhc2UgdGhlIEplbmtpbnMgdGltZW91dCBpbiBvcmRlciB0byBzb2x2
ZSB0aGUgQnVnemlsbGEKYmVsb3cuCgpWMjogQ2hhbmdlZCB0eXBvIGFuZCBhZGRlZCBjb21tZW50
LgoKQnVnemlsbGE6IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lk
PTEwNTYxNwpTaWduZWQtb2ZmLWJ5OiBNYXJ0YSBMb2ZzdGVkdCA8bWFydGEubG9mc3RlZHRAaW50
ZWwuY29tPgotLS0KIHRlc3RzL2ludGVsLWNpL2JsYWNrbGlzdC50eHQgfCA0ICsrKysKIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC1jaS9i
bGFja2xpc3QudHh0IGIvdGVzdHMvaW50ZWwtY2kvYmxhY2tsaXN0LnR4dAppbmRleCA3Y2EzMTNh
Yy4uZWYzYjQ1ZTkgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ludGVsLWNpL2JsYWNrbGlzdC50eHQKKysr
IGIvdGVzdHMvaW50ZWwtY2kvYmxhY2tsaXN0LnR4dApAQCAtNTgsNiArNTgsMTAgQEAgaWd0QGdl
bV91c2VycHRyX2JsaXRzQChtYWpvcnxtaW5vcnxmb3JrZWR8bWxvY2tlZHxzd2FwcGluZykuKgog
aWd0QGdlbV93YWl0QC4qaGFuZy4qCiBpZ3RAZ2VtX3dyaXRlX3JlYWRfcmluZ19zd2l0Y2goQC4q
KT8KICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCisjIFRo
ZXJlIGFyZSBubyBEUlJTIGNhcGFibGUgZGlzcGxheXMgaW4gQ0kgbGFiCisjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIworaWd0QGttc19mcm9udGJ1ZmZlcl90
cmFja2luZ0AuKmRycnMuKgorIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMKICMgQnJvYWRjb20KICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjCiBpZ3RAdmM0Xy4qCi0tIAoyLjExLjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaWd0LWRldgo=
