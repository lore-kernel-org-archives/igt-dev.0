Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 253A46EFD8
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jan 2019 11:21:04 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed, 16 Jan 2019 13:20:30 +0200
Message-Id: <20190116112050.27647-2-petri.latvala@intel.com>
In-Reply-To: <20190116112050.27647-1-petri.latvala@intel.com>
References: <20190116112050.27647-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 01/21] lib: Introduce igt_assume()
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

aWd0X2Fzc3VtZSgpIGlzIGFuIGFzc2VydC1saWtlIG1hY3JvIHRoYXQgaXMgdXNlZCB0byBnaXZl
IGhpbnRzIHRvCnN0YXRpYyBhbmFseXNpcyBvZiBjb2RlLiBJZiBzdGF0aWMgYW5hbHlzaXMgaXMg
bm90IHVzZWQgKGFzIGRldGVjdGVkCmJ5IFNUQVRJQ19BTkFMWVNJU19CVUlMRCksIGlndF9hc3N1
bWUoKSBleHBhbmRzIHRvIGEgbm8tb3Agc3RhdGVtZW50LApvdGhlcndpc2UgZXhwYW5kcyB0byBh
biBhc3NlcnQoKS4KClNpZ25lZC1vZmYtYnk6IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFA
aW50ZWwuY29tPgpDYzogQXJrYWRpdXN6IEhpbGVyIDxhcmthZGl1c3ouaGlsZXJAaW50ZWwuY29t
PgpDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CkNjOiBNaWNoYcWC
IFdpbmlhcnNraSA8bWljaGFsLndpbmlhcnNraUBpbnRlbC5jb20+Ci0tLQogbGliL2lndF9jb3Jl
LmggfCAxNSArKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvbGliL2lndF9jb3JlLmggYi9saWIvaWd0X2NvcmUuaAppbmRleCA2Zjhj
Mzg1Mi4uODJlYzc5NzMgMTAwNjQ0Ci0tLSBhL2xpYi9pZ3RfY29yZS5oCisrKyBiL2xpYi9pZ3Rf
Y29yZS5oCkBAIC0zMCw2ICszMCw3IEBACiAjaWZuZGVmIElHVF9DT1JFX0gKICNkZWZpbmUgSUdU
X0NPUkVfSAogCisjaW5jbHVkZSA8YXNzZXJ0Lmg+CiAjaW5jbHVkZSA8c2V0am1wLmg+CiAjaW5j
bHVkZSA8c3RkYm9vbC5oPgogI2luY2x1ZGUgPHN0ZGludC5oPgpAQCAtNTQsNiArNTUsMjAgQEAK
ICNlbmRpZgogI2VuZGlmCiAKKy8qKgorICogaWd0X2Fzc3VtZToKKyAqIEBleHByOiBDb25kaXRp
b24gdG8gdGVzdAorICoKKyAqIEFuIGFzc2VydC1saWtlIG1hY3JvIHRvIGJlIHVzZWQgZm9yIHRh
dXRvbG9naWVzIHRvIGdpdmUgaGludHMgdG8KKyAqIHN0YXRpYyBhbmFseXNpcyBvZiBjb2RlLiBO
by1vcCBpZiBTVEFUSUNfQU5BTFlTSVNfQlVJTEQgaXMgbm90CisgKiBkZWZpbmVkLCBleHBhbmRz
IHRvIGFuIGFzc2VydCgpIGlmIGl0IGlzLgorICovCisjaWYgU1RBVElDX0FOQUxZU0lTX0JVSUxE
CisjZGVmaW5lIGlndF9hc3N1bWUoZSkgYXNzZXJ0KGUpCisjZWxzZQorI2RlZmluZSBpZ3RfYXNz
dW1lKGUpIGRvIHt9IHdoaWxlKDApCisjZW5kaWYKKwogZXh0ZXJuIGNvbnN0IGNoYXIqIF9faWd0
X3Rlc3RfZGVzY3JpcHRpb24gX19hdHRyaWJ1dGVfXygod2VhaykpOwogZXh0ZXJuIGJvb2wgX19p
Z3RfcGxhaW5fb3V0cHV0OwogZXh0ZXJuIGNoYXIgKmlndF9mcmFtZV9kdW1wX3BhdGg7Ci0tIAoy
LjE5LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmln
dC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
