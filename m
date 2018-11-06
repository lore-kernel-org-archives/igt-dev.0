Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D036F6E3AF
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Nov 2018 16:19:49 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Tue,  6 Nov 2018 18:19:42 +0200
Message-Id: <20181106161943.28641-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20181106161943.28641-1-ville.syrjala@linux.intel.com>
References: <20181106161943.28641-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/3] tests/kms_setmode: Request the initial
 vbl count with RELATIVE instead of ABSOLUTE
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
pCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQogdGVzdHMva21zX3NldG1vZGUu
YyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19zZXRtb2RlLmMgYi90ZXN0cy9rbXNfc2V0bW9kZS5jCmlu
ZGV4IDY4MTQ5NjA0NGY1ZC4uYWNkNjA2Y2Q1YjVlIDEwMDY0NAotLS0gYS90ZXN0cy9rbXNfc2V0
bW9kZS5jCisrKyBiL3Rlc3RzL2ttc19zZXRtb2RlLmMKQEAgLTQzNCw3ICs0MzQsNyBAQCBzdGF0
aWMgdm9pZCBjaGVja190aW1pbmdzKGludCBjcnRjX2lkeCwgY29uc3QgZHJtTW9kZU1vZGVJbmZv
ICprbW9kZSkKIAogCW1lbXNldCgmd2FpdCwgMCwgc2l6ZW9mKHdhaXQpKTsKIAl3YWl0LnJlcXVl
c3QudHlwZSA9IGttc3Rlc3RfZ2V0X3ZibF9mbGFnKGNydGNfaWR4KTsKLQl3YWl0LnJlcXVlc3Qu
dHlwZSB8PSBEUk1fVkJMQU5LX0FCU09MVVRFIHwgRFJNX1ZCTEFOS19ORVhUT05NSVNTOworCXdh
aXQucmVxdWVzdC50eXBlIHw9IERSTV9WQkxBTktfUkVMQVRJVkU7CiAJZG9fb3JfZGllKGRybVdh
aXRWQmxhbmsoZHJtX2ZkLCAmd2FpdCkpOwogCiAJbGFzdF9zZXEgPSB3YWl0LnJlcGx5LnNlcXVl
bmNlOwotLSAKMi4xOC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
