Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94CB610E2C6
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Mar 2023 10:04:14 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Mon, 20 Mar 2023 15:30:16 +0530
Message-Id: <20230320100017.2913328-5-bhanuprakash.modem@intel.com>
In-Reply-To: <20230320100017.2913328-1-bhanuprakash.modem@intel.com>
References: <20230320100017.2913328-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 4/5] tests/kms_force_connector_basic: Add XE
 support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com, mchehab@kernel.org, jani.nikula@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Add XE driver support for kms tests.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_force_connector_basic.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/kms_force_connector_basic.c b/tests/kms_force_connector_basic.c
index 4ff1efe3b..6a13fe4ed 100644
--- a/tests/kms_force_connector_basic.c
+++ b/tests/kms_force_connector_basic.c
@@ -53,7 +53,9 @@ static void reset_connectors(void)
 		drmModeFreeConnector(connector);
 	}
 
-	igt_set_module_param_int(drm_fd, "load_detect_test", 0);
+	/* FIXME: load_detect_test is not found in XE. */
+	if (is_i915_device(drm_fd))
+		igt_set_module_param_int(drm_fd, "load_detect_test", 0);
 
 	close(drm_fd);
 }
-- 
2.40.0


