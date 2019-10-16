Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D32F56E8EA
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Oct 2019 07:58:21 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
Date: Wed, 16 Oct 2019 13:19:10 +0530
Message-Id: <20191016074912.32290-6-swati2.sharma@intel.com>
In-Reply-To: <20191016074912.32290-1-swati2.sharma@intel.com>
References: <20191016074912.32290-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 5/7] tools: remove igt_skip_on_simulation()
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
ZWF0dXJlIGlzIG5vdCBzdXBwb3J0ZWQgYW55bW9yZS4KClNpZ25lZC1vZmYtYnk6IFN3YXRpIFNo
YXJtYSA8c3dhdGkyLnNoYXJtYUBpbnRlbC5jb20+Ci0tLQogdG9vbHMvaW50ZWxfZHBfY29tcGxp
YW5jZS5jIHwgMiAtLQogMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvdG9vbHMvaW50ZWxfZHBfY29tcGxpYW5jZS5jIGIvdG9vbHMvaW50ZWxfZHBfY29tcGxpYW5j
ZS5jCmluZGV4IDE0NjMxYTQ2Li41Y2MzZDM3YSAxMDA2NDQKLS0tIGEvdG9vbHMvaW50ZWxfZHBf
Y29tcGxpYW5jZS5jCisrKyBiL3Rvb2xzL2ludGVsX2RwX2NvbXBsaWFuY2UuYwpAQCAtMTAxNyw4
ICsxMDE3LDYgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQogCQl7ImhlbHAiLCAw
LCAwLCAnaCd9LAogCX07CiAKLQlpZ3Rfc2tpcF9vbl9zaW11bGF0aW9uKCk7Ci0KIAllbnRlcl9l
eGVjX3BhdGgoYXJndik7CiAKIAl3aGlsZSAoKGMgPSBnZXRvcHRfbG9uZyhhcmdjLCBhcmd2LCBv
cHRzdHIsIGxvbmdfb3B0cywgTlVMTCkpICE9IC0xKSB7Ci0tIAoyLjIzLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0
CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
