Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70EED6E3A5
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Nov 2018 16:19:53 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Tue,  6 Nov 2018 18:19:43 +0200
Message-Id: <20181106161943.28641-3-ville.syrjala@linux.intel.com>
In-Reply-To: <20181106161943.28641-1-ville.syrjala@linux.intel.com>
References: <20181106161943.28641-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/3] tests/kms_flip: Request the initial vbl
 count with RELATIVE instead of ABSOLUTE
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
To: igt-dev@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkFz
a2luZyBmb3IgdGhlIGluaXRpYWwgdmJsYW5rIGNvdW50IGJ5IHNwZWNpZnlpbmcgYW5kIGFic29s
dXRlIHZibGFuayBjb3VudCBvZiAwCmRvZXNuJ3QgbWFrZSBtdWNoIHNlbnNlLiBTd2l0Y2ggdG8g
YSByZWxhdGl2ZSBxdWVyeSBpbnN0ZWFkLgoKSXQgZG9lc24ndCBsb29rIGxpa2Ugd2UgY2FyZSBh
Ym91dCBsaW5pbmcgdXAgb24gdGhlIGZpcnN0IHZibGFuayBib3VuZGFyeSBzbwp3ZSBjYW4ganVz
dCBkcm9wIHRoZSBORVhUT05NSVNTIGZsYWcuIE9ubHkgdGhlIHJlbGF0aXZlIHRpbWVzdGFtcHMg
b2YgdGhlCmV2ZW50cyB3aWxsIG1hdHRlci4KCnYyOiBEcm9wIHRoZSBORVhUT05NSVNTIChEYW5p
ZWwpCgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogQ2hyaXMgV2lsc29u
IDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+ClNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzD
pCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQogdGVzdHMva21zX2ZsaXAuYyB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL3Rlc3RzL2ttc19mbGlwLmMgYi90ZXN0cy9rbXNfZmxpcC5jCmluZGV4IGYyODI3
MmRkMWUzZi4uMTBhNzJiZjBkMWMzIDEwMDY0NAotLS0gYS90ZXN0cy9rbXNfZmxpcC5jCisrKyBi
L3Rlc3RzL2ttc19mbGlwLmMKQEAgLTExMjUsNyArMTEyNSw3IEBAIHN0YXRpYyB2b2lkIGNhbGli
cmF0ZV90cyhzdHJ1Y3QgdGVzdF9vdXRwdXQgKm8sIGludCBjcnRjX2lkeCkKIAogCW1lbXNldCgm
d2FpdCwgMCwgc2l6ZW9mKHdhaXQpKTsKIAl3YWl0LnJlcXVlc3QudHlwZSA9IGttc3Rlc3RfZ2V0
X3ZibF9mbGFnKGNydGNfaWR4KTsKLQl3YWl0LnJlcXVlc3QudHlwZSB8PSBEUk1fVkJMQU5LX0FC
U09MVVRFIHwgRFJNX1ZCTEFOS19ORVhUT05NSVNTOworCXdhaXQucmVxdWVzdC50eXBlIHw9IERS
TV9WQkxBTktfUkVMQVRJVkU7CiAJZG9fb3JfZGllKGRybVdhaXRWQmxhbmsoZHJtX2ZkLCAmd2Fp
dCkpOwogCiAJbGFzdF9zZXEgPSB3YWl0LnJlcGx5LnNlcXVlbmNlOwotLSAKMi4xOC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxp
bmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
