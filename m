Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Sun, 27 Jan 2019 13:13:53 +0000
Message-Id: <20190127131353.1843-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/pm_rpm: Check for functional GEM
 before use
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Q2hlY2sgdGhlIEdQVSAodXNpbmcgR0VNKSBpcyB1cCBhbiBvcGVyYXRpb25hbCBiZWZvcmUgc3Vi
bWl0dGluZwpjb21tYW5kcy4KClNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hy
aXMtd2lsc29uLmNvLnVrPgotLS0KIHRlc3RzL3BtX3JwbS5jIHwgNCArKysrCiAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdGVzdHMvcG1fcnBtLmMgYi90ZXN0
cy9wbV9ycG0uYwppbmRleCA3ZGNiNTU4NmQuLmJlMjk2ZjUyNSAxMDA2NDQKLS0tIGEvdGVzdHMv
cG1fcnBtLmMKKysrIGIvdGVzdHMvcG1fcnBtLmMKQEAgLTEyMjAsNiArMTIyMCw4IEBAIHN0YXRp
YyB2b2lkIGdlbV9leGVjYnVmX3N1YnRlc3Qodm9pZCkKIAlpbnQgc3FfeCA9IDUsIHNxX3kgPSAx
MCwgc3FfdyA9IDE1LCBzcV9oID0gMjA7CiAJdWludDMyX3QgY29sb3I7CiAKKwlpZ3RfcmVxdWly
ZV9nZW0oZHJtX2ZkKTsKKwogCS8qIENyZWF0ZSBhbmQgc2V0IGRhdGEgd2hpbGUgdGhlIGRldmlj
ZSBpcyBhY3RpdmUuICovCiAJZW5hYmxlX29uZV9zY3JlZW5fYW5kX3dhaXQoJm1zX2RhdGEpOwog
CkBAIC0xMzA4LDYgKzEzMTAsOCBAQCBzdGF0aWMgdm9pZCBnZW1fZXhlY2J1Zl9zdHJlc3Nfc3Vi
dGVzdChpbnQgcm91bmRzLCBpbnQgd2FpdF9mbGFncykKIAlzdHJ1Y3QgZHJtX2k5MTVfZ2VtX2V4
ZWNidWZmZXIyIGV4ZWNidWYgPSB7fTsKIAlzdHJ1Y3QgZHJtX2k5MTVfZ2VtX2V4ZWNfb2JqZWN0
MiBvYmpzWzFdID0ge3t9fTsKIAorCWlndF9yZXF1aXJlX2dlbShkcm1fZmQpOworCiAJaWYgKHdh
aXRfZmxhZ3MgJiBXQUlUX1BDOF9SRVMpCiAJCWlndF9yZXF1aXJlKGhhc19wYzgpOwogCi0tIAoy
LjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmln
dC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
