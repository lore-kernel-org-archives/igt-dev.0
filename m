Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 175AD6E905
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jul 2020 17:41:09 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Wed,  8 Jul 2020 10:42:52 -0700
Message-Id: <20200708174252.25699-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib: Sync i915 PCI ids
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

VHdvIG5ldyBwYXRjaGVzIGxhbmRlZCBpbiBrZXJuZWwgYWRkaW5nIG5ldyBQQ0kgaWRzOgoxMjNm
NjJkZTQxOWYgKCJkcm0vaTkxNS9ya2w6IEFkZCBSS0wgcGxhdGZvcm0gaW5mbyBhbmQgUENJIGlk
cyIpCjUyNzk3YThlODUyOSAoImRybS9pOTE1L2VobDogQWRkIG5ldyBQQ0kgaWRzIikKCkNjOiBN
YXR0IFJvcGVyIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBKb3PD
qSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4KLS0tCiBsaWIvaTkxNV9w
Y2lpZHMuaCB8IDEzICsrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvbGliL2k5MTVfcGNpaWRzLmggYi9saWIvaTkxNV9wY2lpZHMuaApp
bmRleCA2NjJkODM1MWMuLmQ2Y2IyODk5MiAxMDA2NDQKLS0tIGEvbGliL2k5MTVfcGNpaWRzLmgK
KysrIGIvbGliL2k5MTVfcGNpaWRzLmgKQEAgLTU4OCw3ICs1ODgsMTEgQEAKIAlJTlRFTF9WR0Ff
REVWSUNFKDB4NDU1MSwgaW5mbyksIFwKIAlJTlRFTF9WR0FfREVWSUNFKDB4NDU0MSwgaW5mbyks
IFwKIAlJTlRFTF9WR0FfREVWSUNFKDB4NEU3MSwgaW5mbyksIFwKKwlJTlRFTF9WR0FfREVWSUNF
KDB4NDU1NywgaW5mbyksIFwKKwlJTlRFTF9WR0FfREVWSUNFKDB4NDU1NSwgaW5mbyksIFwKIAlJ
TlRFTF9WR0FfREVWSUNFKDB4NEU2MSwgaW5mbyksIFwKKwlJTlRFTF9WR0FfREVWSUNFKDB4NEU1
NywgaW5mbyksIFwKKwlJTlRFTF9WR0FfREVWSUNFKDB4NEU1NSwgaW5mbyksIFwKIAlJTlRFTF9W
R0FfREVWSUNFKDB4NEU1MSwgaW5mbykKIAogLyogVEdMICovCkBAIC02MDUsNCArNjA5LDEzIEBA
CiAJSU5URUxfVkdBX0RFVklDRSgweDlBRDksIGluZm8pLCBcCiAJSU5URUxfVkdBX0RFVklDRSgw
eDlBRjgsIGluZm8pCiAKKy8qIFJLTCAqLworI2RlZmluZSBJTlRFTF9SS0xfSURTKGluZm8pIFwK
KwlJTlRFTF9WR0FfREVWSUNFKDB4NEM4MCwgaW5mbyksIFwKKwlJTlRFTF9WR0FfREVWSUNFKDB4
NEM4QSwgaW5mbyksIFwKKwlJTlRFTF9WR0FfREVWSUNFKDB4NEM4QiwgaW5mbyksIFwKKwlJTlRF
TF9WR0FfREVWSUNFKDB4NEM4QywgaW5mbyksIFwKKwlJTlRFTF9WR0FfREVWSUNFKDB4NEM5MCwg
aW5mbyksIFwKKwlJTlRFTF9WR0FfREVWSUNFKDB4NEM5QSwgaW5mbykKKwogI2VuZGlmIC8qIF9J
OTE1X1BDSUlEU19IICovCi0tIAoyLjI3LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaWd0LWRldgo=
