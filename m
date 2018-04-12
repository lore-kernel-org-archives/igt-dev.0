Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 12 Apr 2018 09:43:11 +0100
Message-Id: <20180412084311.18075-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] [PATCH igt] igt/kms_plane_scaling: Open DRM_MASTER
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
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

TW9kZXNldHRpbmcgcmVxdWlyZXMgRFJNX01BU1RFUiBwcml2aWxlZ2VzLCBzbyB1c2UKZHJtX29w
ZW5fZHJpdmVyX21hc3RlcigpIHRvIGFzc2VydCB0aGF0IHdlIGRvIGFjcXVpcmUgdGhlbS4KClJl
ZmVyZW5jZXM6IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTEw
NTk5NwpTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51
az4KLS0tCiB0ZXN0cy9rbXNfcGxhbmVfc2NhbGluZy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMva21zX3Bs
YW5lX3NjYWxpbmcuYyBiL3Rlc3RzL2ttc19wbGFuZV9zY2FsaW5nLmMKaW5kZXggOWQzZmU5NTgu
LmE4NDU0MjA1IDEwMDY0NAotLS0gYS90ZXN0cy9rbXNfcGxhbmVfc2NhbGluZy5jCisrKyBiL3Rl
c3RzL2ttc19wbGFuZV9zY2FsaW5nLmMKQEAgLTUzMiw3ICs1MzIsNyBAQCBpZ3RfbWFpbgogCWln
dF9za2lwX29uX3NpbXVsYXRpb24oKTsKIAogCWlndF9maXh0dXJlIHsKLQkJZGF0YS5kcm1fZmQg
PSBkcm1fb3Blbl9kcml2ZXIoRFJJVkVSX0lOVEVMKTsKKwkJZGF0YS5kcm1fZmQgPSBkcm1fb3Bl
bl9kcml2ZXJfbWFzdGVyKERSSVZFUl9JTlRFTCk7CiAJCWlndF9yZXF1aXJlX3BpcGVfY3JjKGRh
dGEuZHJtX2ZkKTsKIAkJaWd0X2Rpc3BsYXlfaW5pdCgmZGF0YS5kaXNwbGF5LCBkYXRhLmRybV9m
ZCk7CiAJCWRhdGEuZGV2aWQgPSBpbnRlbF9nZXRfZHJtX2RldmlkKGRhdGEuZHJtX2ZkKTsKLS0g
CjIuMTcuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
aWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
