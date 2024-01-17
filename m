Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C052610E6BF
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jan 2024 14:53:10 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v5 2/3] lib/igt_kms: Correct the check for igt_require
Date: Wed, 17 Jan 2024 20:23:08 +0530
Message-Id: <20240117145308.26010-1-mohammed.thasleem@intel.com>
In-Reply-To: <20240117141323.14994-3-mohammed.thasleem@intel.com>
References: <20240117141323.14994-3-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The function 'igt_debugfs_dir()' returns -1, if it fails and a non-negative
fd otherwise. However in the function igt_get_max_dotclock() the condition
to check the debugfs directory uses igt_require (dir), which fails even if
the dir is 0.
So correct the igt_require check for a valid igt_debugfs fd.

v2: Correct the logic in igt_require.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 lib/igt_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e4dea1a60..1b4d0d761 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6100,7 +6100,7 @@ int igt_get_max_dotclock(int fd)
 	drmModeFreeResources(resources);
 
 	dir = igt_debugfs_dir(fd);
-	igt_require(dir);
+	igt_require(dir != -1);
 
 	/*
 	 * Display specific clock frequency info is moved to i915_cdclk_info,
-- 
2.25.1


