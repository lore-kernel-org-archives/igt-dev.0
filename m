Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 30 May 2018 11:33:13 +0100
Message-Id: <20180530103314.30565-2-chris@chris-wilson.co.uk>
In-Reply-To: <20180530103314.30565-1-chris@chris-wilson.co.uk>
References: <20180530103314.30565-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] [PATCH i-g-t 2/3] lib: Align ring measurement to timer
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

QWZ0ZXIgaGl0dGluZyB0aGUgU0lHSU5UIGZyb20gZXhlY2J1Ziwgd2FpdCB1bnRpbCB0aGUgbmV4
dCB0aW1lciBzaWduYWwKYmVmb3JlIHRyeWluZyBhZ2Fpbi4gVGhpcyBhbGlnbnMgdGhlIHN0YXJ0
IG9mIHRoZSBpb2N0bCB0byB0aGUgdGltZXIsCmhvcGVmdWxseSBtYXhpbWlzaW5nIHRoZSBhbW91
bnQgb2YgdGltZSB3ZSBoYXZlIGZvciBwcm9jZXNzaW5nIGJlZm9yZQp0aGUgbmV4dCBzaWduYWwg
LS0gdHJ5aW5nIHRvIHByZXZlbnQgdGhlIGNhc2Ugd2hlcmUgd2UgYXJlIHNjaGVkdWxlZCBvdXQK
aW4gdGhlIG1pZGRsZSBvZiBwcm9jZXNzaW5nIGFuZCBzbyBoaXQgdGhlIHRpbWVyIHNpZ25hbCB0
b28gZWFybHkuCgpSZWZlcmVuY2VzOiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3df
YnVnLmNnaT9pZD0xMDY2OTUKU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJp
cy13aWxzb24uY28udWs+Ci0tLQogbGliL2k5MTUvZ2VtX3JpbmcuYyB8IDIgKysKIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9saWIvaTkxNS9nZW1fcmluZy5j
IGIvbGliL2k5MTUvZ2VtX3JpbmcuYwppbmRleCA3ZDY0MTY1ZWIuLjBjMDYxMDAwYyAxMDA2NDQK
LS0tIGEvbGliL2k5MTUvZ2VtX3JpbmcuYworKysgYi9saWIvaTkxNS9nZW1fcmluZy5jCkBAIC05
Niw2ICs5Niw4IEBAIF9fZ2VtX21lYXN1cmVfcmluZ19pbmZsaWdodChpbnQgZmQsIHVuc2lnbmVk
IGludCBlbmdpbmUsIGVudW0gbWVhc3VyZV9yaW5nX2ZsYWdzCiAJCWlmIChsYXN0ID09IGNvdW50
KQogCQkJYnJlYWs7CiAKKwkJLyogc2xlZXAgdW50aWwgdGhlIG5leHQgdGltZXIgaW50ZXJydXB0
ICh3b2tlbiBvbiBzaWduYWwpICovCisJCXBhdXNlKCk7CiAJCWxhc3QgPSBjb3VudDsKIAl9IHdo
aWxlICgxKTsKIAotLSAKMi4xNy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ln
dC1kZXYK
