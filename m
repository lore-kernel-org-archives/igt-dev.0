Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 30 May 2018 11:33:12 +0100
Message-Id: <20180530103314.30565-1-chris@chris-wilson.co.uk>
Subject: [Intel-gfx] [PATCH i-g-t 1/3] lib: Assert that we do manage to
 submit at least one batch when measuring
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

QXMgd2UgbWVhc3VyZSB0aGUgcmluZyBzaXplLCB3ZSBuZXZlciBleHBlY3QgdG8gZmluZCB3ZSBj
YW4gbm90IHN1Ym1pdApubyBiYXRjaGVzIGF0IGFsbC4gQXNzZXJ0IGFnYWluc3QgdGhlIHVuZXhw
ZWN0ZWQuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5j
by51az4KQ2M6IEFudG9uaW8gQXJnZW56aWFubyA8YW50b25pby5hcmdlbnppYW5vQGludGVsLmNv
bT4KLS0tCiBsaWIvaTkxNS9nZW1fcmluZy5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykKCmRpZmYgLS1naXQgYS9saWIvaTkxNS9nZW1fcmluZy5jIGIvbGliL2k5MTUvZ2Vt
X3JpbmcuYwppbmRleCAxMGQyZjJjZDQuLjdkNjQxNjVlYiAxMDA2NDQKLS0tIGEvbGliL2k5MTUv
Z2VtX3JpbmcuYworKysgYi9saWIvaTkxNS9nZW1fcmluZy5jCkBAIC0xMDAsNiArMTAwLDcgQEAg
X19nZW1fbWVhc3VyZV9yaW5nX2luZmxpZ2h0KGludCBmZCwgdW5zaWduZWQgaW50IGVuZ2luZSwg
ZW51bSBtZWFzdXJlX3JpbmdfZmxhZ3MKIAl9IHdoaWxlICgxKTsKIAogCWlndF9hc3NlcnRfZXEo
X19leGVjYnVmKGZkLCAmZXhlY2J1ZiksIC1FSU5UUik7CisJaWd0X2Fzc2VydChjb3VudCk7CiAK
IAltZW1zZXQoJml0diwgMCwgc2l6ZW9mKGl0dikpOwogCXNldGl0aW1lcihJVElNRVJfUkVBTCwg
Jml0diwgTlVMTCk7Ci0tIAoyLjE3LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2ludGVsLWdmeAo=
