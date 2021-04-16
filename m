Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9B96ECA5
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Apr 2021 17:48:51 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Fri, 16 Apr 2021 20:48:38 +0300
Message-Id: <20210416174841.20132-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20210416174841.20132-1-ville.syrjala@linux.intel.com>
References: <20210416174841.20132-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/4] lib: Document that we have
 --trace-on-oops
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCklu
Y2x1ZGUgLS10cmFjZS1vbi1vb3BzIGluIHRoZSBoZWxwIHRleHQuCgpTaWduZWQtb2ZmLWJ5OiBW
aWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgotLS0KIGxpYi9p
Z3RfY29yZS5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1n
aXQgYS9saWIvaWd0X2NvcmUuYyBiL2xpYi9pZ3RfY29yZS5jCmluZGV4IDY1OTdhY2ZhYWNmZS4u
NmE0M2Q5NTVkNTYyIDEwMDY0NAotLS0gYS9saWIvaWd0X2NvcmUuYworKysgYi9saWIvaWd0X2Nv
cmUuYwpAQCAtNzA4LDYgKzcwOCw3IEBAIHN0YXRpYyB2b2lkIHByaW50X3VzYWdlKGNvbnN0IGNo
YXIgKmhlbHBfc3RyLCBib29sIG91dHB1dF9vbl9zdGRlcnIpCiAJCSAgICIgIC0tZGVidWdbPWxv
Zy1kb21haW5dXG4iCiAJCSAgICIgIC0taW50ZXJhY3RpdmUtZGVidWdbPWRvbWFpbl1cbiIKIAkJ
ICAgIiAgLS1za2lwLWNyYy1jb21wYXJlXG4iCisJCSAgICIgIC0tdHJhY2Utb24tb29wc1xuIgog
CQkgICAiICAtLWhlbHAtZGVzY3JpcHRpb25cbiIKIAkJICAgIiAgLS1kZXNjcmliZVxuIgogCQkg
ICAiICAtLWRldmljZSBmaWx0ZXJzXG4iCi0tIAoyLjI2LjMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaWd0LWRldgo=
