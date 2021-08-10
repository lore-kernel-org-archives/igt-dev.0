Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED6E16E03E
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Aug 2021 10:53:57 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 10 Aug 2021 12:52:49 +0200
Message-Id: <20210810105323.31375-21-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210810105323.31375-1-zbigniew.kempczynski@intel.com>
References: <20210810105323.31375-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v7 20/54] tests/gem_exec_lut_handle: Require
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
List-ID: <igt-dev@lists.freedesktop.org>

From: Andrzej Turko <andrzej.turko@linux.intel.com>

This test exercises LUT which is a part of the relocation
interface. Running this test makes no sense on platforms
without relocation support -- thus the new requirement.

Signed-off-by: Andrzej Turko <andrzej.turko@linux.intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/i915/gem_exec_lut_handle.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/i915/gem_exec_lut_handle.c b/tests/i915/gem_exec_lut_handle.c
index 3c5c81f1a..064308666 100644
--- a/tests/i915/gem_exec_lut_handle.c
+++ b/tests/i915/gem_exec_lut_handle.c
@@ -99,6 +99,7 @@ igt_simple_main
 
 	fd = drm_open_driver(DRIVER_INTEL);
 	igt_require_gem(fd);
+	igt_require(gem_has_relocations(fd));
 
 	memset(gem_exec, 0, sizeof(gem_exec));
 	for (n = 0; n < MAX_NUM_EXEC; n++)
-- 
2.26.0
