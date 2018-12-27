Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id E35556E738
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Dec 2018 14:58:30 +0000 (UTC)
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date: Thu, 27 Dec 2018 15:57:41 +0100
Message-Id: <20181227145741.28096-7-paul.kocialkowski@bootlin.com>
In-Reply-To: <20181227145741.28096-1-paul.kocialkowski@bootlin.com>
References: <20181227145741.28096-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 6/6] lib/igt_fb: Add a check on stride
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
Cc: Petri Latvala <petri.latvala@intel.com>, Eben Upton <eben@raspberrypi.org>
List-ID: <igt-dev@lists.freedesktop.org>

UGl4bWFuIHJlcXVpcmVzIGJ1ZmZlciBzdHJpZGVzIHRoZSBiZSBhbGlnbmVkIHRvIDMyLWJpdCB3
b3JkcyBpbiBvcmRlcgp0byBjcmVhdGUgaW50ZXJuYWwgcmVwcmVzZW50YXRpb25zIG9mIGJ1ZmZl
cnMuIElmIHRoaXMgY29uZGl0aW9uIGlzIG5vdAptZXQsIGl0IHdpbGwgZmFpbCBhbmQgSUdUIHdp
bGwgbm90IGJlIGFibGUgdG8gcmVwb3J0IHRoZSBlcnJvciBjYXVzZSwKbWFraW5nIGl0IGhhcmQg
dG8gZGVidWcgdGhlIGlzc3VlLgoKQWRkIGFuIGV4cGxpY2l0IGNoZWNrIGluIG91ciBjb2RlIHBy
aW9yIHRvIGNhbGxpbmcgcGl4bWFuIHdoZW4KY29udmVydGluZyBidWZmZXIgc28gdGhhdCB0aGUg
ZXJyb3IgY2FuIGJlIHVuZGVyc3Rvb2QgaWYgaXQgb2NjdXJzLgoKU2lnbmVkLW9mZi1ieTogUGF1
bCBLb2NpYWxrb3dza2kgPHBhdWwua29jaWFsa293c2tpQGJvb3RsaW4uY29tPgpSZXZpZXdlZC1i
eTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KLS0tCiBsaWIvaWd0
X2ZiLmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9saWIvaWd0X2ZiLmMgYi9saWIvaWd0X2ZiLmMKaW5kZXggMmY1NTVjOTU1YWNmLi44MjQ0
ZTUxNzZhNmYgMTAwNjQ0Ci0tLSBhL2xpYi9pZ3RfZmIuYworKysgYi9saWIvaWd0X2ZiLmMKQEAg
LTE5ODEsNiArMTk4MSwxMCBAQCBzdGF0aWMgdm9pZCBjb252ZXJ0X3BpeG1hbihzdHJ1Y3QgZmJf
Y29udmVydCAqY3Z0KQogCWlndF9hc3NlcnQoKHNyY19waXhtYW4gIT0gUElYTUFOX2ludmFsaWQp
ICYmCiAJCSAgIChkc3RfcGl4bWFuICE9IFBJWE1BTl9pbnZhbGlkKSk7CiAKKwkvKiBQaXhtYW4g
cmVxdWlyZXMgdGhlIHN0cmlkZSB0byBiZSBhbGlnbmVkIHRvIDMyIGJpdHMuICovCisJaWd0X2Fz
c2VydCgoY3Z0LT5zcmMuZmItPnN0cmlkZXNbMF0gJSBzaXplb2YodWludDMyX3QpKSA9PSAwKTsK
KwlpZ3RfYXNzZXJ0KChjdnQtPmRzdC5mYi0+c3RyaWRlc1swXSAlIHNpemVvZih1aW50MzJfdCkp
ID09IDApOworCiAJc3JjX3B0ciA9IGNvbnZlcnRfc3JjX2dldChjdnQpOwogCiAJc3JjX2ltYWdl
ID0gcGl4bWFuX2ltYWdlX2NyZWF0ZV9iaXRzKHNyY19waXhtYW4sCi0tIAoyLjIwLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGlu
ZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
