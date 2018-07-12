Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 12 Jul 2018 16:37:09 +0100
Message-Id: <20180712153709.10125-2-chris@chris-wilson.co.uk>
In-Reply-To: <20180712153709.10125-1-chris@chris-wilson.co.uk>
References: <20180712153709.10125-1-chris@chris-wilson.co.uk>
Subject: [Intel-gfx] [PATCH i-g-t 2/2] lib/gt: Check GEM is operation before
 injecting a hang
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

VG8gaW5qZWN0IGEgaGFuZywgd2UgZXhlY3V0ZSBhIHNwaW5uaW5nIGJhdGNoLiBUaGlzIG1lYW5z
IHdlIHJlcXVpcmUgR0VNCnRvIGJlIG9wZXJhdGlvbiBiZWZvcmUgdGhlIGhhbmcsIHNvIGNoZWNr
LgoKU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+
Ci0tLQogbGliL2lndF9ndC5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykK
CmRpZmYgLS1naXQgYS9saWIvaWd0X2d0LmMgYi9saWIvaWd0X2d0LmMKaW5kZXggODliMzE4YWU2
Li44NmM2ZTE5NzIgMTAwNjQ0Ci0tLSBhL2xpYi9pZ3RfZ3QuYworKysgYi9saWIvaWd0X2d0LmMK
QEAgLTExOCw2ICsxMTgsNyBAQCB2b2lkIGlndF9yZXF1aXJlX2hhbmdfcmluZyhpbnQgZmQsIGlu
dCByaW5nKQogCWlmICghaWd0X2NoZWNrX2Jvb2xlYW5fZW52X3ZhcigiSUdUX0hBTkciLCB0cnVl
KSkKIAkJaWd0X3NraXAoImhhbmcgaW5qZWN0aW9uIGRpc2FibGVkIGJ5IHVzZXIiKTsKIAorCWln
dF9yZXF1aXJlX2dlbShmZCk7CiAJZ2VtX3JlcXVpcmVfcmluZyhmZCwgcmluZyk7CiAJZ2VtX2Nv
bnRleHRfcmVxdWlyZV9iYW5uYWJsZShmZCk7CiAJaWYgKCFpZ3RfY2hlY2tfYm9vbGVhbl9lbnZf
dmFyKCJJR1RfSEFOR19XSVRIT1VUX1JFU0VUIiwgZmFsc2UpKQotLSAKMi4xOC4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1nZnggbWFpbGlu
ZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
