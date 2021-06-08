Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC8076EB7F
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jun 2021 09:40:32 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 t4-20020a1c77040000b029019d22d84ebdso1461262wmi.3
 for <igt-dev@lists.freedesktop.org>; Tue, 08 Jun 2021 02:40:32 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue,  8 Jun 2021 11:40:19 +0200
Message-Id: <20210608094020.21598-6-daniel.vetter@ffwll.ch>
In-Reply-To: <20210608094020.21598-1-daniel.vetter@ffwll.ch>
References: <20210608094020.21598-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 6/7] Revert "i915/gem_exec_reloc: Check that
 relocations do not block"
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: IGT development <igt-dev@lists.freedesktop.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>
List-ID: <igt-dev@lists.freedesktop.org>

This reverts commit 5343ca6ad8fac39fe4d468f771af72c968404bea.

This validates gpu relocations, which we're about to delete.

Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Dave Airlie <airlied@redhat.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 tests/i915/gem_exec_reloc.c | 52 -------------------------------------
 1 file changed, 52 deletions(-)

diff --git a/tests/i915/gem_exec_reloc.c b/tests/i915/gem_exec_reloc.c
index cbd40962c610..5b15bcdc3a1f 100644
--- a/tests/i915/gem_exec_reloc.c
+++ b/tests/i915/gem_exec_reloc.c
@@ -344,51 +344,6 @@ static void active(int fd, unsigned engine)
 	gem_close(fd, obj[0].handle);
 }
 
-static unsigned int offset_in_page(void *addr)
-{
-	return (uintptr_t)addr & 4095;
-}
-
-static void active_spin(int fd, unsigned engine)
-{
-	const uint32_t bbe = MI_BATCH_BUFFER_END;
-	struct drm_i915_gem_relocation_entry reloc;
-	struct drm_i915_gem_exec_object2 obj[2];
-	struct drm_i915_gem_execbuffer2 execbuf;
-	igt_spin_t *spin;
-
-	spin = igt_spin_new(fd,
-			    .engine = engine,
-			    .flags = IGT_SPIN_NO_PREEMPTION);
-
-	memset(obj, 0, sizeof(obj));
-	obj[0] = spin->obj[IGT_SPIN_BATCH];
-	obj[0].relocs_ptr = to_user_pointer(&reloc);
-	obj[0].relocation_count = 1;
-	obj[1].handle = gem_create(fd, 4096);
-	gem_write(fd, obj[1].handle, 0, &bbe, sizeof(bbe));
-
-	memset(&reloc, 0, sizeof(reloc));
-	reloc.presumed_offset = -1;
-	reloc.offset = offset_in_page(spin->condition);
-	reloc.target_handle = obj[0].handle;
-
-	memset(&execbuf, 0, sizeof(execbuf));
-	execbuf.buffers_ptr = to_user_pointer(obj);
-	execbuf.buffer_count = 2;
-	execbuf.flags = engine;
-
-	gem_execbuf(fd, &execbuf);
-	gem_close(fd, obj[1].handle);
-	igt_assert_eq(*spin->condition, spin->cmd_precondition);
-
-	igt_spin_end(spin);
-	gem_sync(fd, spin->handle);
-
-	igt_assert_eq(*spin->condition, obj[0].offset);
-	igt_spin_free(fd, spin);
-}
-
 static bool has_64b_reloc(int fd)
 {
 	return intel_gen(intel_get_drm_devid(fd)) >= 8;
@@ -964,13 +919,6 @@ igt_main
 		}
 	}
 
-	igt_subtest_with_dynamic("basic-spin") {
-		__for_each_physical_engine(fd, e) {
-			igt_dynamic_f("%s", e->name)
-				active_spin(fd, e->flags);
-		}
-	}
-
 	igt_subtest("invalid-domains")
 		invalid_domains(fd);
 
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
