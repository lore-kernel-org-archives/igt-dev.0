Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 022C589F71
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Jan 2021 06:51:43 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Tue, 12 Jan 2021 08:51:25 +0200
Message-Id: <20210112065125.32351-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] runner: Fix constness warning
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
Cc: Petri Latvala <petri.latvala@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

SW50cm9kdWNlZCBpbiBjb21taXQgNTMyZDZlODRhYjdmICgibGliOiBQcm9jZXNzIGtlcm5lbCB0
YWludHMiKToKCi4uL3J1bm5lci9leGVjdXRvci5jOiBJbiBmdW5jdGlvbiDigJhoYW5kbGVfdGFp
bnTigJk6Ci4uL3J1bm5lci9leGVjdXRvci5jOjMyNDoxODogd2FybmluZzogYXNzaWdubWVudCBk
aXNjYXJkcyDigJhjb25zdOKAmSBxdWFsaWZpZXIgZnJvbSBwb2ludGVyIHRhcmdldCB0eXBlIFst
V2Rpc2NhcmRlZC1xdWFsaWZpZXJzXQogIHdoaWxlICgoZXhwbGFpbiA9IGlndF9leHBsYWluX3Rh
aW50cygmYmFkKSkpIHsKICAgICAgICAgICAgICAgICAgICBeCgpTaWduZWQtb2ZmLWJ5OiBQZXRy
aSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4KQ2M6IENocmlzIFdpbHNvbiA8Y2hy
aXNAY2hyaXMtd2lsc29uLmNvLnVrPgotLS0KIHJ1bm5lci9leGVjdXRvci5jIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
cnVubmVyL2V4ZWN1dG9yLmMgYi9ydW5uZXIvZXhlY3V0b3IuYwppbmRleCA5M2RiOGJiMy4uYzFh
MDU0NWEgMTAwNjQ0Ci0tLSBhL3J1bm5lci9leGVjdXRvci5jCisrKyBiL3J1bm5lci9leGVjdXRv
ci5jCkBAIC0zMTEsNyArMzExLDcgQEAgc3RhdGljIGNoYXIgKmhhbmRsZV9sb2NrZGVwKHZvaWQp
CiBzdGF0aWMgY2hhciAqaGFuZGxlX3RhaW50KHZvaWQpCiB7CiAJdW5zaWduZWQgbG9uZyB0YWlu
dHMsIGJhZDsKLQljaGFyICpleHBsYWluOworCWNvbnN0IGNoYXIgKmV4cGxhaW47CiAJY2hhciAq
cmVhc29uOwogCiAJYmFkID0gaWd0X2tlcm5lbF90YWludGVkKCZ0YWludHMpOwotLSAKMi4yOS4y
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2
IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
