Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E54A6E2E1
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jun 2020 14:50:26 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 30 Jun 2020 16:50:10 +0200
Message-Id: <20200630145010.32413-5-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200630145010.32413-1-zbigniew.kempczynski@intel.com>
References: <20200630145010.32413-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v11 4/4] intel-ci/fast-feedback: add
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
dGxpc3QgfCA5ICsrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL3Rlc3RzL2ludGVsLWNpL2Zhc3QtZmVlZGJhY2sudGVzdGxpc3QgYi90ZXN0cy9p
bnRlbC1jaS9mYXN0LWZlZWRiYWNrLnRlc3RsaXN0CmluZGV4IDA0ZjZhZmZjLi4xOWU3YTc5YyAx
MDA2NDQKLS0tIGEvdGVzdHMvaW50ZWwtY2kvZmFzdC1mZWVkYmFjay50ZXN0bGlzdAorKysgYi90
ZXN0cy9pbnRlbC1jaS9mYXN0LWZlZWRiYWNrLnRlc3RsaXN0CkBAIC0xLDUgKzEsMTQgQEAKICMg
S2VlcCBhbHBoYWJldGljYWxseSBzb3J0ZWQgYnkgZGVmYXVsdAogCitpZ3RAYXBpX2ludGVsX2Ji
QHNpbXBsZS1iYgoraWd0QGFwaV9pbnRlbF9iYkBzaW1wbGUtYmItY3R4CitpZ3RAYXBpX2ludGVs
X2JiQGJsaXQtbm9yZWxvYy1rZWVwLWNhY2hlCitpZ3RAYXBpX2ludGVsX2JiQGJsaXQtcmVsb2Mt
cHVyZ2UtY2FjaGUKK2lndEBhcGlfaW50ZWxfYmJAYmxpdC1ub3JlbG9jLXB1cmdlLWNhY2hlCitp
Z3RAYXBpX2ludGVsX2JiQGJsaXQtcmVsb2Mta2VlcC1jYWNoZQoraWd0QGFwaV9pbnRlbF9iYkBp
bnRlbC1iYi1ibGl0CitpZ3RAYXBpX2ludGVsX2JiQG9mZnNldC1jb250cm9sCitpZ3RAYXBpX2lu
dGVsX2JiQGZ1bGwtYmF0Y2gKIGlndEBjb3JlX2F1dGhAYmFzaWMtYXV0aAogaWd0QGRlYnVnZnNf
dGVzdEByZWFkX2FsbF9lbnRyaWVzCiBpZ3RAZmJkZXZAbW1hcAotLSAKMi4yNi4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcg
bGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
