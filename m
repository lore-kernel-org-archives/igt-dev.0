Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F2B10E0A6
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Jul 2023 05:38:59 +0000 (UTC)
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  3 Jul 2023 11:08:12 +0530
Message-Id: <20230703053812.9597-1-mohammed.thasleem@intel.com>
In-Reply-To: <20230627185528.2498910-1-mohammed.thasleem@intel.com>
References: <20230627185528.2498910-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v5 1/2] tests/kms_display_modes: Fixed mode
 selection for extended mode tests
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

From: Mohammed Thasleem <mohammed.thasleem@intel.com>

This will find the connector mode combo that fits into the
bandwidth when more than one monitor is connected.

Example:
  When two monitors connected through MST, the second monitor
  also tries to use the same mode. So two such modes may not
  fit into the link bandwidth. So, iterate through connected
  outputs & modes and find a combination of modes those fit
  into the link BW.

v2: -Updated commit msg and description. (Bhanu)
    -Renamed restart with retry. (Bhanu)
    -Moved igt_pipe_crc_new before retry. (Bhanu)
    -Removed unrelated changes and new line. (Bhanu)
    -Minor changes.
v3: Updated discription and added EINVAL check.
v4: Removed EINVAL and ENOSPC checks.
    Added check for DP-MST and 4k panels.
    Updated discription.
v5: Defined 4k display modes globally.
v6: -Removed if loop checks.
    -Added igt override to avoid dp mst bw failure.
v7: Resolved conflict.
v8: Removed igt_display_reset from called function.
v9: Updated commit message and removed redundant code. (Bhanu)

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_display_modes.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index 93d91ef5b..6d7637ffa 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -144,11 +144,6 @@ static void run_extendedmode_basic(data_t *data,
 	int width, height;
 	cairo_t *cr;
 
-	igt_display_reset(display);
-
-	igt_output_set_pipe(output1, pipe1);
-	igt_output_set_pipe(output2, pipe2);
-
 	mode[0] = igt_output_get_mode(output1);
 	mode[1] = igt_output_get_mode(output2);
 
@@ -253,6 +248,9 @@ static void run_extendedmode_test(data_t *data) {
 					igt_output_set_pipe(output1, pipe1);
 					igt_output_set_pipe(output2, pipe2);
 
+					if (!igt_override_all_active_output_modes_to_fit_bw(display))
+						continue;
+
 					if (!i915_pipe_output_combo_valid(display))
 						continue;
 
-- 
2.25.1
