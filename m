Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7FFC10EF80
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Mar 2022 11:44:04 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  8 Sep 2021 23:40:06 +0530
Message-Id: <20210908181006.6088-2-mohammed.thasleem@intel.com>
In-Reply-To: <20210908181006.6088-1-mohammed.thasleem@intel.com>
References: <20210908181006.6088-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/2] tests/i915/kms_dsc : Close fd after
 igt_display_fini execution.
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

Close fd after igt_display_fini to avoid bad fd failure.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/i915/kms_dsc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index ee52ffcc..22d2216e 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -354,7 +354,7 @@ igt_main
 			drmModeFreeConnector(connector);
 		test_cleanup(&data);
 		drmModeFreeResources(res);
-		close(data.drm_fd);
 		igt_display_fini(&data.display);
+		close(data.drm_fd);
 	}
 }
-- 
2.25.1
