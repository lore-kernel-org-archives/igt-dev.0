Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C604B10E9C1
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Sep 2022 08:53:11 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  8 Sep 2022 14:18:45 +0530
Message-Id: <20220908084845.4102-3-nidhi1.gupta@intel.com>
In-Reply-To: <20220908084845.4102-1-nidhi1.gupta@intel.com>
References: <20220908084845.4102-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 2/2] tests/kms_writeback: Test cleanup
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

Sanitize the system state before starting the subtest.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_writeback.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 2c5421ce..79a5760f 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -186,6 +186,7 @@ static int do_writeback_test(igt_output_t *output, uint32_t fb_id,
 {
 	int ret;
 	igt_display_t *display = output->display;
+	igt_display_reset(display);
 	struct kmstest_connector_config *config = &output->config;
 
 	igt_output_set_prop_value(output, IGT_CONNECTOR_CRTC_ID, config->crtc->crtc_id);
-- 
2.36.0
