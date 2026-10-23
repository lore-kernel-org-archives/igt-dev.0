Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A36606A31A
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 15:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=C192MVy3
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E561910E0AA;
	Fri, 23 Oct 2026 15:01:54 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27409112B84
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2026 14:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Reply-To; bh=H+wCnJibHJCQOCsqXYL0e5iQdf/BmMRWxcT7lwvx6XQ=; b=
 C192MVy3BYA1d56PusH9YWi/oGi1QbI0oUcmw2b312z08h4W9rmikRiRVTU0SPT7h0lVdaMpH+NeT
 Jm3bPbq3MiPv0ORPNMcD+vaAmv9yJqcoyfY8IYC0vMg5K+dkRqk9kHh4jZUNLrTELeDGNO13CKKcR
 JZTzFqoVhZITkvtYXj73vaHYUDpZZxmnTJlLIexSOGt63NEGhrmM/GHlKQQjY6eyVhdsZQWUcQ03a
 kO086SirtLtCFAT0v/JYQ6rA02H/rocHREwL7HBeeSsUHvjav37uFyZGgdeHvdhUKug5Au7cDacTD
 w/bBNEbx/hkpMp3BQp+Tk+rqQtPd6w2WIQ==;
Received: from [81.79.79.1] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1xKGbQ-007yoM-6Y; Fri, 23 Oct 2026 16:50:40 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: igt-dev@lists.freedesktop.org
Cc: David Francis <David.Francis@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH i-g-t 04/10] tests/amd/gem_list_contexts: Add basic test for
 DRM_IOCTL_AMDGPU_GEM_LIST_CONTEXTS
Date: Fri, 23 Oct 2026 15:50:26 +0100
Message-ID: <20261023145032.22650-5-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261023145032.22650-1-tvrtko.ursulin@igalia.com>
References: <20261023145032.22650-1-tvrtko.ursulin@igalia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Just some basic test cases to verify input checking and normal
operation.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: David Francis <David.Francis@amd.com>
---
 tests/amdgpu/amd_list_contexts.c | 233 +++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build         |   1 +
 2 files changed, 234 insertions(+)
 create mode 100644 tests/amdgpu/amd_list_contexts.c

diff --git a/tests/amdgpu/amd_list_contexts.c b/tests/amdgpu/amd_list_contexts.c
new file mode 100644
index 000000000000..94d4d945f09b
--- /dev/null
+++ b/tests/amdgpu/amd_list_contexts.c
@@ -0,0 +1,233 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright (c) 2026 Valve Corporation
+ */
+#include <sys/ioctl.h>
+
+#include "igt.h"
+#include "drmtest.h"
+
+#include <amdgpu.h>
+#include <amdgpu_drm.h>
+
+#include "lib/amdgpu/amd_memory.h"
+
+
+#define DRM_AMDGPU_GEM_LIST_CONTEXTS	0x1C
+#define DRM_IOCTL_AMDGPU_GEM_LIST_CONTEXTS DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_LIST_CONTEXTS, struct drm_amdgpu_gem_list_contexts)
+
+struct drm_amdgpu_gem_list_contexts {
+	/* User pointer to array of drm_amdgpu_gem_list_contexts_entry */
+	__u64 contexts;
+
+	/* Size of the contexts buffer / Number of contexts in the client (if larger than size of buffer, must retry) */
+	__u32 num_contexts;
+
+	__u32 padding;
+};
+
+struct drm_amdgpu_gem_list_contexts_entry {
+	/* gem context handle */
+	__u32 handle;
+
+	/* AMDGPU_GEM_LIST_CONTEXTS_FLAG_* */
+	__u32 flags;
+
+	/* context initial priority */
+	__s32 init_priority;
+
+	/* context override priority */
+	__s32 override_priority;
+
+	/* pstate flags */
+	__u32 pstate_flags;
+
+	__u32 padding;
+};
+
+static uint32_t ctx_create(int fd, int prio)
+{
+	union drm_amdgpu_ctx ctx = {
+		.in.op = AMDGPU_CTX_OP_ALLOC_CTX,
+		.in.priority = prio,
+	};
+	int ret;
+
+	ret = ioctl(fd, DRM_IOCTL_AMDGPU_CTX, &ctx);
+	igt_assert_eq(ret, 0);
+
+	return ctx.out.alloc.ctx_id;
+}
+
+static void ctx_free(int fd, uint32_t handle)
+{
+	union drm_amdgpu_ctx ctx = {
+		.in.op = AMDGPU_CTX_OP_FREE_CTX,
+		.in.ctx_id = handle,
+	};
+	int ret;
+
+	ret = ioctl(fd, DRM_IOCTL_AMDGPU_CTX, &ctx);
+	igt_assert_eq(ret, 0);
+}
+
+#define TEST_PADDING		(1 << 0)
+#define TEST_FAULT		(1 << 1)
+#define TEST_TWOPASS		(1 << 2)
+#define TEST_PROBE		(1 << 3)
+#define TEST_PRIO		(1 << 4)
+#define TEST_OVERRIDE_PRIO	(1 << 5)
+#define TEST_PSTATE		(1 << 6)
+
+static void basic(int fd, unsigned int num_ctxs, unsigned int flags)
+{
+	struct drm_amdgpu_gem_list_contexts_entry entry[num_ctxs];
+	struct drm_amdgpu_gem_list_contexts list = {
+		.contexts = (uintptr_t)entry,
+		.num_contexts = num_ctxs,
+	};
+	uint32_t ctx[num_ctxs];
+	int i, ret;
+
+	igt_require(!!(flags & TEST_OVERRIDE_PRIO) != !!geteuid());
+
+	for (i = 0; i < num_ctxs; i++) {
+		int prio = ((flags & TEST_PRIO) && (i & 1)) ?
+			   AMDGPU_CTX_PRIORITY_LOW : AMDGPU_CTX_PRIORITY_NORMAL;
+
+		ctx[i] = ctx_create(fd, prio);
+
+		if ((flags & TEST_OVERRIDE_PRIO) && !(i & 0x1f)) {
+			union drm_amdgpu_sched sched = {
+				.in.op = AMDGPU_SCHED_OP_CONTEXT_PRIORITY_OVERRIDE,
+				.in.fd = fd,
+				.in.ctx_id = ctx[i],
+				.in.priority = AMDGPU_CTX_PRIORITY_LOW,
+			};
+
+			ret = ioctl(fd, DRM_IOCTL_AMDGPU_SCHED, &sched);
+			igt_assert_eq(ret, 0);
+		}
+
+		if ((flags & TEST_PSTATE) && (i == 1)) {
+			union drm_amdgpu_ctx ctx2 = {
+				.in.op = AMDGPU_CTX_OP_SET_STABLE_PSTATE,
+				.in.flags = AMDGPU_CTX_STABLE_PSTATE_STANDARD,
+				.in.ctx_id = ctx[i],
+			};
+
+			ret = ioctl(fd, DRM_IOCTL_AMDGPU_CTX, &ctx2);
+			igt_assert_eq(ret, 0);
+		}
+	}
+
+	if (flags & TEST_TWOPASS) {
+		if (flags & TEST_PROBE) {
+			list.num_contexts = 0;
+		} else {
+			igt_assert(num_ctxs > 1);
+			list.num_contexts = num_ctxs - 1;
+		}
+		ret = ioctl(fd, DRM_IOCTL_AMDGPU_GEM_LIST_CONTEXTS, &list);
+		igt_assert_eq(ret, 0);
+		igt_assert_eq(list.num_contexts, num_ctxs);
+	}
+
+	if (flags & TEST_PADDING)
+		list.padding = 0x13ac5;
+
+	if (flags & TEST_FAULT)
+		list.contexts = 0;
+
+	ret = ioctl(fd, DRM_IOCTL_AMDGPU_GEM_LIST_CONTEXTS, &list);
+	if (flags & (TEST_PADDING | TEST_FAULT)) {
+		i = errno;
+		igt_assert_eq(ret, -1);
+		igt_assert_eq(i, (flags & TEST_PADDING) ? EINVAL : EFAULT);
+		goto out;
+	}
+	igt_assert_eq(ret, 0);
+	igt_assert_eq(list.num_contexts, num_ctxs);
+
+	for (i = 0; i < num_ctxs; i++) {
+		struct drm_amdgpu_gem_list_contexts_entry *c = &entry[i];
+		int prio = ((flags & TEST_PRIO) && (i & 1)) ?
+			   AMDGPU_CTX_PRIORITY_LOW :
+			   AMDGPU_CTX_PRIORITY_NORMAL;
+		int override_prio = ((flags & TEST_OVERRIDE_PRIO) && !(i & 0x1f)) ?
+				    AMDGPU_CTX_PRIORITY_LOW :
+				    AMDGPU_CTX_PRIORITY_UNSET;
+
+		igt_assert_eq(c->handle, ctx[i]);
+		igt_assert_eq(c->flags, 0);
+		igt_assert_eq(c->padding, 0);
+		igt_assert_eq(c->init_priority, prio);
+		igt_assert_eq(c->override_priority, override_prio);
+		if ((flags & TEST_PSTATE) && (i == 1))
+			igt_assert_eq(c->pstate_flags,
+				      AMDGPU_CTX_STABLE_PSTATE_STANDARD);
+		else
+			igt_assert_eq(c->pstate_flags,
+				      AMDGPU_CTX_STABLE_PSTATE_NONE);
+	}
+
+out:
+	for (i = 0; i < num_ctxs; i++)
+		ctx_free(fd, ctx[i]);
+}
+
+int igt_main()
+{
+	int fd = -1;
+
+	igt_fixture() {
+		if (geteuid() == 0)
+			fd = drm_open_driver(DRIVER_AMDGPU);
+		else
+			fd = drm_open_driver_render(DRIVER_AMDGPU);
+	}
+
+	igt_describe("Check padding");
+	igt_subtest("padding")
+		basic(fd, 1, TEST_PADDING);
+
+	igt_describe("Check fault");
+	igt_subtest("fault")
+		basic(fd, 1, TEST_FAULT);
+
+	igt_describe("List no contexts");
+	igt_subtest("no-contexts")
+		basic(fd, 0, 0);
+
+	igt_describe("Create and list one context");
+	igt_subtest("one-context")
+		basic(fd, 1, 0);
+
+	igt_describe("Create and list many contexts");
+	igt_subtest("many-contexts")
+		basic(fd, 1024, 0);
+
+	igt_describe("Create and list many contexts with different priorities");
+	igt_subtest("many-contexts-priorities")
+		basic(fd, 1024, TEST_PRIO);
+
+	igt_describe("Create and list many contexts with different priorities including override");
+	igt_subtest("many-contexts-priorities-override")
+		basic(fd, 1024, TEST_PRIO | TEST_OVERRIDE_PRIO);
+
+	igt_describe("Create and list many contexts in two-pass mode");
+	igt_subtest("many-contexts-two-pass")
+		basic(fd, 16, TEST_TWOPASS);
+
+	igt_describe("Create and list many contexts in two-pass probe mode");
+	igt_subtest("many-contexts-two-pass-probe")
+		basic(fd, 16, TEST_TWOPASS | TEST_PROBE);
+
+	igt_describe("Create some contexts one of which modifies pstate");
+	igt_subtest("many-contexts-pstate")
+		basic(fd, 16, TEST_PSTATE | TEST_PRIO);
+
+	igt_fixture() {
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index 2dcc3228b583..a915cf66a268 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -28,6 +28,7 @@ if libdrm_amdgpu.found()
 			  'amd_jpeg_dec',
 			  'amd_jpeg_queue',
 			  'amd_link_settings',
+			  'amd_list_contexts',
 			  'amd_list_handles',
 			  'amd_lockdep',
 			  'amd_max_bpc',
-- 
2.56.0

