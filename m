Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADBDA890D7
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2019 11:19:34 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Wed, 10 Apr 2019 13:19:30 +0200
Message-Id: <20190410111931.28305-2-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20190410111931.28305-1-maarten.lankhorst@linux.intel.com>
References: <20190410111931.28305-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/3] tests/kms_flip: Reduce runtime to 1s
 for busy-flip.
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

V2UgZG9uJ3QgYWN0dWFsbHkgY2FyZSBhYm91dCBydW5uaW5nIHRoaXMgZm9yIDMwIHNlY29uZHMs
IGFsbCB3ZQpjYXJlIGlzIHRoYXQgd2UgZ2V0IGEgLUVCVVNZIGlmIGEgZmxpcCBpcyBhbHJlYWR5
IHF1ZXVlZC4KClNpZ25lZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmto
b3JzdEBsaW51eC5pbnRlbC5jb20+Ci0tLQogdGVzdHMva21zX2ZsaXAuYyB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rl
c3RzL2ttc19mbGlwLmMgYi90ZXN0cy9rbXNfZmxpcC5jCmluZGV4IDA4ZjNiZDI5YjhlYi4uZTUw
YzkxZWFkMTJjIDEwMDc1NQotLS0gYS90ZXN0cy9rbXNfZmxpcC5jCisrKyBiL3Rlc3RzL2ttc19m
bGlwLmMKQEAgLTE0OTcsNyArMTQ5Nyw3IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJn
dikKIAkJeyAzMCwgIFRFU1RfVkJMQU5LIHwgVEVTVF9WQkxBTktfQkxPQ0sgfCBURVNUX1ZCTEFO
S19BQlNPTFVURSwKIAkJCQkJImJsb2NraW5nLWFic29sdXRlLXdmX3ZibGFuayIgfSwKIAkJeyAx
MCwgVEVTVF9GTElQIHwgVEVTVF9CQVNJQywgInBsYWluLWZsaXAiIH0sCi0JCXsgMzAsIFRFU1Rf
RkxJUCB8IFRFU1RfRUJVU1kgLCAiYnVzeS1mbGlwIiB9LAorCQl7IDEsIFRFU1RfRkxJUCB8IFRF
U1RfRUJVU1ksICJidXN5LWZsaXAiIH0sCiAJCXsgMzAsIFRFU1RfRkxJUCB8IFRFU1RfRkVOQ0Vf
U1RSRVNTICwgImZsaXAtdnMtZmVuY2VzIiB9LAogCQl7IDMwLCBURVNUX0ZMSVAgfCBURVNUX0NI
RUNLX1RTLCAicGxhaW4tZmxpcC10cy1jaGVjayIgfSwKIAkJeyAzMCwgVEVTVF9GTElQIHwgVEVT
VF9DSEVDS19UUyB8IFRFU1RfRkJfUkVDUkVBVEUsCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0Cmln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
