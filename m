Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A0B6EFCD
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jan 2019 11:21:03 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed, 16 Jan 2019 13:20:36 +0200
Message-Id: <20190116112050.27647-8-petri.latvala@intel.com>
In-Reply-To: <20190116112050.27647-1-petri.latvala@intel.com>
References: <20190116112050.27647-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 07/21] overlay: Write out the assumption for
 kernel-provided data
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

VGhlIGNvZGUgYXNzdW1lcyAoY29ycmVjdGx5KSB0aGF0IHBlcmZfZXZlbnRfaGVhZGVyJ3Mgc2l6
ZSBpcwpub24temVyby4gV3JpdGUgdGhhdCBvdXQgc28gc3RhdGljIGFuYWx5c2lzIGFsc28ga25v
d3MgaXQuCgpTaWduZWQtb2ZmLWJ5OiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVs
LmNvbT4KQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgotLS0KIG92
ZXJsYXkvZ3B1LXBlcmYuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpk
aWZmIC0tZ2l0IGEvb3ZlcmxheS9ncHUtcGVyZi5jIGIvb3ZlcmxheS9ncHUtcGVyZi5jCmluZGV4
IDU2MjlmODI2Li43YWRkZDc4ZCAxMDA2NDQKLS0tIGEvb3ZlcmxheS9ncHUtcGVyZi5jCisrKyBi
L292ZXJsYXkvZ3B1LXBlcmYuYwpAQCAtNDk0LDYgKzQ5NCw3IEBAIGludCBncHVfcGVyZl91cGRh
dGUoc3RydWN0IGdwdV9wZXJmICpncCkKIAkJCWNvbnN0IHN0cnVjdCBwZXJmX2V2ZW50X2hlYWRl
ciAqaGVhZGVyOwogCiAJCQloZWFkZXIgPSAoY29uc3Qgc3RydWN0IHBlcmZfZXZlbnRfaGVhZGVy
ICopKGRhdGEgKyAodGFpbCAmIG1hc2spKTsKKwkJCWFzc2VydChoZWFkZXItPnNpemUgPiAwKTsK
IAkJCWlmIChoZWFkZXItPnNpemUgPiBoZWFkIC0gdGFpbCkKIAkJCQlicmVhazsKIAotLSAKMi4x
OS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3Qt
ZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
