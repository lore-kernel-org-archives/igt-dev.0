Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 17 Sep 2019 09:19:53 +0100
Message-Id: <20190917081953.28098-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] 915/gem_exec_faulting_reloc: Uses the
 blitter; require the blitter
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

U2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Ci0t
LQogdGVzdHMvaTkxNS9nZW1fZXhlY19mYXVsdGluZ19yZWxvYy5jIHwgMiArKwogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNf
ZmF1bHRpbmdfcmVsb2MuYyBiL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfZmF1bHRpbmdfcmVsb2MuYwpp
bmRleCA2YjA1ZTQzZmUuLjBiYjVmYTkxYSAxMDA2NDQKLS0tIGEvdGVzdHMvaTkxNS9nZW1fZXhl
Y19mYXVsdGluZ19yZWxvYy5jCisrKyBiL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfZmF1bHRpbmdfcmVs
b2MuYwpAQCAtMTczLDYgKzE3Myw4IEBAIHN0YXRpYyB2b2lkIHJ1bihpbnQgb2JqZWN0X3NpemUp
CiAKIAlmZCA9IGRybV9vcGVuX2RyaXZlcihEUklWRVJfSU5URUwpOwogCWlndF9yZXF1aXJlX2dl
bShmZCk7CisJZ2VtX3JlcXVpcmVfYmxpdHRlcihmZCk7CisKIAlkZXZpZCA9IGludGVsX2dldF9k
cm1fZGV2aWQoZmQpOwogCWhhbmRsZSA9IGdlbV9jcmVhdGUoZmQsIDQwOTYpOwogCXNyYyA9IGdl
bV9jcmVhdGUoZmQsIG9iamVjdF9zaXplKTsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9pZ3QtZGV2
