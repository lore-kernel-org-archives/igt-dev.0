Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from 10.mo68.mail-out.ovh.net (10.mo68.mail-out.ovh.net
 [46.105.79.203])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CC5F89361
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2019 01:11:34 +0000 (UTC)
Received: from player796.ha.ovh.net (unknown [10.108.57.50])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id B30F0122CB8
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2019 02:46:30 +0200 (CEST)
From: Andi Shyti <andi@etezian.org>
Date: Mon, 13 May 2019 03:45:02 +0300
Message-Id: <20190513004508.8042-9-andi@etezian.org>
In-Reply-To: <20190513004508.8042-1-andi@etezian.org>
References: <20190513004508.8042-1-andi@etezian.org>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v23 08/14] test/i915: gem_cs_tlb: use the
 gem_engine_topology library
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
To: IGT dev <igt-dev@lists.freedesktop.org>
Cc: Andi Shyti <andi@etezian.org>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogQW5kaSBTaHl0aSA8YW5kaS5zaHl0aUBpbnRlbC5jb20+CgpSZXBsYWNlIHRoZSBsZWdh
Y3kgZm9yX2VhY2hfZW5naW5lKiBkZWZpbmVzIHdpdGggdGhlIG9uZXMKaW1wbGVtZW50ZWQgaW4g
dGhlIGdlbV9lbmdpbmVfdG9wb2xvZ3kgbGlicmFyeS4KClNpZ25lZC1vZmYtYnk6IEFuZGkgU2h5
dGkgPGFuZGkuc2h5dGlAaW50ZWwuY29tPgpDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13
aWxzb24uY28udWs+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgot
LS0KIHRlc3RzL2k5MTUvZ2VtX2NzX3RsYi5jIHwgOCArKysrLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9pOTE1
L2dlbV9jc190bGIuYyBiL3Rlc3RzL2k5MTUvZ2VtX2NzX3RsYi5jCmluZGV4IDUxZTFjNGUxOTkz
MC4uMTNkZTU0OTlmMWM3IDEwMDY0NAotLS0gYS90ZXN0cy9pOTE1L2dlbV9jc190bGIuYworKysg
Yi90ZXN0cy9pOTE1L2dlbV9jc190bGIuYwpAQCAtMTQwLDcgKzE0MCw3IEBAIHN0YXRpYyB2b2lk
IHJ1bl9vbl9yaW5nKGludCBmZCwgdW5zaWduZWQgcmluZ19pZCwgY29uc3QgY2hhciAqcmluZ19u
YW1lKQogCiBpZ3RfbWFpbgogewotCWNvbnN0IHN0cnVjdCBpbnRlbF9leGVjdXRpb25fZW5naW5l
ICplOworCWNvbnN0IHN0cnVjdCBpbnRlbF9leGVjdXRpb25fZW5naW5lMiAqZTsKIAlpbnQgZmQg
PSAtMTsKIAogCWlndF9za2lwX29uX3NpbXVsYXRpb24oKTsKQEAgLTE1MCw5ICsxNTAsOSBAQCBp
Z3RfbWFpbgogCQlpZ3RfcmVxdWlyZV9nZW0oZmQpOwogCX0KIAotCWZvciAoZSA9IGludGVsX2V4
ZWN1dGlvbl9lbmdpbmVzOyBlLT5uYW1lOyBlKyspCi0JCWlndF9zdWJ0ZXN0X2YoIiVzJXMiLCBl
LT5leGVjX2lkID8gIiIgOiAiYmFzaWMtIiwgZS0+bmFtZSkKLQkJCXJ1bl9vbl9yaW5nKGZkLCBl
LT5leGVjX2lkIHwgZS0+ZmxhZ3MsIGUtPm5hbWUpOworCV9fZm9yX2VhY2hfcGh5c2ljYWxfZW5n
aW5lKGZkLCBlKQorCQlpZ3Rfc3VidGVzdF9mKCIlcyIsIGUtPm5hbWUpCisJCQlydW5fb25fcmlu
ZyhmZCwgZS0+ZmxhZ3MsIGUtPm5hbWUpOwogCiAJaWd0X2ZpeHR1cmUKIAkJY2xvc2UoZmQpOwot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
