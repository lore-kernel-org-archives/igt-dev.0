Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 14 Mar 2019 08:38:18 +0000
Message-Id: <20190314083818.10945-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_create: Always try to create an
 object of at least one page
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

MC1ieXRlIG9iamVjdHMgYXJlIG5vdCBhbGxvd2VkLgoKUmVmZXJlbmNlczogaHR0cHM6Ly9idWdz
LmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTEwMTA2ClNpZ25lZC1vZmYtYnk6IENo
cmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgotLS0KIHRlc3RzL2k5MTUvZ2Vt
X2NyZWF0ZS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9nZW1fY3JlYXRlLmMgYi90ZXN0cy9pOTE1
L2dlbV9jcmVhdGUuYwppbmRleCA2MDViN2Y5ZDkuLjJhODYxY2E4YSAxMDA2NDQKLS0tIGEvdGVz
dHMvaTkxNS9nZW1fY3JlYXRlLmMKKysrIGIvdGVzdHMvaTkxNS9nZW1fY3JlYXRlLmMKQEAgLTE0
OSw3ICsxNDksNyBAQCBzdGF0aWMgdWludDY0X3QgZ2V0X25wYWdlcyh1aW50NjRfdCAqZ2xvYmFs
LCB1aW50NjRfdCBucGFnZXMpCiAJbWF4ID0gKmdsb2JhbDsKIAlkbyB7CiAJCW9sZCA9IG1heDsK
LQkJdHJ5ID0gbnBhZ2VzICUgKG1heCAvIDIpOworCQl0cnkgPSAxICsgbnBhZ2VzICUgKG1heCAv
IDIpOwogCQltYXggLT0gdHJ5OwogCX0gd2hpbGUgKChtYXggPSBfX3N5bmNfdmFsX2NvbXBhcmVf
YW5kX3N3YXAoZ2xvYmFsLCBvbGQsIG1heCkpICE9IG9sZCk7CiAKLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5n
IGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
