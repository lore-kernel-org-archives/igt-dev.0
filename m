Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C12C6EADE
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Feb 2019 08:49:59 +0000 (UTC)
Date: Fri, 15 Feb 2019 14:16:06 +0530
Message-Id: <1550220366-21575-6-git-send-email-anshuman.gupta@intel.com>
In-Reply-To: <1550220366-21575-1-git-send-email-anshuman.gupta@intel.com>
References: <1550220366-21575-1-git-send-email-anshuman.gupta@intel.com>
Subject: [igt-dev] [PATCH i-g-t v5 5/5] tests/pm_dc: Added test for DC6
 during DPMS
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
From: Anshuman Gupta via igt-dev <igt-dev@lists.freedesktop.org>
Reply-To: Anshuman Gupta <anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: jyoti.r.yadav@intel.com, anshuman.gupta@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogSnlvdGkgWWFkYXYgPGp5b3RpLnIueWFkYXZAaW50ZWwuY29tPgoKQWRkZWQgbmV3IHN1
YnRlc3QgZm9yIERDNiBlbnRyeSBkdXJpbmcgRFBNUyBvbi9vZmYgY3ljbGUuCkR1cmluZyBEUE1T
IG9uL29mZiBjeWNsZSBEQzYgY291bnRlciBpcyBpbmNyZW1lbnRlZC4KCnYyOiBSZW5hbWVkIHRo
ZSBzdWJ0ZXN0IG5hbWUuCnYzOiBSZWJhc2VkLgp2NDogQWRkcmVzc2VkIHJldmlldyBjb21tZW50
IGJ5IHJlcGxhY2luZyBpZ3RfZGlzcGxheV9pbml0KCkgdG8KICAgIGlndF9kaXNwbGF5X3JlcXVp
cmUoKSwgY2hhbmdlcyBnb3QgZG9uZSBpbiBwYXRjaCBzZXQgMi4KdjU6IEFkZHJlc3NlZCB0aGUg
cmV2aWV3IGNvbW1lbnQgYnkgcmVtb3ZpbmcgcmVkdW5kYW50IHJlYWRfZGNfY291bnRlcigpCiAg
ICBzdWdnZXN0ZWQgYnkgSW1yZS4KICAgIExpc3RpbmcgYWN0dWFsIGNoYW5nZSBpbiBwYXRjaCBz
ZXQgY2hhbmdlbG9nIHRvIG1ha2UgcmV2aWV3IGVhc2llci4KClNpZ25lZC1vZmYtYnk6IEp5b3Rp
IFlhZGF2IDxqeW90aS5yLnlhZGF2QGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogQW5zaHVtYW4g
R3VwdGEgPGFuc2h1bWFuLmd1cHRhQGludGVsLmNvbT4KLS0tCiB0ZXN0cy9wbV9kYy5jIHwgNCAr
KysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdGVzdHMv
cG1fZGMuYyBiL3Rlc3RzL3BtX2RjLmMKaW5kZXggOGJjNjg0ZS4uYTZmODIxYSAxMDA2NDQKLS0t
IGEvdGVzdHMvcG1fZGMuYworKysgYi90ZXN0cy9wbV9kYy5jCkBAIC0yMzYsNiArMjM2LDEwIEBA
IGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCiAJCXRlc3RfZGNfc3RhdGVfZHBtcygm
ZGF0YSwgQ0hFQ0tfREM1KTsKIAl9CiAKKwlpZ3Rfc3VidGVzdCgiZGM2LWRwbXMiKSB7CisJCXRl
c3RfZGNfc3RhdGVfZHBtcygmZGF0YSwgQ0hFQ0tfREM2KTsKKwl9CisKIAlpZ3RfZml4dHVyZSB7
CiAJCWNsb3NlKGRhdGEuZGVidWdmc19mZCk7CiAJCWRpc3BsYXlfZmluaSgmZGF0YSk7Ci0tIAoy
LjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0
LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
