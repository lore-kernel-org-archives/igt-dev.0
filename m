Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE7E88972D
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Jun 2019 08:42:42 +0000 (UTC)
From: Simon Ser <simon.ser@intel.com>
Date: Fri, 14 Jun 2019 11:42:56 +0300
Message-Id: <20190614084256.25900-1-simon.ser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_chamelium: reduce flatline test
 amplitude
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
Cc: martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

U2V0IGZsYXRsaW5lIHRlc3QgYW1wbGl0dWRlIHRvIDAuMSBpbnN0ZWFkIG9mIDAuOS4gVGhlcmUg
aGF2ZSBiZWVuIGNvbmNlcm5zCmFib3V0IGVkZ2UtY2FzZXMgd2hlcmUgYmFkIFRWIGhhcmR3YXJl
IGlzIGNvbm5lY3RlZCB2aWEgSERNSS9EUCBhbmQgYnJlYWtzIHdoZW4KYSBEQyBvZmZzZXQgaXMg
c2VudC4KClRoaXMgaXMgYSBmaXJzdCBtaXRpZ2F0aW9uLiBBIHNlY29uZCBtaXRpZ2F0aW9uIHRv
IG9ubHkgc2VuZCBhdWRpbyB0byB0aGUKQ2hhbWVsaXVtIGRldmljZSBpbnN0ZWFkIG9mIGFsbCBI
RE1JL0RQIHBvcnRzIGlzIHBsYW5uZWQsIGJ1dCByZXF1aXJlcyBjaGFuZ2VzCmluIEFMU0EgYW5k
L29yIERSTS4KClNpZ25lZC1vZmYtYnk6IFNpbW9uIFNlciA8c2ltb24uc2VyQGludGVsLmNvbT4K
LS0tCiB0ZXN0cy9rbXNfY2hhbWVsaXVtLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9rbXNfY2hhbWVsaXVt
LmMgYi90ZXN0cy9rbXNfY2hhbWVsaXVtLmMKaW5kZXggMzZlOTJlOTc1ZDY0Li4wYmZiMDgzOGQw
MTMgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19jaGFtZWxpdW0uYworKysgYi90ZXN0cy9rbXNfY2hh
bWVsaXVtLmMKQEAgLTc3NSw3ICs3NzUsNyBAQCB0ZXN0X2Rpc3BsYXlfZnJhbWVfZHVtcChkYXRh
X3QgKmRhdGEsIHN0cnVjdCBjaGFtZWxpdW1fcG9ydCAqcG9ydCkKIC8qIEEgc3RyZWFrIG9mIDMg
Z2l2ZXMgY29uZmlkZW5jZSB0aGF0IHRoZSBzaWduYWwgaXMgZ29vZC4gKi8KICNkZWZpbmUgTUlO
X1NUUkVBSyAzCgotI2RlZmluZSBGTEFUTElORV9BTVBMSVRVREUgMC45IC8qIG5vcm1hbGl6ZWQs
IGllLiBpbiBbMCwgMV0gKi8KKyNkZWZpbmUgRkxBVExJTkVfQU1QTElUVURFIDAuMSAvKiBub3Jt
YWxpemVkLCBpZS4gaW4gWzAsIDFdICovCiAjZGVmaW5lIEZMQVRMSU5FX0FNUExJVFVERV9BQ0NV
UkFDWSAwLjAwMSAvKiDCsSAwLjEgJSBvZiB0aGUgZnVsbCBhbXBsaXR1ZGUgKi8KICNkZWZpbmUg
RkxBVExJTkVfQUxJR05fQUNDVVJBQ1kgMCAvKiBudW1iZXIgb2Ygc2FtcGxlcyAqLwoKLS0KMi4y
Mi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3Qt
ZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
