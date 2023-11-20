Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A21E610E089
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Nov 2023 16:13:59 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 20 Nov 2023 21:43:48 +0530
Message-Id: <20231120161348.6093-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] test/intel/xe_guc_pc: Add debug message
 for gt freq
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

v2:
- Add missed freq argument to igt_debug(). [Riana]

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/intel/xe_guc_pc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_guc_pc.c b/tests/intel/xe_guc_pc.c
index fa2f20cca..d0ec0ee49 100644
--- a/tests/intel/xe_guc_pc.c
+++ b/tests/intel/xe_guc_pc.c
@@ -166,6 +166,8 @@ static uint32_t get_freq(int fd, int gt_id, const char *freq_name)
 	while (err == -EAGAIN)
 		err = igt_sysfs_scanf(gt_fd, freq_attr, "%u", &freq);
 
+	igt_debug("gt%d: %s freq %u\n", gt_id, freq_name, freq);
+
 	close(gt_fd);
 	return freq;
 }
-- 
2.25.1
