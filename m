Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8701F6E027
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Jan 2019 14:59:04 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Fri, 25 Jan 2019 15:58:34 +0100
Message-Id: <20190125145842.15738-6-maxime.ripard@bootlin.com>
In-Reply-To: <20190125145842.15738-1-maxime.ripard@bootlin.com>
References: <20190125145842.15738-1-maxime.ripard@bootlin.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v5 05/13] igt: fb: Refactor dumb buffer
 allocation path
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
Cc: Petri Latvala <petri.latvala@intel.com>, eben@raspberrypi.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>

VGhlIGVsc2UgY29uZGl0aW9uIGlzIG5vdCBuZWVkZWQsIHNpbmNlIGFsbCB0aGUgb3RoZXIgY29u
ZGl0aW9ucyByZXR1cm4Kd2hlbiB0aGV5IGFyZSBkb25lLgoKTW92ZSB0aGUgS01TIGR1bWIgYnVm
ZmVyIGFsbG9jYXRpb24gb3V0c2lkZSBvZiB0aGUgb3V0ZXIgZWxzZSBjb25kaXRpb24sCnRoaXMg
d2lsbCBhbHNvIGFsbG93IHRvIGVhc2UgbGF0ZXIgY2hhbmdlcy4KClJldmlld2VkLWJ5OiBQYXVs
IEtvY2lhbGtvd3NraSA8cGF1bC5rb2NpYWxrb3dza2lAYm9vdGxpbi5jb20+ClNpZ25lZC1vZmYt
Ynk6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+Ci0tLQogbGliL2ln
dF9mYi5jIHwgMjUgKysrKysrKysrKysrKysrKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE3
IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbGliL2lndF9mYi5j
IGIvbGliL2lndF9mYi5jCmluZGV4IGQ2OWMzZmIyZDM4ZC4uMjcwZGI4ZDZkYzkwIDEwMDY0NAot
LS0gYS9saWIvaWd0X2ZiLmMKKysrIGIvbGliL2lndF9mYi5jCkBAIC01NTcsMTUgKzU1NywyNCBA
QCBzdGF0aWMgaW50IGNyZWF0ZV9ib19mb3JfZmIoc3RydWN0IGlndF9mYiAqZmIpCiAJCQlpZ3Rf
cmVxdWlyZShkcml2ZXJfaGFzX2dlbV9hcGkpOwogCQkJcmV0dXJuIC1FSU5WQUw7CiAJCX0KLQl9
IGVsc2UgewotCQlmYi0+aXNfZHVtYiA9IHRydWU7Ci0KLQkJZmItPmdlbV9oYW5kbGUgPSBrbXN0
ZXN0X2R1bWJfY3JlYXRlKGZkLCBmYi0+d2lkdGgsIGZiLT5oZWlnaHQsCi0JCQkJCQkgICAgIGZi
LT5wbGFuZV9icHBbMF0sCi0JCQkJCQkgICAgICZmYi0+c3RyaWRlc1swXSwgJmZiLT5zaXplKTsK
LQotCQlyZXR1cm4gZmItPmdlbV9oYW5kbGU7CiAJfQorCisJLyoKKwkgKiBUaGUgY3VycmVudCBk
dW1iIGJ1ZmZlciBhbGxvY2F0aW9uIEFQSSBkb2Vzbid0IHJlYWxseSBhbGxvdyB0bworCSAqIHNw
ZWNpZnkgYSBjdXN0b20gc2l6ZSBvciBzdHJpZGUuIFlldCB0aGUgY2FsbGVyIGlzIGZyZWUgdG8g
c3BlY2lmeQorCSAqIHRoZW0sIHNvIHdlIG5lZWQgdG8gbWFrZSBzdXJlIHRvIGVycm9yIG91dCBp
biB0aGlzIGNhc2UuCisJICovCisJaWd0X2Fzc2VydChmYi0+c2l6ZSA9PSAwKTsKKwlpZ3RfYXNz
ZXJ0KGZiLT5zdHJpZGVzWzBdID09IDApOworCisJZmItPnNpemUgPSBjYWxjX2ZiX3NpemUoZmIp
OworCisJZmItPmlzX2R1bWIgPSB0cnVlOworCWZiLT5nZW1faGFuZGxlID0ga21zdGVzdF9kdW1i
X2NyZWF0ZShmZCwgZmItPndpZHRoLCBmYi0+aGVpZ2h0LAorCQkJCQkgICAgIGZiLT5wbGFuZV9i
cHBbMF0sCisJCQkJCSAgICAgJmZiLT5zdHJpZGVzWzBdLCAmZmItPnNpemUpOworCisJcmV0dXJu
IGZiLT5nZW1faGFuZGxlOwogfQogCiAvKioKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
