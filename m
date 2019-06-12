Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 532A1894E0
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jun 2019 12:52:26 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Wed, 12 Jun 2019 15:52:22 +0300
Message-Id: <20190612125222.8447-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/igt_aux/hang_detector: Don't enable
 reset if it's explicitly disabled
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

V2UgZG9uJ3QgZXhwZWN0IHRvIGhhbmcgZHVyaW5nIHRoZSB0ZXN0cyB1c2luZyBoYW5nX2RldGVj
dG9yLCBhbmQgdGhlCm9ubHkgZGlmZmVyZW5jZSBpcyBtb3JlIHNldmVyZSBmYWxsb3V0IGluIGNh
c2UgYSBoYW5nIGFjdHVhbGx5IGhhcHBlbnMKYW5kIGZld2VyIHN1cnByaXNlZCBwZW9wbGUgc2Vl
aW5nIHJlc2V0IG15c3RlcmlvdXNseSBlbmFibGVkIGEgY291cGxlIG9mCnRlc3RzIGRvd24gdGhl
IGxpbmUuCgpDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CkNjOiBQ
ZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogQXJr
YWRpdXN6IEhpbGVyIDxhcmthZGl1c3ouaGlsZXJAaW50ZWwuY29tPgotLS0KIGxpYi9pZ3RfYXV4
LmMgfCA1ICsrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3RfYXV4LmMgYi9saWIvaWd0X2F1eC5jCmluZGV4IDU3
OGY4NTc5Li5hZjIxZmRhYyAxMDA2NDQKLS0tIGEvbGliL2lndF9hdXguYworKysgYi9saWIvaWd0
X2F1eC5jCkBAIC01MTQsOCArNTE0LDkgQEAgdm9pZCBpZ3RfZm9ya19oYW5nX2RldGVjdG9yKGlu
dCBmZCkKIAkgKiB0aGV5IGFyZSBhIHRlc3QgZmFpbHVyZSEpIGFuZCBzbyB0aGUgbG9zcyBvZiBw
ZXItZW5naW5lIHJlc2V0CiAJICogZnVuY3Rpb25hbGl0eSBpcyBub3QgYW4gaXNzdWUuCiAJICov
Ci0JaWd0X2Fzc2VydChpZ3Rfc3lzZnNfc2V0X3BhcmFtZXRlcgotCQkgICAoZmQsICJyZXNldCIs
ICIlZCIsIDEgLyogb25seSBnbG9iYWwgcmVzZXQgKi8pKTsKKwlpZiAoaWd0X3N5c2ZzX2dldF91
MzIoZmQsICJyZXNldCIpICE9IDApIC8qIGlmIHJlc2V0IGlzIG5vdCBleHBsaWNpdGx5IGRpc2Fi
bGVkICovCisJCWlndF9hc3NlcnQoaWd0X3N5c2ZzX3NldF9wYXJhbWV0ZXIKKwkJCSAgIChmZCwg
InJlc2V0IiwgIiVkIiwgMSAvKiBvbmx5IGdsb2JhbCByZXNldCAqLykpOwogCiAJc2lnbmFsKFNJ
R0lPLCBzaWdfYWJvcnQpOwogCWlndF9mb3JrX2hlbHBlcigmaGFuZ19kZXRlY3RvcikKLS0gCjIu
MjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0
LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
