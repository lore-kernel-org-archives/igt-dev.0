Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 049106E82F
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jul 2019 20:36:13 +0000 (UTC)
From: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Thu, 25 Jul 2019 13:33:51 -0700
Message-Id: <20190725203354.6757-2-lucas.demarchi@intel.com>
In-Reply-To: <20190725203354.6757-1-lucas.demarchi@intel.com>
References: <20190725203354.6757-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 2/5] i915/gem_mocs_settings: do not set undefined
 entries to PTE
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

SW4gdGhlIEljZSBMYWtlIHRhYmxlIHdlIGFyZSBzZXR0aW5nIGFsbCB1bmRlZmluZWQgZW50cmll
cyB0byBQVEUuCldpdGggVGlnZXIgTGFrZSB0aGlzIHdvbid0IGJlIHRydWUgYW55bW9yZS4gRXZl
biBpZiBmb3IgdGVzdCBpbiBJR1Qgd2UKYWRkIGEgbmV3IHRhYmxlIGZvciBUaWdlciBMYWtlLCBp
biBrZXJuZWwgdGhleSBjYW4gYmUgc2hhcmVzIHNpbmNlIHRoZXkKYXJlIHN1cHBvc2VkbHkgY29t
cGF0aWJsZSAob25seSB1bnVzZWQgZW50cmllcyB3ZXJlIGFkZGVkIG9yIGJlY2FtZQp1bnVzZWQp
LgoKU2lnbmVkLW9mZi1ieTogTHVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5j
b20+Ci0tLQogdGVzdHMvaTkxNS9nZW1fbW9jc19zZXR0aW5ncy5jIHwgMSAtCiAxIGZpbGUgY2hh
bmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUvZ2VtX21vY3Nfc2V0
dGluZ3MuYyBiL3Rlc3RzL2k5MTUvZ2VtX21vY3Nfc2V0dGluZ3MuYwppbmRleCA3YjE3MThmNC4u
OWY0ZTFiNmQgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2k5MTUvZ2VtX21vY3Nfc2V0dGluZ3MuYworKysg
Yi90ZXN0cy9pOTE1L2dlbV9tb2NzX3NldHRpbmdzLmMKQEAgLTEwMSw3ICsxMDEsNiBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IG1vY3NfZW50cnkgaWNlbGFrZV9tb2NzX3RhYmxlW0dFTjExX05VTV9N
T0NTX0VOVFJJRVNdID0gewogCVsyMV0gPSB7IDB4MDAwMDAxMzcsIDB4MDAzMCwgMHgxfSwKIAlb
MjJdID0geyAweDAwMDAwM2I3LCAweDAwMzAsIDB4MX0sCiAJWzIzXSA9IHsgMHgwMDAwMDdiNywg
MHgwMDMwLCAweDF9LAotCVsyNCAuLi4gNjFdID0gSUNFTEFLRV9NT0NTX1BURSwKIAlbNjJdID0g
eyAweDAwMDAwMDM3LCAweDAwMTAsIDB4MX0sCiAJWzYzXSA9IHsgMHgwMDAwMDAzNywgMHgwMDEw
LCAweDF9LAogfTsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
Z3QtZGV2
