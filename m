Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D3066E091
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Aug 2020 12:33:18 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Wed, 19 Aug 2020 14:32:36 +0200
Message-Id: <20200819123306.22856-4-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200819123306.22856-1-zbigniew.kempczynski@intel.com>
References: <20200819123306.22856-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v30 03/33] lib/intel_bufops: change stride
 requirements for Grantsdale
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

R3JhbnRzZGFsZSByZXF1aXJlcyA1MTIgc3RyaWRlIG9uIFkgdGlsaW5nLgoKU2lnbmVkLW9mZi1i
eTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+
CkNjOiBEb21pbmlrIEdyemVnb3J6ZWsgPGRvbWluaWsuZ3J6ZWdvcnpla0BpbnRlbC5jb20+CkNj
OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KLS0tCiBsaWIvaW50ZWxf
YnVmb3BzLmMgfCA5ICsrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9saWIvaW50ZWxfYnVmb3BzLmMgYi9saWIvaW50
ZWxfYnVmb3BzLmMKaW5kZXggMmE5YjA3YTUuLmM2NDFkYmE0IDEwMDY0NAotLS0gYS9saWIvaW50
ZWxfYnVmb3BzLmMKKysrIGIvbGliL2ludGVsX2J1Zm9wcy5jCkBAIC03NTIsOCArNzUyLDcgQEAg
c3RhdGljIHZvaWQgX19pbnRlbF9idWZfaW5pdChzdHJ1Y3QgYnVmX29wcyAqYm9wcywKIAogCQkJ
aWYgKGJvcHMtPmludGVsX2dlbiA8IDMpCiAJCQkJdGlsZV93aWR0aCA9IDEyODsKLQkJCWVsc2Ug
aWYgKElTXzkxNUdNKGRldmlkKSB8fCBJU185MTVHKGRldmlkKSB8fAotCQkJCSBidWYtPnRpbGlu
ZyA9PSBJOTE1X1RJTElOR19YKQorCQkJZWxzZSBpZiAoSVNfOTE1RyhkZXZpZCkgfHwgYnVmLT50
aWxpbmcgPT0gSTkxNV9USUxJTkdfWCkKIAkJCQl0aWxlX3dpZHRoID0gNTEyOwogCQkJZWxzZQog
CQkJCXRpbGVfd2lkdGggPSAxMjg7CkBAIC0xMDM3LDExICsxMDM2LDEzIEBAIHN0YXRpYyBib29s
IHByb2JlX2h3X3RpbGluZyhzdHJ1Y3QgYnVmX29wcyAqYm9wcywgdWludDMyX3QgdGlsaW5nLAog
ewogCXVpbnQ2NF90IHNpemUgPSAyNTYgKiAyNTY7CiAJdWludDMyX3QgaGFuZGxlLCBidWZfdGls
aW5nLCBidWZfc3dpenpsZSwgcGh5c19zd2l6emxlOwotCXVpbnQzMl90IHN0cmlkZTsKKwl1aW50
MzJfdCBkZXZpZCwgc3RyaWRlOwogCWludCByZXQ7CiAJYm9vbCBpc19zZXQgPSBmYWxzZTsKIAot
CWlmICh0aWxpbmcgPT0gSTkxNV9USUxJTkdfWCkKKwlkZXZpZCA9ICBpbnRlbF9nZXRfZHJtX2Rl
dmlkKGJvcHMtPmZkKTsKKworCWlmICh0aWxpbmcgPT0gSTkxNV9USUxJTkdfWCB8fCBJU185MTVH
KGRldmlkKSkKIAkJc3RyaWRlID0gNTEyOwogCWVsc2UgaWYgKHRpbGluZyA9PSBJOTE1X1RJTElO
R19ZKQogCQlzdHJpZGUgPSAxMjg7Ci0tIAoyLjI2LjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaWd0LWRldgo=
