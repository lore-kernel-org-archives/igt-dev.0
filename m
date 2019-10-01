Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 062796E7E2
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Oct 2019 14:28:09 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Tue,  1 Oct 2019 16:27:23 +0200
Message-Id: <20191001142724.16472-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 0/1] tests/i915_module_load: Use new name
 of fault injection module parameter
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
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

TmFtZSBvZiB0aGUgaTkxNSBtb2R1bGUgcGFyYW1ldGVyIHByb3ZpZGluZyBmYXVsdCBpbmplY3Rp
b24gZnVuY3Rpb24gaXMKY2hhbmdpbmcgZm9yIGNvbnNpc3RlbmN5IHdpdGggYSBuZXcgY29udmVu
dGlvbiBvZiBuYW1pbmcgaTkxNSBkcml2ZXIKaW50ZXJuYWwgZnVuY3Rpb25zIGNhbGxlZCBmcm9t
IHRoZSBkcml2ZXIgUENJIC5wcm9iZSBlbnRyeSBwb2ludC4gIEFkanVzdAp0aGUgdGVzdCB0byB1
c2UgdGhlIG5ldyBuYW1lLgoKdjI6ICogYWRkIFItYiAodGhhbmtzIENocmlzKSwKICAgICogYWRk
IGNvdmVyIGxldHRlciB0byBjb3JyZWN0bHkgc3VwcG9ydCBqb2ludCB0ZXN0aW5nIHdpdGggYQog
ICAgICBjb3JyZXNwb25kaW5nIGtlcm5lbCBkcml2ZXIgc2lkZSBwYXRjaC4KCkphbnVzeiBLcnp5
c3p0b2ZpayAoMSk6CiAgdGVzdHMvaTkxNV9tb2R1bGVfbG9hZDogVXNlIG5ldyBuYW1lIG9mIGZh
dWx0IGluamVjdGlvbiBtb2R1bGUKICAgIHBhcmFtZXRlcgoKIHRlc3RzL2k5MTUvaTkxNV9tb2R1
bGVfbG9hZC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCgotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1k
ZXY=
