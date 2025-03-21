Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3F2C36005
	for <igt-dev@archiver.kernel.org>; Fri, 21 Mar 2025 17:33:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D8110E7F1;
	Fri, 21 Mar 2025 17:33:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l9duzpdr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D673910E7F1
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Mar 2025 17:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742578398; x=1774114398;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7QRRWZHXQe8VKQe15k0wrSCfj8Qw8BjwHpUVPP0D+gY=;
 b=l9duzpdrx8skWeTWjhmi1bY+BWGYDFIZHeKRGLMUh+lHSWCBW9aLRMIh
 16cPMtJ+zlEXD/3R/fDFxtOq8SMnYvFbUsFNyNBbRcmttj+IQPq4JFgFi
 S6aiI6TxILxLZ0eePee3lRCeSk91NocX/ogWcz/LlB4WC4SJdUl/dGA5E
 UAF20kDsbsS9fIK/lsbeK5hgeLF46fokMhEoxAxqq4C81UATG24j4f79z
 SAGumisIRz2h2/FEM06KuiVsTx1mnsKCACB2Vn4Ov9ZLJn/kX78kGV16m
 V9Uj+lBPQvhLW1qbU0dw4HWAdvor32/pHGz1cVpLFtO61PmquRurxHTwD Q==;
X-CSE-ConnectionGUID: KlR0szSTTgO8UZKycjV+sA==
X-CSE-MsgGUID: WUe/enu3TXisG7ubqyKajw==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="66316332"
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; d="scan'208";a="66316332"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 10:33:17 -0700
X-CSE-ConnectionGUID: Qj1m98OoTze+tNGigHoSpg==
X-CSE-MsgGUID: GNWPrr/NQQ693RK7uaK3yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; d="scan'208";a="154464099"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa001.fm.intel.com with ESMTP; 21 Mar 2025 10:33:14 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 heikki.krogerus@linux.intel.com
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH i-g-t v1] tests/intel/xe_pm: Introduce i2c subtests
Date: Fri, 21 Mar 2025 23:02:05 +0530
Message-Id: <20250321173205.40076-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Introduce subtests for i2c adapter which is used to control on-board
OEM sensors on selected devices. This will test D3hot/D3cold transition
after i2c adapter access for the devices that support it.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 tests/intel/xe_pm.c | 95 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 19b0d5ef7..233e63d17 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -11,12 +11,18 @@
  * Test category: functionality test
  */
 
+#include <dirent.h>
 #include <limits.h>
 #include <fcntl.h>
 #include <string.h>
+#include <sys/ioctl.h>
+
+#include <linux/i2c-dev.h>
+#include <linux/i2c.h>
 
 #include "igt.h"
 #include "lib/igt_device.h"
+#include "lib/igt_kmod.h"
 #include "lib/igt_pm.h"
 #include "lib/igt_sysfs.h"
 #include "lib/igt_syncobj.h"
@@ -774,6 +780,88 @@ static void test_mocs_suspend_resume(device_t device, enum igt_suspend_state s_s
 	}
 }
 
+static int find_i2c_index(device_t device, int sysfs_fd)
+{
+	int adapter_fd, i2c_index = -1;
+	struct dirent *dirent;
+	char adapter[32];
+	DIR *dir;
+
+	/* Make sure the /dev/i2c-* files exist */
+	igt_require(igt_kmod_load("i2c-dev", NULL) == 0);
+
+	snprintf(adapter, sizeof(adapter) - 1, "%s.%hu", "device/i2c_designware",
+		 (device.pci_xe->bus << 8) | (device.pci_xe->dev));
+	adapter_fd = openat(sysfs_fd, adapter, O_RDONLY);
+	igt_require_fd(adapter_fd);
+
+	dir = fdopendir(adapter_fd);
+	igt_assert(dir);
+
+	/* Find the i2c device node index */
+	while ((dirent = readdir(dir))) {
+		if (strncmp(dirent->d_name, "i2c-", 4) == 0) {
+			sscanf(dirent->d_name, "i2c-%d", &i2c_index);
+			break;
+		}
+	}
+
+	closedir(dir);
+	close(adapter_fd);
+	return i2c_index;
+}
+
+/**
+ * SUBTEST: %s-i2c
+ * Description:
+ * 	Validate whether the device is able to suspend after i2c adapter access.
+ * Functionality: pm-d3
+ * GPU requirements: D3 feature should be supported
+ *
+ * arg[1]:
+ *
+ * @d3hot:	d3hot
+ * @d3cold:	d3cold
+ */
+static bool i2c_test(device_t device, int sysfs_fd)
+{
+	/* AMC slave details */
+	uint8_t addr = 0x40, reg = 0x0, buf;
+	int i2c_index, i2c_fd;
+	char i2c_dev[16];
+	struct i2c_msg msgs[] = {
+		{
+			.addr = addr,
+			.flags = 0,
+			.len = sizeof(reg),
+			.buf = &reg,
+		}, {
+			.addr = addr,
+			.flags = I2C_M_RD,
+			.len = sizeof(buf),
+			.buf = &buf,
+		}
+	};
+	struct i2c_rdwr_ioctl_data msgset = {
+		.msgs = msgs,
+		.nmsgs = ARRAY_SIZE(msgs),
+	};
+
+	i2c_index = find_i2c_index(device, sysfs_fd);
+	igt_assert(i2c_index >= 0);
+
+	snprintf(i2c_dev, sizeof(i2c_dev) - 1, "/dev/i2c-%hhd", i2c_index);
+	i2c_fd = open(i2c_dev, O_RDWR);
+	igt_assert_fd(i2c_fd);
+
+	/* Perform an i2c transaction to trigger adapter wake */
+	igt_info("Accessing slave 0x%hhx on %s\n", addr, i2c_dev);
+	igt_assert(igt_ioctl(i2c_fd, I2C_RDWR, &msgset) >= 0);
+
+	close(i2c_fd);
+	return true;
+}
+
 igt_main
 {
 	device_t device;
@@ -881,6 +969,13 @@ igt_main
 			cleanup_d3(device);
 		}
 
+		igt_subtest_f("%s-i2c", d->name) {
+			igt_assert(setup_d3(device, d->state));
+			igt_assert(i2c_test(device, sysfs_fd));
+			igt_assert(in_d3(device, d->state));
+			cleanup_d3(device);
+		}
+
 		igt_subtest_f("%s-multiple-execs", d->name) {
 			igt_assert(setup_d3(device, d->state));
 			test_exec(device, 16, 32, NO_SUSPEND, d->state, 0);
-- 
2.34.1

