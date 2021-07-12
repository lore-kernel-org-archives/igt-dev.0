Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90A7E89B8F
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jul 2021 07:49:39 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Mon, 12 Jul 2021 10:49:36 +0300
Message-Id: <20210712074936.3541-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/gem_fenced_exec_thrash:
 s/EDEADLK/ENOBUFS/
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkFk
anVzdCB0aGUgZXhwZWN0ZWQgZXJybm8gZm9yIHJ1bm5pbmcgb3V0IG9mIGZlbmNlcyB0bwpFTk9C
VUZTIGZyb20gRURFQURMSyBhcyBwZXIga2VybmVsIGNvbW1pdCA3OGQyYWQ3ZWI0ZTEKKCJkcm0v
aTkxNS9ndDogRml4IC1FREVBRExLIGhhbmRsaW5nIHJlZ3Jlc3Npb24iKS4KClNpZ25lZC1vZmYt
Ynk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQog
dGVzdHMvaTkxNS9nZW1fZmVuY2VkX2V4ZWNfdGhyYXNoLmMgfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9pOTE1
L2dlbV9mZW5jZWRfZXhlY190aHJhc2guYyBiL3Rlc3RzL2k5MTUvZ2VtX2ZlbmNlZF9leGVjX3Ro
cmFzaC5jCmluZGV4IDEzODEyYmI3ZTQyOS4uNjQ5N2ZmNTc2NDdhIDEwMDY0NAotLS0gYS90ZXN0
cy9pOTE1L2dlbV9mZW5jZWRfZXhlY190aHJhc2guYworKysgYi90ZXN0cy9pOTE1L2dlbV9mZW5j
ZWRfZXhlY190aHJhc2guYwpAQCAtMTgyLDcgKzE4Miw3IEBAIGlndF9tYWluCiAJCQlydW5fdGVz
dChmZCwgbnVtX2ZlbmNlcywgMCwgZmxhZ3MpOwogCX0KIAlpZ3Rfc3VidGVzdCgidG9vLW1hbnkt
ZmVuY2VzIikKLQkJcnVuX3Rlc3QoZmQsIG51bV9mZW5jZXMgKyAxLCBpbnRlbF9nZW4oZGV2aWQp
ID49IDQgPyAwIDogRURFQURMSywgMCk7CisJCXJ1bl90ZXN0KGZkLCBudW1fZmVuY2VzICsgMSwg
aW50ZWxfZ2VuKGRldmlkKSA+PSA0ID8gMCA6IEVOT0JVRlMsIDApOwogCiAJaWd0X2ZpeHR1cmUK
IAkJY2xvc2UoZmQpOwotLSAKMi4zMS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2lndC1kZXYK
