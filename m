Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4030C3ABBE
	for <igt-dev@archiver.kernel.org>; Thu,  8 May 2025 09:51:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6532010E37B;
	Thu,  8 May 2025 09:51:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VWpJKwCX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61B5810E37B
 for <igt-dev@lists.freedesktop.org>; Thu,  8 May 2025 09:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746697876; x=1778233876;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nVP81E0+YzvYgLP316BS8JM3YwPLXsQI3xn0ugBJCBo=;
 b=VWpJKwCXw976ntbSj0o0Sf/7/zuWGu4VG0WehTFZ3szu39H3Dbe1Biok
 WiBbNPONmYqtJej2ZAXZNqEHbzZ6w6/0CiI32sQ/BfgArV09VBJdUiUPJ
 BS15ETNij6Y1OPJAnQpWENprzLeoXyr0SSYGqlCLdu1IRm30cSlzkJpYo
 46sllC4fDdNVrZgSWCbY2mMCnOOMiZKlhmCBs0/jWyH4daziNgDAX7nGJ
 zFlyj5xkFuDxuOvwyl1WEItk93SaWYqNOfhKxmBdfaNK43SYuj/zDMTYi
 69FSLWqf4a/DQOdTaV2k/q0Wuk6s3FwwIL6GR1Q06UYt9xTK/g4xLfrGB Q==;
X-CSE-ConnectionGUID: q4RI5y/7SiO2pYAoc66KAw==
X-CSE-MsgGUID: eKwfZdCRTkWI3nvz21Bbaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48619278"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="48619278"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 02:51:16 -0700
X-CSE-ConnectionGUID: Byj4Oxs/Q6u78bMANgFYew==
X-CSE-MsgGUID: 03/gjvZvTY+vrYqKVUJ8yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="141452802"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.101.99])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 02:51:14 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH i-g-t] tests/core_hotunplug: Add
 exec-no-cleanup-hotunbind-rebind subtest
Date: Thu,  8 May 2025 11:51:04 +0200
Message-Id: <20250508095104.712844-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

Add a new subtest to verify driver behavior when unbinding an open
device with active user handles and no explicit exec cleanup. The test
opens a DRM device, submits a basic workload (currently Xe driver only),
and unbinds the device while handles are still open. After cleanup, the
device is rebound and checked for health.

This validates robustness of the driver across unbind/rebind cycles
under realistic open-handle conditions.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 tests/core_hotunplug.c | 70 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 18e9dfc34..5d25602a4 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -39,6 +39,10 @@
 #include "igt_kmod.h"
 #include "igt_sysfs.h"
 #include "sw_sync.h"
+#include "xe_drm.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_spin.h"
+
 /**
  * TEST: core hotunplug
  * Description: Examine behavior of a driver on device hot unplug
@@ -69,6 +73,10 @@
  * Description: Check if the driver can be cleanly unbound from an open device,
  *		then released and rebound
  *
+ * SUBTEST: exec-no-cleanup-hotunbind-rebind
+ * Description: Check if the driver can be cleanly unbound from an open device
+ *		with open handles, then released and rebound
+ *
  * SUBTEST: hotunplug-rescan
  * Description: Check if an open device can be cleanly unplugged, then released
  *		and restored
@@ -596,6 +604,56 @@ static void hotunbind_rebind(struct hotunplug *priv)
 	igt_assert_f(healthcheck(priv, false), "%s\n", priv->failure);
 }
 
+#define FLAG_SKIP_EXEC_CLEANUP 1
+
+static void
+simple_xe_exec(int fd, struct drm_xe_engine_class_instance *eci, unsigned int test_flags)
+{
+	uint32_t vm;
+	struct xe_cork *cork;
+
+	vm = xe_vm_create(fd, 0, 0);
+	cork = xe_cork_create_opts(fd, eci, vm, 1, 1);
+	xe_cork_sync_start(fd, cork);
+	usleep(1000);
+	xe_cork_sync_end(fd, cork);
+
+	if (test_flags & FLAG_SKIP_EXEC_CLEANUP)
+		return;
+
+	if (cork)
+		xe_cork_destroy(fd, cork);
+
+	xe_vm_destroy(fd, vm);
+}
+
+static void simple_exec(struct hotunplug *priv, unsigned int test_flags)
+{
+	if (priv->chipset != DRIVER_XE)
+		return;
+
+	igt_assert_fd(priv->fd.drm);
+	simple_xe_exec(priv->fd.drm, &xe_engine(priv->fd.drm, 0)->instance, test_flags);
+}
+
+static void exec_hotunbind_rebind(struct hotunplug *priv, unsigned int test_flags)
+{
+	pre_check(priv);
+
+	priv->fd.drm = local_drm_open_driver(false, "", " for exec and hot unbind");
+
+	simple_exec(priv, test_flags);
+
+	driver_unbind(priv, "hot ", 0);
+
+	priv->fd.drm = close_device(priv->fd.drm, "late ", "unbound ");
+	igt_assert_eq(priv->fd.drm, -1);
+
+	driver_bind(priv, 0);
+
+	igt_assert_f(healthcheck(priv, false), "%s\n", priv->failure);
+}
+
 static void hotunplug_rescan(struct hotunplug *priv)
 {
 	pre_check(priv);
@@ -748,6 +806,18 @@ igt_main
 			recover(&priv);
 	}
 
+	igt_fixture
+		post_healthcheck(&priv);
+
+	igt_subtest_group {
+		igt_describe("Check if the driver can be cleanly unbound from an open device with open handles, then released and rebound");
+		igt_subtest("exec-no-cleanup-hotunbind-rebind")
+			exec_hotunbind_rebind(&priv, FLAG_SKIP_EXEC_CLEANUP);
+
+		igt_fixture
+			recover(&priv);
+	}
+
 	igt_fixture
 		post_healthcheck(&priv);
 
-- 
2.31.1

