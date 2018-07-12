Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 12 Jul 2018 16:40:03 +0100
Message-Id: <20180712154003.12630-1-chris@chris-wilson.co.uk>
Subject: [Intel-gfx] [PATCH i-g-t] igt/gem_unfence_active_buffers: Check GEM
 before use
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

QXMgd2Ugd2FudCB0byBtYWtlIHRoZSBidWZmZXJzIGFjdGl2ZSBvbiB0aGUgR1BVIGJlZm9yZSBy
ZW1vdmluZyB0aGVpcgpmZW5jZSwgYW4gb3BlcmF0aW9uYWwgR1BVIChub3Qgd2VkZ2VkISkgaXMg
cmVxdWlyZWQuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNv
bi5jby51az4KLS0tCiB0ZXN0cy9nZW1fdW5mZW5jZV9hY3RpdmVfYnVmZmVycy5jIHwgMSArCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS90ZXN0cy9nZW1fdW5m
ZW5jZV9hY3RpdmVfYnVmZmVycy5jIGIvdGVzdHMvZ2VtX3VuZmVuY2VfYWN0aXZlX2J1ZmZlcnMu
YwppbmRleCA2ZGYyM2NjNTMuLmI3OGZiYWZhNyAxMDA2NDQKLS0tIGEvdGVzdHMvZ2VtX3VuZmVu
Y2VfYWN0aXZlX2J1ZmZlcnMuYworKysgYi90ZXN0cy9nZW1fdW5mZW5jZV9hY3RpdmVfYnVmZmVy
cy5jCkBAIC03NCw2ICs3NCw3IEBAIGlndF9zaW1wbGVfbWFpbgogCQlkYXRhW2ldID0gaTsKIAog
CWZkID0gZHJtX29wZW5fZHJpdmVyKERSSVZFUl9JTlRFTCk7CisJaWd0X3JlcXVpcmVfZ2VtKGZk
KTsKIAogCWJ1Zm1nciA9IGRybV9pbnRlbF9idWZtZ3JfZ2VtX2luaXQoZmQsIDQwOTYpOwogCWRy
bV9pbnRlbF9idWZtZ3JfZ2VtX2VuYWJsZV9yZXVzZShidWZtZ3IpOwotLSAKMi4xOC4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1nZnggbWFp
bGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
