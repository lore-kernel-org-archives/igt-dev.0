Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A1046E3CB
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Mar 2019 15:46:17 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Fri,  8 Mar 2019 15:46:09 +0000
Message-Id: <20190308154609.19242-4-lionel.g.landwerlin@intel.com>
In-Reply-To: <20190308154609.19242-1-lionel.g.landwerlin@intel.com>
References: <20190308154609.19242-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/3] lib/syncobj: fix timeout check
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

VGhlIHZhbHVlIHJldHVybiBieSBfX3N5bmNvYmpfd2FpdCBpcyBhIG5lZ2F0ZWQgZXJyb3IgY29k
ZS4KClNpZ25lZC1vZmYtYnk6IExpb25lbCBMYW5kd2VybGluIDxsaW9uZWwuZy5sYW5kd2VybGlu
QGludGVsLmNvbT4KLS0tCiBsaWIvaWd0X3N5bmNvYmouYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3Rfc3lu
Y29iai5jIGIvbGliL2lndF9zeW5jb2JqLmMKaW5kZXggYTc3MDgzMDIuLmY2NTliYzI0IDEwMDY0
NAotLS0gYS9saWIvaWd0X3N5bmNvYmouYworKysgYi9saWIvaWd0X3N5bmNvYmouYwpAQCAtMjIz
LDcgKzIyMyw3IEBAIHN5bmNvYmpfd2FpdChpbnQgZmQsIHVpbnQzMl90ICpoYW5kbGVzLCB1aW50
MzJfdCBjb3VudCwKIAl3YWl0LnBhZCA9IDA7CiAKIAlyZXQgPSBfX3N5bmNvYmpfd2FpdChmZCwg
JndhaXQpOwotCWlmIChyZXQgPT0gRVRJTUUpCisJaWYgKHJldCA9PSAtRVRJTUUpCiAJCXJldHVy
biBmYWxzZTsKIAogCWlndF9hc3NlcnRfZXEocmV0LCAwKTsKLS0gCjIuMjAuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxp
c3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
