Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E036E4CF
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Aug 2019 14:02:50 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Thu,  8 Aug 2019 17:02:05 +0300
Message-Id: <20190808140205.16658-1-imre.deak@intel.com>
Subject: [igt-dev] [PATCH i-g-t] tests/kms_properties: Fix upper bound of
 'max bpc' range
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

VGhlIGF2YWlsYWJsZSByYW5nZSByZXBvcnRlZCBieSB0aGUgZHJpdmVyIGlzIHRoZSBpbmNsdXNp
dmUgW21pbl9icGMsCm1heF9icGNdLCBzbyBmaXggdGhlIHVwcGVyIGJvdW5kIHVzZWQgYnkgdGhl
IHRlc3QgYWNjb3JkaW5nbHkuIFRoaXMKaXNzdWUgaGFkIHRoZSBzaWRlLWVmZmVjdCAob24gSUNM
IGZvciBpbnN0YW5jZSkgb2YgbGltaXRpbmcgJ21heCBicGMnIHRvCjEwIChpbnN0ZWFkIG9mIHJl
c3RvcmluZyBpdCB0byB0aGUgZGVmYXVsdCAxMikgZm9yIGFsbCB0aGUgdGVzdHMKZm9sbG93aW5n
IGttc19wcm9wZXJ0aWVzLCBhcyBzZWVuIGZyb20gdGhlIGxvZ3MgaW4gdGhlIHJlZmVyZW5jZWQg
YnVnCmJlbG93LgoKUmVmZXJlbmNlOiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3df
YnVnLmNnaT9pZD0xMDk1OTMKQ2M6IFJhZGhha3Jpc2huYSBTcmlwYWRhIDxyYWRoYWtyaXNobmEu
c3JpcGFkYUBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEltcmUgRGVhayA8aW1yZS5kZWFrQGlu
dGVsLmNvbT4KLS0tCiB0ZXN0cy9rbXNfcHJvcGVydGllcy5jIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMva21z
X3Byb3BlcnRpZXMuYyBiL3Rlc3RzL2ttc19wcm9wZXJ0aWVzLmMKaW5kZXggZWI5Y2JkZGEuLjE4
Y2Y5NmUwIDEwMDY0NAotLS0gYS90ZXN0cy9rbXNfcHJvcGVydGllcy5jCisrKyBiL3Rlc3RzL2tt
c19wcm9wZXJ0aWVzLmMKQEAgLTkxLDcgKzkxLDcgQEAgc3RhdGljIHZvaWQgbWF4X2JwY19wcm9w
X3Rlc3QoaW50IGZkLCB1aW50MzJfdCBpZCwgdWludDMyX3QgdHlwZSwgZHJtTW9kZVByb3BlcnQK
IAlpZiAoYXRvbWljKQogCQlyZXEgPSBkcm1Nb2RlQXRvbWljQWxsb2MoKTsKIAotCWZvciAoIGkg
PSBwcm9wLT52YWx1ZXNbMF07IGkgPCBwcm9wLT52YWx1ZXNbMV0gOyBpKyspIHsKKwlmb3IgKGkg
PSBwcm9wLT52YWx1ZXNbMF07IGkgPD0gcHJvcC0+dmFsdWVzWzFdOyBpKyspIHsKIAkJaWYgKCFh
dG9taWMpIHsKIAkJCXJldCA9IGRybU1vZGVPYmplY3RTZXRQcm9wZXJ0eShmZCwgaWQsIHR5cGUs
IHByb3BfaWQsIGkpOwogCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaWd0LWRldg==
