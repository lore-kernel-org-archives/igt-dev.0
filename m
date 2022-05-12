Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4207E10E877
 for <igt-dev@lists.freedesktop.org>; Thu, 12 May 2022 07:33:27 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 12 May 2022 13:05:49 +0530
Message-Id: <20220512073549.5535-3-nidhi1.gupta@intel.com>
In-Reply-To: <20220512073549.5535-1-nidhi1.gupta@intel.com>
References: <20220512073549.5535-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 2/2] tests/kms_bw: sanitize the system state
 between subtests
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

Before running the subtest we need to sanitize the system state
to default, since we can't trust the state of previous subtest, used
igt_display_reset() to sanitize the state.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_bw.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index 60f87537..adc8bdfb 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -147,6 +147,8 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
 	int i = 0, num_pipes = 0;
 	enum pipe p;
 
+	igt_display_reset(&data->display);
+
 	/* Cannot use igt_display_get_n_pipes() due to fused pipes on i915 where they do
 	 * not give the numver of valid crtcs and always return IGT_MAX_PIPES */
 	for_each_pipe(display, p) num_pipes++;
-- 
2.26.2
