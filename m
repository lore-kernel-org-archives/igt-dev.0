Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A076E36D
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Oct 2018 17:52:32 +0000 (UTC)
From: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Date: Tue, 02 Oct 2018 10:50:33 -0700
Message-ID: <2455734.iny254CoEU@dk-thinkpad-x260>
In-Reply-To: <20180929000131.142820-1-casey.g.bowman@intel.com>
References: <20180929000131.142820-1-casey.g.bowman@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_psr: Added ENOENT error check
 to psr_set for older kernels
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
Cc: Casey Bowman <casey.g.bowman@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpZGF5LCBTZXB0ZW1iZXIgMjgsIDIwMTggNTowMTozMSBQTSBQRFQgQ2FzZXkgQm93bWFu
IHdyb3RlOgo+IE9ubHkgRUlOVkFMIHdhcyBiZWluZyB1c2VkIHRvIGFjY291bnQgZm9yIG9sZGVy
IGtlcm5lbHMsCj4gYnV0IG9uIGxlZ2FjeSBrZXJuZWxzIHRoYXQgZG9uJ3QgdXNlIGk5MTVfZWRw
X3Bzcl9kZWJ1ZywKPiB0aGUgRU5PRU5UIGVycm9yIHdpbGwgYmUgdGhyb3duLiBUaGlzIGNoYW5n
ZXMgdGhlIGxvZ2ljCj4gdG8gYWxzbyBhY2NvdW50IGZvciBFTk9FTlQgZXJyb3JzLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IENhc2V5IEJvd21hbiA8Y2FzZXkuZy5ib3dtYW5AaW50ZWwuY29tPgo+IC0t
LQo+ICBsaWIvaWd0X3Bzci5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9wc3IuYyBiL2xpYi9p
Z3RfcHNyLmMKPiBpbmRleCAwZGRmYjY0Zi4uOGNiNDFhNTUgMTAwNjQ0Cj4gLS0tIGEvbGliL2ln
dF9wc3IuYwo+ICsrKyBiL2xpYi9pZ3RfcHNyLmMKPiBAQCAtMTAzLDcgKzEwMyw3IEBAIHN0YXRp
YyBib29sIHBzcl9zZXQoaW50IGRlYnVnZnNfZmQsIGJvb2wgZW5hYmxlKQo+ICAJCXJldHVybiBm
YWxzZTsKPiAgCX0KPiAKPiAtCWlmIChyZXQgPT0gLUVJTlZBTCkgewo+ICsJaWYgKHJldCA9PSAt
RUlOVkFMIHx8IHJldCA9PSAtRU5PRU5UKSB7CgpQbGVhc2UgbW92ZSB0aGlzIGxvZ2ljIHRvIGhh
c19wc3JfZGVidWdmcygpIGFuZCBleHBhbmQgdGhlIGV4aXN0aW5nIApkb2N1bWVudGF0aW9uIGFi
b3V0IHJldHVybiB2YWx1ZXMgZnJvbSB0aGUga2VybmVsLgoKLURLCgoKPiAgCQlyZXQgPSBwc3Jf
bW9kcGFyYW1fc2V0KGVuYWJsZSk7Cj4gIAl9IGVsc2Ugewo+ICAJCXJldCA9IHBzcl93cml0ZShk
ZWJ1Z2ZzX2ZkLCBlbmFibGUgPyAiMHgzIiA6ICIweDEiKTsKCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
