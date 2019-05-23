Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97A0E89DA2
 for <igt-dev@lists.freedesktop.org>; Thu, 23 May 2019 10:56:47 +0000 (UTC)
From: Simon Ser <simon.ser@intel.com>
Date: Thu, 23 May 2019 13:56:32 +0300
Message-Id: <20190523105632.29397-2-simon.ser@intel.com>
In-Reply-To: <20190523105632.29397-1-simon.ser@intel.com>
References: <20190523105632.29397-1-simon.ser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] lib/igt_audio: use calloc instead of
 malloc + memset
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

VGhpcyBpcyBsZXNzIGVycm9yLXByb25lLgoKU2lnbmVkLW9mZi1ieTogU2ltb24gU2VyIDxzaW1v
bi5zZXJAaW50ZWwuY29tPgotLS0KIGxpYi9pZ3RfYXVkaW8uYyB8IDUgKy0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9saWIv
aWd0X2F1ZGlvLmMgYi9saWIvaWd0X2F1ZGlvLmMKaW5kZXggMTY3N2RkMDljMDI5Li5hMjUyODhj
ODE4MTkgMTAwNjQ0Ci0tLSBhL2xpYi9pZ3RfYXVkaW8uYworKysgYi9saWIvaWd0X2F1ZGlvLmMK
QEAgLTgzLDEyICs4Myw5IEBAIHN0cnVjdCBhdWRpb19zaWduYWwgKmF1ZGlvX3NpZ25hbF9pbml0
KGludCBjaGFubmVscywgaW50IHNhbXBsaW5nX3JhdGUpCiAJaWd0X2Fzc2VydChjaGFubmVscyA+
IDApOwogCWlndF9hc3NlcnQoY2hhbm5lbHMgPD0gQ0hBTk5FTFNfTUFYKTsKIAotCXNpZ25hbCA9
IG1hbGxvYyhzaXplb2Yoc3RydWN0IGF1ZGlvX3NpZ25hbCkpOwotCW1lbXNldChzaWduYWwsIDAs
IHNpemVvZihzdHJ1Y3QgYXVkaW9fc2lnbmFsKSk7Ci0KKwlzaWduYWwgPSBjYWxsb2MoMSwgc2l6
ZW9mKHN0cnVjdCBhdWRpb19zaWduYWwpKTsKIAlzaWduYWwtPnNhbXBsaW5nX3JhdGUgPSBzYW1w
bGluZ19yYXRlOwogCXNpZ25hbC0+Y2hhbm5lbHMgPSBjaGFubmVsczsKLQogCXJldHVybiBzaWdu
YWw7CiB9CiAKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3Qt
ZGV2
