Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6502C6EB7F
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Sep 2019 09:14:12 +0000 (UTC)
From: Katarzyna Dec <katarzyna.dec@intel.com>
Date: Tue, 17 Sep 2019 11:13:53 +0200
Message-Id: <20190917091353.31149-4-katarzyna.dec@intel.com>
In-Reply-To: <20190917091353.31149-1-katarzyna.dec@intel.com>
References: <20190917091353.31149-1-katarzyna.dec@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/3] HAX: run gpgpu_fill and media_fill in
 BAT
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

LS0tCiB0ZXN0cy9pbnRlbC1jaS9mYXN0LWZlZWRiYWNrLnRlc3RsaXN0IHwgMyArKy0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90
ZXN0cy9pbnRlbC1jaS9mYXN0LWZlZWRiYWNrLnRlc3RsaXN0IGIvdGVzdHMvaW50ZWwtY2kvZmFz
dC1mZWVkYmFjay50ZXN0bGlzdAppbmRleCBlNzhlN2ZkMC4uNTk2ZmYwNDIgMTAwNjQ0Ci0tLSBh
L3Rlc3RzL2ludGVsLWNpL2Zhc3QtZmVlZGJhY2sudGVzdGxpc3QKKysrIGIvdGVzdHMvaW50ZWwt
Y2kvZmFzdC1mZWVkYmFjay50ZXN0bGlzdApAQCAtMSw1ICsxLDYgQEAKICMgS2VlcCBhbHBoYWJl
dGljYWxseSBzb3J0ZWQgYnkgZGVmYXVsdAotCitpZ3RAZ2VtX21lZGlhX2ZpbGwKK2lndEBnZW1f
Z3BncHVfZmlsbAogaWd0QGNvcmVfYXV0aEBiYXNpYy1hdXRoCiBpZ3RAZGVidWdmc190ZXN0QHJl
YWRfYWxsX2VudHJpZXMKIGlndEBnZW1fYmFzaWNAYmFkLWNsb3NlCi0tIAoyLjIwLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGlu
ZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
