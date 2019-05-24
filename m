Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CEA46E0DF
 for <igt-dev@lists.freedesktop.org>; Fri, 24 May 2019 15:03:50 +0000 (UTC)
From: Simon Ser <simon.ser@intel.com>
Date: Fri, 24 May 2019 18:03:25 +0300
Message-Id: <20190524150334.15833-1-simon.ser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 0/9] tests/kms_chamelium: add pulse test
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

VGhlIHNlcmllcyBwZXJmb3JtcyBhIHJlZmFjdG9yaW5nIG9mIHRoZSBjdXJyZW50IGF1ZGlvIHRl
c3QgdG8gYmUgYWJsZSB0bwppbnRyb2R1Y2UgYSBuZXcgb25lLgoKVGhlIG5ldyB0ZXN0IGNoZWNr
cyBib3RoIHRoZSBhbXBsaXR1ZGUgYW5kIHRoZSBjaGFubmVsIGFsaWdubWVudC4KClRoZSBzZXJp
ZXMgaGFzIGJlZW4gcmVwb3N0ZWQgYmVjYXVzZToKCi0gQ0kgZmFpbGVkIHRvIHRlc3QgbXkgY2hh
bmdlcywgZm9yIHNvbWUgcmVhc29uCi0gQSBuZXcgcGF0Y2ggaGFzIGJlZW4gYWRkZWQKClNpbW9u
IFNlciAoOSk6CiAgdGVzdHMva21zX2NoYW1lbGl1bTogcmVmYWN0b3IgYXVkaW8gdGVzdAogIHRl
c3RzL2ttc19jaGFtZWxpdW06IGludHJvZHVjZSBhdWRpb19zdGF0ZV9yZWNlaXZlCiAgdGVzdHMv
a21zX2NoYW1lbGl1bTogcmVuYW1lIGRvX3Rlc3RfZGlzcGxheV9hdWRpbyBhbmQKICAgIHRlc3Rf
YXVkaW9fY29uZmlndXJhdGlvbgogIHRlc3RzL2ttc19jaGFtZWxpdW06IGV4cGxhaW4gd2h5IDgt
Y2hhbm5lbCB0ZXN0cyBhcmVuJ3QgcGVyZm9ybWVkCiAgbGliL2lndF9hdWRpbzogaW50cm9kdWNl
IGF1ZGlvX2NvbnZlcnRfdG8KICB0ZXN0cy9rbXNfY2hhbWVsaXVtOiBhZGQgbmFtZSBwYXJhbWV0
ZXIgdG8gYXVkaW9fc3RhdGVfc3RhcnQKICBsaWIvaWd0X2F1ZGlvOiBtYWtlIGF1ZGlvX2V4dHJh
Y3RfY2hhbm5lbF9zMzJfbGUgc3VwcG9ydCBhIE5VTEwgZHN0CiAgdGVzdHMva21zX2NoYW1lbGl1
bTogYWRkIHB1bHNlIGF1ZGlvIHRlc3QKICB0ZXN0cy9rbXNfY2hhbWVsaXVtOiBhZGQgYXVkaW8g
Y2hhbm5lbCBhbGlnbm1lbnQgdGVzdAoKIGxpYi9pZ3RfYXVkaW8uYyAgICAgICB8ICA5OCArKysr
LS0tLQogbGliL2lndF9hdWRpby5oICAgICAgIHwgIDEyICstCiB0ZXN0cy9rbXNfY2hhbWVsaXVt
LmMgfCA1NjEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tCiAzIGZp
bGVzIGNoYW5nZWQsIDQ1OSBpbnNlcnRpb25zKCspLCAyMTIgZGVsZXRpb25zKC0pCgotLQoyLjIx
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1k
ZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
