Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BEA86E518
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Jan 2019 20:01:29 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Mon, 28 Jan 2019 22:01:21 +0200
Message-Id: <20190128200126.1270-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/6] tools/intel_watermark: Bump number of
 planes to 8 for icl
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
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCmlj
bCBoYXMgOCBwbGFuZXMgcGVyIHBpcGUuIEJ1bXAgdGhlIGxpbWl0cyB0byBtYXRjaC4KClNpZ25l
ZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+
Ci0tLQogdG9vbHMvaW50ZWxfd2F0ZXJtYXJrLmMgfCA4ICsrKysrKy0tCiAxIGZpbGUgY2hhbmdl
ZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2lu
dGVsX3dhdGVybWFyay5jIGIvdG9vbHMvaW50ZWxfd2F0ZXJtYXJrLmMKaW5kZXggM2ZkMzc0NDFj
YmE3Li5iNjFhMjZmMWNkNTcgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2ludGVsX3dhdGVybWFyay5jCisr
KyBiL3Rvb2xzL2ludGVsX3dhdGVybWFyay5jCkBAIC0xMzcsNyArMTM3LDkgQEAgc3RhdGljIGlu
dCBpc19oc3dfcGx1cyh1aW50MzJfdCBkKQogCiBzdGF0aWMgaW50IHNrbF9udW1fcGxhbmVzKHVp
bnQzMl90IGQsIGludCBwaXBlKQogewotCWlmIChJU19HRU4xMChkKSB8fCBJU19HRU1JTklMQUtF
KGQpKQorCWlmIChJU19HRU4xMShkKSkKKwkJcmV0dXJuIDg7CisJZWxzZSBpZiAoSVNfR0VOMTAo
ZCkgfHwgSVNfR0VNSU5JTEFLRShkKSkKIAkJcmV0dXJuIDU7CiAJZWxzZSBpZiAoSVNfQlJPWFRP
TihkKSkKIAkJcmV0dXJuIHBpcGUgPT0gMiA/IDQgOiA1OwpAQCAtMTQ3LDcgKzE0OSw5IEBAIHN0
YXRpYyBpbnQgc2tsX251bV9wbGFuZXModWludDMyX3QgZCwgaW50IHBpcGUpCiAKIHN0YXRpYyBp
bnQgc2tsX21heF9wbGFuZXModWludDMyX3QgZCkKIHsKLQlpZiAoSVNfR0VOMTAoZCkgfHwgSVNf
R0VNSU5JTEFLRShkKSB8fCBJU19CUk9YVE9OKGQpKQorCWlmIChJU19HRU4xMShkKSkKKwkJcmV0
dXJuIDg7CisJZWxzZSBpZiAoSVNfR0VOMTAoZCkgfHwgSVNfR0VNSU5JTEFLRShkKSB8fCBJU19C
Uk9YVE9OKGQpKQogCQlyZXR1cm4gNTsKIAllbHNlCiAJCXJldHVybiA0OwotLSAKMi4xOS4yCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1h
aWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
