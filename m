Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 15 Aug 2018 21:59:24 +0100
Message-Id: <20180815205924.6949-2-chris@chris-wilson.co.uk>
In-Reply-To: <20180815205924.6949-1-chris@chris-wilson.co.uk>
References: <20180815205924.6949-1-chris@chris-wilson.co.uk>
Subject: [Intel-gfx] [PATCH i-g-t 2/2] igt/pm_rpm: Avoid at_exit_drm_fd
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
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

S2VlcCB0aGUgZHJtX2ZkIG93bmVkIGJ5IHBtX3JwbSBhcyB3ZSBuZWVkIHRvIHJlbGlucXVpc2gg
YWxsIG93bmVyc2hpcApvZiB0aGUgZGV2aWNlIGluIG9yZGVyIHRvIHVubG9hZCB0aGUgbW9kdWxl
LgoKU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+
Ci0tLQogdGVzdHMvcG1fcnBtLmMgfCA1ICsrKystCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvcG1fcnBtLmMgYi90ZXN0
cy9wbV9ycG0uYwppbmRleCBjMDIxMmVkNzAuLmYwNzgxNjE3YyAxMDA2NDQKLS0tIGEvdGVzdHMv
cG1fcnBtLmMKKysrIGIvdGVzdHMvcG1fcnBtLmMKQEAgLTY5Nyw3ICs2OTcsMTAgQEAgc3RhdGlj
IGJvb2wgc2V0dXBfZW52aXJvbm1lbnQodm9pZCkKIAlpZiAoaGFzX3J1bnRpbWVfcG0pCiAJCWdv
dG8gb3V0OwogCi0JZHJtX2ZkID0gZHJtX29wZW5fZHJpdmVyX21hc3RlcihEUklWRVJfSU5URUwp
OworCWRybV9mZCA9IF9fZHJtX29wZW5fZHJpdmVyKERSSVZFUl9JTlRFTCk7CisJaWd0X3JlcXVp
cmUoZHJtX2ZkICE9IC0xKTsKKwlpZ3RfZGV2aWNlX3NldF9tYXN0ZXIoZHJtX2ZkKTsKKwogCWRl
YnVnZnMgPSBpZ3RfZGVidWdmc19kaXIoZHJtX2ZkKTsKIAlpZ3RfcmVxdWlyZShkZWJ1Z2ZzICE9
IC0xKTsKIAotLSAKMi4xOC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpJbnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
bnRlbC1nZngK
