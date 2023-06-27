Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D54DF10E31B
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jun 2023 19:02:01 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 28 Jun 2023 00:25:28 +0530
Message-Id: <20230627185528.2498910-1-mohammed.thasleem@intel.com>
In-Reply-To: <20230625183436.14150-1-mohammed.thasleem@intel.com>
References: <20230625183436.14150-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v4 1/2] tests/kms_display_modes: Fixed mode
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

Added check on DP-MST and 4k panels when two moniters connected
through MST.
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

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_display_modes.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index 93d91ef5..4bebb25e 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -144,8 +144,6 @@ static void run_extendedmode_basic(data_t *data,
 	int width, height;
 	cairo_t *cr;
 
-	igt_display_reset(display);
-
 	igt_output_set_pipe(output1, pipe1);
 	igt_output_set_pipe(output2, pipe2);
 
@@ -253,6 +251,9 @@ static void run_extendedmode_test(data_t *data) {
 					igt_output_set_pipe(output1, pipe1);
 					igt_output_set_pipe(output2, pipe2);
 
+					if (!igt_override_all_active_output_modes_to_fit_bw(display))
+						continue;
+
 					if (!i915_pipe_output_combo_valid(display))
 						continue;
 
-- 
2.25.1
