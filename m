Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD1546EFCD
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jan 2019 11:21:02 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed, 16 Jan 2019 13:20:33 +0200
Message-Id: <20190116112050.27647-5-petri.latvala@intel.com>
In-Reply-To: <20190116112050.27647-1-petri.latvala@intel.com>
References: <20190116112050.27647-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 04/21] lib/igt_kms: Use correct type for
 calloc
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

VGhlIHR5cGUgbWlzbWF0Y2ggd2FzIGNoYXIgdnMuIHVuc2lnbmVkIGNoYXIsIGJvdGggYmVpbmcg
c2l6ZSAxIHNvCnRoaXMgZGlkbid0IGNhdXNlIGFueSBhY3R1YWwgaXNzdWVzIG90aGVyIHRoYW4g
bm9pc2UgaW4gc3RhdGljCmFuYWx5c2lzIHRoYXQgZG9lc24ndCBiZWxpZXZlIDEgaXMgZXF1YWwg
dG8gYW5vdGhlciB0eXBlIG9mIDEuCgpTaWduZWQtb2ZmLWJ5OiBQZXRyaSBMYXR2YWxhIDxwZXRy
aS5sYXR2YWxhQGludGVsLmNvbT4KQ2M6IEFiZGllbCBKYW51bGd1ZSA8YWJkaWVsLmphbnVsZ3Vl
QGxpbnV4LmludGVsLmNvbT4KLS0tCiBsaWIvaWd0X2ttcy5jIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbGliL2lndF9r
bXMuYyBiL2xpYi9pZ3Rfa21zLmMKaW5kZXggNjg0YTU5OWMuLmY5MjZlYWZiIDEwMDY0NAotLS0g
YS9saWIvaWd0X2ttcy5jCisrKyBiL2xpYi9pZ3Rfa21zLmMKQEAgLTEyMzQsNyArMTIzNCw3IEBA
IGluaXRfY2VhX2Jsb2NrKGNvbnN0IHVuc2lnbmVkIGNoYXIgKmVkaWQsIHNpemVfdCBsZW5ndGgs
CiAKIAkqbmV3X2xlbmd0aCA9IGxlbmd0aCArIDEyODsKIAotCW5ld19lZGlkLmRhdGEgPSBjYWxs
b2MoKm5ld19sZW5ndGgsIHNpemVvZihjaGFyKSk7CisJbmV3X2VkaWQuZGF0YSA9IGNhbGxvYygq
bmV3X2xlbmd0aCwgc2l6ZW9mKCpuZXdfZWRpZC5kYXRhKSk7CiAJaWd0X2Fzc2VydF9mKG5ld19l
ZGlkLmRhdGEsICJGYWlsZWQgdG8gYWxsb2NhdGUgJXp1IGJ5dGVzIGZvciBlZGlkXG4iLCBzaXpl
b2YobmV3X2xlbmd0aCkpOwogCW1lbWNweShuZXdfZWRpZC5kYXRhLCBlZGlkLCBsZW5ndGgpOwog
CSpuZXdfZWRpZF9wdHIgPSBuZXdfZWRpZC5kYXRhOwotLSAKMi4xOS4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdApp
Z3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
