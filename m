Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED6510E00C
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Nov 2023 13:55:43 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 20 Nov 2023 19:23:44 +0530
Message-Id: <20231120135344.4182454-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] test/intel/xe_guc_pc: Add debug message for
 gt freq
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

Adding a igt_debug() message for gt freq, it will be
useful to debug the xe_guc_pc igt test failures.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/intel/xe_guc_pc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_guc_pc.c b/tests/intel/xe_guc_pc.c
index fa2f20cca..37c6fd9e0 100644
--- a/tests/intel/xe_guc_pc.c
+++ b/tests/intel/xe_guc_pc.c
@@ -166,6 +166,8 @@ static uint32_t get_freq(int fd, int gt_id, const char *freq_name)
 	while (err == -EAGAIN)
 		err = igt_sysfs_scanf(gt_fd, freq_attr, "%u", &freq);
 
+	igt_debug("gt%d: %s freq\n", gt_id, freq_name);
+
 	close(gt_fd);
 	return freq;
 }
-- 
2.25.1
