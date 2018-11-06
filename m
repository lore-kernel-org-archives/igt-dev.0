Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A426E6E3A5
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Nov 2018 16:19:46 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Tue,  6 Nov 2018 18:19:41 +0200
Message-Id: <20181106161943.28641-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/3] lib/debugfs: Fix wraparound handling
 for crc frame counter check
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkRl
YWwgd2l0aCBmcmFtZSBjb3VudGVyIHdyYXBhcm91bmQgY29ycmVjcnRseS4KCkNjOiBNYWFydGVu
IExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgpDYzogRGFuaWVs
IFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KU2lnbmVkLW9mZi1ieTogVmlsbGUgU3ly
asOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiBsaWIvaWd0X2RlYnVn
ZnMuYyB8IDEyICsrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9saWIvaWd0X2RlYnVnZnMuYyBiL2xpYi9pZ3Rf
ZGVidWdmcy5jCmluZGV4IGEzYWNhODQ2NjY1OC4uNzA4NzQ0MTZkMTI4IDEwMDY0NAotLS0gYS9s
aWIvaWd0X2RlYnVnZnMuYworKysgYi9saWIvaWd0X2RlYnVnZnMuYwpAQCAtOTc1LDYgKzk3NSwx
NiBAQCB2b2lkIGlndF9waXBlX2NyY19nZXRfc2luZ2xlKGlndF9waXBlX2NyY190ICpwaXBlX2Ny
YywgaWd0X2NyY190ICpjcmMpCiAJY3JjX3Nhbml0eV9jaGVja3MoY3JjKTsKIH0KIAorc3RhdGlj
IGJvb2wgdmJsX2FmdGVyX2VxKHVpbnQzMl90IGEsIHVpbnQzMl90IGIpCit7CisJcmV0dXJuIChp
bnQzMl90KShhIC0gYikgPj0gMDsKK30KKworc3RhdGljIGJvb2wgdmJsX2JlZm9yZV9lcSh1aW50
MzJfdCBhLCB1aW50MzJfdCBiKQoreworCXJldHVybiB2YmxfYWZ0ZXJfZXEoYiwgYSk7Cit9CisK
IC8qKgogICogaWd0X3BpcGVfY3JjX2dldF9jdXJyZW50OgogICogQGRybV9mZDogUG9pbnRlciB0
byBkcm0gZmQgZm9yIHZibGFuayBjb3VudGVyCkBAIC05OTksNyArMTAwOSw3IEBAIGlndF9waXBl
X2NyY19nZXRfY3VycmVudChpbnQgZHJtX2ZkLCBpZ3RfcGlwZV9jcmNfdCAqcGlwZV9jcmMsIGln
dF9jcmNfdCAqY3JjKQogCQkJaWd0X3BpcGVfY3JjX2dldF9zaW5nbGUocGlwZV9jcmMsIGNyYyk7
CiAJCQlyZXR1cm47CiAJCX0KLQl9IHdoaWxlIChjcmMtPmZyYW1lIDw9IHZibGFuayk7CisJfSB3
aGlsZSAodmJsX2JlZm9yZV9lcShjcmMtPmZyYW1lLCB2YmxhbmspKTsKIAogCWNyY19zYW5pdHlf
Y2hlY2tzKGNyYyk7CiB9Ci0tIAoyLjE4LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaWd0LWRldgo=
