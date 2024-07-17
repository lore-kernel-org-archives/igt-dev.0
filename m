Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC104C3DA4B
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jul 2024 12:22:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7895E10EAA6;
	Wed, 17 Jul 2024 12:22:54 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA56710EAA6
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jul 2024 12:22:51 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH] tests/xe: Add test waiting for ufence signaling
Date: Wed, 17 Jul 2024 14:23:02 +0200
Message-ID: <20240717122302.192806-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.45.2
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

Create a single VM_BIND that signals a valid and invalid ufence,
to see what happens..

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 tests/intel/xe_vm.c | 67 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index a4f6c7a0b..aba2e1b82 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -1839,6 +1839,70 @@ static void bind_flag_invalid(int fd)
 	xe_vm_destroy(fd, vm);
 }
 
+/**
+ * SUBTEST: ufence-invalid
+ * Description:
+ *	Test what happens when trying to signal completion with read-only
+ * 	ufence address.
+ * Functionality: bind
+ * Test category: functionality test
+ */
+static void ufence_invalid(int fd)
+{
+	uint32_t bo, bo_size = xe_get_default_alignment(fd);
+	uint64_t addr = 0x1a0000;
+	uint32_t vm;
+	uint64_t *ro_ufence = mmap(NULL, sysconf(_SC_PAGESIZE), PROT_READ, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	uint64_t ufence = 0;
+	struct drm_xe_vm_bind bind;
+	struct drm_xe_sync sync[] = {
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+			.timeline_value = 0x1234567890abcdef,
+		}
+	};
+
+	igt_assert(ro_ufence != MAP_FAILED);
+
+	vm = xe_vm_create(fd, 0, 0);
+	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0), 0);
+	sync[0].handle = syncobj_create(fd, 0);
+
+	memset(&bind, 0, sizeof(bind));
+	bind.vm_id = vm;
+	bind.num_binds = 1;
+	bind.bind.obj = bo;
+	bind.bind.range = bo_size;
+	bind.bind.addr = addr;
+	bind.bind.op = DRM_XE_VM_BIND_OP_MAP;
+	bind.bind.pat_index = intel_get_pat_idx_wb(fd);
+	bind.num_syncs = ARRAY_SIZE(sync);
+	bind.syncs = to_user_pointer(sync);
+
+	/* Using valid with valid ufence should work */
+	sync[1].addr = (uintptr_t)&ufence;
+	bind.bind.flags = 0;
+	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+	syncobj_reset(fd, &sync[0].handle, 1);
+	/* Small sleep to allow some time for async kernel worker to run */
+	usleep(100000);
+	igt_assert_eq_u64(ufence, sync[1].timeline_value);
+
+	/* Also with ro_ufence, but it should remain unsignaled */
+	sync[1].addr = (uintptr_t)ro_ufence;
+	bind.bind.flags = DRM_XE_VM_BIND_FLAG_READONLY;
+	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+	syncobj_reset(fd, &sync[0].handle, 1);
+	usleep(100000);
+	igt_assert_eq_u64(*ro_ufence, 0);
+
+	syncobj_destroy(fd, sync[0].handle);
+	xe_vm_destroy(fd, vm);
+	munmap(ro_ufence, sysconf(_SC_PAGESIZE));
+}
+
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe, *hwe_non_copy = NULL;
@@ -1973,6 +2037,9 @@ igt_main
 	igt_subtest("bind-flag-invalid")
 		bind_flag_invalid(fd);
 
+	igt_subtest("ufence-invalid")
+		ufence_invalid(fd);
+
 	igt_subtest("shared-pte-page")
 		xe_for_each_engine(fd, hwe)
 			shared_pte_page(fd, hwe, 4,
-- 
2.45.2

