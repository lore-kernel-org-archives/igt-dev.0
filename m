Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19CE710E1E1
 for <igt-dev@lists.freedesktop.org>; Fri, 20 May 2022 01:09:52 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 20 May 2022 06:42:26 +0530
Message-Id: <20220520011226.24017-3-nidhi1.gupta@intel.com>
In-Reply-To: <20220520011226.24017-1-nidhi1.gupta@intel.com>
References: <20220520011226.24017-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 2/2] tests/kms_invalid_mode: sanitize the system
 state between subtests
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
 tests/kms_invalid_mode.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
index bb524037..8115f7fd 100644
--- a/tests/kms_invalid_mode.c
+++ b/tests/kms_invalid_mode.c
@@ -222,6 +222,7 @@ test_output(data_t *data)
 
 static void test(data_t *data)
 {
+	igt_display_reset(&data->display);
 	int valid_connectors = 0;
 
 	for_each_connected_output(&data->display, data->output) {
-- 
2.26.2
