Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id BE89F6E6EF
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Dec 2018 09:02:16 +0000 (UTC)
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date: Fri,  7 Dec 2018 10:01:46 +0100
Message-Id: <20181207090146.4686-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/igt_fb: Add a check on stride alignment
 for pixman conversion
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
Cc: Petri Latvala <petri.latvala@intel.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>

UGl4bWFuIHJlcXVpcmVzIGJ1ZmZlciBzdHJpZGVzIHRoZSBiZSBhbGlnbmVkIHRvIDMyLWJpdCB3
b3JkcyBpbiBvcmRlcgp0byBjcmVhdGUgaW50ZXJuYWwgcmVwcmVzZW50YXRpb25zIG9mIGJ1ZmZl
cnMuIElmIHRoaXMgY29uZGl0aW9uIGlzIG5vdAptZXQsIGl0IHdpbGwgZmFpbCBhbmQgSUdUIHdp
bGwgbm90IGJlIGFibGUgdG8gcmVwb3J0IHRoZSBlcnJvciBjYXVzZSwKbWFraW5nIGl0IGhhcmQg
dG8gZGVidWcgdGhlIGlzc3VlLgoKQWRkIGFuIGV4cGxpY2l0IGNoZWNrIGluIG91ciBjb2RlIHBy
aW9yIHRvIGNhbGxpbmcgcGl4bWFuIHdoZW4KY29udmVydGluZyBidWZmZXIgc28gdGhhdCB0aGUg
ZXJyb3IgY2FuIGJlIHVuZGVyc3Rvb2QgaWYgaXQgb2NjdXJzLgotLS0KIGxpYi9pZ3RfZmIuYyB8
IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2xp
Yi9pZ3RfZmIuYyBiL2xpYi9pZ3RfZmIuYwppbmRleCAyNDYyZDZiYS4uNTEzYTY2YjcgMTAwNjQ0
Ci0tLSBhL2xpYi9pZ3RfZmIuYworKysgYi9saWIvaWd0X2ZiLmMKQEAgLTE5MDEsNiArMTkwMSwx
MCBAQCBzdGF0aWMgdm9pZCBjb252ZXJ0X3BpeG1hbihzdHJ1Y3QgZmJfY29udmVydCAqY3Z0KQog
CWlndF9hc3NlcnQoKHNyY19waXhtYW4gIT0gUElYTUFOX2ludmFsaWQpICYmCiAJCSAgIChkc3Rf
cGl4bWFuICE9IFBJWE1BTl9pbnZhbGlkKSk7CiAKKwkvKiBQaXhtYW4gcmVxdWlyZXMgdGhlIHN0
cmlkZSB0byBiZSBhbGlnbmVkIHRvIDMyIGJpdHMuICovCisJaWd0X2Fzc2VydCgoY3Z0LT5zcmMu
ZmItPnN0cmlkZXNbMF0gJSBzaXplb2YodWludDMyX3QpKSA9PSAwKTsKKwlpZ3RfYXNzZXJ0KChj
dnQtPmRzdC5mYi0+c3RyaWRlc1swXSAlIHNpemVvZih1aW50MzJfdCkpID09IDApOworCiAJc3Jj
X3B0ciA9IGNvbnZlcnRfc3JjX2dldChjdnQpOwogCiAJc3JjX2ltYWdlID0gcGl4bWFuX2ltYWdl
X2NyZWF0ZV9iaXRzKHNyY19waXhtYW4sCi0tIAoyLjE5LjIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaWd0LWRldgo=
