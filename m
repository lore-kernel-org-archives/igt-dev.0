Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 856EE6E5C1
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Nov 2019 12:41:47 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
Date: Fri, 15 Nov 2019 18:15:22 +0530
Message-Id: <1573821922-3416-1-git-send-email-nidhi1.gupta@intel.com>
Subject: [igt-dev] [RFC PATCH i-g-t] Adding the support for DP-Phy
 Compliance Test.
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
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

QWRkaW5nIGEgdGVzdCBjYXNlIGZvciBEUF9URVNUX0xJTktfUEhZX1RFU1RfUEFUVEVSTiBpbgpp
bnRlbF9kcF9jb21wbGlhbmNlIHRvb2wuIFRoaXMgd2lsbCB0cmlnZ2VyIGRwIGNvbm5lY3Rvcgpw
cmVmZXJyZWQgbW9kZSBtb2Rlc2V0IGluIGNhc2Ugb2YgaG90cGx1ZyBldmVudCB3aGVuIHRlc3QK
dHlwZSBpcyBEUF9URVNUX0xJTktfUEhZX1RFU1RfUEFUVEVSTi4KClNpZ25lZC1vZmYtYnk6IE5p
ZGhpIEd1cHRhIDxuaWRoaTEuZ3VwdGFAaW50ZWwuY29tPgotLS0KIHRvb2xzL2ludGVsX2RwX2Nv
bXBsaWFuY2UuYyB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS90b29scy9pbnRlbF9kcF9jb21wbGlhbmNlLmMgYi90b29scy9pbnRlbF9kcF9j
b21wbGlhbmNlLmMKaW5kZXggMTQ2MzFhNC4uYTk1YzExZiAxMDA2NDQKLS0tIGEvdG9vbHMvaW50
ZWxfZHBfY29tcGxpYW5jZS5jCisrKyBiL3Rvb2xzL2ludGVsX2RwX2NvbXBsaWFuY2UuYwpAQCAt
MzM0LDYgKzMzNCwxMSBAQCBzdGF0aWMgaW50IHByb2Nlc3NfdGVzdF9yZXF1ZXN0KGludCB0ZXN0
X3R5cGUpCiAJCQlJTlRFTF9EUF9SRVNPTFVUSU9OX1NISUZUX01BU0s7CiAJCXZhbGlkID0gdHJ1
ZTsKIAkJYnJlYWs7CisJY2FzZSBEUF9URVNUX0xJTktfUEhZX1RFU1RfUEFUVEVSTjoKKwkJLyog
VHJpZ2dlcmluZyBhIG1vZGVzZXQgZm9yIGtlcm5lbCBmb3IgRHAgUGh5LUNvbXBsaWFuY2UgVGVz
dCAqLworCQltb2RlID0gSU5URUxfTU9ERV9QUkVGRVJSRUQ7CisJCXZhbGlkID0gdHJ1ZTsKKwkJ
YnJlYWs7CiAJZGVmYXVsdDoKIAkJLyogVW5rbm93biB0ZXN0IHR5cGUgKi8KIAkJZnByaW50Zihz
dGRlcnIsICJJbnZhbGlkIHRlc3QgcmVxdWVzdCwgaWdub3JlZC5cbiIpOwotLSAKMi43LjQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFp
bGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
