Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53CAF6EAC0
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Feb 2018 23:20:43 +0000 (UTC)
From: Jordan Justen <jordan.l.justen@intel.com>
Date: Wed, 21 Feb 2018 15:19:05 -0800
Message-Id: <20180221231905.15580-6-jordan.l.justen@intel.com>
In-Reply-To: <20180221231905.15580-1-jordan.l.justen@intel.com>
References: <20180221231905.15580-1-jordan.l.justen@intel.com>
Subject: [igt-dev] [PATCH i-g-t 6/6] aubdump: Signal drm sync objects when
 device override is used
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
To: IGT GPU Tools <igt-dev@lists.freedesktop.org>
Cc: Jason Ekstrand <jason@jlekstrand.net>
List-ID: <igt-dev@lists.freedesktop.org>

VGhpcyBwcmV2ZW50cyBhbiBpbmZpbml0ZSBoYW5nIHdpdGggY3J1Y2libGUgKHZ1bGthbikgcmVu
ZGVyaW5nIHRlc3RzCndoZW4gLS1kZXZpY2UgaXMgdXNlZC4KCkNjOiBKYXNvbiBFa3N0cmFuZCA8
amFzb25Aamxla3N0cmFuZC5uZXQ+ClNpZ25lZC1vZmYtYnk6IEpvcmRhbiBKdXN0ZW4gPGpvcmRh
bi5sLmp1c3RlbkBpbnRlbC5jb20+Ci0tLQogdG9vbHMvYXViZHVtcC5jIHwgMTYgKysrKysrKysr
KysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90
b29scy9hdWJkdW1wLmMgYi90b29scy9hdWJkdW1wLmMKaW5kZXggNGVjYmEwMWEuLmVkOTBlOTFj
IDEwMDY0NAotLS0gYS90b29scy9hdWJkdW1wLmMKKysrIGIvdG9vbHMvYXViZHVtcC5jCkBAIC05
OTYsNiArOTk2LDIyIEBAIGR1bXBfZXhlY2J1ZmZlcjIoaW50IGZkLCBzdHJ1Y3QgZHJtX2k5MTVf
Z2VtX2V4ZWNidWZmZXIyICpleGVjYnVmZmVyMikKIAkJaWYgKGZpbGVzW2ldICE9IE5VTEwpCiAJ
CQlmZmx1c2goZmlsZXNbaV0pOwogCX0KKworCWlmIChkZXZpY2Vfb3ZlcnJpZGUgJiYKKwkgICAg
KGV4ZWNidWZmZXIyLT5mbGFncyAmIEk5MTVfRVhFQ19GRU5DRV9BUlJBWSkgIT0gMCkgeworCQlz
dHJ1Y3QgZHJtX2k5MTVfZ2VtX2V4ZWNfZmVuY2UgKmZlbmNlcyA9CisJCQkodm9pZCopKHVpbnRw
dHJfdClleGVjYnVmZmVyMi0+Y2xpcHJlY3RzX3B0cjsKKwkJZm9yICh1aW50MzJfdCBpID0gMDsg
aSA8IGV4ZWNidWZmZXIyLT5udW1fY2xpcHJlY3RzOyBpKyspIHsKKwkJCWlmICgoZmVuY2VzW2ld
LmZsYWdzICYgSTkxNV9FWEVDX0ZFTkNFX1NJR05BTCkgIT0gMCkgeworCQkJCXN0cnVjdCBkcm1f
c3luY29ial9hcnJheSBhcmcgPSB7CisJCQkJICAuaGFuZGxlcyA9ICh1aW50cHRyX3QpJmZlbmNl
c1tpXS5oYW5kbGUsCisJCQkJCS5jb3VudF9oYW5kbGVzID0gMSwKKwkJCQkJLnBhZCA9IDAsCisJ
CQkJfTsKKwkJCQlsaWJjX2lvY3RsKGZkLCBEUk1fSU9DVExfU1lOQ09CSl9TSUdOQUwsICZhcmcp
OworCQkJfQorCQl9CisJfQogfQogCiBzdGF0aWMgdm9pZAotLSAKMi4xNi4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlz
dAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
