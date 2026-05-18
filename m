Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16627CD4F3C
	for <igt-dev@archiver.kernel.org>; Mon, 18 May 2026 11:26:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B647010E7C6;
	Mon, 18 May 2026 11:26:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j99vg3lG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0B810E7C6
 for <igt-dev@lists.freedesktop.org>; Mon, 18 May 2026 11:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779103566; x=1810639566;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=P25rVu9nZ1rhJTtvHCR+tpR/uMd6zST/uoMfuxJKchE=;
 b=j99vg3lGWnD9vq222+vqoQll8/NcVycmUy2Oj5YZQccgKH+8Ba0YqOQK
 VT+mBvmQN+Cywfd8P993DDuCWUwELcNQ+PUkqcuD8yf6AE+nyACnWp8JP
 WjYNyjjYjzdp5tcK/PA5+/nIBt5JrjMen/MJxtuqAZ81JJlZbLsIwBwTm
 XlWgeImXd/crz3csfaJzJYBzEwaqlQhHudhP9EkBQsibhqPU+bWtjtdtx
 N7uouJW7API2YouI2ohPseF/M5llwv+cd+e06gdjSkNlHnbkjq+safsU7
 ThS52ru1v+NmrZC5/v+BKYgMiFMRaXia8zcfKU7vtMwp0WHYQ507OW4Ta A==;
X-CSE-ConnectionGUID: Iyd+CboRSPilBsVSRtrRnw==
X-CSE-MsgGUID: dFXOrLfZSdiXVGQ3/yvm6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="83805733"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="83805733"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 04:26:05 -0700
X-CSE-ConnectionGUID: QWyYXxoiSIWoE7nCRT7ZPw==
X-CSE-MsgGUID: 7C3OZh4wSMSkhyJtH6pjHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="239655821"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by orviesa007.jf.intel.com with ESMTP; 18 May 2026 04:26:02 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: igt-dev@lists.freedesktop.org, janusz.krzysztofik@linux.intel.com,
 kamil.konieczny@linux.intel.com
Cc: matthew.auld@intel.com,
	nitin.r.gote@intel.com
Subject: [PATCH] tests/core_hotunplug: add *-with-load subtests exercising GPU
 workload during hotplug
Date: Mon, 18 May 2026 17:31:34 +0530
Message-ID: <20260518120133.5651-2-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The six fd-holding hot* subtests keep a DRM fd open across unbind/unplug
but leave the GPU idle, so the kernel hotplug path is never exercised
against an active VM, exec queue and BOs.

Add six new dedicated *-with-load subtests that run a GPU spinner across
the unbind/unplug sequence so the device is removed while a workload is
actively using it.

The workload helpers use an explicit chipset dispatch block in
workload_start()/stop() so that other vendors can contribute
support by adding an else-if branch. New subtests are gated on
workload_available(), which currently covers DRIVER_XE and DRIVER_INTEL,
and returns false (SKIP) on any other driver.

igt_spin_free() is avoided in workload_stop() since the device may be
gone by then — igt_spin_end() writes the stop condition via a userspace
mmap and lets the DRM fd close reclaim kernel-side resources.

Validated on BMG and DG2 with a KASAN-enabled kernel:
all six new subtests pass with no KASAN reports.

v2: Pass the hotunplug priv struct to workload_start()/stop()
    and dispatch via an explicit if/else-if chipset block to invite
    other vendors to contribute. (Janusz)

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Assisted-by: Copilot:claude-opus-4.7
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 tests/core_hotunplug.c | 290 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 290 insertions(+)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 7c9dae1bf..38dcbb97d 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -80,6 +80,34 @@
  * SUBTEST: unplug-rescan
  * Description: Check if a device believed to be closed can be cleanly
  *		unplugged, then restored
+ *
+ * SUBTEST: hotunbind-rebind-with-load
+ * Description: Check if the driver can be cleanly unbound from an open device
+ *		with a background GPU workload in flight, then released and
+ *		rebound
+ *
+ * SUBTEST: hotunplug-rescan-with-load
+ * Description: Check if an open device with a background GPU workload in
+ *		flight can be cleanly unplugged, then released and restored
+ *
+ * SUBTEST: hotrebind-with-load
+ * Description: Check if the driver can be cleanly rebound to a device with a
+ *		still open hot unbound driver instance while a background GPU
+ *		workload is in flight
+ *
+ * SUBTEST: hotreplug-with-load
+ * Description: Check if a hot unplugged and still open device can be cleanly
+ *		restored while a background GPU workload is in flight
+ *
+ * SUBTEST: hotrebind-lateclose-with-load
+ * Description: Check if a hot unbound driver instance still open after hot
+ *		rebind with a background GPU workload in flight can be cleanly
+ *		released
+ *
+ * SUBTEST: hotreplug-lateclose-with-load
+ * Description: Check if an instance of a still open while hot replugged
+ *		device with a background GPU workload in flight can be cleanly
+ *		released
  */
 
 IGT_TEST_DESCRIPTION("Examine behavior of a driver on device hot unplug");
@@ -565,6 +593,52 @@ static void set_filter_from_device(int fd)
 	igt_assert_eq(igt_device_filter_add(filter), 1);
 }
 
+/* GPU workload helpers */
+
+struct gpu_workload {
+	igt_spin_t *spin;
+	uint64_t ahnd;
+};
+
+static bool workload_available(int chipset)
+{
+	return chipset == DRIVER_XE || chipset == DRIVER_INTEL;
+}
+
+static void workload_start(struct hotunplug *priv, int fd,
+			   struct gpu_workload *w)
+{
+	if (priv->chipset == DRIVER_XE || priv->chipset == DRIVER_INTEL) {
+		local_debug("%s\n", "starting GPU spinner");
+		priv->failure = "GPU workload start failure!";
+		w->ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
+		w->spin = igt_spin_new(fd, .ahnd = w->ahnd);
+		priv->failure = NULL;
+	}
+}
+
+static void workload_stop(struct hotunplug *priv, struct gpu_workload *w)
+{
+	if (priv->chipset == DRIVER_XE || priv->chipset == DRIVER_INTEL) {
+		if (!w->spin)
+			return;
+
+		/*
+		 * The device may be gone (unbind/unplug), so avoid
+		 * igt_spin_free(): on Xe it would wait forever on a syncobj
+		 * that never signals; on i915 it would touch the dead fd via
+		 * gem_munmap()/gem_close(). Instead, end the spinner via a
+		 * userspace mmap write and let the DRM fd close reclaim the
+		 * kernel-side resources.
+		 */
+		local_debug("%s\n", "stopping GPU spinner");
+		igt_spin_end(w->spin);
+		put_ahnd(w->ahnd);
+		w->spin = NULL;
+		w->ahnd = 0;
+	}
+}
+
 /* Subtests */
 
 static void unbind_rebind(struct hotunplug *priv)
@@ -679,6 +753,150 @@ static void hotreplug_lateclose(struct hotunplug *priv)
 	igt_assert_f(healthcheck(priv, false), "%s\n", priv->failure);
 }
 
+static void hotunbind_rebind_with_load(struct hotunplug *priv)
+{
+	struct gpu_workload w = { 0 };
+
+	pre_check(priv);
+
+	igt_require_f(workload_available(priv->chipset),
+		      "No GPU workload support for this driver\n");
+
+	priv->fd.drm = local_drm_open_driver(false, "", " for hot unbind");
+
+	workload_start(priv, priv->fd.drm, &w);
+
+	driver_unbind(priv, "hot ", 0);
+
+	workload_stop(priv, &w);
+
+	priv->fd.drm = close_device(priv->fd.drm, "late ", "unbound ");
+	igt_assert_eq(priv->fd.drm, -1);
+
+	driver_bind(priv, 0);
+
+	igt_assert_f(healthcheck(priv, false), "%s\n", priv->failure);
+}
+
+static void hotunplug_rescan_with_load(struct hotunplug *priv)
+{
+	struct gpu_workload w = { 0 };
+
+	pre_check(priv);
+
+	igt_require_f(workload_available(priv->chipset),
+		      "No GPU workload support for this driver\n");
+
+	priv->fd.drm = local_drm_open_driver(false, "", " for hot unplug");
+
+	workload_start(priv, priv->fd.drm, &w);
+
+	device_unplug(priv, "hot ", 0);
+
+	workload_stop(priv, &w);
+
+	priv->fd.drm = close_device(priv->fd.drm, "late ", "removed ");
+	igt_assert_eq(priv->fd.drm, -1);
+
+	bus_rescan(priv, 0);
+
+	igt_assert_f(healthcheck(priv, false), "%s\n", priv->failure);
+}
+
+static void hotrebind_with_load(struct hotunplug *priv)
+{
+	struct gpu_workload w = { 0 };
+
+	pre_check(priv);
+
+	igt_require_f(workload_available(priv->chipset),
+		      "No GPU workload support for this driver\n");
+
+	priv->fd.drm = local_drm_open_driver(false, "", " for hot rebind");
+
+	workload_start(priv, priv->fd.drm, &w);
+
+	driver_unbind(priv, "hot ", 60);
+
+	driver_bind(priv, 0);
+
+	workload_stop(priv, &w);
+
+	igt_assert_f(healthcheck(priv, false), "%s\n", priv->failure);
+}
+
+static void hotreplug_with_load(struct hotunplug *priv)
+{
+	struct gpu_workload w = { 0 };
+
+	pre_check(priv);
+
+	igt_require_f(workload_available(priv->chipset),
+		      "No GPU workload support for this driver\n");
+
+	priv->fd.drm = local_drm_open_driver(false, "", " for hot replug");
+
+	workload_start(priv, priv->fd.drm, &w);
+
+	device_unplug(priv, "hot ", 60);
+
+	bus_rescan(priv, 0);
+
+	workload_stop(priv, &w);
+
+	igt_assert_f(healthcheck(priv, false), "%s\n", priv->failure);
+}
+
+static void hotrebind_lateclose_with_load(struct hotunplug *priv)
+{
+	struct gpu_workload w = { 0 };
+
+	pre_check(priv);
+
+	igt_require_f(workload_available(priv->chipset),
+		      "No GPU workload support for this driver\n");
+
+	priv->fd.drm = local_drm_open_driver(false, "", " for hot rebind");
+
+	workload_start(priv, priv->fd.drm, &w);
+
+	driver_unbind(priv, "hot ", 60);
+
+	driver_bind(priv, 0);
+
+	workload_stop(priv, &w);
+
+	priv->fd.drm = close_device(priv->fd.drm, "late ", "unbound ");
+	igt_assert_eq(priv->fd.drm, -1);
+
+	igt_assert_f(healthcheck(priv, false), "%s\n", priv->failure);
+}
+
+static void hotreplug_lateclose_with_load(struct hotunplug *priv)
+{
+	struct gpu_workload w = { 0 };
+
+	pre_check(priv);
+
+	igt_require_f(workload_available(priv->chipset),
+		      "No GPU workload support for this driver\n");
+
+	priv->fd.drm = local_drm_open_driver(false, "", " for hot replug");
+
+	workload_start(priv, priv->fd.drm, &w);
+
+	device_unplug(priv, "hot ", 60);
+
+	bus_rescan(priv, 0);
+
+	workload_stop(priv, &w);
+
+	priv->fd.drm = close_device(priv->fd.drm, "late ", "removed ");
+	igt_assert_eq(priv->fd.drm, -1);
+
+	igt_assert_f(healthcheck(priv, false), "%s\n", priv->failure);
+}
+
 /* Main */
 
 int igt_main()
@@ -817,6 +1035,78 @@ int igt_main()
 			recover(&priv);
 	}
 
+	igt_fixture()
+		post_healthcheck(&priv);
+
+	igt_subtest_group() {
+		igt_describe("Check if the driver can be cleanly unbound from an open device with a background GPU workload in flight, then released and rebound");
+		igt_subtest("hotunbind-rebind-with-load")
+			hotunbind_rebind_with_load(&priv);
+
+		igt_fixture()
+			recover(&priv);
+	}
+
+	igt_fixture()
+		post_healthcheck(&priv);
+
+	igt_subtest_group() {
+		igt_describe("Check if an open device with a background GPU workload in flight can be cleanly unplugged, then released and restored");
+		igt_subtest("hotunplug-rescan-with-load")
+			hotunplug_rescan_with_load(&priv);
+
+		igt_fixture()
+			recover(&priv);
+	}
+
+	igt_fixture()
+		post_healthcheck(&priv);
+
+	igt_subtest_group() {
+		igt_describe("Check if the driver can be cleanly rebound to a device with a still open hot unbound driver instance while a background GPU workload is in flight");
+		igt_subtest("hotrebind-with-load")
+			hotrebind_with_load(&priv);
+
+		igt_fixture()
+			recover(&priv);
+	}
+
+	igt_fixture()
+		post_healthcheck(&priv);
+
+	igt_subtest_group() {
+		igt_describe("Check if a hot unplugged and still open device can be cleanly restored while a background GPU workload is in flight");
+		igt_subtest("hotreplug-with-load")
+			hotreplug_with_load(&priv);
+
+		igt_fixture()
+			recover(&priv);
+	}
+
+	igt_fixture()
+		post_healthcheck(&priv);
+
+	igt_subtest_group() {
+		igt_describe("Check if a hot unbound driver instance still open after hot rebind with a background GPU workload in flight can be cleanly released");
+		igt_subtest("hotrebind-lateclose-with-load")
+			hotrebind_lateclose_with_load(&priv);
+
+		igt_fixture()
+			recover(&priv);
+	}
+
+	igt_fixture()
+		post_healthcheck(&priv);
+
+	igt_subtest_group() {
+		igt_describe("Check if an instance of a still open while hot replugged device with a background GPU workload in flight can be cleanly released");
+		igt_subtest("hotreplug-lateclose-with-load")
+			hotreplug_lateclose_with_load(&priv);
+
+		igt_fixture()
+			recover(&priv);
+	}
+
 	igt_fixture() {
 		post_healthcheck(&priv);
 
-- 
2.50.1

