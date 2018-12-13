Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 53FD66EE2A
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Dec 2018 13:11:23 +0000 (UTC)
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date: Thu, 13 Dec 2018 14:11:11 +0100
Message-Id: <20181213131111.25821-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2] lib/igt_fb: Add a check on stride
 alignment for pixman conversion
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
ZXJyb3IgY2FuIGJlIHVuZGVyc3Rvb2QgaWYgaXQgb2NjdXJzLgoKU2lnbmVkLW9mZi1ieTogUGF1
bCBLb2NpYWxrb3dza2kgPHBhdWwua29jaWFsa293c2tpQGJvb3RsaW4uY29tPgpSZXZpZXdlZC1i
eTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KLS0tCgpDaGFuZ2Vz
IHNpbmNlIHYxOgoqIEFkZGVkIG1pc3NpbmcgU2lnbmVkLU9mZi1CeTsKKiBBZGRlZCBNYXhpbWUn
cyBSZXZpZXdlZC1CeS4KCiBsaWIvaWd0X2ZiLmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9saWIvaWd0X2ZiLmMgYi9saWIvaWd0X2ZiLmMK
aW5kZXggMjQ2MmQ2YmE2ZmFiLi41MTNhNjZiNzA5OGUgMTAwNjQ0Ci0tLSBhL2xpYi9pZ3RfZmIu
YworKysgYi9saWIvaWd0X2ZiLmMKQEAgLTE5MDEsNiArMTkwMSwxMCBAQCBzdGF0aWMgdm9pZCBj
b252ZXJ0X3BpeG1hbihzdHJ1Y3QgZmJfY29udmVydCAqY3Z0KQogCWlndF9hc3NlcnQoKHNyY19w
aXhtYW4gIT0gUElYTUFOX2ludmFsaWQpICYmCiAJCSAgIChkc3RfcGl4bWFuICE9IFBJWE1BTl9p
bnZhbGlkKSk7CiAKKwkvKiBQaXhtYW4gcmVxdWlyZXMgdGhlIHN0cmlkZSB0byBiZSBhbGlnbmVk
IHRvIDMyIGJpdHMuICovCisJaWd0X2Fzc2VydCgoY3Z0LT5zcmMuZmItPnN0cmlkZXNbMF0gJSBz
aXplb2YodWludDMyX3QpKSA9PSAwKTsKKwlpZ3RfYXNzZXJ0KChjdnQtPmRzdC5mYi0+c3RyaWRl
c1swXSAlIHNpemVvZih1aW50MzJfdCkpID09IDApOworCiAJc3JjX3B0ciA9IGNvbnZlcnRfc3Jj
X2dldChjdnQpOwogCiAJc3JjX2ltYWdlID0gcGl4bWFuX2ltYWdlX2NyZWF0ZV9iaXRzKHNyY19w
aXhtYW4sCi0tIAoyLjE5LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRl
dgo=
