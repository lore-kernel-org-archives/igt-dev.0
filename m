Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 015526E183
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Apr 2018 22:32:14 +0000 (UTC)
From: Antonio Argenziano <antonio.argenziano@intel.com>
Date: Wed, 11 Apr 2018 15:32:09 -0700
Message-Id: <20180411223209.591-1-antonio.argenziano@intel.com>
In-Reply-To: <20180411214531.36613-1-antonio.argenziano@intel.com>
References: <20180411214531.36613-1-antonio.argenziano@intel.com>
Subject: [igt-dev] [PATCH i-g-t v2] tests/gem_close_race: Wait for work to
 complete before terminating test
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

V2hlbiBydW5uaW5nIGEgc2luZ2xlIHN1YnRlc3QsIG91dHN0YW5kaW5nIHdvcmsgbWlnaHQgaGFu
ZyBhZnRlciB0aGUgdGVzdAplbmRzIHRoZXJlZm9yZSBlc2NhcGluZyBkZXRlY3Rpb24gYnkgdGhl
IGhhbmdfZGV0ZWN0b3IuCgp2MjoKCS0gVXBkYXRlIGNvbW1pdCBtZXNzYWdlLiAoQ2hyaXMpCgpT
aWduZWQtb2ZmLWJ5OiBBbnRvbmlvIEFyZ2Vuemlhbm8gPGFudG9uaW8uYXJnZW56aWFub0BpbnRl
bC5jb20+ClJldmlld2VkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51
az4KLS0tCiB0ZXN0cy9nZW1fY2xvc2VfcmFjZS5jIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdGVzdHMvZ2VtX2Nsb3NlX3JhY2UuYyBiL3Rl
c3RzL2dlbV9jbG9zZV9yYWNlLmMKaW5kZXggYmMxMTI3YjEuLjExZDYyNmRjIDEwMDY0NAotLS0g
YS90ZXN0cy9nZW1fY2xvc2VfcmFjZS5jCisrKyBiL3Rlc3RzL2dlbV9jbG9zZV9yYWNlLmMKQEAg
LTE0OCw2ICsxNDgsOCBAQCBzdGF0aWMgdm9pZCBwcm9jZXNzKGludCBjaGlsZCkKIAloYW5kbGUg
PSBsb2FkKGZkKTsKIAlpZiAoKGNoaWxkICYgNjMpID09IDYzKQogCQlnZW1fcmVhZChmZCwgaGFu
ZGxlLCAwLCAmaGFuZGxlLCBzaXplb2YoaGFuZGxlKSk7CisKKwlnZW1fcXVpZXNjZW50X2dwdShm
ZCk7CiB9CiAKIHN0cnVjdCBjcmFzaG1lIHsKQEAgLTIwMyw2ICsyMDUsOCBAQCBzdGF0aWMgdm9p
ZCB0aHJlYWRzKGludCB0aW1lb3V0KQogCX0KIAogCXRpbWVyX2RlbGV0ZSh0aW1lcik7CisKKwln
ZW1fcXVpZXNjZW50X2dwdShmZCk7CiAJY2xvc2UoZmQpOwogfQogCi0tIAoyLjE2LjIKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGlu
ZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
