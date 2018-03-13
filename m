Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308::216:3eff:fe92:dfa3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD2A8940E
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Mar 2018 10:45:19 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Tue, 13 Mar 2018 11:45:12 +0100
Message-Id: <20180313104512.51407-1-maarten.lankhorst@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t] tests/kms_frontbuffer_tracking: Respect
 mode when collecting CRCs.
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
List-ID: <igt-dev@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4
LmludGVsLmNvbT4KUmVwb3J0ZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29u
LmNvLnVrPgpDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Ci0tLQog
dGVzdHMva21zX2Zyb250YnVmZmVyX3RyYWNraW5nLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19mcm9udGJ1ZmZlcl90cmFja2lu
Zy5jIGIvdGVzdHMva21zX2Zyb250YnVmZmVyX3RyYWNraW5nLmMKaW5kZXggYTJhYWI1Yzc2MmFj
Li4yYjI4NzA3MzEzZTAgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19mcm9udGJ1ZmZlcl90cmFja2lu
Zy5jCisrKyBiL3Rlc3RzL2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5jCkBAIC0xMzcxLDYgKzEz
NzEsNyBAQCBzdGF0aWMgdm9pZCBpbml0X2NyY3MoZW51bSBwaXhlbF9mb3JtYXQgZm9ybWF0LAog
CX0KIAogCWlndF9vdXRwdXRfc2V0X3BpcGUocHJpbV9tb2RlX3BhcmFtcy5vdXRwdXQsIHByaW1f
bW9kZV9wYXJhbXMucGlwZSk7CisJaWd0X291dHB1dF9vdmVycmlkZV9tb2RlKHByaW1fbW9kZV9w
YXJhbXMub3V0cHV0LCBwcmltX21vZGVfcGFyYW1zLm1vZGUpOwogCWZvciAociA9IDA7IHIgPCBw
YXR0ZXJuLT5uX3JlY3RzOyByKyspIHsKIAkJaWd0X3BsYW5lX3NldF9mYihwcmltX21vZGVfcGFy
YW1zLnByaW1hcnkucGxhbmUsICZ0bXBfZmJzW3JdKTsKIAkJaWd0X2Rpc3BsYXlfY29tbWl0KCZk
cm0uZGlzcGxheSk7Ci0tIAoyLjE2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aWd0LWRldgo=
