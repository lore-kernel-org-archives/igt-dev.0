Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90678E77197
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jan 2025 20:28:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4865510E7A0;
	Tue,  7 Jan 2025 20:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MBS4znRh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D382410E31D
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jan 2025 20:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736281686; x=1767817686;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6JGYKAP3N0pXT3Kt1JV7hLsZYvbg42Kodk1i7AL7OA4=;
 b=MBS4znRhrJo8dQYafkvYP81HzuLMAahXQrGW/EZewBrlu/prXMoPoDXv
 Rz8AZiCYtu9zkBIo05SdYnDA2iG/8116RqWV0+4/wKH2MMeTOzbLUZm8B
 phNLZh7UoXtjejyh6dIVWxzk0exRLdl3yOUquWJaYYpAHecsrLS+PlRp+
 Ybg4vkODOyz3xp5CYqEOHUB25BjFWqN2Sc/EuYkUJ9q0jA64fXCeZlvxL
 YOTs1EulAInc4ogYlb/V5W1gUqN02q1JkR3MAIeItV0afU34/To0J8I7T
 eXd/U+kG1oiup3a9hFQ0LrAvCtlRx2lYhGWaMSmzqtZg7KB9jgCBKzB0/ g==;
X-CSE-ConnectionGUID: U2M6skriR8+8WIkcj3/Dgg==
X-CSE-MsgGUID: 9cxYJaQVTIi6lpDWLM9YPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="39309012"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="39309012"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 12:28:05 -0800
X-CSE-ConnectionGUID: hf/XJYEXSry8dkQRlq1P9g==
X-CSE-MsgGUID: ikScT3s0QU24/271AsyHjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="133725686"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 12:28:05 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 5/8] lib/xe/xe_spin: Move declarations around
Date: Tue,  7 Jan 2025 12:26:12 -0800
Message-ID: <20250107202615.1306306-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250107202615.1306306-1-lucas.demarchi@intel.com>
References: <20250107202615.1306306-1-lucas.demarchi@intel.com>
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

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/xe/xe_spin.c |  2 +-
 lib/xe/xe_spin.h | 58 +++++++++++++++++++++++++++---------------------
 2 files changed, 34 insertions(+), 26 deletions(-)

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
index f104fbaf5..7c95996c3 100644
--- a/lib/xe/xe_spin.h
+++ b/lib/xe/xe_spin.h
@@ -15,8 +15,17 @@
 #include "xe_query.h"
 #include "lib/igt_dummyload.h"
 
-/** struct xe_spin_opts
- *
+/* Wrapper to integrate with igt_dummyload, aka igt_spin */
+igt_spin_t *xe_spin_create(int fd, const struct igt_spin_factory *opt);
+void xe_spin_free(int fd, struct igt_spin *spin);
+
+/*
+ * xe_spin: abstract a bo mapped in the GPU that when exec'ed will spin the
+ * engine in which it's exec'ed
+ */
+
+/**
+ * struct xe_spin_opts
  * @addr: offset of spinner within vm
  * @preempt: allow spinner to be preempted or not
  * @ctx_ticks: number of ticks after which spinner is stopped, applied if > 0
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

