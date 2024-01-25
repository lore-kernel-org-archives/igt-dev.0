Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B9DC47422
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jan 2024 15:41:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12D210F922;
	Thu, 25 Jan 2024 15:41:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA70E10F921
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jan 2024 15:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706197287; x=1737733287;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QGF/hdsBPBK2obZP2GCx0pRY8KZ7sCoe0nuO0Ude1DU=;
 b=MImYx4YxcVFAc/x4XDRySgjQAAP4RHILOzu7d8b2sAVlk7T+CFvjsmtN
 7OZh0KBtfu78Ffd/GaCElzz7TX9Z1GLJ/Z/4xN7zGzBUW5Dm6Ar3nK/ii
 JoevFjqjHMsbVBAIO0r9MPHO2A2WaPtgqJpD4E9Puw7yu285j0a4lBaQM
 olBTgQ6Mf+YimahVElMJEzd/dDr64kaRk9b07wvmmUQFsaddWTc07DMbg
 qX2zluyXmzWbcOEw2dnbLdCSlqRQ/fMvNke8zQXieoXZgFsskR0aR+sAU
 icxBkxAlZ6LUeOjw+EG/xMlVJedh7C8gcRCjAXWycbEM9h+ogjfTOChV/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="20743794"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="20743794"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 07:41:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="35137497"
Received: from anshuma1-desk.iind.intel.com ([10.190.239.112])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 07:41:26 -0800
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v7 1/4] test/xe_pm: Add exit handler to close fw handle
Date: Thu, 25 Jan 2024 21:11:11 +0530
Message-Id: <20240125154114.2164080-2-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240125154114.2164080-1-anshuman.gupta@intel.com>
References: <20240125154114.2164080-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Adding an exit handler to close the fw handle to make sure we don't
leak the fw in CI environment. Adding a IGT subtest group for the
test using the fw handle to runtime wake the device.
Scaling forcewake close exit handler for vram-d3cold-threshold
subtest, while doing so add the missing subtest Functionality
as well.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_pm.c | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 4afe37d93..f793fd24e 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -40,6 +40,7 @@ typedef struct {
 } device_t;
 
 uint64_t orig_threshold;
+int fw_handle = -1;
 
 static void dpms_on_off(device_t device, int mode)
 {
@@ -195,6 +196,14 @@ static bool out_of_d3(device_t device, enum igt_acpi_d_state state)
 	return true;
 }
 
+static void close_fw_handle(int sig)
+{
+	if (fw_handle < 0)
+		return;
+
+	close(fw_handle);
+}
+
 /**
  * SUBTEST: %s-basic
  * Description: set GPU state to %arg[1] and test suspend/autoresume
@@ -411,9 +420,9 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
 	};
 	uint64_t vram_used_mb = 0, vram_total_mb = 0, threshold;
 	uint32_t bo, placement;
-	int handle, i;
 	bool active;
 	void *map;
+	int i;
 
 	igt_require(xe_has_vram(device.fd_xe));
 
@@ -457,10 +466,10 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
 	 * the device from runtime suspend.
 	 * Therefore open and close fw handle to wake the device.
 	 */
-	handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
-	igt_assert(handle >= 0);
+	fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
+	igt_assert(fw_handle >= 0);
 	active = igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE;
-	close(handle);
+	close(fw_handle);
 	igt_assert(active);
 
 	/* Test D3Cold again after freeing up the Xe BO */
@@ -570,11 +579,18 @@ igt_main
 		}
 	}
 
-	igt_describe("Validate whether card is limited to d3hot, if vram used > vram threshold");
-	igt_subtest("vram-d3cold-threshold") {
-		orig_threshold = get_vram_d3cold_threshold(sysfs_fd);
-		igt_install_exit_handler(vram_d3cold_threshold_restore);
-		test_vram_d3cold_threshold(device, sysfs_fd);
+	igt_subtest_group {
+		igt_fixture {
+			igt_install_exit_handler(close_fw_handle);
+		}
+
+		igt_describe("Validate whether card is limited to d3hot,"
+			     "if vram used > vram threshold");
+		igt_subtest("vram-d3cold-threshold") {
+			orig_threshold = get_vram_d3cold_threshold(sysfs_fd);
+			igt_install_exit_handler(vram_d3cold_threshold_restore);
+			test_vram_d3cold_threshold(device, sysfs_fd);
+		}
 	}
 
 	igt_fixture {
-- 
2.25.1

