Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E1846EB92
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Aug 2021 09:47:34 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri,  6 Aug 2021 11:46:15 +0200
Message-Id: <20210806094649.21162-23-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210806094649.21162-1-zbigniew.kempczynski@intel.com>
References: <20210806094649.21162-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 22/56] tests/gem_exec_gttfill: Require
 relocation support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Andrzej Turko <andrzej.turko@linux.intel.com>, =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Andrzej Turko <andrzej.turko@linux.intel.com>

Since this test uses relocations, which are now disabled on newer
generations, we need to skip the test if they are not supported.
In order to maintain coverage a slightly modified version of this test
using softpinning instead of relocations is added to gem_softpin.

Signed-off-by: Andrzej Turko <andrzej.turko@linux.intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/i915/gem_exec_gttfill.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/i915/gem_exec_gttfill.c b/tests/i915/gem_exec_gttfill.c
index b8283eb8f..f16428714 100644
--- a/tests/i915/gem_exec_gttfill.c
+++ b/tests/i915/gem_exec_gttfill.c
@@ -216,6 +216,7 @@ igt_main
 	igt_fixture {
 		i915 = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(i915);
+		igt_require(gem_has_relocations(i915));
 		ctx = intel_ctx_create_all_physical(i915);
 		igt_fork_hang_detector(i915);
 	}
-- 
2.26.0
