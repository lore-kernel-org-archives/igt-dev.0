Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FABE7719A
	for <igt-dev@archiver.kernel.org>; Sat,  4 Jan 2025 07:16:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28BF610E449;
	Sat,  4 Jan 2025 07:16:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ACG1s8VI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4790C10E367
 for <igt-dev@lists.freedesktop.org>; Sat,  4 Jan 2025 07:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735974963; x=1767510963;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zGKs9yMiVJIMK2Ldh7BxbpszWc/DIwBr+6/0eAFravk=;
 b=ACG1s8VIX7XLw7OBg+UWqNUCmwiML+uKFnSACekz2UXWCCSJyOrm7SyF
 x8Jkr+frDHwURdyW/sp3qQuK5wSm+Z9G6UxqZsoeE6nMqPXCjkCPzGV+H
 zOQSd/vpLvO2i3reYSsGrLRf5qGdJUCJEZmBhgz86ReIGx5sq7PSVsLbH
 UZavHwxK0Nf8lkbzVbUl7OxyB9NkFoU+rFoVkvtAcSgxVO5vK761W9crK
 Rauq2N0Z7uyte9/ueKt7YiBFPMUtyLvx4ps5OdV30wXJA6NsMfzCefdJn
 nN0ljYwyeVGeOLzJ8CKBvnOU/ZBW/EQvwX5S25lO8ovHahrzByvF7HGNk Q==;
X-CSE-ConnectionGUID: idozfi1KSwqfuPGgUXauJA==
X-CSE-MsgGUID: F4emUmotRA+QxQrfavIdJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="46878994"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; d="scan'208";a="46878994"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2025 23:16:02 -0800
X-CSE-ConnectionGUID: bF0p+yIRRDabt6vSYgHQPw==
X-CSE-MsgGUID: txsQFgWoTbanjaDXUJb++w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; d="scan'208";a="101762001"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2025 23:16:02 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 6/8] lib/xe/xe_spin: Move declarations around
Date: Fri,  3 Jan 2025 23:15:46 -0800
Message-ID: <20250104071548.737612-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250104071548.737612-1-lucas.demarchi@intel.com>
References: <20250104071548.737612-1-lucas.demarchi@intel.com>
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

xe_spin.h has 3 abstractions:

1) the integration with igt_dummyload
2) xe_spin, the bo to be exec'ed somewhere
3) xe_cork, that resembles more the igt_spin, abstracting the fd, vm,
   bind, etc

Group them so it's easier to understand each one.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/xe/xe_spin.c |  2 +-
 lib/xe/xe_spin.h | 54 +++++++++++++++++++++++++++---------------------
 2 files changed, 32 insertions(+), 24 deletions(-)

diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index 333f8d7d8..bb6318cef 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -232,7 +232,7 @@ xe_spin_create(int fd, const struct igt_spin_factory *opt)
 	return spin;
 }
 
-void xe_spin_sync_wait(int fd, struct igt_spin *spin)
+static void xe_spin_sync_wait(int fd, struct igt_spin *spin)
 {
 	igt_assert(syncobj_wait(fd, &spin->syncobj, 1, INT64_MAX, 0, NULL));
 }
diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
index 01f45eaeb..7c95996c3 100644
--- a/lib/xe/xe_spin.h
+++ b/lib/xe/xe_spin.h
@@ -15,6 +15,15 @@
 #include "xe_query.h"
 #include "lib/igt_dummyload.h"
 
+/* Wrapper to integrate with igt_dummyload, aka igt_spin */
+igt_spin_t *xe_spin_create(int fd, const struct igt_spin_factory *opt);
+void xe_spin_free(int fd, struct igt_spin *spin);
+
+/*
+ * xe_spin: abstract a bo mapped in the GPU that when exec'ed will spin the
+ * engine in which it's exec'ed
+ */
+
 /**
  * struct xe_spin_opts
  * @addr: offset of spinner within vm
@@ -30,11 +39,6 @@ struct xe_spin_opts {
 	bool write_timestamp;
 };
 
-struct xe_cork_opts {
-	uint64_t ahnd;
-	bool debug;
-};
-
 /* Mapped GPU object */
 struct xe_spin {
 	uint32_t batch[128];
@@ -46,6 +50,24 @@ struct xe_spin {
 	uint32_t timestamp;
 };
 
+uint32_t xe_spin_nsec_to_ticks(int fd, int gt_id, uint64_t nsec);
+void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts);
+#define xe_spin_init_opts(fd, ...) \
+	xe_spin_init(fd, &((struct xe_spin_opts){__VA_ARGS__}))
+bool xe_spin_started(struct xe_spin *spin);
+void xe_spin_wait_started(struct xe_spin *spin);
+void xe_spin_end(struct xe_spin *spin);
+
+/*
+ * xe_cork: higher level API that simplifies exec'ing an xe_spin by taking care
+ * of vm creation, exec call, etc.
+ */
+
+struct xe_cork_opts {
+	uint64_t ahnd;
+	bool debug;
+};
+
 struct xe_cork {
 	struct xe_spin *spin;
 	int fd;
@@ -65,27 +87,13 @@ struct xe_cork {
 	uint16_t num_placements;
 };
 
-igt_spin_t *xe_spin_create(int fd, const struct igt_spin_factory *opt);
-void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts);
-struct xe_cork *
-xe_cork_create(int fd, struct drm_xe_engine_class_instance *hwe, uint32_t vm,
-	      uint16_t width, uint16_t num_placements, struct xe_cork_opts *opts);
-void xe_cork_destroy(int fd, struct xe_cork *ctx);
-
+struct xe_cork *xe_cork_create(int fd, struct drm_xe_engine_class_instance *hwe,
+			       uint32_t vm, uint16_t width, uint16_t num_placements,
+			       struct xe_cork_opts *opts);
 #define xe_cork_create_opts(fd, hwe, vm, width, num_placements, ...) \
 	xe_cork_create(fd, hwe, vm, width, num_placements, \
 			&((struct xe_cork_opts){__VA_ARGS__}))
-
-#define xe_spin_init_opts(fd, ...) \
-	xe_spin_init(fd, &((struct xe_spin_opts){__VA_ARGS__}))
-
-uint32_t xe_spin_nsec_to_ticks(int fd, int gt_id, uint64_t nsec);
-
-bool xe_spin_started(struct xe_spin *spin);
-void xe_spin_sync_wait(int fd, struct igt_spin *spin);
-void xe_spin_wait_started(struct xe_spin *spin);
-void xe_spin_end(struct xe_spin *spin);
-void xe_spin_free(int fd, struct igt_spin *spin);
+void xe_cork_destroy(int fd, struct xe_cork *ctx);
 void xe_cork_sync_start(int fd, struct xe_cork *ctx);
 void xe_cork_sync_end(int fd, struct xe_cork *ctx);
 
-- 
2.47.0

