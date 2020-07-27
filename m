Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E432B89AB6
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jul 2020 11:44:51 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 27 Jul 2020 13:44:10 +0200
Message-Id: <20200727114412.5101-15-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200727114412.5101-1-zbigniew.kempczynski@intel.com>
References: <20200727114412.5101-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v8 14/16] lib/intel_batchbuffer: change
 alignment constraints on gen4
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

R2VuNCByZXF1aXJlcyBiaWdnZXIgYWxpZ25tZW50IG9uIHRpbGVkIGJ1ZmZlcnMuIENoYW5nZSB0
byAweDgwMDAKKHNpbWlsYXIgcmVsb2NhdGlvbiBjb2RlIGRvZXMgZm9yIGdlbjQpLgoKU2lnbmVk
LW9mZi1ieTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRl
bC5jb20+Ci0tLQogbGliL2ludGVsX2JhdGNoYnVmZmVyLmMgfCA2ICsrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2xpYi9pbnRlbF9iYXRjaGJ1ZmZl
ci5jIGIvbGliL2ludGVsX2JhdGNoYnVmZmVyLmMKaW5kZXggM2FlMzY5YjcuLmUyY2ZjYmJkIDEw
MDY0NAotLS0gYS9saWIvaW50ZWxfYmF0Y2hidWZmZXIuYworKysgYi9saWIvaW50ZWxfYmF0Y2hi
dWZmZXIuYwpAQCAtMTU3OCw2ICsxNTc4LDEyIEBAIGludGVsX2JiX2FkZF9pbnRlbF9idWYoc3Ry
dWN0IGludGVsX2JiICppYmIsIHN0cnVjdCBpbnRlbF9idWYgKmJ1ZiwgYm9vbCB3cml0ZSkKIAkJ
b2JqLT5hbGlnbm1lbnQgPSAweDEwMDAwOwogCX0KIAorCS8qIEZvciBnZW40IGVuc3VyZSB0aWxl
ZCBidWZmZXJzIGFyZSBhbGlnbmVkIHRvIDB4ODAwMCAqLworCWlmIChpYmItPmdlbiA9PSA0ICYm
IGJ1Zi0+dGlsaW5nKSB7CisJCW9iai0+b2Zmc2V0ICY9IH4oMHg4MDAwIC0gMSk7CisJCW9iai0+
YWxpZ25tZW50ID0gMHg4MDAwOworCX0KKwogCS8qIFVwZGF0ZSBhZGRyZXNzIGluIGludGVsX2J1
ZiBidWZmZXIgKi8KIAlidWYtPmFkZHIub2Zmc2V0ID0gb2JqLT5vZmZzZXQ7CiAKLS0gCjIuMjYu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRl
diBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
