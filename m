Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu,  5 Apr 2018 19:47:57 +0100
Message-Id: <20180405184757.15907-2-chris@chris-wilson.co.uk>
In-Reply-To: <20180405184757.15907-1-chris@chris-wilson.co.uk>
References: <20180405184757.15907-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] [PATCH igt 2/2] igt/gem_eio: Drop DRM_MASTER so we can
 reacquire it in the subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

QXMgd2UgcmVvcGVuIHRoZSBmZCBmb3IgZWFjaCBzdWJ0ZXN0LCBhbmQgd2UgbmVlZCBhIERSTV9N
QVNURVIsIHdlIG5lZWQKdG8gZHJvcCBtYXN0ZXIgb24gdGhlIG9yaWdpbmFsIGJlZm9yZSB3ZSBh
cmUgYWxsb3dlZCB0byBjbGFpbSBEUk1fTUFTVEVSCm9uIHRoZSBzZWNvbmQuCgpTaWduZWQtb2Zm
LWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KQ2M6IFR2cnRrbyBV
cnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+Ci0tLQogdGVzdHMvZ2VtX2Vpby5jIHwg
MiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rlc3Rz
L2dlbV9laW8uYyBiL3Rlc3RzL2dlbV9laW8uYwppbmRleCA5NTk5ZTczZC4uNjZkOGMxOGEgMTAw
NjQ0Ci0tLSBhL3Rlc3RzL2dlbV9laW8uYworKysgYi90ZXN0cy9nZW1fZWlvLmMKQEAgLTQxLDYg
KzQxLDcgQEAKICNpbmNsdWRlIDxkcm0uaD4KIAogI2luY2x1ZGUgImlndC5oIgorI2luY2x1ZGUg
ImlndF9kZXZpY2UuaCIKICNpbmNsdWRlICJpZ3Rfc3lzZnMuaCIKICNpbmNsdWRlICJzd19zeW5j
LmgiCiAKQEAgLTY3NCw2ICs2NzUsNyBAQCBpZ3RfbWFpbgogCiAJaWd0X2ZpeHR1cmUgewogCQlm
ZCA9IGRybV9vcGVuX2RyaXZlcihEUklWRVJfSU5URUwpOworCQlpZ3RfZGV2aWNlX2Ryb3BfbWFz
dGVyKGZkKTsKIAogCQlpZ3RfcmVxdWlyZShpOTE1X3Jlc2V0X2NvbnRyb2wodHJ1ZSkpOwogCQlp
Z3RfZm9yY2VfZ3B1X3Jlc2V0KGZkKTsKLS0gCjIuMTYuMwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9pZ3QtZGV2Cg==
