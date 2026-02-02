Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7730BE73145
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 08:24:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2102E10E2DD;
	Mon,  2 Feb 2026 08:24:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M2O7gU2W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EAB210E3B5
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 08:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770020665; x=1801556665;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=39RwSialkSi+CerLL2SQ6qOunogCGvwyhrniDkKKwxA=;
 b=M2O7gU2WhzUYSW5IF9n0bByYGPVT3xa9Ge+zGE31dJ//TbED8ZRLeOXm
 g5DQo08VLXG+A6Z5PZeObavPR3PmzXrUFE9J1YO4m5m0V+UoxxXaJa9FU
 Y1XACFZGT+tJ0ymhdXEGc5BDZxOG2teqA/qZxNIio+kXcatYQCs8xZXZQ
 mkZFwi2bRxIYAKev6Av1JNYbO703wXuQCnC+o55caSM0M/2B2Eq1bEwWe
 KgZDCCDle7tytOcLyFlMuyypMuJ61r3Yt9gzjyF1YmWwqRgE0LI7L1s19
 LD3RHdzn/awITRnR2JXi7eBXSfUzSxAPvRroWzM0zXkHoS9Chn8NQwzve Q==;
X-CSE-ConnectionGUID: V7MaD3ReRWelcN2DkcKoVA==
X-CSE-MsgGUID: rSagA2bwRAWH8Hkhj+DWrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="58756435"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="58756435"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 00:24:25 -0800
X-CSE-ConnectionGUID: YriFD2lkS8m+bGAhLj2Vlg==
X-CSE-MsgGUID: 3i+gHgTjTkGqbsoKPy6KYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="209455086"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 00:24:24 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 2/6] lib/igt_cleanup: Add general resource cleanup
 infrastructure
Date: Mon,  2 Feb 2026 14:15:35 +0530
Message-Id: <20260202084539.2524306-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260202084539.2524306-1-kunal1.joshi@intel.com>
References: <20260202084539.2524306-1-kunal1.joshi@intel.com>
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

Add a new library for automatic cleanup of resources on test exit,
including early exits due to failures, skips (igt_require/igt_skip),
or assertion failures (igt_assert).

Features:
- Supports framebuffer cleanup via igt_cleanup_register_fb()
- Supports pipe CRC cleanup via igt_cleanup_register_pipe_crc()
- Validates drm_fd before cleanup to handle closed fds gracefully

This helps prevent resource leaks when tests don't complete normally.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt.h         |   1 +
 lib/igt_cleanup.c | 492 ++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_cleanup.h |  63 ++++++
 lib/meson.build   |   1 +
 4 files changed, 557 insertions(+)
 create mode 100644 lib/igt_cleanup.c
 create mode 100644 lib/igt_cleanup.h

diff --git a/lib/igt.h b/lib/igt.h
index 173ca70bf..7955127a0 100644
--- a/lib/igt.h
+++ b/lib/igt.h
@@ -33,6 +33,7 @@
 #include "igt_draw.h"
 #include "igt_dummyload.h"
 #include "igt_fb.h"
+#include "igt_cleanup.h"
 #include "igt_frame.h"
 #include "igt_gt.h"
 #include "igt_kms.h"
diff --git a/lib/igt_cleanup.c b/lib/igt_cleanup.c
new file mode 100644
index 000000000..87b483164
--- /dev/null
+++ b/lib/igt_cleanup.c
@@ -0,0 +1,492 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include "igt.h"
+#include "igt_cleanup.h"
+#include <string.h>
+#include <errno.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <unistd.h>
+
+/**
+ * SECTION:igt_cleanup
+ * @short_description: IGT resource cleanup infrastructure
+ * @title: Resource Cleanup
+ * @include: igt_cleanup.h
+ *
+ * # Overview
+ *
+ * This library provides automatic cleanup of IGT test resources when tests exit,
+ * including early exits due to failures, skips (igt_require/igt_skip), or
+ * assertion failures (igt_assert). This prevents resource leaks and ensures
+ * proper cleanup even when tests don't complete normally.
+ *
+ * # Motivation
+ *
+ * IGT tests often exit early through igt_require (skipping unsupported
+ * configurations), igt_skip (conditional skips), or igt_assert (test failures).
+ * These early exit paths bypass normal cleanup code in test fixtures, which can
+ * leak resources like framebuffers, pipe CRC objects, or file descriptors.
+ * This framework ensures cleanup happens automatically via exit handlers.
+ *
+ * # Exit Handler Context
+ *
+ * Exit handlers in IGT follow igt_exit_handler_t and run during teardown paths
+ * triggered by normal exit, skips, or failures. This implementation follows the
+ * standard IGT pattern of performing best-effort resource cleanup from those
+ * handlers.
+ *
+ * # Framebuffer Cleanup
+ *
+ * After creating a framebuffer with igt_create_*_fb(), register it for
+ * automatic cleanup:
+ *
+ * |[<!-- language="C" -->
+ * struct igt_fb fb;
+ * igt_create_color_fb(drm_fd, width, height, format, modifier,
+ *                     r, g, b, &fb);
+ * igt_cleanup_register_fb(drm_fd, &fb);
+ * ]|
+ *
+ * When you manually remove the framebuffer, unregister it to prevent
+ * double cleanup:
+ *
+ * |[<!-- language="C" -->
+ * igt_remove_fb(drm_fd, &fb);
+ * igt_cleanup_unregister_fb(&fb);
+ * ]|
+ *
+ * If the test exits early (due to igt_require, igt_skip, igt_assert, etc.),
+ * the registered framebuffers will be automatically cleaned up.
+ *
+ * # File Descriptor Cleanup
+ *
+ * After opening a DRM file descriptor, register it for automatic cleanup:
+ *
+ * |[<!-- language="C" -->
+ * int drm_fd = drm_open_driver_master(DRIVER_ANY);
+ * igt_cleanup_register_fd(drm_fd);
+ * ]|
+ *
+ * The fd will be automatically closed on test exit, after all other resources
+ * that depend on it (like framebuffers) have been cleaned up.
+ *
+ * # Adding New Resource Types
+ *
+ * To add support for new resource types:
+ * 1. Add a new enum value to igt_cleanup_resource_type
+ * 2. Add a new entry structure if needed
+ * 3. Add register/unregister functions for the resource
+ * 4. Update the cleanup handler to handle the new type
+ */
+
+/*
+ * Maximum number of resources that can be tracked for cleanup.
+ * This needs to accommodate tests that create multiple framebuffers,
+ * pipe CRC objects, and file descriptors across subtests.
+ * Tests creating many resources in loops should clean up incrementally.
+ */
+#define MAX_CLEANUP_RESOURCES 256
+
+/**
+ * struct cleanup_entry:
+ * @type: Type of resource
+ * @drm_fd: DRM file descriptor (for resources that need it)
+ * @resource: Pointer to the resource
+ * @in_use: Whether this entry is active
+ * @dev: Device number from fstat (for fd validation)
+ * @ino: Inode number from fstat (for fd validation)
+ *
+ * Internal structure for tracking resources to cleanup.
+ * For FD resources, we store dev/ino to detect fd reuse after close/reopen.
+ */
+struct cleanup_entry {
+	enum igt_cleanup_resource_type type;
+	int drm_fd;
+	void *resource;
+	bool in_use;
+	dev_t dev;
+	ino_t ino;
+};
+
+static struct cleanup_entry cleanup_registry[MAX_CLEANUP_RESOURCES];
+static bool handler_installed = false;
+
+/*
+ * Helper to check if a file descriptor still refers to the same file.
+ * Returns true if fd is valid, open, and refers to the same device/inode, false otherwise.
+ *
+ * This protects against fd reuse: if the fd was closed and the number was reused
+ * for a different file, we'll detect it by comparing device/inode numbers.
+ */
+static bool fd_matches_identity(int fd, dev_t expected_dev, ino_t expected_ino)
+{
+	struct stat st;
+
+	if (fd < 0)
+		return false;
+
+	/* Check if fd is still open and get current file identity */
+	if (fstat(fd, &st) == -1)
+		return false;
+
+	/* Verify it's the same file (not reused fd) */
+	return st.st_dev == expected_dev && st.st_ino == expected_ino;
+}
+
+/*
+ * Internal cleanup implementation that performs the actual resource cleanup.
+ * This is called both from the exit handler and from explicit cleanup requests.
+ */
+static void cleanup_all_resources_internal(void)
+{
+	/* First pass: cleanup resources that need the fd */
+	for (int i = 0; i < MAX_CLEANUP_RESOURCES; i++) {
+		if (!cleanup_registry[i].in_use)
+			continue;
+
+		/* Skip FD cleanup in first pass */
+		if (cleanup_registry[i].type == IGT_CLEANUP_FD)
+			continue;
+
+		switch (cleanup_registry[i].type) {
+		case IGT_CLEANUP_FB:
+			/*
+			 * Check if drm_fd still refers to same file before cleanup.
+			 * If fd was closed and potentially reused, skip cleanup to
+			 * avoid operating on wrong file descriptor.
+			 */
+			if (!fd_matches_identity(cleanup_registry[i].drm_fd,
+						 cleanup_registry[i].dev,
+						 cleanup_registry[i].ino)) {
+				break;
+			}
+			igt_remove_fb(cleanup_registry[i].drm_fd,
+				      (struct igt_fb *)cleanup_registry[i].resource);
+			break;
+		case IGT_CLEANUP_PIPE_CRC:
+			igt_pipe_crc_free((igt_pipe_crc_t *)
+					  cleanup_registry[i].resource);
+			break;
+		default:
+			igt_warn("Unknown cleanup resource type: %d\n",
+				 cleanup_registry[i].type);
+			break;
+		}
+
+		cleanup_registry[i].in_use = false;
+	}
+
+	/* Second pass: cleanup file descriptors last */
+	for (int i = 0; i < MAX_CLEANUP_RESOURCES; i++) {
+		if (!cleanup_registry[i].in_use)
+			continue;
+
+		if (cleanup_registry[i].type == IGT_CLEANUP_FD) {
+			if (cleanup_registry[i].drm_fd >= 0 &&
+			    fd_matches_identity(cleanup_registry[i].drm_fd,
+						cleanup_registry[i].dev,
+						cleanup_registry[i].ino)) {
+				drm_close_driver(cleanup_registry[i].drm_fd);
+			}
+			cleanup_registry[i].in_use = false;
+		}
+	}
+}
+
+static void cleanup_all_resources(int sig)
+{
+	/*
+	 * IGT exit handler (igt_exit_handler_t). The sig parameter indicates
+	 * exit reason (0 for normal exit, signal number otherwise).
+	 */
+	(void)sig; /* Parameter present but unused in this implementation */
+
+	cleanup_all_resources_internal();
+}
+
+static void register_resource(enum igt_cleanup_resource_type type,
+			       int drm_fd, void *resource)
+{
+	struct stat st;
+
+	/* Validate inputs based on resource type */
+	if (type == IGT_CLEANUP_FB) {
+		igt_assert_f(drm_fd >= 0,
+			     "Invalid drm_fd %d for framebuffer cleanup\n",
+			     drm_fd);
+		igt_assert_f(resource, "Cannot register NULL framebuffer\n");
+	} else if (type == IGT_CLEANUP_FD) {
+		igt_assert_f(drm_fd >= 0,
+			     "Invalid drm_fd %d for fd cleanup\n",
+			     drm_fd);
+	} else if (type == IGT_CLEANUP_PIPE_CRC) {
+		igt_assert_f(resource, "Cannot register NULL pipe_crc\n");
+	}
+
+	/* Check for duplicate registrations */
+	for (int i = 0; i < MAX_CLEANUP_RESOURCES; i++) {
+		if (!cleanup_registry[i].in_use)
+			continue;
+		if (cleanup_registry[i].type != type)
+			continue;
+
+		/* Check for duplicate based on type */
+		if (type == IGT_CLEANUP_FD) {
+			if (cleanup_registry[i].drm_fd == drm_fd) {
+				/* Already registered, silently ignore duplicate */
+				return;
+			}
+		} else {
+			/*
+			 * For FB/CRC, the resource pointer uniquely identifies
+			 * the allocation. A given struct igt_fb * belongs to a
+			 * single fd.
+			 */
+			if (cleanup_registry[i].resource == resource) {
+				/* Already registered, silently ignore duplicate */
+				return;
+			}
+		}
+	}
+
+	/* Get fstat data for fd validation (for resources that use fd) */
+	if ((type == IGT_CLEANUP_FB || type == IGT_CLEANUP_FD) && drm_fd >= 0) {
+		igt_assert_f(fstat(drm_fd, &st) == 0,
+			     "fstat failed on drm_fd %d: %s\n",
+			     drm_fd, strerror(errno));
+	}
+
+	if (!handler_installed) {
+		igt_install_exit_handler(cleanup_all_resources);
+		handler_installed = true;
+	}
+
+	for (int i = 0; i < MAX_CLEANUP_RESOURCES; i++) {
+		if (!cleanup_registry[i].in_use) {
+			cleanup_registry[i].type = type;
+			cleanup_registry[i].drm_fd = drm_fd;
+			cleanup_registry[i].resource = resource;
+			cleanup_registry[i].in_use = true;
+			cleanup_registry[i].dev = 0;
+			cleanup_registry[i].ino = 0;
+			if ((type == IGT_CLEANUP_FB || type == IGT_CLEANUP_FD) &&
+			    drm_fd >= 0) {
+				cleanup_registry[i].dev = st.st_dev;
+				cleanup_registry[i].ino = st.st_ino;
+			}
+			return;
+		}
+	}
+
+	if (type == IGT_CLEANUP_FD) {
+		igt_assert_f(false,
+			     "Cleanup registry full (MAX_CLEANUP_RESOURCES=%d)! Cannot register drm_fd %d.\n"
+			     "Increase MAX_CLEANUP_RESOURCES or fix resource leaks.\n",
+			     MAX_CLEANUP_RESOURCES, drm_fd);
+	} else {
+		igt_assert_f(false,
+			     "Cleanup registry full (MAX_CLEANUP_RESOURCES=%d)! Cannot register resource %p (type %d).\n"
+			     "Increase MAX_CLEANUP_RESOURCES or fix resource leaks.\n",
+			     MAX_CLEANUP_RESOURCES, resource, type);
+	}
+}
+
+static void unregister_resource(void *resource)
+{
+	for (int i = 0; i < MAX_CLEANUP_RESOURCES; i++) {
+		if (cleanup_registry[i].in_use &&
+		    cleanup_registry[i].resource == resource) {
+			cleanup_registry[i].in_use = false;
+			return;
+		}
+	}
+}
+
+/**
+ * igt_cleanup_register_fb:
+ * @drm_fd: DRM file descriptor
+ * @fb: Framebuffer to register for cleanup
+ *
+ * Registers a framebuffer for automatic cleanup on test exit. If the test
+ * exits early (due to igt_require, igt_skip, igt_assert, or other reasons),
+ * the framebuffer will be automatically removed.
+ *
+ * The exit handler is automatically installed on first use.
+ *
+ * Example:
+ * |[<!-- language="C" -->
+ * struct igt_fb fb;
+ * igt_create_color_fb(drm_fd, 1920, 1080, DRM_FORMAT_XRGB8888,
+ *                     DRM_FORMAT_MOD_LINEAR, 1.0, 1.0, 1.0, &fb);
+ * igt_cleanup_register_fb(drm_fd, &fb);
+ * ]|
+ */
+void igt_cleanup_register_fb(int drm_fd, struct igt_fb *fb)
+{
+	register_resource(IGT_CLEANUP_FB, drm_fd, fb);
+}
+
+/**
+ * igt_cleanup_unregister_fb:
+ * @fb: Framebuffer to unregister
+ *
+ * Unregisters a framebuffer from automatic cleanup. Call this after manually
+ * removing a framebuffer with igt_remove_fb() to prevent double cleanup.
+ *
+ * Example:
+ * |[<!-- language="C" -->
+ * igt_remove_fb(drm_fd, &fb);
+ * igt_cleanup_unregister_fb(&fb);
+ * ]|
+ */
+void igt_cleanup_unregister_fb(struct igt_fb *fb)
+{
+	unregister_resource(fb);
+}
+
+/**
+ * igt_cleanup_register_pipe_crc:
+ * @pipe_crc: Pipe CRC object to register for cleanup
+ *
+ * Registers a pipe CRC object for automatic cleanup on test exit. If the test
+ * exits early (due to igt_require, igt_skip, igt_assert, or other reasons),
+ * the pipe CRC will be automatically freed.
+ *
+ * Example:
+ * |[<!-- language="C" -->
+ * igt_pipe_crc_t *pipe_crc;
+ * pipe_crc = igt_pipe_crc_new(fd, pipe, IGT_PIPE_CRC_SOURCE_AUTO);
+ * igt_cleanup_register_pipe_crc(pipe_crc);
+ * ]|
+ */
+void igt_cleanup_register_pipe_crc(igt_pipe_crc_t *pipe_crc)
+{
+	register_resource(IGT_CLEANUP_PIPE_CRC, 0, pipe_crc);
+}
+
+/**
+ * igt_cleanup_unregister_pipe_crc:
+ * @pipe_crc: Pipe CRC object to unregister
+ *
+ * Unregisters a pipe CRC object from automatic cleanup. Call this after manually
+ * freeing the pipe CRC with igt_pipe_crc_free() to prevent double cleanup.
+ *
+ * Example:
+ * |[<!-- language="C" -->
+ * igt_pipe_crc_free(pipe_crc);
+ * igt_cleanup_unregister_pipe_crc(pipe_crc);
+ * ]|
+ */
+void igt_cleanup_unregister_pipe_crc(igt_pipe_crc_t *pipe_crc)
+{
+	unregister_resource(pipe_crc);
+}
+
+/**
+ * igt_cleanup_register_fd:
+ * @drm_fd: DRM file descriptor to register for cleanup
+ *
+ * Registers a DRM file descriptor for automatic cleanup on test exit.
+ * The fd will be closed after all other resources (FBs, pipe CRCs, etc.)
+ * that depend on it have been cleaned up.
+ *
+ * This ensures proper cleanup order: resources that need the fd are cleaned
+ * up first, then the fd is closed.
+ *
+ * Example:
+ * |[<!-- language="C" -->
+ * int drm_fd = drm_open_driver_master(DRIVER_ANY);
+ * igt_cleanup_register_fd(drm_fd);
+ * // ... use drm_fd ...
+ * // fd will be automatically closed on exit
+ * ]|
+ */
+void igt_cleanup_register_fd(int drm_fd)
+{
+	register_resource(IGT_CLEANUP_FD, drm_fd, NULL);
+}
+
+/**
+ * igt_cleanup_unregister_fd:
+ * @drm_fd: DRM file descriptor to unregister
+ *
+ * Unregisters a DRM file descriptor from automatic cleanup.
+ * Call this after manually closing the fd to prevent double cleanup.
+ *
+ * Example:
+ * |[<!-- language="C" -->
+ * drm_close_driver(drm_fd);
+ * igt_cleanup_unregister_fd(drm_fd);
+ * ]|
+ */
+void igt_cleanup_unregister_fd(int drm_fd)
+{
+	for (int i = 0; i < MAX_CLEANUP_RESOURCES; i++) {
+		if (cleanup_registry[i].in_use &&
+		    cleanup_registry[i].type == IGT_CLEANUP_FD &&
+		    cleanup_registry[i].drm_fd == drm_fd) {
+			cleanup_registry[i].in_use = false;
+			return;
+		}
+	}
+}
+
+/**
+ * igt_cleanup_forget_all:
+ *
+ * Clears all registered resources from the cleanup registry without
+ * cleaning them up. This is DANGEROUS and will leak resources if they
+ * have not been manually cleaned up first.
+ *
+ * Use this only when you need to reset the registry state at the start
+ * of a new test or subtest where you have already manually cleaned up
+ * all resources and want a clean slate.
+ *
+ * WARNING: This does NOT clean up the resources themselves, it only
+ * forgets about them. The resources will leak if not cleaned up manually
+ * before calling this function.
+ *
+ * Note: The exit handler remains installed even after forgetting all resources.
+ */
+void igt_cleanup_forget_all(void)
+{
+	memset(cleanup_registry, 0, sizeof(cleanup_registry));
+}
+
+/**
+ * igt_cleanup_run:
+ *
+ * Explicitly runs cleanup on all registered resources and clears the registry.
+ * Unlike the automatic cleanup at exit, this can be called at any point during
+ * test execution to clean up resources (e.g., at end of subtests).
+ *
+ * This performs the same cleanup as the exit handler: resources are cleaned up
+ * in proper order (FBs/CRCs first, then file descriptors), and the registry
+ * is cleared afterward.
+ *
+ * Useful for:
+ * - Cleaning up between subtests without process exit
+ * - Testing the cleanup framework itself
+ * - Freeing resources before moving to next test phase
+ *
+ * Note: This cleans up ALL registered resources. Only call between subtests
+ * if you have no remaining registered resources you intend to keep.
+ *
+ * Example:
+ * |[<!-- language="C" -->
+ * // Run subtest with automatic cleanup
+ * igt_subtest("test1") {
+ *     // ... create and register resources ...
+ * }
+ * // Explicitly clean up before next subtest
+ * igt_cleanup_run();
+ * ]|
+ */
+void igt_cleanup_run(void)
+{
+	cleanup_all_resources_internal();
+}
diff --git a/lib/igt_cleanup.h b/lib/igt_cleanup.h
new file mode 100644
index 000000000..d71880ce8
--- /dev/null
+++ b/lib/igt_cleanup.h
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef IGT_CLEANUP_H
+#define IGT_CLEANUP_H
+
+#include "igt_fb.h"
+#include "igt_pipe_crc.h"
+
+/**
+ * SECTION:igt_cleanup
+ * @short_description: IGT resource cleanup infrastructure
+ * @title: Resource Cleanup
+ * @include: igt_cleanup.h
+ *
+ * This library provides infrastructure for automatic cleanup of IGT resources
+ * on test exit, including early exits due to failures, skips (igt_require/
+ * igt_skip), or assertion failures (igt_assert). This prevents resource leaks
+ * when tests exit early through these mechanisms, which bypass normal cleanup
+ * paths in test fixtures.
+ *
+ * Without this framework, resources like framebuffers or pipe CRCs can be
+ * leaked when tests exit early, leaving lingering objects that can affect
+ * subsequent subtests or consume system resources.
+ *
+ * Supported resource types:
+ * - Framebuffers (struct igt_fb)
+ * - Pipe CRC (igt_pipe_crc_t)
+ * - DRM file descriptors (closed last, after dependent resources)
+ */
+
+/**
+ * igt_cleanup_resource_type:
+ * @IGT_CLEANUP_FB: Framebuffer resource
+ * @IGT_CLEANUP_PIPE_CRC: Pipe CRC resource
+ * @IGT_CLEANUP_FD: DRM file descriptor
+ *
+ * Types of resources that can be registered for cleanup.
+ * Note: FD cleanup happens last, after all other resources.
+ */
+enum igt_cleanup_resource_type {
+	IGT_CLEANUP_FB,
+	IGT_CLEANUP_PIPE_CRC,
+	IGT_CLEANUP_FD,
+	/* Add more types here as needed:
+	 * IGT_CLEANUP_OUTPUT,
+	 * IGT_CLEANUP_BO,
+	 * etc.
+	 */
+};
+
+void igt_cleanup_register_fb(int drm_fd, struct igt_fb *fb);
+void igt_cleanup_unregister_fb(struct igt_fb *fb);
+void igt_cleanup_register_pipe_crc(igt_pipe_crc_t *pipe_crc);
+void igt_cleanup_unregister_pipe_crc(igt_pipe_crc_t *pipe_crc);
+void igt_cleanup_register_fd(int drm_fd);
+void igt_cleanup_unregister_fd(int drm_fd);
+void igt_cleanup_forget_all(void);
+void igt_cleanup_run(void);
+
+#endif /* IGT_CLEANUP_H */
diff --git a/lib/meson.build b/lib/meson.build
index d851029e0..46145f3d5 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -94,6 +94,7 @@ lib_sources = [
         'intel_wa.c',
 	'igt_kms.c',
 	'igt_fb.c',
+	'igt_cleanup.c',
 	'igt_core.c',
 	'igt_dir.c',
 	'igt_draw.c',
-- 
2.43.0

