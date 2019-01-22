Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Tue, 22 Jan 2019 18:54:05 -0200
From: Shayenne Moura <shayenneluzmoura@gmail.com>
Message-ID: <20190122205405.dpzt3oxkpjxzgvnq@smtp.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [igt-dev] [PATCH i-g-t v2] tests/kms_flip: Add test to check
 suspend/resume
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
To: Petri Latvala <petri.latvala@intel.com>, Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

VGhpcyBwYXRjaCBhZGRzIG9uZSB0ZXN0IHRvIGV2YWx1YXRlIHN1c3BlbmQvcmVzdW1lIG9wZXJh
dGlvbnMgdXNpbmcga21zX2ZsaXAuCgpTaWduZWQtb2ZmLWJ5OiBTaGF5ZW5uZSBNb3VyYSA8c2hh
eWVubmVsdXptb3VyYUBnbWFpbC5jb20+Cgp2MjogUmVkdWNlIHRlc3QgdGltZSB0byAxMCAoRGFu
aWVsKQotLS0KIHRlc3RzL2ttc19mbGlwLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQogbW9kZSBjaGFuZ2UgMTAwNjQ0ID0+IDEwMDc1NSB0ZXN0cy9rbXNfZmxpcC5jCgpk
aWZmIC0tZ2l0IGEvdGVzdHMva21zX2ZsaXAuYyBiL3Rlc3RzL2ttc19mbGlwLmMKb2xkIG1vZGUg
MTAwNjQ0Cm5ldyBtb2RlIDEwMDc1NQppbmRleCBmMjgyNzJkZC4uM2MyOWY0N2EKLS0tIGEvdGVz
dHMva21zX2ZsaXAuYworKysgYi90ZXN0cy9rbXNfZmxpcC5jCkBAIC0xNTY3LDYgKzE1NjcsNyBA
QCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCiAJCXsgMTAsIFRFU1RfRFBNU19PRkYg
fCBURVNUX0RQTVMgfCBURVNUX1ZCTEFOS19SQUNFLCAiZHBtcy12cy12YmxhbmstcmFjZSIgfSwK
IAkJeyAxMCwgVEVTVF9NT0RFU0VUIHwgVEVTVF9WQkxBTktfUkFDRSwgIm1vZGVzZXQtdnMtdmJs
YW5rLXJhY2UiIH0sCiAJCXsgMCwgVEVTVF9CT19UT09CSUcgfCBURVNUX05PXzJYX09VVFBVVCwg
ImJvLXRvby1iaWciIH0sCisJCXsgMTAsIFRFU1RfRkxJUCB8IFRFU1RfU1VTUEVORCwgImZsaXAt
dnMtc3VzcGVuZCIgfSwKIAl9OwogCWludCBpOwogCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0Cmln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
