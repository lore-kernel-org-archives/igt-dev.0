Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Sun, 18 Aug 2019 13:56:30 +0100
Message-Id: <20190818125630.12200-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_ctx_engine: Scheduler required for
 reordering requests
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

VG8gcnVuIHRoZSBpbmRlcGVuZGVudCBzdWJ0ZXN0cyByZXF1aXJlcyB0byBpc3N1ZSB0aGUgcmVx
dWVzdHMKbm90LWluLXN1Ym1pc3Npb24gb3JkZXIsIHdlIG5lZWQgYSBzY2hlZHVsZXIuCgpTaWdu
ZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KLS0tCiB0
ZXN0cy9pOTE1L2dlbV9jdHhfZW5naW5lcy5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykKCmRpZmYgLS1naXQgYS90ZXN0cy9pOTE1L2dlbV9jdHhfZW5naW5lcy5jIGIvdGVz
dHMvaTkxNS9nZW1fY3R4X2VuZ2luZXMuYwppbmRleCAyZTgwZDBmM2UuLjFlODJlNTFlZSAxMDA2
NDQKLS0tIGEvdGVzdHMvaTkxNS9nZW1fY3R4X2VuZ2luZXMuYworKysgYi90ZXN0cy9pOTE1L2dl
bV9jdHhfZW5naW5lcy5jCkBAIC00MzEsNiArNDMxLDcgQEAgc3RhdGljIHZvaWQgaW5kZXBlbmRl
bnQoaW50IGk5MTUpCiAJdWludDMyX3QgbGFzdCwgKm1hcDsKIAogCWlndF9yZXF1aXJlKGdlbiA+
PSA2KTsgLyogTm8gcGVyLWVuZ2luZSBUSU1FU1RBTVAgb24gb2xkZXIgZ2VuICovCisJaWd0X3Jl
cXVpcmUoZ2VtX3NjaGVkdWxlcl9lbmFibGVkKGk5MTUpKTsKIAogCXsKIAkJc3RydWN0IGRybV9p
OTE1X2dlbV9leGVjYnVmZmVyMiBleGVjYnVmID0gewotLSAKMi4yMy4wLnJjMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxp
c3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
