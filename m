Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D796E179
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Sep 2018 04:19:36 +0000 (UTC)
From: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Date: Thu, 27 Sep 2018 21:19:26 -0700
Message-Id: <20180928041926.7834-2-dhinakaran.pandiyan@intel.com>
In-Reply-To: <20180928041926.7834-1-dhinakaran.pandiyan@intel.com>
References: <20180928041926.7834-1-dhinakaran.pandiyan@intel.com>
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/psr: Check for PSR entry less
 frequently
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
Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

V2UgY3VycmVudGx5IHJlYWQgZGVidWdmcyBldmVyeSAxIG1zLCBnaXZlbiB0aGF0IGl0IHRha2Vz
IGFib3V0IDE0MCBtcwpmb3IgUFNSIGVudHJ5IG9uIHRoZSBDSSBtYWNoaW5lcyBhbmQgZW50cnkg
Y2FuIG9jY3VyIGF0IGZyYW1lIHRpbWUKaW50ZXJ2YWxzLCBidW1wIHRoZSBkZWJ1Z2ZzIHJlYWQg
aW50ZXJ2YWwgdG8gMjAgbXMuCgpTaWduZWQtb2ZmLWJ5OiBEaGluYWthcmFuIFBhbmRpeWFuIDxk
aGluYWthcmFuLnBhbmRpeWFuQGludGVsLmNvbT4KLS0tCiBsaWIvaWd0X3Bzci5jIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvbGliL2lndF9wc3IuYyBiL2xpYi9pZ3RfcHNyLmMKaW5kZXggMzU1ZmU2MjcuLjBkZGZiNjRm
IDEwMDY0NAotLS0gYS9saWIvaWd0X3Bzci5jCisrKyBiL2xpYi9pZ3RfcHNyLmMKQEAgLTM5LDcg
KzM5LDcgQEAgc3RhdGljIGJvb2wgcHNyX2FjdGl2ZShpbnQgZGVidWdmc19mZCwgYm9vbCBjaGVj
a19hY3RpdmUpCiAKIGJvb2wgcHNyX3dhaXRfZW50cnkoaW50IGRlYnVnZnNfZmQpCiB7Ci0JcmV0
dXJuIGlndF93YWl0KHBzcl9hY3RpdmUoZGVidWdmc19mZCwgdHJ1ZSksIDUwMCwgMSk7CisJcmV0
dXJuIGlndF93YWl0KHBzcl9hY3RpdmUoZGVidWdmc19mZCwgdHJ1ZSksIDUwMCwgMjApOwogfQog
CiBib29sIHBzcl93YWl0X2V4aXQoaW50IGRlYnVnZnNfZmQpCi0tIAoyLjE3LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
