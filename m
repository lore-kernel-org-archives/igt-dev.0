Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A22FF8855
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 13:22:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A970F10ED89;
	Wed,  6 May 2026 13:22:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IaNXifRl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D5510ED89
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 13:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778073747; x=1809609747;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rBDqMHtUG4Q/R8MxHWIubVec+u4qDtanT7ChlABJhp0=;
 b=IaNXifRldTSRwr2ysWjGv380rNJTQEw18CIKO1tNMfQhID+wStyq/QMI
 yzYOG8Tr8Q5/SyuhNNBeKgew7sY8wg4c4l3QE5zU6m/kDoLxVHghnH/FJ
 cjlW6Tz7WAc0VN0FjdXwZHl+/Y/wTqTfkTl7hO7AnZ0cRDQC96NVHlvaT
 flmuKOGiuQNsyLIrL0HOgcC6P/SR81CtSi6Q0HtUmGc+gQQo1lzaGfnHr
 drjJipmvGLnthG7A35jk9AKEU8X9VS5U53gBQBcV45CojojwjLu0bWb9Z
 FtmIxf4JHI5pIvcBC2CHQS/DNgOVLZGHXY6pCu4evF9fW79mnEUkxMoDo A==;
X-CSE-ConnectionGUID: VUVs5PolQ0u62rJ+VnssAg==
X-CSE-MsgGUID: yuCr5lu2RDq/UH0++K2Wdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="90101201"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="90101201"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 06:22:26 -0700
X-CSE-ConnectionGUID: MOK0agI7S3CGlxohktpzug==
X-CSE-MsgGUID: /tPCqh5GSVaN+q9Qi9YAgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="229733766"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by fmviesa009.fm.intel.com with ESMTP; 06 May 2026 06:22:25 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.auld@intel.com,
	nitin.r.gote@intel.com
Subject: [PATCH] tests/core_hotunplug: exercise fd-holding subtests with Xe
 workload
Date: Wed,  6 May 2026 19:27:15 +0530
Message-ID: <20260506135714.1819588-2-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.50.1
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

The six fd-holding subtests (hotunbind-rebind, hotunplug-rescan,
hotrebind, hotreplug, hotrebind-lateclose, hotreplug-lateclose) keep
a DRM fd open across unbind/unplug but leave the GPU idle, so on Xe
the unbind/unplug path is never exercised against an active VM,
exec queue and BOs.

Add xe_workload_start()/xe_workload_stop() helpers, gated on
is_xe_device(), that run a spinner on the GPU across the
unbind/unplug sequence, so the device is removed while a workload
is using it. i915 already has equivalent coverage via
local_i915_healthcheck().

Validated on BMG with a KASAN-enabled kernel: all subtests pass with
no KASAN reports.

Cc: Matthew Auld <matthew.auld@intel.com>
Assisted-by: Copilot:claude-opus-4.7
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 tests/core_hotunplug.c | 74 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 7c9dae1bf..88a2133af 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -565,6 +565,44 @@ static void set_filter_from_device(int fd)
 	igt_assert_eq(igt_device_filter_add(filter), 1);
 }
 
+/* Xe GPU workload helpers */
+
+struct xe_workload {
+	igt_spin_t *xe_spin;
+	uint64_t xe_ahnd;
+};
+
+static void xe_workload_start(struct hotunplug *priv, int fd,
+			      struct xe_workload *w)
+{
+	if (!is_xe_device(fd))
+		return;
+
+	local_debug("%s\n", "starting Xe GPU spinner");
+	priv->failure = "Xe workload start failure!";
+	w->xe_ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
+	w->xe_spin = igt_spin_new(fd, .ahnd = w->xe_ahnd);
+	priv->failure = NULL;
+}
+
+static void xe_workload_stop(struct xe_workload *w)
+{
+	if (!w->xe_spin)
+		return;
+
+	/*
+	 * The device may be gone (unbind/unplug), so avoid igt_spin_free():
+	 * on Xe it asserts in xe_spin_sync_wait() because the syncobj will
+	 * never signal. Stop the spinner via a userspace mmap write and let
+	 * the DRM fd close reclaim the kernel-side resources.
+	 */
+	local_debug("%s\n", "stopping Xe GPU spinner");
+	igt_spin_end(w->xe_spin);
+	put_ahnd(w->xe_ahnd);
+	w->xe_spin = NULL;
+	w->xe_ahnd = 0;
+}
+
 /* Subtests */
 
 static void unbind_rebind(struct hotunplug *priv)
@@ -591,12 +629,18 @@ static void unplug_rescan(struct hotunplug *priv)
 
 static void hotunbind_rebind(struct hotunplug *priv)
 {
+	struct xe_workload w = { 0 };
+
 	pre_check(priv);
 
 	priv->fd.drm = local_drm_open_driver(false, "", " for hot unbind");
 
+	xe_workload_start(priv, priv->fd.drm, &w);
+
 	driver_unbind(priv, "hot ", 0);
 
+	xe_workload_stop(&w);
+
 	priv->fd.drm = close_device(priv->fd.drm, "late ", "unbound ");
 	igt_assert_eq(priv->fd.drm, -1);
 
@@ -607,12 +651,18 @@ static void hotunbind_rebind(struct hotunplug *priv)
 
 static void hotunplug_rescan(struct hotunplug *priv)
 {
+	struct xe_workload w = { 0 };
+
 	pre_check(priv);
 
 	priv->fd.drm = local_drm_open_driver(false, "", " for hot unplug");
 
+	xe_workload_start(priv, priv->fd.drm, &w);
+
 	device_unplug(priv, "hot ", 0);
 
+	xe_workload_stop(&w);
+
 	priv->fd.drm = close_device(priv->fd.drm, "late ", "removed ");
 	igt_assert_eq(priv->fd.drm, -1);
 
@@ -623,40 +673,58 @@ static void hotunplug_rescan(struct hotunplug *priv)
 
 static void hotrebind(struct hotunplug *priv)
 {
+	struct xe_workload w = { 0 };
+
 	pre_check(priv);
 
 	priv->fd.drm = local_drm_open_driver(false, "", " for hot rebind");
 
+	xe_workload_start(priv, priv->fd.drm, &w);
+
 	driver_unbind(priv, "hot ", 60);
 
 	driver_bind(priv, 0);
 
+	xe_workload_stop(&w);
+
 	igt_assert_f(healthcheck(priv, false), "%s\n", priv->failure);
 }
 
 static void hotreplug(struct hotunplug *priv)
 {
+	struct xe_workload w = { 0 };
+
 	pre_check(priv);
 
 	priv->fd.drm = local_drm_open_driver(false, "", " for hot replug");
 
+	xe_workload_start(priv, priv->fd.drm, &w);
+
 	device_unplug(priv, "hot ", 60);
 
 	bus_rescan(priv, 0);
 
+	xe_workload_stop(&w);
+
 	igt_assert_f(healthcheck(priv, false), "%s\n", priv->failure);
 }
 
 static void hotrebind_lateclose(struct hotunplug *priv)
 {
+	struct xe_workload w = { 0 };
+
 	pre_check(priv);
 
 	priv->fd.drm = local_drm_open_driver(false, "", " for hot rebind");
 
+	xe_workload_start(priv, priv->fd.drm, &w);
+
 	driver_unbind(priv, "hot ", 60);
 
 	driver_bind(priv, 0);
 
+	xe_workload_stop(&w);
+
 	priv->fd.drm = close_device(priv->fd.drm, "late ", "unbound ");
 	igt_assert_eq(priv->fd.drm, -1);
 
@@ -665,14 +733,20 @@ static void hotrebind_lateclose(struct hotunplug *priv)
 
 static void hotreplug_lateclose(struct hotunplug *priv)
 {
+	struct xe_workload w = { 0 };
+
 	pre_check(priv);
 
 	priv->fd.drm = local_drm_open_driver(false, "", " for hot replug");
 
+	xe_workload_start(priv, priv->fd.drm, &w);
+
 	device_unplug(priv, "hot ", 60);
 
 	bus_rescan(priv, 0);
 
+	xe_workload_stop(&w);
+
 	priv->fd.drm = close_device(priv->fd.drm, "late ", "removed ");
 	igt_assert_eq(priv->fd.drm, -1);
 
-- 
2.50.1

