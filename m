Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3012DC83F17
	for <igt-dev@archiver.kernel.org>; Mon, 28 Jul 2025 16:14:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D488A10E533;
	Mon, 28 Jul 2025 16:14:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hrnzbz/0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DFD610E533
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Jul 2025 16:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753719248; x=1785255248;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3k9fD/S8DeOQeA8wYm7ZyC4h/ouk9l3abU39DOrbASM=;
 b=Hrnzbz/0xPFha9SHBDK0QPkGSe2Sko/at9eTkPqGJ7jGha5ea9c9NPjM
 AOjzFF8e6U20YOmQScH3FgU7vpszCd424jSIa5ngrTzC0IzkY5BoTN3yR
 RDQsVAAFwFROncWnTl9Hau2bFPcuKkw49OwkS9VJ+V7xe68Y4cRVnasbS
 AwLpePJdVdMsrOlxWlK2bkvLLGFouVZG7RLflJP/rgHG/OpPBp4V3zz6X
 ROeaRrmv4MxsKQgWbYzfQ1vTGkvbIRJdztn0yDrjhn9fkuPM3VCf3PKff
 5xhMdY+vl8p3FkHypv+bkDIYgirowS0qN39mZ90LEE9HAx7ZfIfSSo4t4 g==;
X-CSE-ConnectionGUID: LGnEKwjyTeGO3Ct1kMKt6g==
X-CSE-MsgGUID: 0JLGfHY8RNG1qH1UTXVL5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="59794669"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="59794669"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 09:14:08 -0700
X-CSE-ConnectionGUID: bhI4E9k3Ruix2UpYSPiW2w==
X-CSE-MsgGUID: sN3cdFUeQBedAOq5xyxcYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="166660190"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa003.jf.intel.com with ESMTP; 28 Jul 2025 09:14:05 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 heikki.krogerus@linux.intel.com, karthik.poosa@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH i-g-t v4] tests/intel/xe_pm: Introduce i2c subtests
Date: Mon, 28 Jul 2025 21:43:24 +0530
Message-Id: <20250728161324.95116-1-raag.jadav@intel.com>
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
before and after i2c adapter access for the devices that support it.

v2: Define macros for AMC constants (Lucas)
    s/index/adapter (Lucas)
v3: Wait for runtime suspend before ioctl (Anshuman)
    Make i2c_test() void (Riana)
    Fix test description (Riana)
v4: Assert on wait for runtime suspend timeout

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Acked-by: Karthik Poosa <karthik.poosa@intel.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 tests/intel/xe_pm.c | 101 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 16b5fc686..a7108cd77 100644
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
@@ -38,6 +44,10 @@
 #define PREFETCH (0x1 << 1)
 #define UNBIND_ALL (0x1 << 2)
 
+/* AMC slave details */
+#define I2C_AMC_ADDR	0x40
+#define I2C_AMC_REG	0x00
+
 enum mem_op {
 	READ,
 	WRITE,
@@ -779,6 +789,90 @@ static void test_mocs_suspend_resume(device_t device, enum igt_suspend_state s_s
 	}
 }
 
+static int find_i2c_adapter(device_t device, int sysfs_fd)
+{
+	int adapter_fd, i2c_adapter = -1;
+	struct dirent *dirent;
+	char adapter[32];
+	DIR *dir;
+
+	/* Make sure the /dev/i2c-* files exist */
+	igt_require(igt_kmod_load("i2c-dev", NULL) == 0);
+
+	snprintf(adapter, sizeof(adapter), "%s.%hu", "device/i2c_designware",
+		 (device.pci_xe->bus << 8) | (device.pci_xe->dev));
+	adapter_fd = openat(sysfs_fd, adapter, O_RDONLY);
+	igt_require_fd(adapter_fd);
+
+	dir = fdopendir(adapter_fd);
+	igt_assert(dir);
+
+	/* Find the i2c adapter */
+	while ((dirent = readdir(dir))) {
+		if (strncmp(dirent->d_name, "i2c-", 4) == 0) {
+			sscanf(dirent->d_name, "i2c-%d", &i2c_adapter);
+			break;
+		}
+	}
+
+	closedir(dir);
+	close(adapter_fd);
+	return i2c_adapter;
+}
+
+/**
+ * SUBTEST: %s-i2c
+ * Description:
+ * 	Validate whether the device is able to runtime suspend before and after
+ * 	i2c adapter access.
+ * Functionality: pm-d3
+ * GPU requirements: D3 feature should be supported
+ *
+ * arg[1]:
+ *
+ * @d3hot:	d3hot
+ * @d3cold:	d3cold
+ */
+static void i2c_test(device_t device, int sysfs_fd)
+{
+	uint8_t addr = I2C_AMC_ADDR, reg = I2C_AMC_REG, buf;
+	int i2c_adapter, i2c_fd;
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
+	i2c_adapter = find_i2c_adapter(device, sysfs_fd);
+	igt_assert_lte(0, i2c_adapter);
+
+	snprintf(i2c_dev, sizeof(i2c_dev), "/dev/i2c-%hd", i2c_adapter);
+	i2c_fd = open(i2c_dev, O_RDWR);
+	igt_assert_fd(i2c_fd);
+
+	/* Make sure open() doesn't cause runtime resume */
+	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+
+	/* Perform an i2c transaction to trigger adapter wake */
+	igt_info("Accessing slave 0x%hhx on %s\n", addr, i2c_dev);
+	igt_assert_lte(0, igt_ioctl(i2c_fd, I2C_RDWR, &msgset));
+
+	close(i2c_fd);
+}
+
 igt_main
 {
 	device_t device;
@@ -889,6 +983,13 @@ igt_main
 			cleanup_d3(device);
 		}
 
+		igt_subtest_f("%s-i2c", d->name) {
+			igt_assert(setup_d3(device, d->state));
+			i2c_test(device, sysfs_fd);
+			igt_assert(in_d3(device, d->state));
+			cleanup_d3(device);
+		}
+
 		igt_subtest_f("%s-multiple-execs", d->name) {
 			igt_assert(setup_d3(device, d->state));
 			test_exec(device, 16, 32, NO_SUSPEND, d->state, 0);
-- 
2.34.1

