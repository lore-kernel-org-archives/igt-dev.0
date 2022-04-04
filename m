Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA77A10EB6C
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Apr 2022 08:48:57 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  4 Apr 2022 10:48:52 +0200
Message-Id: <20220404084852.24975-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_eio: Fix missing
 multiprocess allocator environment
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On discrete we need to ensure that allocator is able to run in
multiprocess mode otherwise we encounter crashes.

Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/4928

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/i915/gem_eio.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/i915/gem_eio.c b/tests/i915/gem_eio.c
index 39cd6a1deb..d9689534d5 100644
--- a/tests/i915/gem_eio.c
+++ b/tests/i915/gem_eio.c
@@ -1111,9 +1111,14 @@ igt_main
 
 			igt_display_require(&display, fd);
 			igt_display_require_output(&display);
+			intel_allocator_multiprocess_start();
 		}
 
 		igt_subtest("kms")
 			test_kms(fd, &display);
+
+		igt_fixture {
+			intel_allocator_multiprocess_stop();
+		}
 	}
 }
-- 
2.32.0
