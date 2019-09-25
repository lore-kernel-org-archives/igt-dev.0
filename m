Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD8AC6E82A
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Sep 2019 12:14:06 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
Date: Wed, 25 Sep 2019 17:42:15 +0530
Message-Id: <1569413537-8923-1-git-send-email-jeevan.b@intel.com>
Subject: [igt-dev] [PATCH i-g-t 0/2] Add a new IGT test to validate DC3CO
 state.
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
Cc: Jeevan B <jeevan.b@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

VGhpcyB0ZXN0IGlzIGNyZWF0aW5nIGEgdnBiIHNjZW5hcmlvIGZvcgpzZWxlY3RpdmUgZnJhbWUg
dXBkYXRlIGFuZCB2YWxpZGF0aW5nIAp0aGF0IERDIHN0YXRlIHN0YXlzIGluIERDM0NPIGR1cmlu
ZyBleGVjdXRpb24uCgpBbnNodW1hbiBHdXB0YSAoMSk6CiAgaWd0L2k5MTUvaTkxNV9wbV9kYzog
REMzQ08gUFNSMiBoZWxwZXJzCgpKZWV2YW4gQiAoMSk6CiAgQWRkIGEgbmV3IElHVCB0ZXN0IHRv
IHZhbGlkYXRlIERDM0NPIHN0YXRlCgogbGliL2lndF9wc3IuYyAgICAgICAgICAgfCAgMTEgKysr
CiBsaWIvaWd0X3Bzci5oICAgICAgICAgICB8ICAgMSArCiB0ZXN0cy9pOTE1L2k5MTVfcG1fZGMu
YyB8IDE4MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0K
IDMgZmlsZXMgY2hhbmdlZCwgMTgzIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKLS0g
CjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
