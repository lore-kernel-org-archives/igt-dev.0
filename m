Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FDF789F5F
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Dec 2019 06:14:12 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
Date: Mon,  2 Dec 2019 11:31:30 +0530
Message-Id: <20191202060132.31907-6-swati2.sharma@intel.com>
In-Reply-To: <20191202060132.31907-1-swati2.sharma@intel.com>
References: <20191202060132.31907-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 5/7] tools: remove
 igt_skip_on_simulation()
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
Cc: lucas.demarchi@intel.com, martin.peres@intel.com, maarten.lankhorst@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

UmVtb3ZpbmcgaWd0X3NraXBfb25fc2ltdWxhdGlvbigpIGZyb20gdG9vbHMgc2luY2UgdGhpcwpm
ZWF0dXJlIGlzIG5vdCBzdXBwb3J0ZWQgYW55bW9yZS4KCnYyOiBSZWJhc2UKClNpZ25lZC1vZmYt
Ynk6IFN3YXRpIFNoYXJtYSA8c3dhdGkyLnNoYXJtYUBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6
IEthcnRoaWsgQiBTIDxrYXJ0aGlrLmIuc0BpbnRlbC5jb20+ClJldmlld2VkLWJ5OiBNYXJ0aW4g
UGVyZXMgPG1hcnRpbi5wZXJlc0BsaW51eC5pbnRlbC5jb20+Ci0tLQogdG9vbHMvaW50ZWxfZHBf
Y29tcGxpYW5jZS5jIHwgMiAtLQogMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvdG9vbHMvaW50ZWxfZHBfY29tcGxpYW5jZS5jIGIvdG9vbHMvaW50ZWxfZHBfY29t
cGxpYW5jZS5jCmluZGV4IDE0NjMxYTQ2Li41Y2MzZDM3YSAxMDA2NDQKLS0tIGEvdG9vbHMvaW50
ZWxfZHBfY29tcGxpYW5jZS5jCisrKyBiL3Rvb2xzL2ludGVsX2RwX2NvbXBsaWFuY2UuYwpAQCAt
MTAxNyw4ICsxMDE3LDYgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQogCQl7Imhl
bHAiLCAwLCAwLCAnaCd9LAogCX07CiAKLQlpZ3Rfc2tpcF9vbl9zaW11bGF0aW9uKCk7Ci0KIAll
bnRlcl9leGVjX3BhdGgoYXJndik7CiAKIAl3aGlsZSAoKGMgPSBnZXRvcHRfbG9uZyhhcmdjLCBh
cmd2LCBvcHRzdHIsIGxvbmdfb3B0cywgTlVMTCkpICE9IC0xKSB7Ci0tIAoyLjIzLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGlu
ZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
