Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DDAD10E085
 for <igt-dev@lists.freedesktop.org>; Sun, 25 Jun 2023 18:34:57 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 26 Jun 2023 00:04:36 +0530
Message-Id: <20230625183436.14150-1-mohammed.thasleem@intel.com>
In-Reply-To: <20230607115333.55940-2-mohammed.thasleem@intel.com>
References: <20230607115333.55940-2-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 1/2] tests/kms_display_modes: Fixed mode
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

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_display_modes.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index 93d91ef5..17cb66df 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -253,6 +253,9 @@ static void run_extendedmode_test(data_t *data) {
 					igt_output_set_pipe(output1, pipe1);
 					igt_output_set_pipe(output2, pipe2);
 
+					if (!igt_override_all_active_output_modes_to_fit_bw(display))
+						continue;
+
 					if (!i915_pipe_output_combo_valid(display))
 						continue;
 
-- 
2.34.1
