Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ADC46E345
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Jul 2019 13:30:52 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Thu,  4 Jul 2019 16:30:41 +0300
Message-Id: <20190704133041.15162-2-arkadiusz.hiler@intel.com>
In-Reply-To: <20190704133041.15162-1-arkadiusz.hiler@intel.com>
References: <20190704133041.15162-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/kms_ccs: Clean up output selection
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
Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

VXNlIGZ1bmN0aW9uIHRoYXQgaXMgbWVhbnQgdG8gZ2V0IHRoZSBvdXRwdXQgaW5zdGVhZCBvZiBy
ZWx5aW5nIG9uIGEKbWFnaWMgZm9yLWxvb3AuCgpDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0
ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KQ2M6IERoaW5ha2FyYW4gUGFuZGl5YW4gPGRo
aW5ha2FyYW4ucGFuZGl5YW5AaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBBcmthZGl1c3ogSGls
ZXIgPGFya2FkaXVzei5oaWxlckBpbnRlbC5jb20+Ci0tLQogdGVzdHMva21zX2Njcy5jIHwgOCAr
Ky0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS90ZXN0cy9rbXNfY2NzLmMgYi90ZXN0cy9rbXNfY2NzLmMKaW5kZXggNWEx
Zjk0MGUuLmE4MzRiMmY1IDEwMDY0NAotLS0gYS90ZXN0cy9rbXNfY2NzLmMKKysrIGIvdGVzdHMv
a21zX2Njcy5jCkBAIC0zMDIsMTIgKzMwMiw4IEBAIHN0YXRpYyBpbnQgX190ZXN0X291dHB1dChk
YXRhX3QgKmRhdGEpCiAJaWd0X2Rpc3BsYXlfdCAqZGlzcGxheSA9ICZkYXRhLT5kaXNwbGF5Owog
CWludCBpLCB2YWxpZF90ZXN0cyA9IDA7CiAKLQlpZ3RfZGlzcGxheV9yZXF1aXJlX291dHB1dF9v
bl9waXBlKGRpc3BsYXksIGRhdGEtPnBpcGUpOwotCi0JLyogU2V0cyBkYXRhLT5vdXRwdXQgd2l0
aCBhIHZhbGlkIG91dHB1dC4gKi8KLQlmb3JfZWFjaF92YWxpZF9vdXRwdXRfb25fcGlwZShkaXNw
bGF5LCBkYXRhLT5waXBlLCBkYXRhLT5vdXRwdXQpIHsKLQkJYnJlYWs7Ci0JfQorCWRhdGEtPm91
dHB1dCA9IGlndF9nZXRfc2luZ2xlX291dHB1dF9mb3JfcGlwZShkaXNwbGF5LCBkYXRhLT5waXBl
KTsKKwlpZ3RfcmVxdWlyZShkYXRhLT5vdXRwdXQpOwogCiAJaWd0X291dHB1dF9zZXRfcGlwZShk
YXRhLT5vdXRwdXQsIGRhdGEtPnBpcGUpOwogCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaWd0LWRldg==
