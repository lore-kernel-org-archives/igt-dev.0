Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 14 Sep 2018 21:13:09 +0100
Message-Id: <20180914201310.19527-4-chris@chris-wilson.co.uk>
In-Reply-To: <20180914201310.19527-1-chris@chris-wilson.co.uk>
References: <20180914201310.19527-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/5] lib/kms: Skip no-op display updates
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
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

SWYgdGhlIGRpc3BsYXkgaXMgZGlzYWJsZWQgKGUuZy4gdGhlIGRyaXZlciBoYXMgZGlzYWJsZWQg
dGhlIEtNUwppbnRlcmZhY2UpIHRoZXJlIGlzIG5vdGhpbmcgdG8gZG8gc28gYXZvaWQgZmFpbGlu
Zy4KClNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVr
PgotLS0KIGxpYi9pZ3Rfa21zLmMgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3Rfa21zLmMgYi9saWIvaWd0X2ttcy5jCmluZGV4
IDk3MTBiY2FlMS4uZGVkYzgxMzQ0IDEwMDY0NAotLS0gYS9saWIvaWd0X2ttcy5jCisrKyBiL2xp
Yi9pZ3Rfa21zLmMKQEAgLTMyNzEsNiArMzI3MSw5IEBAIHN0YXRpYyBpbnQgZG9fZGlzcGxheV9j
b21taXQoaWd0X2Rpc3BsYXlfdCAqZGlzcGxheSwKIAllbnVtIHBpcGUgcGlwZTsKIAlMT0dfSU5E
RU5UKGRpc3BsYXksICJjb21taXQiKTsKIAorCWlmICghZGlzcGxheS0+bl9waXBlcyB8fCAhZGlz
cGxheS0+bl9vdXRwdXRzKQorCQlyZXR1cm4gMDsgLyogbm90aGluZyB0byBkbyAqLworCiAJaWd0
X2Rpc3BsYXlfcmVmcmVzaChkaXNwbGF5KTsKIAogCWlmIChzID09IENPTU1JVF9BVE9NSUMpIHsK
QEAgLTMzMjEsNiArMzMyNCw5IEBAIGludCBpZ3RfZGlzcGxheV90cnlfY29tbWl0X2F0b21pYyhp
Z3RfZGlzcGxheV90ICpkaXNwbGF5LCB1aW50MzJfdCBmbGFncywgdm9pZCAqCiB7CiAJaW50IHJl
dDsKIAorCWlmICghZGlzcGxheS0+bl9waXBlcyB8fCAhZGlzcGxheS0+bl9vdXRwdXRzKQorCQly
ZXR1cm4gMDsgLyogbm90aGluZyB0byBkbyAqLworCiAJTE9HX0lOREVOVChkaXNwbGF5LCAiY29t
bWl0Iik7CiAKIAlpZ3RfZGlzcGxheV9yZWZyZXNoKGRpc3BsYXkpOwotLSAKMi4xOS4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxp
bmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
