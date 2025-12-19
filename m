Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820A6D767F5
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 12:02:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 354CD10EF70;
	Fri, 19 Dec 2025 12:02:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MtBlOxbM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB2D110EF6E
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Dec 2025 12:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766145720; x=1797681720;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=U05AQ29D9ACpBlzxkUk2akZm2pqcF86UWc9qKbjtg0E=;
 b=MtBlOxbMNL/qKilpaiPkrSjJxIOgCMJkHe0+gWk56ctMOu63GvuQoFwW
 HjZfdiJovgToF8b0vDvFw0HqS0f6KLyx5jaXWHp6SZUXzoFH0oA+kCcPM
 soZ9CnjcOqxF3e7q8OeaqcTHJ+ft0dWsmFFWytwdsFstNVAk7Sr5pj23Z
 7ZwI3mixnLo9Nj5hnbhnC2JUPsp+Si4OjXKj+M0m/XrVf2k9PB6WhGSkv
 tZlTAiqDzyt8lc8WjbIrZ2zpJqNtyDmAv0amiD53YuDpptw8/QaB30Zrb
 VMtMMAxMOlX6x6bihBAJayuFieRnD41f4nOxNfTgKmX9m8jyaut1Wi2ON g==;
X-CSE-ConnectionGUID: 9NVMQgG1RH2jsdyrSB5kWw==
X-CSE-MsgGUID: 0KZHdoqbRDS3fWnwCu+1Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="79473864"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="79473864"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 04:02:00 -0800
X-CSE-ConnectionGUID: dCyvwotFTRyJRwTO99I2VQ==
X-CSE-MsgGUID: wC49/PsLSzqNtSk/fYbYmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="203746963"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa004.fm.intel.com with ESMTP; 19 Dec 2025 04:01:58 -0800
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, niranjana.vishwanathapura@intel.com,
 igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/7] tests/intel/xe_evict: Add basic multi queue test
Date: Fri, 19 Dec 2025 17:31:49 +0530
Message-ID: <20251219120154.695287-3-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219120154.695287-1-priyanka.dandamudi@intel.com>
References: <20251219120154.695287-1-priyanka.dandamudi@intel.com>
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Added basic multi queue test for small buffer objects.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 tests/intel/xe_evict.c | 62 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 52 insertions(+), 10 deletions(-)

diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index 2350487c8..a62230ec6 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -29,6 +29,7 @@
 #define COMPUTE_THREAD		(0x1 << 4)
 #define EXTERNAL_OBJ		(0x1 << 5)
 #define BIND_EXEC_QUEUE		(0x1 << 6)
+#define MULTI_QUEUE		(0x1 << 7)
 
 static void
 test_evict(int fd, struct drm_xe_engine_class_instance *eci,
@@ -80,7 +81,18 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
 		if (flags & MULTI_VM)
 			exec_queues[i] = xe_exec_queue_create(fd, i & 1 ? vm2 : vm ,
 						      eci, 0);
-		else
+		else if (flags & MULTI_QUEUE) {
+			struct drm_xe_ext_set_property multiq = {
+				.base.next_extension = 0,
+				.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
+				.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
+			};
+			uint64_t ext = to_user_pointer(&multiq);
+
+			multiq.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
+			igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci,
+							     ext, &exec_queues[i]), 0);
+		} else
 			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
 		syncobjs[i] = syncobj_create(fd, 0);
 	};
@@ -259,7 +271,18 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
 		if (flags & MULTI_VM)
 			exec_queues[i] = xe_exec_queue_create(fd, i & 1 ? vm2 :
 							      vm, eci, 0);
-		else
+		else if (flags & MULTI_QUEUE) {
+			struct drm_xe_ext_set_property multiq = {
+				.base.next_extension = 0,
+				.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
+				.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
+			};
+			uint64_t ext = to_user_pointer(&multiq);
+
+			multiq.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
+			igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci,
+							     ext, &exec_queues[i]), 0);
+		} else
 			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
 	}
 
@@ -516,6 +539,7 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
  * arg[1]:
  *
  * @small:			small
+ * @small-multiqueue:		small multi queue
  * @small-external:		small external
  * @small-multi-vm:		small multi VM
  * @beng-small:			small bind exec_queue
@@ -546,6 +570,7 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
  * arg[1]:
  *
  * @small-cm:			small compute machine
+ * @small-multiqueue-cm:	small multi queue compute machine
  * @small-external-cm:		small external compute machine
  * @small-multi-vm-cm:		small multi VM compute machine
  * @beng-small-cm:		small bind exec_queue compute machine
@@ -678,7 +703,7 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
  */
 int igt_main()
 {
-	struct drm_xe_engine_class_instance *hwe;
+	struct drm_xe_engine_class_instance *hwe, *multi_queue_hwe = NULL;
 	const struct section {
 		const char *name;
 		int n_exec_queues;
@@ -688,6 +713,7 @@ int igt_main()
 		unsigned int flags;
 	} sections[] = {
 		{ "small", 16, 448, 1, 128, 0 },
+		{ "small-multiqueue", 16, 448, 1, 128, MULTI_QUEUE },
 		{ "small-external", 16, 448, 1, 128, EXTERNAL_OBJ },
 		{ "small-multi-vm", 16, 256, 1, 128, MULTI_VM },
 		{ "large", 4, 16, 1, 4, 0 },
@@ -713,6 +739,7 @@ int igt_main()
 		unsigned int flags;
 	} sections_cm[] = {
 		{ "small-cm", 16, 448, 1, 128, 0 },
+		{ "small-multiqueue-cm", 16, 448, 1, 128, MULTI_QUEUE },
 		{ "small-external-cm", 16, 448, 1, 128, EXTERNAL_OBJ },
 		{ "small-multi-vm-cm", 16, 256, 1, 128, MULTI_VM },
 		{ "large-cm", 4, 16, 1, 4, 0 },
@@ -820,6 +847,9 @@ int igt_main()
 		xe_for_each_engine(fd, hwe)
 			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COPY)
 				break;
+
+		xe_for_each_multi_queue_engine(fd, multi_queue_hwe)
+			break;
 	}
 
 	for (const struct section *s = sections; s->name; s++) {
@@ -829,9 +859,13 @@ int igt_main()
 					     1, s->flags);
 
 			igt_debug("Max working set %d n_execs %d\n", ws, s->n_execs);
+			if (s->flags & MULTI_QUEUE) {
+				igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+				igt_require(multi_queue_hwe != NULL);
+			}
 			igt_skip_on_f(!ws, "System memory size is too small.\n");
-			test_evict(fd, hwe, s->n_exec_queues,
-				   min(ws, s->n_execs), bo_size,
+			test_evict(fd, s->flags & MULTI_QUEUE ? multi_queue_hwe : hwe,
+				   s->n_exec_queues, min(ws, s->n_execs), bo_size,
 				   s->flags, NULL);
 		}
 	}
@@ -843,10 +877,13 @@ int igt_main()
 					     1, s->flags);
 
 			igt_debug("Max working set %d n_execs %d\n", ws, s->n_execs);
+			if (s->flags & MULTI_QUEUE) {
+				igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+				igt_require(multi_queue_hwe != NULL);
+			}
 			igt_skip_on_f(!ws, "System memory size is too small.\n");
-			test_evict_cm(fd, hwe, s->n_exec_queues,
-				      min(ws, s->n_execs), bo_size,
-				      s->flags, NULL);
+			test_evict_cm(fd, s->flags & MULTI_QUEUE ? multi_queue_hwe : hwe, s->n_exec_queues,
+				      min(ws, s->n_execs), bo_size, s->flags, NULL);
 		}
 	}
 
@@ -857,9 +894,14 @@ int igt_main()
 					     s->n_threads, s->flags);
 
 			igt_debug("Max working set %d n_execs %d\n", ws, s->n_execs);
+			if (s->flags & MULTI_QUEUE) {
+				igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+				igt_require(multi_queue_hwe != NULL);
+			}
 			igt_skip_on_f(!ws, "System memory size is too small.\n");
-			threads(fd, hwe, s->n_threads, s->n_exec_queues,
-				min(ws, s->n_execs), bo_size, s->flags);
+			threads(fd, s->flags & MULTI_QUEUE ? multi_queue_hwe : hwe,
+				s->n_threads, s->n_exec_queues, min(ws, s->n_execs),
+				bo_size, s->flags);
 		}
 	}
 
-- 
2.43.0

