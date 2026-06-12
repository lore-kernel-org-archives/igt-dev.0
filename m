Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A415CD8CA8
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jun 2026 11:08:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B0310F450;
	Fri, 12 Jun 2026 11:08:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X1wSdG3e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E8E210E9E2
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jun 2026 11:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781262419; x=1812798419;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IGL9T/QxifaaQmRKft7m+/WrsnCS+PO2BBr5Q9G8cHM=;
 b=X1wSdG3ejKGKILiK40YHTqN204O8p9Y+SPUOxU5DOtZHwybIpqeBzqAN
 wcR2DrjVv5JA4Ha/vjmxnwCZ2NZtMcxwI7rmLXxkV3qN9HWgsIXRVAg8u
 yMIpZa1pguZBylfSIa4Uj7HtibLwcATxJerDysC+4I4kv7yb/212vsJKO
 43ywxNIIhFAUp9XGxR7Fr1dnzGOU4cHaHrrhNDKMphFnjqwSdgaQrQrPA
 H9pLhmT+OLtLoDgBpIdA5hDxyu3yxd1tN4tSb1fDK8PQVaPrQZKXaMu4v
 /i8VnuTkE0EfTVw6NwGZF6tdNdOJf5ljOAkYtQUvpimy6jFDUBqRWUU/1 Q==;
X-CSE-ConnectionGUID: pTAWISoySIa4A2ZdLeL4xg==
X-CSE-MsgGUID: ec6wtLg7ShWDJQhFV8oQbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81997604"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="81997604"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 04:06:59 -0700
X-CSE-ConnectionGUID: FUsb8aUkRWC6Qvnl5JMO3g==
X-CSE-MsgGUID: weEqUlTIS+WI8O6gGdLqkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="250717735"
Received: from slindbla-desk.ger.corp.intel.com (HELO fedora) ([10.245.245.68])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 04:06:56 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 John Falkowski <john.falkowski@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lahtinen Joonas <joonas.lahtinen@intel.com>
Subject: [PATCH i-g-t 1/4] lib/xe: add xe_vm_restart ioctl helper
Date: Fri, 12 Jun 2026 13:06:16 +0200
Message-ID: <20260612110619.103198-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260612110619.103198-1-thomas.hellstrom@linux.intel.com>
References: <20260612110619.103198-1-thomas.hellstrom@linux.intel.com>
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

Add DRM_XE_VM_RESTART (ioctl 0x10) and struct drm_xe_vm_restart to the
Xe DRM UAPI header, taken from the xe_event kernel branch.

Add DRM_XE_VM_CREATE_FLAG_RESTARTABLE (bit 4) to allow VMs to opt in to
the restart mechanism.

Add __xe_vm_restart() (failable, with bounded EAGAIN retry) and
xe_vm_restart() (asserting wrapper) to lib/xe/xe_ioctl.  Both take an
optional CLOCK_MONOTONIC timestamp_ns which is forwarded to the IOCTL so
the driver can log event-to-restart latency.

Assisted-by: GitHub Copilot:claude-sonnet-4.6
---
 include/drm-uapi/xe_drm.h | 40 +++++++++++++++++++++++++++++++++++
 lib/xe/xe_ioctl.c         | 44 +++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_ioctl.h         |  2 ++
 3 files changed, 86 insertions(+)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 5a96a7910..43b65b1d9 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -84,6 +84,7 @@ extern "C" {
  *  - &DRM_IOCTL_XE_MADVISE
  *  - &DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS
  *  - &DRM_IOCTL_XE_VM_GET_PROPERTY
+ *  - &DRM_IOCTL_XE_VM_RESTART
  */
 
 /*
@@ -109,6 +110,7 @@ extern "C" {
 #define DRM_XE_VM_QUERY_MEM_RANGE_ATTRS	0x0d
 #define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x0e
 #define DRM_XE_VM_GET_PROPERTY		0x0f
+#define DRM_XE_VM_RESTART		0x10
 
 /* Must be kept compact -- no holes */
 
@@ -128,6 +130,7 @@ extern "C" {
 #define DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_MEM_RANGE_ATTRS, struct drm_xe_vm_query_mem_range_attr)
 #define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
 #define DRM_IOCTL_XE_VM_GET_PROPERTY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_GET_PROPERTY, struct drm_xe_vm_get_property)
+#define DRM_IOCTL_XE_VM_RESTART			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_RESTART, struct drm_xe_vm_restart)
 
 /**
  * DOC: Xe IOCTL Extensions
@@ -991,6 +994,7 @@ struct drm_xe_vm_create {
 #define DRM_XE_VM_CREATE_FLAG_LR_MODE	        (1 << 1)
 #define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 2)
 #define DRM_XE_VM_CREATE_FLAG_NO_VM_OVERCOMMIT  (1 << 3)
+#define DRM_XE_VM_CREATE_FLAG_RESTARTABLE       (1 << 4)
 	/** @flags: Flags */
 	__u32 flags;
 
@@ -2609,6 +2613,42 @@ enum drm_xe_ras_error_component {
 	[DRM_XE_RAS_ERR_COMP_SOC_INTERNAL] = "soc-internal"		\
 }
 
+/**
+ * DOC: DRM_XE_VM_RESTART
+ *
+ * Synchronously restart a VM by running its preempt-rebind worker in the
+ * calling context.  The VM must be in preempt-fence mode (i.e. it must have
+ * been created with exec queues that use preempt fences).
+ *
+ * On return the rebind attempt has completed or a retriable error was
+ * encountered.  Any non-retriable error is surfaced through the event
+ * mechanism if the caller has subscribed to %DRM_XE_EVENT_MASK_VM_ERR.
+ * The IOCTL may return -EAGAIN if userptr memory needs to be repinned;
+ * callers should retry in that case.
+ */
+
+/**
+ * struct drm_xe_vm_restart - restart a VM's preempt-rebind worker
+ *
+ * Used with %DRM_IOCTL_XE_VM_RESTART.
+ */
+struct drm_xe_vm_restart {
+	/** @vm_id: ID of the VM to restart */
+	__u32 vm_id;
+	/** @pad: reserved, must be zero */
+	__u32 pad;
+	/**
+	 * @timestamp_ns: optional CLOCK_MONOTONIC timestamp in nanoseconds.
+	 * When non-zero, the driver logs the delay between this timestamp and
+	 * the point the rebind completes, which can be used to measure the
+	 * response latency from event delivery to VM restart.  Pass zero to
+	 * disable the logging.
+	 */
+	__u64 timestamp_ns;
+	/** @reserved: reserved, must be zero */
+	__u64 reserved;
+};
+
 #if defined(__cplusplus)
 }
 #endif
diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index c8ed99182..f102fe34e 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -337,6 +337,50 @@ void xe_vm_get_property(int fd, uint32_t vm, struct drm_xe_vm_get_property *quer
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_GET_PROPERTY, query), 0);
 }
 
+/**
+ * __xe_vm_restart() - restart a VM's preempt-rebind worker (failable)
+ * @fd: open Xe DRM device file descriptor
+ * @vm: VM id to restart
+ * @timestamp_ns: CLOCK_MONOTONIC timestamp from the triggering event, or 0
+ *
+ * Calls %DRM_IOCTL_XE_VM_RESTART, retrying up to 10 times on -EAGAIN as
+ * required when userptr memory needs repinning.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int __xe_vm_restart(int fd, uint32_t vm, uint64_t timestamp_ns)
+{
+	struct drm_xe_vm_restart restart = {
+		.vm_id = vm,
+		.timestamp_ns = timestamp_ns,
+	};
+	int err, tries = 10;
+
+	do {
+		err = igt_ioctl(fd, DRM_IOCTL_XE_VM_RESTART, &restart);
+		if (err) {
+			err = -errno;
+			igt_assume(err);
+			errno = 0;
+		}
+	} while (err == -EAGAIN && --tries > 0);
+
+	return err;
+}
+
+/**
+ * xe_vm_restart() - restart a VM's preempt-rebind worker
+ * @fd: open Xe DRM device file descriptor
+ * @vm: VM id to restart
+ * @timestamp_ns: CLOCK_MONOTONIC timestamp from the triggering event, or 0
+ *
+ * Calls __xe_vm_restart() and asserts success.
+ */
+void xe_vm_restart(int fd, uint32_t vm, uint64_t timestamp_ns)
+{
+	igt_assert_eq(__xe_vm_restart(fd, vm, timestamp_ns), 0);
+}
+
 void xe_vm_destroy(int fd, uint32_t vm)
 {
 	struct drm_xe_vm_destroy destroy = {
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index bf40fb6bd..95f2ec3d8 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -66,6 +66,8 @@ void xe_vm_unbind_all_async(int fd, uint32_t vm, uint32_t exec_queue,
 			    uint32_t bo, struct drm_xe_sync *sync,
 			    uint32_t num_syncs);
 void xe_vm_get_property(int fd, uint32_t vm, struct drm_xe_vm_get_property *query);
+int __xe_vm_restart(int fd, uint32_t vm, uint64_t timestamp_ns);
+void xe_vm_restart(int fd, uint32_t vm, uint64_t timestamp_ns);
 void xe_vm_destroy(int fd, uint32_t vm);
 uint32_t __xe_bo_create(int fd, uint32_t vm, uint64_t size, uint32_t placement,
 			uint32_t flags, void *ext, uint32_t *handle);
-- 
2.54.0

