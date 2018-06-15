Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 15 Jun 2018 19:56:43 +0100
Message-Id: <20180615185643.15359-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] [PATCH i-g-t] igt/gem_eio: Make reset-stress safe
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
Cc: igt-dev@lists.freedesktop.org, Mika Kuoppala <mika.kuoppala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

QXMgd2UgaGFuZyBjdHgwIHF1aXRlIGZyZXF1ZW50bHksIGl0IG5lZWRzIHRvIGJlIGhhcmRlbiBh
Z2FpbnN0IGJlaW5nCmJhbm5lZC4KClNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNA
Y2hyaXMtd2lsc29uLmNvLnVrPgpDYzogTWlrYSBLdW9wcGFsYSA8bWlrYS5rdW9wcGFsYUBpbnRl
bC5jb20+Ci0tLQogdGVzdHMvZ2VtX2Vpby5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvZ2VtX2Vpby5jIGIv
dGVzdHMvZ2VtX2Vpby5jCmluZGV4IGUxYWZmNjM5ZC4uNWZhZjc1MDJiIDEwMDY0NAotLS0gYS90
ZXN0cy9nZW1fZWlvLmMKKysrIGIvdGVzdHMvZ2VtX2Vpby5jCkBAIC02NDIsNyArNjQyLDcgQEAg
c3RhdGljIHZvaWQgdGVzdF9pbmZsaWdodF9pbnRlcm5hbChpbnQgZmQsIHVuc2lnbmVkIGludCB3
YWl0KQogICovCiBzdGF0aWMgdm9pZCB0ZXN0X3Jlc2V0X3N0cmVzcyhpbnQgZmQsIHVuc2lnbmVk
IGludCBmbGFncykKIHsKLQl1aW50MzJfdCBjdHgwID0gZ2VtX2NvbnRleHRfY3JlYXRlKGZkKTsK
Kwl1aW50MzJfdCBjdHgwID0gY29udGV4dF9jcmVhdGVfc2FmZShmZCk7CiAKIAlpZ3RfdW50aWxf
dGltZW91dCg1KSB7CiAJCXN0cnVjdCBkcm1faTkxNV9nZW1fZXhlY2J1ZmZlcjIgZXhlY2J1ZiA9
IHsgfTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
Cg==
