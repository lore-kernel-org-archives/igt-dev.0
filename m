Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534346E094
 for <igt-dev@lists.freedesktop.org>; Fri, 24 May 2019 08:07:52 +0000 (UTC)
From: Simon Ser <simon.ser@intel.com>
Date: Fri, 24 May 2019 11:07:28 +0300
Message-Id: <20190524080736.9173-1-simon.ser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/8] tests/kms_chamelium: add amplitude test
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

VGhpcyBzZXJpZXMgc3VwZXJzZWRlcyB0aGUgcHJldmlvdXMgb25lIHN0YXJ0aW5nIHdpdGggInRl
c3RzL2ttc19jaGFtZWxpdW06CnJlZmFjdG9yIGF1ZGlvIHRlc3QiLgoKVGhlIHNlcmllcyBwZXJm
b3JtcyBhIHJlZmFjdG9yaW5nIG9mIHRoZSBjdXJyZW50IGF1ZGlvIHRlc3QgdG8gYmUgYWJsZSB0
bwppbnRyb2R1Y2UgYSBuZXcgb25lLgoKVGhlIG5ldyB0ZXN0IGNoZWNrcyB0aGUgYW1wbGl0dWRl
LiBUaGlzIG1ha2VzIHN1cmUgbm8gc2NhbGluZyBvZiB0aGUgc2lnbmFsIGlzCm9ic2VydmVkLCBh
bmQgdGhlIHdpbmRvdyBzaG91bGQgYmUgc21hbGwgZW5vdWdoIHRvIGRldGVjdCBwb3BzLgoKU2lt
b24gU2VyICg4KToKICB0ZXN0cy9rbXNfY2hhbWVsaXVtOiByZWZhY3RvciBhdWRpbyB0ZXN0CiAg
dGVzdHMva21zX2NoYW1lbGl1bTogaW50cm9kdWNlIGF1ZGlvX3N0YXRlX3JlY2VpdmUKICB0ZXN0
cy9rbXNfY2hhbWVsaXVtOiByZW5hbWUgZG9fdGVzdF9kaXNwbGF5X2F1ZGlvIGFuZAogICAgdGVz
dF9hdWRpb19jb25maWd1cmF0aW9uCiAgdGVzdHMva21zX2NoYW1lbGl1bTogZXhwbGFpbiB3aHkg
OC1jaGFubmVsIHRlc3RzIGFyZW4ndCBwZXJmb3JtZWQKICBsaWIvaWd0X2F1ZGlvOiBpbnRyb2R1
Y2UgYXVkaW9fY29udmVydF90bwogIHRlc3RzL2ttc19jaGFtZWxpdW06IGFkZCBuYW1lIHBhcmFt
ZXRlciB0byBhdWRpb19zdGF0ZV9zdGFydAogIGxpYi9pZ3RfYXVkaW86IG1ha2UgYXVkaW9fZXh0
cmFjdF9jaGFubmVsX3MzMl9sZSBzdXBwb3J0IGEgTlVMTCBkc3QKICB0ZXN0cy9rbXNfY2hhbWVs
aXVtOiBhZGQgcHVsc2UgYXVkaW8gdGVzdAoKIGxpYi9pZ3RfYXVkaW8uYyAgICAgICB8ICA5OCAr
KysrKy0tLS0KIGxpYi9pZ3RfYXVkaW8uaCAgICAgICB8ICAxMiArLQogdGVzdHMva21zX2NoYW1l
bGl1bS5jIHwgNDc0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQog
MyBmaWxlcyBjaGFuZ2VkLCAzNzggaW5zZXJ0aW9ucygrKSwgMjA2IGRlbGV0aW9ucygtKQoKLS0K
Mi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
