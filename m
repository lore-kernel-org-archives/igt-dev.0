Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 507CA6E0A6
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Oct 2018 14:05:07 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Mon,  8 Oct 2018 17:04:26 +0300
Message-Id: <20181008140433.32399-9-arkadiusz.hiler@intel.com>
In-Reply-To: <20181008140433.32399-1-arkadiusz.hiler@intel.com>
References: <20181008140433.32399-1-arkadiusz.hiler@intel.com>
Subject: [igt-dev] [CI 09/16] tests: kms_plane: Disable XBGR8888
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

RnJvbTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KCkZvciBzb21l
IHJlYXNvbiwgdGhlIFhCR1I4ODg4IENSQyBjaGVjayB3aWxsIGZhaWwgaW4gdGhlIGttc19wbGFu
ZSB0ZXN0cy4KU2luY2UgdGhhdCBmb3JtYXQgd2lsbCBiZSBlbmFibGVkIGFuZCBjaGVja2VkIGJ5
IHRoYXQgdGVzdCBpbiB0aGUgbmV4dApjb21taXQsIG1ha2Ugc3VyZSB3ZSBkb24ndCBpbnRyb2R1
Y2UgYSByZWdyZXNzaW9uIGZvciBubyBwYXJ0aWN1bGFyIHJlYXNvbi4KClNpZ25lZC1vZmYtYnk6
IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+ClJldmlld2VkLWJ5OiBB
cmthZGl1c3ogSGlsZXIgPGFya2FkaXVzei5oaWxlckBpbnRlbC5jb20+CkFja2VkLWJ5OiBNYXJ0
aW4gUGVyZXMgPG1hcnRpbi5wZXJlc0BsaW51eC5pbnRlbC5jb20+Ci0tLQogdGVzdHMva21zX3Bs
YW5lLmMgfCAxMCArKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19wbGFuZS5jIGIvdGVzdHMva21zX3BsYW5lLmMKaW5kZXgg
NWEwYmMwNWIuLjQ1ZTBhMzA0IDEwMDY0NAotLS0gYS90ZXN0cy9rbXNfcGxhbmUuYworKysgYi90
ZXN0cy9rbXNfcGxhbmUuYwpAQCAtNDg5LDYgKzQ4OSwxNiBAQCBzdGF0aWMgdm9pZCB0ZXN0X2Zv
cm1hdF9wbGFuZShkYXRhX3QgKmRhdGEsIGVudW0gcGlwZSBwaXBlLAogCQlpZiAoIWlndF9mYl9z
dXBwb3J0ZWRfZm9ybWF0KGZvcm1hdCkpCiAJCQljb250aW51ZTsKIAorCQkvKgorCQkgKiBUaGVy
ZSBzZWVtcyB0byBiZSBzb21lIGlzc3VlIHRoZXJlIHdpdGggdGhlIENSQyBub3QKKwkJICogbWF0
Y2hpbmcuIEJvdGggQ1JDcyBhcmUgc3RhYmxlLCBidXQgZG9uJ3QgbWF0Y2gsCisJCSAqIHdoaWNo
IHNlZW1zIHRvIGluZGljYXRlIHNvbWUgaXNzdWUgd2l0aCB0aGUgQ1JDCisJCSAqIGNvbXB1dGF0
aW9uIGxvZ2ljLCBidXQgSSBoYXZlbid0IGJlZW4gYWJsZSB0byBmaW5kCisJCSAqIHdoYXQuCisJ
CSAqLworCQlpZiAoZm9ybWF0ID09IERSTV9GT1JNQVRfWEJHUjg4ODgpCisJCQljb250aW51ZTsK
KwogCQlpZ3RfaW5mbygiVGVzdGluZyBmb3JtYXQgIiBJR1RfRk9STUFUX0ZNVCAiIG9uICVzLiV1
XG4iLAogCQkJIElHVF9GT1JNQVRfQVJHUyhmb3JtYXQpLAogCQkJIGttc3Rlc3RfcGlwZV9uYW1l
KHBpcGUpLCBwbGFuZS0+aW5kZXgpOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2lndC1kZXYK
