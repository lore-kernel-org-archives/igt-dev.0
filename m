Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4F76EFCD
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jan 2019 11:21:03 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed, 16 Jan 2019 13:20:35 +0200
Message-Id: <20190116112050.27647-7-petri.latvala@intel.com>
In-Reply-To: <20190116112050.27647-1-petri.latvala@intel.com>
References: <20190116112050.27647-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 06/21] lib: Avoid memcpying 0 bytes from NULL
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

VGhlIGJlaGF2aW91ciBvZiBtZW1jcHlpbmcgMCBieXRlcyBmcm9tIE5VTEwgaXMgc2VtYW50aWNh
bGx5IHNvdW5kLApidXQgc3RpbGwgdW5kZWZpbmVkIGJlaGF2aW91ci4KClNpZ25lZC1vZmYtYnk6
IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgpDYzogQXJrYWRpdXN6IEhp
bGVyIDxhcmthZGl1c3ouaGlsZXJAaW50ZWwuY29tPgotLS0KIGxpYi9pZ3RfY29yZS5jIHwgNSAr
KystLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9saWIvaWd0X2NvcmUuYyBiL2xpYi9pZ3RfY29yZS5jCmluZGV4IDUwZDYwMDhm
Li43YzcyN2VkYyAxMDA2NDQKLS0tIGEvbGliL2lndF9jb3JlLmMKKysrIGIvbGliL2lndF9jb3Jl
LmMKQEAgLTcyOCw4ICs3MjgsOSBAQCBzdGF0aWMgaW50IGNvbW1vbl9pbml0KGludCAqYXJnYywg
Y2hhciAqKmFyZ3YsCiAJYWxsX29wdF9jb3VudCArPSBBUlJBWV9TSVpFKGxvbmdfb3B0aW9ucyk7
CiAKIAljb21iaW5lZF9vcHRzID0gbWFsbG9jKGFsbF9vcHRfY291bnQgKiBzaXplb2YoKmNvbWJp
bmVkX29wdHMpKTsKLQltZW1jcHkoY29tYmluZWRfb3B0cywgZXh0cmFfbG9uZ19vcHRzLAotCSAg
ICAgICBleHRyYV9vcHRfY291bnQgKiBzaXplb2YoKmNvbWJpbmVkX29wdHMpKTsKKwlpZiAoZXh0
cmFfb3B0X2NvdW50ID4gMCkKKwkJbWVtY3B5KGNvbWJpbmVkX29wdHMsIGV4dHJhX2xvbmdfb3B0
cywKKwkJICAgICAgIGV4dHJhX29wdF9jb3VudCAqIHNpemVvZigqY29tYmluZWRfb3B0cykpOwog
CiAJLyogQ29weSB0aGUgc3VidGVzdCBsb25nIG9wdGlvbnMgKGFuZCB0aGUgZmluYWwgTlVMTCBl
bnRyeSkgKi8KIAltZW1jcHkoJmNvbWJpbmVkX29wdHNbZXh0cmFfb3B0X2NvdW50XSwgbG9uZ19v
cHRpb25zLAotLSAKMi4xOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1k
ZXYK
