Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C6526E108
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Jul 2020 19:21:01 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Wed,  1 Jul 2020 21:20:45 +0200
Message-Id: <20200701192045.13196-5-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200701192045.13196-1-zbigniew.kempczynski@intel.com>
References: <20200701192045.13196-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v13 4/4] intel-ci/fast-feedback: add
 api_intel_bb tests
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
Cc: Petri Latvala <petri.latvala@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

aW50ZWxfYmIgaGFzIHRvIHJlcGxhY2UgbGliZHJtIGludGVsX2JhdGNoYnVmZmVyLiBXZSBuZWVk
IHRvIGtub3cKYW55IGNoYW5nZXMgaW4gaXRzIGluZnJhc3RydWN0dXJlIGRvZXNuJ3QgbGVhZCB0
byByZWdyZXNzaW9uLgpBZGQgYXBpX2ludGVsX2JiIHRvIEJBVCB0byBiZSB2ZXJpZmllZCBvbiB0
aGUgdmVyeSBiZWdpbm5pbmcuClRlc3QgZXhlY3V0aW9uIHRpbWUgaXMgdmVyeSBzaG9ydCBzbyBp
dCBzaG91bGRuJ3QgYmUgbm90aWNhYmxlCm9uIENJLgoKU2lnbmVkLW9mZi1ieTogWmJpZ25pZXcg
S2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+CkNjOiBDaHJpcyBX
aWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KQ2M6IFBldHJpIExhdHZhbGEgPHBldHJp
LmxhdHZhbGFAaW50ZWwuY29tPgotLS0KIHRlc3RzL2ludGVsLWNpL2Zhc3QtZmVlZGJhY2sudGVz
dGxpc3QgfCAxMSArKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC1jaS9mYXN0LWZlZWRiYWNrLnRlc3RsaXN0IGIvdGVz
dHMvaW50ZWwtY2kvZmFzdC1mZWVkYmFjay50ZXN0bGlzdAppbmRleCAwNGY2YWZmYy4uZjA4ZDU4
MmQgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ludGVsLWNpL2Zhc3QtZmVlZGJhY2sudGVzdGxpc3QKKysr
IGIvdGVzdHMvaW50ZWwtY2kvZmFzdC1mZWVkYmFjay50ZXN0bGlzdApAQCAtMSw1ICsxLDE2IEBA
CiAjIEtlZXAgYWxwaGFiZXRpY2FsbHkgc29ydGVkIGJ5IGRlZmF1bHQKIAoraWd0QGFwaV9pbnRl
bF9iYkBzaW1wbGUtYmIKK2lndEBhcGlfaW50ZWxfYmJAc2ltcGxlLWJiLWN0eAoraWd0QGFwaV9p
bnRlbF9iYkBibGl0LW5vcmVsb2Mta2VlcC1jYWNoZQoraWd0QGFwaV9pbnRlbF9iYkBibGl0LXJl
bG9jLXB1cmdlLWNhY2hlCitpZ3RAYXBpX2ludGVsX2JiQGJsaXQtbm9yZWxvYy1wdXJnZS1jYWNo
ZQoraWd0QGFwaV9pbnRlbF9iYkBibGl0LXJlbG9jLWtlZXAtY2FjaGUKK2lndEBhcGlfaW50ZWxf
YmJAaW50ZWwtYmItYmxpdC1ub25lCitpZ3RAYXBpX2ludGVsX2JiQGludGVsLWJiLWJsaXQteAor
aWd0QGFwaV9pbnRlbF9iYkBpbnRlbC1iYi1ibGl0LXkKK2lndEBhcGlfaW50ZWxfYmJAb2Zmc2V0
LWNvbnRyb2wKK2lndEBhcGlfaW50ZWxfYmJAZnVsbC1iYXRjaAogaWd0QGNvcmVfYXV0aEBiYXNp
Yy1hdXRoCiBpZ3RAZGVidWdmc190ZXN0QHJlYWRfYWxsX2VudHJpZXMKIGlndEBmYmRldkBtbWFw
Ci0tIAoyLjI2LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
