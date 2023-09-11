Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C70B910E2E0
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Sep 2023 12:23:03 +0000 (UTC)
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 11 Sep 2023 15:22:56 +0300
Message-Id: <20230911122256.30665-3-stanislav.lisovskiy@intel.com>
In-Reply-To: <20230911122256.30665-1-stanislav.lisovskiy@intel.com>
References: <20230911122256.30665-1-stanislav.lisovskiy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 2/2] tests/intel/i915_pipe_stress: Use only first
 pipe if Bigjoiner is used
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: juha-pekka.heikkila@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

We currently are having test failures for Bigjoiner, because that
test tries to use all pipes simultaneously, not realizing that
if we use a Bigjoiner mode on pipe A, the adjacent pipe won't be
available.
For now just fix it by using only one pipe, if resolution > 3840
is detected.

Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
---
 tests/intel/i915_pipe_stress.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/intel/i915_pipe_stress.c b/tests/intel/i915_pipe_stress.c
index 007d3a1159..681cefa8aa 100644
--- a/tests/intel/i915_pipe_stress.c
+++ b/tests/intel/i915_pipe_stress.c
@@ -590,6 +590,12 @@ static void stress_pipes(struct data *data, struct timespec *start,
 		igt_pipe_crc_stop(data->pipe_crc[pipe]);
 		igt_assert_crc_equal(&crc, &crc2);
 
+		/*
+		 * Do not try to use other pipes, if Bigjoiner is used
+		 */
+		if (data->highest_mode[pipe]->hdisplay > 3840)
+			break;
+
 		++pipe;
 	}
 }
-- 
2.37.3
