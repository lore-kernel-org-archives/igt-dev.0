Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 19 Mar 2019 19:23:20 +0000
Message-Id: <20190319192320.10526-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_mocs_settings/mocs-isolation:
 Filter out missing rings
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

RG9uJ3QgdHJ5IHRvIGV2YWx1YXRlIHdoZXRoZXIgcmVhZHMgZXhlY3V0ZWQgb24gYW4gYWJzZW50
IHJpbmcgZG8KYW55dGhpbmcuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNo
cmlzLXdpbHNvbi5jby51az4KLS0tCiB0ZXN0cy9pOTE1L2dlbV9tb2NzX3NldHRpbmdzLmMgfCA0
ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9nZW1fbW9jc19zZXR0aW5ncy5jIGIvdGVzdHMvaTkxNS9n
ZW1fbW9jc19zZXR0aW5ncy5jCmluZGV4IDIxZjdjNmUxMi4uMWEzMTFiOGMwIDEwMDY0NAotLS0g
YS90ZXN0cy9pOTE1L2dlbV9tb2NzX3NldHRpbmdzLmMKKysrIGIvdGVzdHMvaTkxNS9nZW1fbW9j
c19zZXR0aW5ncy5jCkBAIC01NjQsOCArNTY0LDggQEAgaWd0X21haW4KIAkJCX0KIAkJfQogCi0J
CWlndF9zdWJ0ZXN0X2YoIm1vY3MtaXNvbGF0aW9uLSVzIiwKLQkJCSAgICAgIGUtPm5hbWUpIHsK
KwkJaWd0X3N1YnRlc3RfZigibW9jcy1pc29sYXRpb24tJXMiLCBlLT5uYW1lKSB7CisJCQlnZW1f
cmVxdWlyZV9yaW5nKGZkLCBlLT5leGVjX2lkIHwgZS0+ZmxhZ3MpOwogCQkJZ2VtX3JlcXVpcmVf
Y29udGV4dHMoZmQpOwogCiAJCQlpc29sYXRpb25fdGVzdChmZCwgZS0+ZXhlY19pZCB8IGUtPmZs
YWdzKTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
