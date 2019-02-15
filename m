Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC7656E042
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Feb 2019 08:49:50 +0000 (UTC)
Date: Fri, 15 Feb 2019 14:16:04 +0530
Message-Id: <1550220366-21575-4-git-send-email-anshuman.gupta@intel.com>
In-Reply-To: <1550220366-21575-1-git-send-email-anshuman.gupta@intel.com>
References: <1550220366-21575-1-git-send-email-anshuman.gupta@intel.com>
Subject: [igt-dev] [PATCH i-g-t v5 3/5] tests/pm_dc: Added test for DC6
 during PSR
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

RnJvbTogSnlvdGkgWWFkYXYgPGp5b3RpLnIueWFkYXZAaW50ZWwuY29tPgoKVGhpcyBwYXRjaCBh
ZGQgc3VidGVzdCB0byBjaGVjayBEQzYgZW50cnkgb24gUFNSIGZvciB0aGUgc3VwcG9ydGVkCnBs
YXRmb3Jtcy4KCnYyOiBSZW5hbWUgdGhlIHN1YnRlc3Qgd2l0aCBtb3JlIG1lYW5pbmdmdWwgbmFt
ZS4KdjM6IFJlYmFzZWQuCnY0OiBSZWJhc2VkLCB0byBmaXggY29tcGlsYXRpb24gZXJyb3IgaW4g
cHNyX2VuYWJsZSgpLgogICAgQWRkcmVzc2VkIHJldmlldyBjb21tZW50IGJ5IGZpeGluZyB0eXBv
IGluIGNvbW1lbnQgZGVzY3JpcHRpb24KICAgIG9mIERDNiBQU1Igc3VidGVzdC4KdjU6IEFkZHJl
c3NlZCB0aGUgcmV2aWV3IGNvbW1lbnQgYnkgcmVtb3ZpbmcgcmVkdW5kYW50IHJlYWRfZGNfY291
bnRlcigpLAogICAgY2x1YmJlZCBjbGVhbnVwKCkgZnVuY3Rpb24gaW4gdGVzdF9kY19zdGF0ZV9w
c3IoKSBzdWdnZXN0ZWQgYnkgSW1yZS4KICAgIExpc3RpbmcgYWN0dWFsIGNoYW5nZSBpbiBwYXRj
aCBzZXQgY2hhbmdlbG9nIHRvIG1ha2UgcmV2aWV3IGVhc2llci4KClNpZ25lZC1vZmYtYnk6IEp5
b3RpIFlhZGF2IDxqeW90aS5yLnlhZGF2QGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogQW5zaHVt
YW4gR3VwdGEgPGFuc2h1bWFuLmd1cHRhQGludGVsLmNvbT4KLS0tCiB0ZXN0cy9wbV9kYy5jIHwg
OCArKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L3Rlc3RzL3BtX2RjLmMgYi90ZXN0cy9wbV9kYy5jCmluZGV4IDU2YjA0MjguLmIyNmYzZDggMTAw
NjQ0Ci0tLSBhL3Rlc3RzL3BtX2RjLmMKKysrIGIvdGVzdHMvcG1fZGMuYwpAQCAtMjAwLDYgKzIw
MCwxNCBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQogCQkJICAgICAgIlNpbmsg
ZG9lcyBub3Qgc3VwcG9ydCBQU1JcbiIpOwogCQl0ZXN0X2RjX3N0YXRlX3BzcigmZGF0YSwgQ0hF
Q0tfREM1KTsKIAl9CisKKwlpZ3Rfc3VidGVzdCgiZGM2LXBzciIpIHsKKwkJZGF0YS5vcF9wc3Jf
bW9kZSA9IFBTUl9NT0RFXzE7CisJCXBzcl9lbmFibGUoZGF0YS5kZWJ1Z2ZzX2ZkLCBkYXRhLm9w
X3Bzcl9tb2RlKTsKKwkJaWd0X3JlcXVpcmVfZihlZHBfcHNyX3Npbmtfc3VwcG9ydCgmZGF0YSks
CisJCQkgICAgICAiU2luayBkb2VzIG5vdCBzdXBwb3J0IFBTUlxuIik7CisJCXRlc3RfZGNfc3Rh
dGVfcHNyKCZkYXRhLCBDSEVDS19EQzYpOworCX0KIAlpZ3RfZml4dHVyZSB7CiAJCWNsb3NlKGRh
dGEuZGVidWdmc19mZCk7CiAJCWRpc3BsYXlfZmluaSgmZGF0YSk7Ci0tIAoyLjcuNAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5n
IGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
