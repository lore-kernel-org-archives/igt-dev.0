Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71DE989A8C
 for <igt-dev@lists.freedesktop.org>; Mon, 27 May 2019 14:34:38 +0000 (UTC)
From: Simon Ser <simon.ser@intel.com>
Date: Mon, 27 May 2019 17:34:08 +0300
Message-Id: <20190527143418.7925-1-simon.ser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 00/10] tests/kms_chamelium: add pulse test
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
Cc: martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

VGhlIHNlcmllcyBwZXJmb3JtcyBhIHJlZmFjdG9yaW5nIG9mIHRoZSBjdXJyZW50IGF1ZGlvIHRl
c3QgdG8gYmUgYWJsZSB0bwppbnRyb2R1Y2UgYSBuZXcgb25lLgoKVGhlIG5ldyB0ZXN0IGNoZWNr
cyBib3RoIHRoZSBhbXBsaXR1ZGUgYW5kIHRoZSBjaGFubmVsIGFsaWdubWVudC4KCkNoYW5nZXMg
ZnJvbSB2MiB0byB2MzoKLSBBZGRlZCBvbmUgbW9yZSBwYXRjaCB0byBpbnRyb2R1Y2UgQ0hBTUVM
SVVNX01BWF9BVURJT19DSEFOTkVMUwotIEFkZHJlc3NlZCBNYXJ0aW4ncyBjb21tZW50cwoKU2lt
b24gU2VyICgxMCk6CiAgbGliL2lndF9jaGFtZWxpdW06IGludHJvZHVjZSBDSEFNRUxJVU1fTUFY
X0FVRElPX0NIQU5ORUxTCiAgdGVzdHMva21zX2NoYW1lbGl1bTogcmVmYWN0b3IgYXVkaW8gdGVz
dAogIHRlc3RzL2ttc19jaGFtZWxpdW06IGludHJvZHVjZSBhdWRpb19zdGF0ZV9yZWNlaXZlCiAg
dGVzdHMva21zX2NoYW1lbGl1bTogcmVuYW1lIGRvX3Rlc3RfZGlzcGxheV9hdWRpbyBhbmQKICAg
IHRlc3RfYXVkaW9fY29uZmlndXJhdGlvbgogIHRlc3RzL2ttc19jaGFtZWxpdW06IGV4cGxhaW4g
d2h5IDgtY2hhbm5lbCB0ZXN0cyBhcmVuJ3QgcGVyZm9ybWVkCiAgbGliL2lndF9hdWRpbzogaW50
cm9kdWNlIGF1ZGlvX2NvbnZlcnRfdG8KICB0ZXN0cy9rbXNfY2hhbWVsaXVtOiBhZGQgbmFtZSBw
YXJhbWV0ZXIgdG8gYXVkaW9fc3RhdGVfc3RhcnQKICBsaWIvaWd0X2F1ZGlvOiBtYWtlIGF1ZGlv
X2V4dHJhY3RfY2hhbm5lbF9zMzJfbGUgc3VwcG9ydCBhIE5VTEwgZHN0CiAgdGVzdHMva21zX2No
YW1lbGl1bTogYWRkIGEgZmxhdGxpbmUgYXVkaW8gdGVzdAogIHRlc3RzL2ttc19jaGFtZWxpdW06
IGFkZCBhdWRpbyBjaGFubmVsIGFsaWdubWVudCB0ZXN0CgogbGliL2lndF9hdWRpby5jICAgICAg
IHwgIDk4ICsrKystLS0tCiBsaWIvaWd0X2F1ZGlvLmggICAgICAgfCAgMTIgKy0KIGxpYi9pZ3Rf
Y2hhbWVsaXVtLmMgICB8ICAgOCArLQogbGliL2lndF9jaGFtZWxpdW0uaCAgIHwgICA4ICstCiB0
ZXN0cy9rbXNfY2hhbWVsaXVtLmMgfCA1NjMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tCiA1IGZpbGVzIGNoYW5nZWQsIDQ3MyBpbnNlcnRpb25zKCspLCAyMTYgZGVs
ZXRpb25zKC0pCgotLQoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0
LWRldg==
