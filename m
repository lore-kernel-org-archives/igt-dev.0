Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C600F6E72B
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Mar 2018 13:47:54 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Tue, 20 Mar 2018 13:47:40 +0000
Message-Id: <20180320134741.1442-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] [PATCH i-g-t 1/2] lib: intel: report GT size from the
 database if available
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
List-ID: <igt-dev@lists.freedesktop.org>

VGhlIHNjaGVtZSBpZiBnZXR0aW5nIHRoZSBHVCBzaXplIGZyb20gdGhlIFBDSS1pZCBkb2Vzbid0
IHdvcmsgYW55bW9yZQpvbiBDb2ZmZWVsYWtlLgoKU2lnbmVkLW9mZi1ieTogTGlvbmVsIExhbmR3
ZXJsaW4gPGxpb25lbC5nLmxhbmR3ZXJsaW5AaW50ZWwuY29tPgpCdWd6aWxsYTogaHR0cHM6Ly9i
dWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTA1NDUxLCBodHRwczovL2J1Z3Mu
ZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMDE3NDAKLS0tCiBsaWIvaW50ZWxfZGV2
aWNlX2luZm8uYyB8IDkgKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvbGliL2ludGVsX2RldmljZV9pbmZvLmMgYi9saWIvaW50ZWxfZGV2aWNl
X2luZm8uYwppbmRleCAxYzcxMDczMy4uYzEwNGM5YzQgMTAwNjQ0Ci0tLSBhL2xpYi9pbnRlbF9k
ZXZpY2VfaW5mby5jCisrKyBiL2xpYi9pbnRlbF9kZXZpY2VfaW5mby5jCkBAIC00MTAsOCArNDEw
LDE3IEBAIHVuc2lnbmVkIGludGVsX2dlbih1aW50MTZfdCBkZXZpZCkKICAqLwogdW5zaWduZWQg
aW50ZWxfZ3QodWludDE2X3QgZGV2aWQpCiB7CisJY29uc3Qgc3RydWN0IGludGVsX2RldmljZV9p
bmZvICpkZXZpbmZvID0gaW50ZWxfZ2V0X2RldmljZV9pbmZvKGRldmlkKTsKIAl1bnNpZ25lZCBt
YXNrID0gaW50ZWxfZ2VuKGRldmlkKTsKIAorCS8qIElmIGluIHRoZSBkYXRhYmFzZSwganVzdCB1
c2UgdGhhdCBpbmZvcm1hdGlvbi4gKi8KKwlpZiAoZGV2aW5mby0+Z3QgIT0gMCkKKwkJcmV0dXJu
IGRldmluZm8tPmd0IC0gMTsKKworCS8qCisJICogVGhpcyBzY2hlbWUgZG9lc24ndCB3b3JrIG9u
IENvZmZlZWxha2UsIHdlIHNob3VsZCBwcm9iYWJseQorCSAqIG5vdCByZWx5IG9uIHRoaXMgYW55
bW9yZS4KKwkgKi8KIAlpZiAobWFzayA+PSA4KQogCQltYXNrID0gMHhmOwogCWVsc2UgaWYgKG1h
c2sgPj0gNikKLS0gCjIuMTYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3Qt
ZGV2Cg==
