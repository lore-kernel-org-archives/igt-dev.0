Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B41F10E6C0
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Dec 2023 08:21:33 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  6 Dec 2023 14:01:36 +0530
Message-Id: <20231206083136.16099-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking:
 Cleanup pipe crc
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Before testing FBC on next pipe, cleanup pipe CRCs
to avoid any mismatch.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 1daf27d2e..e10803b62 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -4532,6 +4532,9 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 					continue;
 				}
 
+				pipe_crc = NULL;
+				setup_crcs();
+
 				for_each_valid_output_on_pipe(&drm.display, pipe, output) {
 					init_mode_params(&prim_mode_params, output, pipe);
 					setup_fbc();
-- 
2.39.0
