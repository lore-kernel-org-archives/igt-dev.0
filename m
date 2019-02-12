Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 12 Feb 2019 10:16:01 +0000
Message-Id: <20190212101601.25562-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_mmap_gtt: Impose a timeout for
 "hang"
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Mika Kuoppala <mika.kuoppala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T25seSB3YWl0IGEgbWF4aW11bSBvZiAyIG1vcmUgc2Vjb25kcyBmb3IgdGhlIGhhbmcgY2hpbGRy
ZW4gdG8gY29tcGxldGUsCnRvIGNhdGNoIGRlYWRsb2NrcyBpbiBhIHRpbWVseSBmYXNoaW9uLgoK
U2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CkNj
OiBNaWthIEt1b3BwYWxhIDxtaWthLmt1b3BwYWxhQGludGVsLmNvbT4KLS0tCiB0ZXN0cy9pOTE1
L2dlbV9tbWFwX2d0dC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9nZW1fbW1hcF9ndHQuYyBiL3Rl
c3RzL2k5MTUvZ2VtX21tYXBfZ3R0LmMKaW5kZXggZjlkODExYWQ2Li5mNmZiYmUxOTMgMTAwNjQ0
Ci0tLSBhL3Rlc3RzL2k5MTUvZ2VtX21tYXBfZ3R0LmMKKysrIGIvdGVzdHMvaTkxNS9nZW1fbW1h
cF9ndHQuYwpAQCAtNDUwLDcgKzQ1MCw3IEBAIHRlc3RfaGFuZyhpbnQgZmQpCiAJaWd0X2luZm8o
IiVsdSByZXNldHNcbiIsIGNvdW50KTsKIAogCWNvbnRyb2wtPmRvbmUgPSB0cnVlOwotCWlndF93
YWl0Y2hpbGRyZW4oKTsKKwlpZ3Rfd2FpdGNoaWxkcmVuX3RpbWVvdXQoMiwgTlVMTCk7CiAKIAlp
Z3RfYXNzZXJ0KCFjb250cm9sLT5lcnJvcik7CiAJbXVubWFwKGNvbnRyb2wsIDQwOTYpOwotLSAK
Mi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
