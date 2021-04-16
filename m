Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B2616ECA5
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Apr 2021 17:53:17 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Fri, 16 Apr 2021 20:53:06 +0300
Message-Id: <20210416175312.25190-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/6] tests/kms_flip_scaled_crc: Fix a bunch
 of fail
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkZp
eCBhIGJ1bmNoIG9mIGlzc3VlcyBpbiBrbXNfZmxpcF9zY2FsZWRfY3JjLgoKVmlsbGUgU3lyasOk
bMOkICg2KToKICB0ZXN0cy9rbXNfZmxpcF9zY2FsZWRfY3JjOiBSZW1vdmUgb3BlbiBjb2RlZCBp
Z3RfY3JlYXRlX2NvbG9yX2ZiKCkKICB0ZXN0cy9rbXNfZmxpcF9zY2FsZWRfY3JjOiBEb24ndCBs
ZWFrIHRoZSBmYnMgYmV0d2VlbiBzdWJ0ZXN0cwogIHRlc3RzL2ttc19mbGlwX3NjYWxlZF9jcmM6
IFVzZSBpZ3RfYXNzZXJ0X2NyY19lcXVhbCgpCiAgdGVzdHMva21zX2ZsaXBfc2NhbGVkX2NyYzog
Q2xlYW4gdXAgcGlwZSBjcmMgYmVmb3JlIHN1YnRlc3QKICB0ZXN0cy9rbXNfZmxpcF9zY2FsZWRf
Y3JjOiBDaGVjayB0aGF0IHRoZSBwbGFuZSBzdXBwb3J0cyB0aGUKICAgIGZvcm1hdCttb2RpZmll
cgogIHRlc3RzL2ttc19mbGlwX3NjYWxlZF9jcmM6IExpbWl0IHBpcGUgb3V0cHV0IHRvIDhicGMK
CiB0ZXN0cy9rbXNfZmxpcF9zY2FsZWRfY3JjLmMgfCA3OSArKysrKysrKysrKysrKysrKysrKysr
KysrLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNTQgaW5zZXJ0aW9ucygrKSwgMjUgZGVs
ZXRpb25zKC0pCgotLSAKMi4yNi4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ln
dC1kZXYK
