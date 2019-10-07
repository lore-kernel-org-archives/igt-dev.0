Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B87E86E19A
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Oct 2019 19:52:46 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id u12so508947pgb.11
 for <igt-dev@lists.freedesktop.org>; Mon, 07 Oct 2019 12:52:46 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Mon,  7 Oct 2019 22:52:34 +0300
Message-Id: <1570477954-3047-2-git-send-email-juhapekka.heikkila@gmail.com>
In-Reply-To: <1570477954-3047-1-git-send-email-juhapekka.heikkila@gmail.com>
References: <1570477954-3047-1-git-send-email-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/kms_rotation_crc: Check requested
 format/mod combo is supported
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

QXZvaWQgZmFpbGluZyB0ZXN0IGZvciB3cm9uZyByZWFzb25zLgoKU2lnbmVkLW9mZi1ieTogSnVo
YS1QZWtrYSBIZWlra2lsYSA8anVoYXBla2thLmhlaWtraWxhQGdtYWlsLmNvbT4KLS0tCiB0ZXN0
cy9rbXNfcm90YXRpb25fY3JjLmMgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19yb3RhdGlvbl9jcmMuYyBiL3Rlc3RzL2tt
c19yb3RhdGlvbl9jcmMuYwppbmRleCA2NjhjMTczLi5mZTYzMzExIDEwMDY0NAotLS0gYS90ZXN0
cy9rbXNfcm90YXRpb25fY3JjLmMKKysrIGIvdGVzdHMva21zX3JvdGF0aW9uX2NyYy5jCkBAIC0y
NTEsNiArMjUxLDEyIEBAIHN0YXRpYyB2b2lkIHByZXBhcmVfZmJzKGRhdGFfdCAqZGF0YSwgaWd0
X291dHB1dF90ICpvdXRwdXQsCiAJCWlndF9zd2FwKHcsIGgpOwogCX0KIAorCS8qIAorCSAqIEp1
c3QgdHJ5IGhlcmUgaWYgcmVxdWVzdGVkIHRpbGluZyBmb3JtYXQgaXMgZ2VuZXJhbGx5IGF2YWls
YWJsZSwKKwkgKiBpZiBvbmUgZm9ybWF0IGZhaWwgaXQgd2lsbCBza2lwIGVudGlyZSBzdWJ0ZXN0
LgorCSAqLworCWlndF9yZXF1aXJlKGlndF9kaXNwbGF5X2hhc19mb3JtYXRfbW9kKGRpc3BsYXks
IHBpeGVsX2Zvcm1hdCwgdGlsaW5nKSk7CisKIAkvKgogCSAqIENyZWF0ZSBhIHJlZmVyZW5jZSBz
b2Z0d2FyZSByb3RhdGVkIGZsaXAgZnJhbWVidWZmZXIuCiAJICovCi0tIAoyLjcuNAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5n
IGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
