Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0EE46E418
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jul 2019 07:32:59 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Fri,  5 Jul 2019 10:32:53 +0300
Message-Id: <20190705073253.28178-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] Dockerfile.fedora: Download peg source from
 our own mirror
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

VGhlIG9yaWdpbmFsIFVSTCB1c2VkIGh0dHAgKyBzZWVtcyB0byBiZSBhdXRob3IncyBvd24gc21h
bGwgc2l0ZSBhbmQgaXMKY3VycmVudGx5IGRvd24uCgpJbnN0ZWFkIG9mIHdhaXRpbmcgZm9yIGl0
IHRvIGJlIHVwIGFnYWluIGp1c3QgdG8gaGFtbWVyIGl0IHdpdGggb3VyIENJCndlIGNhbiBzZXQg
dXAgb3VyIG93biBtaXJyb3IgZm9yIHRoZSB0YXJiYWxsIGFuZCB1c2UgaXQuCgpDYzogUGV0cmkg
TGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+CkNjOiBTaW1vbiBTZXIgPHNpbW9uLnNl
ckBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEFya2FkaXVzeiBIaWxlciA8YXJrYWRpdXN6Lmhp
bGVyQGludGVsLmNvbT4KLS0tCiBEb2NrZXJmaWxlLmZlZG9yYSB8IDMgKystCiAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvRG9ja2Vy
ZmlsZS5mZWRvcmEgYi9Eb2NrZXJmaWxlLmZlZG9yYQppbmRleCBjODRiNDEyYi4uZmEyN2E2MjMg
MTAwNjQ0Ci0tLSBhL0RvY2tlcmZpbGUuZmVkb3JhCisrKyBiL0RvY2tlcmZpbGUuZmVkb3JhCkBA
IC0yOCw3ICsyOCw4IEBAIFJVTiBkbmYgaW5zdGFsbCAteSBcCiBSVU4gZG5mIGluc3RhbGwgLXkg
bWFrZQogUlVOIG1rZGlyIC90bXAvcGVnCiBXT1JLRElSIC90bXAvcGVnCi1SVU4gY3VybCAtTyBo
dHRwOi8vcGl1bWFydGEuY29tL3NvZnR3YXJlL3BlZy9wZWctMC4xLjE4LnRhci5negorIyBvcmln
aW5hbHkgZnJvbSBodHRwOi8vcGl1bWFydGEuY29tL3NvZnR3YXJlL3BlZy8KK1JVTiBjdXJsIC1P
IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy9taXJyb3IvcGVnL3BlZy0wLjEuMTgudGFyLmd6
CiBSVU4gdGFyIHhmIHBlZy0wLjEuMTgudGFyLmd6CiBSVU4gY2QgcGVnLTAuMS4xOCAmJiBtYWtl
IFBSRUZJWD0vdXNyIGluc3RhbGwKIFJVTiBybSAtZnIgL3RtcC9wZWcKLS0gCjIuMjEuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWls
aW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
