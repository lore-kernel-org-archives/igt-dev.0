Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45DAD89D8E
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2019 20:14:06 +0000 (UTC)
From: Kevin Strasser <kevin.strasser@intel.com>
Date: Fri,  5 Apr 2019 13:14:02 -0700
Message-Id: <1554495245-27955-1-git-send-email-kevin.strasser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 0/3] Add support for fp16 formats
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

S2VybmVsIHN1cHBvcnQgZm9yIHRoZXNlIGZvcm1hdHMgaGFzIGxhbmRlZCBpbiBkcm0tbmV4dC4K
VGhpcyBzZXJpZXMgYWRkcyBhIGxpYnJhcnkgZm9yIGNvbnZlcnRpbmcgZmxvYXRzIHRvIGFuZCBm
cm9tIGZwMTYgd2hpY2ggZW5hYmxlcwphIGNvdXBsZSBvZiB0ZXN0cyB0byB1c2UgdGhlIG5ldyBm
b3JtYXRzLgoKZnAxNiBjb3ZlcmFnZSBpcyBpbmNsdWRlZCBpbiB0aGVzZSB0ZXN0czoKICBrbXNf
cGxhbmVfc2NhbGluZwogIGttc19yb3RhdGlvbl9jcmMKCktldmluIFN0cmFzc2VyICgzKToKICBs
aWI6IEFkZCBoYWxmZmxvYXQgaW1wbGVtZW50YXRpb24KICBsaWIvaWd0X2ZiOiBBZGQgc3VwcG9y
dCBmb3IgZnAxNiBmb3JtYXRzIHRocm91Z2ggY29udmVyc2lvbgogIHRlc3RzL2ttc19wbGFuZV9z
Y2FsaW5nOiBTa2lwIHRlc3RpbmcgdW5zdXBwb3J0ZWQgZnAxNiBmZWF0dXJlcwoKIENPUFlJTkcg
ICAgICAgICAgICAgICAgICAgfCAgMjIgKysrKysKIGxpYi9NYWtlZmlsZS5zb3VyY2VzICAgICAg
fCAgIDIgKwogbGliL2lndF9mYi5jICAgICAgICAgICAgICB8IDE0OCArKysrKysrKysrKysrKysr
KysrKysrKysrKysrLQogbGliL2lndF9mYi5oICAgICAgICAgICAgICB8ICAgMSArCiBsaWIvaWd0
X2hhbGZmbG9hdC5jICAgICAgIHwgMjM0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKIGxpYi9pZ3RfaGFsZmZsb2F0LmggICAgICAgfCAgMjcgKysrKysrCiBs
aWIvaWd0X3g4Ni5jICAgICAgICAgICAgIHwgICA5ICsrCiBsaWIvaWd0X3g4Ni5oICAgICAgICAg
ICAgIHwgICAxICsKIGxpYi9tZXNvbi5idWlsZCAgICAgICAgICAgfCAgIDEgKwogdGVzdHMva21z
X3BsYW5lX3NjYWxpbmcuYyB8ICAxNCArKy0KIDEwIGZpbGVzIGNoYW5nZWQsIDQ1NiBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGxpYi9pZ3RfaGFsZmZs
b2F0LmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBsaWIvaWd0X2hhbGZmbG9hdC5oCgotLSAKMi43LjQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYg
bWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
