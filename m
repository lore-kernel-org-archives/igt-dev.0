Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA98891AD
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Apr 2019 09:51:58 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
Date: Tue, 30 Apr 2019 15:07:11 +0530
Message-Id: <1556617032-2515-1-git-send-email-karthik.b.s@intel.com>
Subject: [igt-dev] [PATCH i-g-t] tests/kms_cursor_crc: Limit cursor size
 based platform capability.
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
List-ID: <igt-dev@lists.freedesktop.org>

TGltaXRpbmcgdGhlIG1heGltdW0gY3Vyc29yIHNpemUgYmVpbmcgdXNlZCBpbiBzdWJ0ZXN0cyBi
YXNlZCBvbgpwbGF0Zm9ybSBjYXBhYmlsaXR5LCB0byBhdm9pZCBza2lwcGluZyBvZiBzdWJ0ZXN0
cy4KCkthcnRoaWsgQiBTICgxKToKICB0ZXN0cy9rbXNfY3Vyc29yX2NyYzogTGltaXQgY3Vyc29y
IHNpemUgYmFzZWQgcGxhdGZvcm0gY2FwYWJpbGl0eS4KCiB0ZXN0cy9rbXNfY3Vyc29yX2NyYy5j
IHwgMjEgKysrKysrKysrKystLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9u
cygrKSwgMTAgZGVsZXRpb25zKC0pCgotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaWd0LWRldg==
