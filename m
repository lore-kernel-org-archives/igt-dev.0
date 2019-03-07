Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F4DF6E2B1
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Mar 2019 12:37:38 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu,  7 Mar 2019 14:37:24 +0200
Message-Id: <20190307123724.4436-1-petri.latvala@intel.com>
In-Reply-To: <20190307112427.29146-2-petri.latvala@intel.com>
References: <20190307112427.29146-2-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 2/5] lib/aux: Plug memory leak in
 get_suspend_test
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

RnJlZSB0ZXN0X2xpbmUgaW4gYWxsIHBhdGhzIG91dCBvZiB0aGUgZnVuY3Rpb24uCgp2MjogQXZv
aWQgZnJlZWluZyB0b28gc29vbiAoQ2hyaXMpCgpTaWduZWQtb2ZmLWJ5OiBQZXRyaSBMYXR2YWxh
IDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4KQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMt
d2lsc29uLmNvLnVrPgotLS0KIGxpYi9pZ3RfYXV4LmMgfCA1ICsrKy0tCiAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3Rf
YXV4LmMgYi9saWIvaWd0X2F1eC5jCmluZGV4IGU1ZDQxZTMyLi42ZWFmNTQ2ZSAxMDA2NDQKLS0t
IGEvbGliL2lndF9hdXguYworKysgYi9saWIvaWd0X2F1eC5jCkBAIC03MTgsOCArNzE4LDEwIEBA
IHN0YXRpYyBlbnVtIGlndF9zdXNwZW5kX3Rlc3QgZ2V0X3N1c3BlbmRfdGVzdChpbnQgcG93ZXJf
ZGlyKQogCQkJYnJlYWs7CiAJCX0KIAotCWlmICghdGVzdF9uYW1lKQorCWlmICghdGVzdF9uYW1l
KSB7CisJICAJZnJlZSh0ZXN0X2xpbmUpOwogCQlyZXR1cm4gU1VTUEVORF9URVNUX05PTkU7CisJ
fQogCiAJZm9yICh0ZXN0ID0gU1VTUEVORF9URVNUX05PTkU7IHRlc3QgPCBTVVNQRU5EX1RFU1Rf
TlVNOyB0ZXN0KyspCiAJCWlmIChzdHJjbXAoc3VzcGVuZF90ZXN0X25hbWVbdGVzdF0sIHRlc3Rf
bmFtZSkgPT0gMCkKQEAgLTcyOCw3ICs3MzAsNiBAQCBzdGF0aWMgZW51bSBpZ3Rfc3VzcGVuZF90
ZXN0IGdldF9zdXNwZW5kX3Rlc3QoaW50IHBvd2VyX2RpcikKIAlpZ3RfYXNzZXJ0KHRlc3QgPCBT
VVNQRU5EX1RFU1RfTlVNKTsKIAogCWZyZWUodGVzdF9saW5lKTsKLQogCXJldHVybiB0ZXN0Owog
fQogCi0tIAoyLjE5LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
